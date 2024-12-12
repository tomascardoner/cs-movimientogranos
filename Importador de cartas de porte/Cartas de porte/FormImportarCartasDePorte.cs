using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;
using static CS_Importador_de_cartas_de_porte.CartaDePorteProcesador;

namespace CS_Importador_de_cartas_de_porte
{
    public partial class FormImportarCartasDePorte : Form
    {

        #region Declaraciones

        private CardonerSistemas.Database.Ado.SqlServer database = new CardonerSistemas.Database.Ado.SqlServer()
        {
            ConnectionString = Program.DatabaseConnectionString
        };

        #endregion Declaraciones

        #region Cosas del form

        public FormImportarCartasDePorte()
        {
            InitializeComponent();

            this.Icon = CardonerSistemas.Graphics.GetIconFromBitmap(Properties.Resources.ImageImport48);
            TextBoxCarpetaOrigen.Text = (string)CardonerSistemas.Registry.LoadUserValueFromApplicationFolder(string.Empty, "SourceFolder", string.Empty, true);
            database.Connect();

            ComboBoxCosecha.ValueMember = "IDCosecha";
            ComboBoxCosecha.DisplayMember = "Nombre";
            ComboBoxCosecha.DataSource = Database.CosechaMetodos.ObtenerVarias(database);
        }

        private void FormImportarCartasDePorte_FormClosing(object sender, FormClosingEventArgs e)
        {
            database.Close();
            database = null;
        }

        #endregion Cosas del form

        #region Eventos de los controles

        private void ButtonCarpetaOrigenExaminar_Click(object sender, EventArgs e)
        {
            FolderBrowserDialogMain.SelectedPath = TextBoxCarpetaOrigen.Text;
            if (FolderBrowserDialogMain.ShowDialog(this) == DialogResult.OK)
            {
                TextBoxCarpetaOrigen.Text = FolderBrowserDialogMain.SelectedPath;
            }
        }

