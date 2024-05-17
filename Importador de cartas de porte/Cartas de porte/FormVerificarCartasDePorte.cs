using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    public partial class FormVerificarCartasDePorte : Form
    {
        string archivoOrigen;
        private CardonerSistemas.Database.Ado.SqlServer database = new CardonerSistemas.Database.Ado.SqlServer()
        {
            ConnectionString = Program.DatabaseConnectionString
        };

        public FormVerificarCartasDePorte()
        {
            InitializeComponent();

            this.Icon = CardonerSistemas.Graphics.GetIconFromBitmap(Properties.Resources.ImageImport48);
            openfiledialogMain.Filter = "Archivo de valores separados por coma (*.csv)|*.csv|Todos los archivos (*.*)|(*.*)";
            textboxArchivoCsv.Text = (string)CardonerSistemas.Registry.LoadUserValueFromApplicationFolder(string.Empty, "SourceFile", string.Empty, true);
        }

        private void ArchivoOrigenExaminar(object sender, EventArgs e)
        {
            openfiledialogMain.FileName = textboxArchivoCsv.Text;
            if (openfiledialogMain.ShowDialog(this) == DialogResult.OK)
            {
                textboxArchivoCsv.Text = openfiledialogMain.FileName;
            }
        }

        private void LeerYVerificarCartasDePorte(object sender, EventArgs e)
        {
            const string CartaDePorteEstadoAnulada = "AN";
            const string CartaDePorteEstadoConfirmada = "CN";

            archivoOrigen = textboxArchivoCsv.Text.Trim();
            List<CartaDePorteEnAfip> cartasDePorteEnAfip;

            if (archivoOrigen == string.Empty)
            {
                MessageBox.Show("Debe especificar el archivo de cartas de porte.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                textboxArchivoCsv.Focus();
                return;
            }
            if (!File.Exists(archivoOrigen))
            {
                MessageBox.Show("El archivo de cartas de porte especificado, no existe.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                textboxArchivoCsv.Focus();
                return;
            }

            Cursor.Current = Cursors.WaitCursor;

            listboxCartasDePorte.Items.Clear();

            // Guardo el archivo en el registro de windows para abrirlo la siguiente vez
            CardonerSistemas.Registry.SaveUserValueToApplicationFolder(string.Empty, "SourceFile", textboxArchivoCsv.Text.Trim(), true);

            try
            {

                cartasDePorteEnAfip = File.ReadAllLines(archivoOrigen)
                                        .Skip(1)
                                        .Select(v => CartaDePorteEnAfip.FromCsv(v))
                                        //.Where(v=>v.estado == "CN") esto sería para filtrar sólo la confirmadas
                                        .ToList();

            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al leer las cartas de porte desde el archivo especificado.\n\nError: {ex.Message}", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Abro la conexión a la base de datos
            if (!database.Connect())
            {
                Cursor.Current = Cursors.Default;
                return;
            }

            // Busco cada una de las cartas de porte contra la base de datos
            progressbarMain.Value = 0;
            progressbarMain.Maximum = cartasDePorteEnAfip.Count;
            EnableControls(false);
            progressbarMain.Visible = true;

            foreach (CartaDePorteEnAfip cartaDePorteEnAfip  in cartasDePorteEnAfip)
            {
                Database.MovimientoCereal movimientoCereal = new Database.MovimientoCereal();
                if (!Database.MovimientoCerealMetodos.ObtenerPorCtg(database, cartaDePorteEnAfip.cpe, movimientoCereal))
                {
                    // Se produjo un error al leer la base de datos
                    EnableControls(true);
                    progressbarMain.Visible = false;
                    Cursor.Current = Cursors.Default;
                    return;
                }

                // Verifico las cartas de acuerdo al estado en Afip
                switch (cartaDePorteEnAfip.estado)
                {
                    case CartaDePorteEstadoAnulada:
                        if (movimientoCereal.IsFound && movimientoCereal.IDCartaPorte_MotivoAnulacion == null)
                        {
                            listboxCartasDePorte.Items.Add($"{cartaDePorteEnAfip.cpe}: está anulada en Afip pero no en CS-Movimiento de Granos.");
                        }
                        break;

                    case CartaDePorteEstadoConfirmada:
                        if (movimientoCereal.IsFound)
                        {
                            if (movimientoCereal.IDCartaPorte_MotivoAnulacion != null)
                            {
                                listboxCartasDePorte.Items.Add($"{cartaDePorteEnAfip.cpe}: está confirmada en Afip y anulada en CS-Movimiento de Granos.");
                            }
                        }
                        else
                        {
                            listboxCartasDePorte.Items.Add($"{cartaDePorteEnAfip.cpe}: no existe en CS-Movimiento de Granos.");
                        }
                        break;

                    default:
                        break;
                }

                if (progressbarMain.Value > 0)
                {
                    progressbarMain.Value--;
                    progressbarMain.Value++;
                }
                progressbarMain.Value++;
                Application.DoEvents();
            }

            EnableControls(true);
            progressbarMain.Visible = false;
            Cursor.Current = Cursors.Default;

            if (listboxCartasDePorte.Items.Count == 0)
            {
                MessageBox.Show($"Se han verificado {cartasDePorteEnAfip.Count} cartas de porte y todas están correctas.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show($"Se han verificado {cartasDePorteEnAfip.Count} cartas de porte.\nVerifique la lista con las observaciones.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void FormVerificarCartasDePorte_FormClosing(object sender, FormClosingEventArgs e)
        {
            database.Close();
            database = null;
        }

        private void EnableControls(bool value)
        {
            textboxArchivoCsv.Enabled = value;
            buttonArchivoCsvExaminar.Enabled = value;
            buttonLeerYVerificarCartasPorte.Enabled = value;
            listboxCartasDePorte.Enabled = value;
        }
    }

    class CartaDePorteEnAfip
    {
        public long cpe;
        public string estado;

        public static CartaDePorteEnAfip FromCsv(string csvLine)
        {
            string[] values = csvLine.Split(';');
            CartaDePorteEnAfip cartaDePorteCsv = new CartaDePorteEnAfip
            {
                cpe = Convert.ToInt64(values[0]),
                estado = values[1]
            };
            return cartaDePorteCsv;
        }
    }
}
