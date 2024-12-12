
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
            this.ButtonLeerYVerificarCartasPorte = new System.Windows.Forms.Button();
            this.ButtonArchivoCsvExaminar = new System.Windows.Forms.Button();
            this.TextBoxArchivoCsv = new System.Windows.Forms.TextBox();
            this.ListBoxCartasDePorte = new System.Windows.Forms.ListBox();
            this.openfiledialogMain = new System.Windows.Forms.OpenFileDialog();
            this.ProgressBarMain = new System.Windows.Forms.ProgressBar();
            this.TableLayoutPanelMain = new System.Windows.Forms.TableLayoutPanel();
            this.LabelArchivoCsv = new System.Windows.Forms.Label();
            this.TableLayoutPanelMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // ButtonLeerYVerificarCartasPorte
            // 
            this.ButtonLeerYVerificarCartasPorte.AutoSize = true;
            this.ButtonLeerYVerificarCartasPorte.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.TableLayoutPanelMain.SetColumnSpan(this.ButtonLeerYVerificarCartasPorte, 2);
            this.ButtonLeerYVerificarCartasPorte.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonLeerYVerificarCartasPorte.Location = new System.Drawing.Point(4, 67);
            this.ButtonLeerYVerificarCartasPorte.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.ButtonLeerYVerificarCartasPorte.Name = "ButtonLeerYVerificarCartasPorte";
            this.ButtonLeerYVerificarCartasPorte.Size = new System.Drawing.Size(651, 26);
            this.ButtonLeerYVerificarCartasPorte.TabIndex = 3;
            this.ButtonLeerYVerificarCartasPorte.Text = "Leer y verificar cartas de porte";
            this.ButtonLeerYVerificarCartasPorte.UseVisualStyleBackColor = true;
            this.ButtonLeerYVerificarCartasPorte.Click += new System.EventHandler(this.ButtonLeerYVerificarCartasPorte_Click);
            // 
            // ButtonArchivoCsvExaminar
            // 
            this.ButtonArchivoCsvExaminar.Location = new System.Drawing.Point(216, 4);
            this.ButtonArchivoCsvExaminar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.ButtonArchivoCsvExaminar.Name = "ButtonArchivoCsvExaminar";
            this.ButtonArchivoCsvExaminar.Size = new System.Drawing.Size(35, 25);
            this.ButtonArchivoCsvExaminar.TabIndex = 1;
            this.ButtonArchivoCsvExaminar.TabStop = false;
            this.ButtonArchivoCsvExaminar.Text = "...";
            this.ButtonArchivoCsvExaminar.UseVisualStyleBackColor = true;
            this.ButtonArchivoCsvExaminar.Click += new System.EventHandler(this.ButtonArchivoOrigenExaminar_Click);
            // 
            // TextBoxArchivoCsv
            // 
            this.TableLayoutPanelMain.SetColumnSpan(this.TextBoxArchivoCsv, 2);
            this.TextBoxArchivoCsv.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TextBoxArchivoCsv.Location = new System.Drawing.Point(4, 37);
            this.TextBoxArchivoCsv.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.TextBoxArchivoCsv.MaxLength = 512;
            this.TextBoxArchivoCsv.Name = "TextBoxArchivoCsv";
            this.TextBoxArchivoCsv.Size = new System.Drawing.Size(651, 22);
            this.TextBoxArchivoCsv.TabIndex = 2;
            // 
            // ListBoxCartasDePorte
            // 
            this.TableLayoutPanelMain.SetColumnSpan(this.ListBoxCartasDePorte, 2);
            this.ListBoxCartasDePorte.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ListBoxCartasDePorte.FormattingEnabled = true;
            this.ListBoxCartasDePorte.ItemHeight = 16;
            this.ListBoxCartasDePorte.Location = new System.Drawing.Point(4, 101);
            this.ListBoxCartasDePorte.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.ListBoxCartasDePorte.Name = "ListBoxCartasDePorte";
            this.ListBoxCartasDePorte.Size = new System.Drawing.Size(651, 510);
            this.ListBoxCartasDePorte.TabIndex = 4;
            // 
            // ProgressBarMain
            // 
            this.TableLayoutPanelMain.SetColumnSpan(this.ProgressBarMain, 2);
            this.ProgressBarMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ProgressBarMain.Location = new System.Drawing.Point(4, 619);
            this.ProgressBarMain.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.ProgressBarMain.Name = "ProgressBarMain";
            this.ProgressBarMain.Size = new System.Drawing.Size(651, 34);
            this.ProgressBarMain.TabIndex = 5;
            this.ProgressBarMain.Visible = false;
            // 
            // TableLayoutPanelMain
            // 
            this.TableLayoutPanelMain.ColumnCount = 2;
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle());
            this.TableLayoutPanelMain.Controls.Add(this.LabelArchivoCsv, 0, 0);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonArchivoCsvExaminar, 1, 0);
            this.TableLayoutPanelMain.Controls.Add(this.TextBoxArchivoCsv, 0, 1);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonLeerYVerificarCartasPorte, 0, 2);
            this.TableLayoutPanelMain.Controls.Add(this.ListBoxCartasDePorte, 0, 3);
            this.TableLayoutPanelMain.Controls.Add(this.ProgressBarMain, 0, 4);
            this.TableLayoutPanelMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TableLayoutPanelMain.GrowStyle = System.Windows.Forms.TableLayoutPanelGrowStyle.FixedSize;
            this.TableLayoutPanelMain.Location = new System.Drawing.Point(0, 0);
            this.TableLayoutPanelMain.Name = "TableLayoutPanelMain";
            this.TableLayoutPanelMain.RowCount = 5;
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.Size = new System.Drawing.Size(659, 657);
            this.TableLayoutPanelMain.TabIndex = 0;
            // 
            // LabelArchivoCsv
            // 
            this.LabelArchivoCsv.AutoSize = true;
            this.LabelArchivoCsv.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LabelArchivoCsv.Location = new System.Drawing.Point(4, 0);
            this.LabelArchivoCsv.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.LabelArchivoCsv.Name = "LabelArchivoCsv";
            this.LabelArchivoCsv.Size = new System.Drawing.Size(204, 33);
            this.LabelArchivoCsv.TabIndex = 0;
            this.LabelArchivoCsv.Text = "Archivo de cartas de porte (*.csv)";
            this.LabelArchivoCsv.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // FormVerificarCartasDePorte
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(659, 657);
            this.Controls.Add(this.TableLayoutPanelMain);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximizeBox = false;
            this.Name = "FormVerificarCartasDePorte";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Verificar C.P.s importadas";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormVerificarCartasDePorte_FormClosing);
            this.TableLayoutPanelMain.ResumeLayout(false);
            this.TableLayoutPanelMain.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button ButtonLeerYVerificarCartasPorte;
        private System.Windows.Forms.Button ButtonArchivoCsvExaminar;
        private System.Windows.Forms.TextBox TextBoxArchivoCsv;
        private System.Windows.Forms.ListBox ListBoxCartasDePorte;
        private System.Windows.Forms.OpenFileDialog openfiledialogMain;
        private System.Windows.Forms.ProgressBar ProgressBarMain;
        private System.Windows.Forms.TableLayoutPanel TableLayoutPanelMain;
        private System.Windows.Forms.Label LabelArchivoCsv;
    }
}