        private void ButtonBuscarCartasPorte_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextBoxCarpetaOrigen.Text))
            {
                MessageBox.Show("Debe especificar la ubicación de los archivos.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                TextBoxCarpetaOrigen.Focus();
                return;
            }
            if (!Directory.Exists(TextBoxCarpetaOrigen.Text.Trim()))
            {
                MessageBox.Show("La ubicación de los archivos especificada, no existe.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                TextBoxCarpetaOrigen.Focus();
                return;
            }

            CheckedListBoxArchivos.Items.Clear();

            // Guardo la carpeta en el registro de windows para abrirla la siguiente vez
            CardonerSistemas.Registry.SaveUserValueToApplicationFolder(string.Empty, "SourceFolder", TextBoxCarpetaOrigen.Text.Trim(), true);

            try
            {
                Cursor.Current = Cursors.WaitCursor;

                foreach (string archivoFull in Directory.GetFiles(TextBoxCarpetaOrigen.Text.Trim(), Constantes.ArchivosPatronBusqueda))
                {
                    string archivo = Path.GetFileName(archivoFull);
                    CheckedListBoxArchivos.Items.Add(archivo);
                }

                Cursor.Current = Cursors.Default;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al leer los archivos desde la ubicación especificada.\n\nError: {ex.Message}", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Abro la conexión a la base de datos
            database.Connect();
        }

        private void ButtonArchivosSeleccionarTodos_Click(object sender, EventArgs e)
        {
            CambiarSeleccion(1);
        }

        private void ButtonArchivosSeleccionarHaciaAbajo_Click(object sender, EventArgs e)
        {
            CambiarSeleccion(2);
        }

        private void ButtonArchivosInvertirSeleccion_Click(object sender, EventArgs e)
        {
            CambiarSeleccion(-1);
        }

        private void ButtonArchivosDeseleccionarTodos_Click(object sender, EventArgs e)
        {
            CambiarSeleccion(0);
        }

        private void CheckBoxCosecha_CheckedChanged(object sender, EventArgs e)
        {
            ComboBoxCosecha.Visible = CheckBoxCosecha.Checked;
        }

        private void ButtonImportar_Click(object sender, EventArgs e)
        {
            int cartasDePorteAgregadas = 0;
            int cartasDePorteActualizadas = 0;
            int cartasDePorteSinCambios = 0;

            if (CheckedListBoxArchivos.CheckedItems.Count == 0)
            {
                MessageBox.Show("No hay ninguna carta de porte seleccionada.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (ComboBoxCosecha.SelectedIndex == -1)
            {
                MessageBox.Show("No hay ninguna cosecha seleccionada.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            Cursor.Current = Cursors.WaitCursor;
            ProgressBarMain.Value = 0;
            ProgressBarMain.Maximum = CheckedListBoxArchivos.CheckedItems.Count;
            EnableControls(false);
            ShowProgressControls(true);

            foreach (int index in CheckedListBoxArchivos.CheckedIndices)
            {
                string archivo = (string)CheckedListBoxArchivos.Items[index];
                List<ResultadosProcesamiento> resultadosProcesamiento = CartaDePorteProcesador.Procesar(TextBoxCarpetaOrigen.Text.Trim(), archivo, (byte)ComboBoxCosecha.SelectedValue, database);
                if (ProgressBarMain.Value > 0)
                {
                    ProgressBarMain.Value--;
                    ProgressBarMain.Value++;
                }
                ProgressBarMain.Value ++;
                Application.DoEvents();

                foreach (ResultadosProcesamiento resultadoProcesamiento in resultadosProcesamiento)
                {
                    switch (resultadoProcesamiento)
                    {
                        case CartaDePorteProcesador.ResultadosProcesamiento.Agregada:
                            cartasDePorteAgregadas++;
                            break;
                        case CartaDePorteProcesador.ResultadosProcesamiento.Modificada:
                            cartasDePorteActualizadas++;
                            break;
                        case CartaDePorteProcesador.ResultadosProcesamiento.SinCambios:
                            cartasDePorteSinCambios++;
                            break;
                        case CartaDePorteProcesador.ResultadosProcesamiento.Error:
                            EnableControls(true);
                            ShowProgressControls(false);
                            Cursor.Current = Cursors.Default;
                            MostrarResumenDeProceso(cartasDePorteAgregadas, cartasDePorteActualizadas, cartasDePorteSinCambios);
                            return;
                        default:
                            break;
                    }
                }
                CheckedListBoxArchivos.SetItemChecked(index, false);
            }
            EnableControls(true);
            ShowProgressControls(false);
            Cursor.Current = Cursors.Default;
            MostrarResumenDeProceso(cartasDePorteAgregadas, cartasDePorteActualizadas, cartasDePorteSinCambios);
        }

        #endregion Eventos de los controles

        #region Cosas extra

        private void CambiarSeleccion(short accion)
        {
            int startIndex;

            if (accion == 2)
            {
                // Hay que marcar desde el ítem actual hacia abajo
                if (CheckedListBoxArchivos.SelectedIndex > -1)
                {
                    startIndex = CheckedListBoxArchivos.SelectedIndex;
                }
                else
                {
                    startIndex = 0;
                }
            }
            else
            {
                startIndex = 0;
            }

            for (int i = startIndex; i < CheckedListBoxArchivos.Items.Count; i++)
            {
                if (accion == -1)
                {
                    // Invertir selección
                    CheckedListBoxArchivos.SetItemChecked(i, !CheckedListBoxArchivos.GetItemChecked(i));
                }
                else if (accion == 0)
                {
                    // Deseleccionar
                    CheckedListBoxArchivos.SetItemChecked(i, false);
                }
                else if (accion == 1 || accion == 2)
                {
                    // Seleccionar todos o hacia abajo
                    CheckedListBoxArchivos.SetItemChecked(i, true);
                }
            }
        }

        private void EnableControls(bool value)
        {
            TextBoxCarpetaOrigen.Enabled = value;
            ButtonCarpetaOrigenExaminar.Enabled = value;
            ButtonBuscarCartasPorte.Enabled = value;
            CheckedListBoxArchivos.Enabled = value;
            ButtonArchivosSeleccionarTodos.Enabled = value;
            ButtonArchivosSeleccionarHaciaAbajo.Enabled = value;
            ButtonArchivosInvertirSeleccion.Enabled = value;
            ButtonArchivosDeseleccionarTodos.Enabled = value;
            ComboBoxCosecha.Enabled = value;
            ButtonImportar.Enabled = value;

            ButtonImportar.Focus();
        }

        private void ShowProgressControls(bool value)
        {
            ButtonArchivosSeleccionarTodos.Visible = !value;
            ButtonArchivosSeleccionarHaciaAbajo.Visible = !value;
            ButtonArchivosInvertirSeleccion.Visible = !value;
            ButtonArchivosDeseleccionarTodos.Visible = !value;
            ProgressBarMain.Visible = value;
        }

        private static void MostrarResumenDeProceso(int agregadas, int actualizadas, int sinCambios)
        {
            if (agregadas == 0 && actualizadas == 0 && sinCambios == 0)
            {
                MessageBox.Show("No se procesó ninguna carta de porte.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                string mensaje;
                if (agregadas + actualizadas + sinCambios == 1)
                {
                    mensaje = $"Se ha procesado {agregadas + actualizadas + sinCambios} carta de porte.\n\n";
                }
                else
                {
                    mensaje = $"Se han procesado {agregadas + actualizadas + sinCambios} cartas de porte.\n\n";
                }
                mensaje += $"Agregadas:______{agregadas}\n";
                mensaje += $"Actualizadas:___{actualizadas}\n";
                mensaje += $"Sin cambios:____{sinCambios}";
                MessageBox.Show(mensaje, CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        #endregion Cosas extra

    }
}
