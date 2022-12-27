
namespace CS_Importador_de_cartas_de_porte
{
    partial class FormMainMenu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.buttonImportarCPs = new System.Windows.Forms.Button();
            this.buttonVerificarCPs = new System.Windows.Forms.Button();
            this.labelCopyright = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // buttonImportarCPs
            // 
            this.buttonImportarCPs.Location = new System.Drawing.Point(12, 12);
            this.buttonImportarCPs.Name = "buttonImportarCPs";
            this.buttonImportarCPs.Size = new System.Drawing.Size(234, 68);
            this.buttonImportarCPs.TabIndex = 0;
            this.buttonImportarCPs.Text = "Importar cartas de porte";
            this.buttonImportarCPs.UseVisualStyleBackColor = true;
            this.buttonImportarCPs.Click += new System.EventHandler(this.ImportarCPs);
            // 
            // buttonVerificarCPs
            // 
            this.buttonVerificarCPs.Location = new System.Drawing.Point(12, 86);
            this.buttonVerificarCPs.Name = "buttonVerificarCPs";
            this.buttonVerificarCPs.Size = new System.Drawing.Size(234, 68);
            this.buttonVerificarCPs.TabIndex = 1;
            this.buttonVerificarCPs.Text = "Verificar cartas de porte";
            this.buttonVerificarCPs.UseVisualStyleBackColor = true;
            this.buttonVerificarCPs.Click += new System.EventHandler(this.VerificarCPs);
            // 
            // labelCopyright
            // 
            this.labelCopyright.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.labelCopyright.Location = new System.Drawing.Point(12, 166);
            this.labelCopyright.Name = "labelCopyright";
            this.labelCopyright.Size = new System.Drawing.Size(234, 14);
            this.labelCopyright.TabIndex = 2;
            this.labelCopyright.Text = "Copyright";
            this.labelCopyright.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // FormMainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(258, 189);
            this.Controls.Add(this.labelCopyright);
            this.Controls.Add(this.buttonVerificarCPs);
            this.Controls.Add(this.buttonImportarCPs);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormMainMenu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "CS-Importador de cartas de porte";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonImportarCPs;
        private System.Windows.Forms.Button buttonVerificarCPs;
        private System.Windows.Forms.Label labelCopyright;
    }
}