
namespace CS_Importador_de_cartas_de_porte
{
    partial class FormVerificarCartasDePorte
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
            this.buttonLeerYVerificarCartasPorte = new System.Windows.Forms.Button();
            this.buttonArchivoCsvExaminar = new System.Windows.Forms.Button();
            this.textboxArchivoCsv = new System.Windows.Forms.TextBox();
            this.labelArchivoCsv = new System.Windows.Forms.Label();
            this.listboxCartasDePorte = new System.Windows.Forms.ListBox();
            this.openfiledialogMain = new System.Windows.Forms.OpenFileDialog();
            this.progressbarMain = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // buttonLeerYVerificarCartasPorte
            // 
            this.buttonLeerYVerificarCartasPorte.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonLeerYVerificarCartasPorte.Location = new System.Drawing.Point(12, 51);
            this.buttonLeerYVerificarCartasPorte.Name = "buttonLeerYVerificarCartasPorte";
            this.buttonLeerYVerificarCartasPorte.Size = new System.Drawing.Size(462, 28);
            this.buttonLeerYVerificarCartasPorte.TabIndex = 2;
            this.buttonLeerYVerificarCartasPorte.Text = "Leer y verificar cartas de porte";
            this.buttonLeerYVerificarCartasPorte.UseVisualStyleBackColor = true;
            this.buttonLeerYVerificarCartasPorte.Click += new System.EventHandler(this.LeerYVerificarCartasDePorte);
            // 
            // buttonArchivoCsvExaminar
            // 
            this.buttonArchivoCsvExaminar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonArchivoCsvExaminar.Location = new System.Drawing.Point(447, 25);
            this.buttonArchivoCsvExaminar.Name = "buttonArchivoCsvExaminar";
            this.buttonArchivoCsvExaminar.Size = new System.Drawing.Size(26, 20);
            this.buttonArchivoCsvExaminar.TabIndex = 2;
            this.buttonArchivoCsvExaminar.TabStop = false;
            this.buttonArchivoCsvExaminar.Text = "...";
            this.buttonArchivoCsvExaminar.UseVisualStyleBackColor = true;
            this.buttonArchivoCsvExaminar.Click += new System.EventHandler(this.ArchivoOrigenExaminar);
            // 
            // textboxArchivoCsv
            // 
            this.textboxArchivoCsv.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textboxArchivoCsv.Location = new System.Drawing.Point(12, 25);
            this.textboxArchivoCsv.MaxLength = 512;
            this.textboxArchivoCsv.Name = "textboxArchivoCsv";
            this.textboxArchivoCsv.Size = new System.Drawing.Size(435, 20);
            this.textboxArchivoCsv.TabIndex = 1;
            // 
            // labelArchivoCsv
            // 
            this.labelArchivoCsv.AutoSize = true;
            this.labelArchivoCsv.Location = new System.Drawing.Point(12, 9);
            this.labelArchivoCsv.Name = "labelArchivoCsv";
            this.labelArchivoCsv.Size = new System.Drawing.Size(165, 13);
            this.labelArchivoCsv.TabIndex = 0;
            this.labelArchivoCsv.Text = "Archivo de cartas de porte (*.csv)";
            // 
            // listboxCartasDePorte
            // 
            this.listboxCartasDePorte.FormattingEnabled = true;
            this.listboxCartasDePorte.Location = new System.Drawing.Point(12, 88);
            this.listboxCartasDePorte.Name = "listboxCartasDePorte";
            this.listboxCartasDePorte.Size = new System.Drawing.Size(461, 329);
            this.listboxCartasDePorte.TabIndex = 3;
            // 
            // progressbarMain
            // 
            this.progressbarMain.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.progressbarMain.Location = new System.Drawing.Point(12, 422);
            this.progressbarMain.Name = "progressbarMain";
            this.progressbarMain.Size = new System.Drawing.Size(461, 28);
            this.progressbarMain.TabIndex = 13;
            this.progressbarMain.Visible = false;
            // 
            // FormVerificarCartasDePorte
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(485, 462);
            this.Controls.Add(this.progressbarMain);
            this.Controls.Add(this.listboxCartasDePorte);
            this.Controls.Add(this.buttonLeerYVerificarCartasPorte);
            this.Controls.Add(this.buttonArchivoCsvExaminar);
            this.Controls.Add(this.textboxArchivoCsv);
            this.Controls.Add(this.labelArchivoCsv);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "FormVerificarCartasDePorte";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Verificar C.P.s importadas";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormVerificarCartasDePorte_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button buttonLeerYVerificarCartasPorte;
        private System.Windows.Forms.Button buttonArchivoCsvExaminar;
        private System.Windows.Forms.TextBox textboxArchivoCsv;
        private System.Windows.Forms.Label labelArchivoCsv;
        private System.Windows.Forms.ListBox listboxCartasDePorte;
        private System.Windows.Forms.OpenFileDialog openfiledialogMain;
        private System.Windows.Forms.ProgressBar progressbarMain;
    }
}