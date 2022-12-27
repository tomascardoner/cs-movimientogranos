using System;
using System.IO;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    public partial class FormImportarCartasDePorte : Form
    {
        string carpetaOrigen;
        Database.Database database = new Database.Database();

        public FormImportarCartasDePorte()
        {
            InitializeComponent();

            this.Icon = CardonerSistemas.Graphics.GetIconFromBitmap(Properties.Resources.ImageImport48);
            textboxCarpetaOrigen.Text = (string)CardonerSistemas.Registry.LoadUserValueFromApplicationFolder(string.Empty, "SourceFolder", string.Empty, true);
        }

        private void CarpetaOrigenExaminar(object sender, EventArgs e)
        {
            folderbrowserdialogMain.SelectedPath = textboxCarpetaOrigen.Text;
            if (folderbrowserdialogMain.ShowDialog(this) == DialogResult.OK)
            {
                textboxCarpetaOrigen.Text = folderbrowserdialogMain.SelectedPath;
            }
        }

        private void BuscarCartasPorte(object sender, EventArgs e)
        {
            carpetaOrigen = textboxCarpetaOrigen.Text.Trim();

            if (carpetaOrigen == string.Empty)
            {
                MessageBox.Show("Debe especificar la ubicación de los archivos.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                textboxCarpetaOrigen.Focus();
                return;
            }
            if (!Directory.Exists(carpetaOrigen))
            {
                MessageBox.Show("La ubicación de los archivos especificada, no existe.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                textboxCarpetaOrigen.Focus();
                return;
            }

            checkedlistboxArchivos.Items.Clear();

            // Guardo la carpeta en el registro de windows para abrirla la siguiente vez
            CardonerSistemas.Registry.SaveUserValueToApplicationFolder(string.Empty, "SourceFolder", textboxCarpetaOrigen.Text.Trim(), true);

            try
            {
                Cursor.Current = Cursors.WaitCursor;

                foreach (string archivoFull in Directory.GetFiles(carpetaOrigen, Constantes.ArchivosPatronBusqueda))
                {
                    string archivo = Path.GetFileName(archivoFull);
                    checkedlistboxArchivos.Items.Add(archivo);
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
            if (!database.Connect())
            {
                return;
            }

            // Completo el combobox de cosechas
            comboboxCosecha.ValueMember = "IDCosecha";
            comboboxCosecha.DisplayMember = "Nombre";
            comboboxCosecha.DataSource = database.ObtenerCosechas();
        }

        private void ArchivosSeleccionarTodos(object sender, EventArgs e)
        {
            CambiarSeleccion(1);
        }

        private void ArchivosSeleccionarHaciaAbajo(object sender, EventArgs e)
        {
            CambiarSeleccion(2);
        }

        private void ArchivosInvertirSeleccion(object sender, EventArgs e)
        {
            CambiarSeleccion(-1);
        }

        private void ArchivosDeseleccionarTodos(object sender, EventArgs e)
        {
            CambiarSeleccion(0);
        }

        private void CambiarSeleccion(short accion)
        {
            int startIndex;

            if (accion == 2)
            {
                // Hay que marcar desde el ítem actual hacia abajo
                if (checkedlistboxArchivos.SelectedIndex > -1)
                {
                    startIndex = checkedlistboxArchivos.SelectedIndex;
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

            for (int i = startIndex; i < checkedlistboxArchivos.Items.Count; i++)
            {
                if (accion == -1)
                {
                    // Invertir selección
                    checkedlistboxArchivos.SetItemChecked(i, !checkedlistboxArchivos.GetItemChecked(i));
                }
                else if (accion == 0)
                {
                    // Deseleccionar
                    checkedlistboxArchivos.SetItemChecked(i, false);
                }
                else if (accion == 1 | accion == 2)
                {
                    // Seleccionar todos o hacia abajo
                    checkedlistboxArchivos.SetItemChecked(i, true);
                }
            }
        }

        private void Importar(object sender, EventArgs e)
        {
            int cartasDePorteAgregadas = 0;
            int cartasDePorteActualizadas = 0;
            int cartasDePorteSinCambios = 0;

            if (checkedlistboxArchivos.CheckedItems.Count == 0)
            {
                MessageBox.Show("No hay ninguna carta de porte seleccionada.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (comboboxCosecha.SelectedIndex == -1)
            {
                MessageBox.Show("No hay ninguna cosecha seleccionada.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            Cursor.Current = Cursors.WaitCursor;
            progressbarMain.Value = 0;
            progressbarMain.Maximum = checkedlistboxArchivos.CheckedItems.Count;
            EnableControls(false);
            ShowProgressControls(true);

            foreach (int index in checkedlistboxArchivos.CheckedIndices)
            {
                string archivo = (string)checkedlistboxArchivos.Items[index];
                CartaDePorteProcesador.ResultadosProcesamiento resultado = CartaDePorteProcesador.Procesar(carpetaOrigen, archivo, (byte)comboboxCosecha.SelectedValue, database);
                if (progressbarMain.Value > 0)
                {
                    progressbarMain.Value--;
                    progressbarMain.Value++;
                }
                progressbarMain.Value ++;
                Application.DoEvents();

                switch (resultado)
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
                checkedlistboxArchivos.SetItemChecked(index, false);
            }
            EnableControls(true);
            ShowProgressControls(false);
            Cursor.Current = Cursors.Default;
            MostrarResumenDeProceso(cartasDePorteAgregadas, cartasDePorteActualizadas, cartasDePorteSinCambios);
        }

        private void MostrarResumenDeProceso(int agregadas, int actualizadas, int sinCambios)
        {
            if (agregadas == 0 & actualizadas == 0 & sinCambios == 0)
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

        private void FormImportarCartasDePorte_FormClosing(object sender, FormClosingEventArgs e)
        {
            database.Close();
            database = null;
        }

        private void EnableControls(bool value)
        {
            textboxCarpetaOrigen.Enabled = value;
            buttonCarpetaOrigenExaminar.Enabled = value;
            buttonBuscarCartasPorte.Enabled = value;
            checkedlistboxArchivos.Enabled = value;
            buttonArchivosSeleccionarTodos.Enabled = value;
            buttonArchivosSeleccionarHaciaAbajo.Enabled = value;
            buttonArchivosInvertirSeleccion.Enabled = value;
            buttonArchivosDeseleccionarTodos.Enabled = value;
            comboboxCosecha.Enabled = value;
            buttonImportar.Enabled = value;

            buttonImportar.Focus();
        }

        private void ShowProgressControls(bool value)
        {
            buttonArchivosSeleccionarTodos.Visible = !value;
            buttonArchivosSeleccionarHaciaAbajo.Visible = !value;
            buttonArchivosInvertirSeleccion.Visible = !value;
            buttonArchivosDeseleccionarTodos.Visible = !value;
            progressbarMain.Visible = value;
        }
    }
}
