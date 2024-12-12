using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    public partial class FormMainMenu : Form
    {
        public FormMainMenu()
        {
            InitializeComponent();
        
            this.Icon = CardonerSistemas.Graphics.GetIconFromBitmap(Properties.Resources.ImageImport48);
            LabelCopyright.Text = CardonerSistemas.My.Application.Info.Copyright;
        }

        private void ButtonImportarCPs_Click(object sender, System.EventArgs e)
        {
            FormImportarCartasDePorte formImportarCartasDePorte = new FormImportarCartasDePorte();
            formImportarCartasDePorte.ShowDialog(this);
        }

        private void ButtonVerificarCPs_Click(object sender, System.EventArgs e)
        {
            FormVerificarCartasDePorte formVerificarCartasDePorte = new FormVerificarCartasDePorte();
            formVerificarCartasDePorte.ShowDialog(this);
        }
    }
}
