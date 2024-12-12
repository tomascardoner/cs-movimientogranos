
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
            this.ButtonImportarCPs = new System.Windows.Forms.Button();
            this.ButtonVerificarCPs = new System.Windows.Forms.Button();
            this.TableLayoutPanelMain = new System.Windows.Forms.TableLayoutPanel();
            this.LabelCopyright = new System.Windows.Forms.Label();
            this.TableLayoutPanelMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // ButtonImportarCPs
            // 
            this.ButtonImportarCPs.AutoSize = true;
            this.ButtonImportarCPs.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ButtonImportarCPs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonImportarCPs.Location = new System.Drawing.Point(14, 14);
            this.ButtonImportarCPs.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonImportarCPs.Name = "ButtonImportarCPs";
            this.ButtonImportarCPs.Size = new System.Drawing.Size(297, 111);
            this.ButtonImportarCPs.TabIndex = 0;
            this.ButtonImportarCPs.Text = "Importar cartas de porte";
            this.ButtonImportarCPs.UseVisualStyleBackColor = true;
            this.ButtonImportarCPs.Click += new System.EventHandler(this.ButtonImportarCPs_Click);
            // 
            // ButtonVerificarCPs
            // 
            this.ButtonVerificarCPs.AutoSize = true;
            this.ButtonVerificarCPs.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ButtonVerificarCPs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonVerificarCPs.Location = new System.Drawing.Point(14, 133);
            this.ButtonVerificarCPs.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonVerificarCPs.Name = "ButtonVerificarCPs";
            this.ButtonVerificarCPs.Size = new System.Drawing.Size(297, 111);
            this.ButtonVerificarCPs.TabIndex = 1;
            this.ButtonVerificarCPs.Text = "Verificar cartas de porte";
            this.ButtonVerificarCPs.UseVisualStyleBackColor = true;
            this.ButtonVerificarCPs.Click += new System.EventHandler(this.ButtonVerificarCPs_Click);
            // 
            // TableLayoutPanelMain
            // 
            this.TableLayoutPanelMain.ColumnCount = 1;
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.TableLayoutPanelMain.Controls.Add(this.ButtonImportarCPs, 0, 0);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonVerificarCPs, 0, 1);
            this.TableLayoutPanelMain.Controls.Add(this.LabelCopyright, 0, 2);
            this.TableLayoutPanelMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TableLayoutPanelMain.GrowStyle = System.Windows.Forms.TableLayoutPanelGrowStyle.FixedSize;
            this.TableLayoutPanelMain.Location = new System.Drawing.Point(0, 0);
            this.TableLayoutPanelMain.Name = "TableLayoutPanelMain";
            this.TableLayoutPanelMain.Padding = new System.Windows.Forms.Padding(10);
            this.TableLayoutPanelMain.RowCount = 3;
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.Size = new System.Drawing.Size(325, 275);
            this.TableLayoutPanelMain.TabIndex = 0;
            // 
            // LabelCopyright
            // 
            this.LabelCopyright.AutoSize = true;
            this.LabelCopyright.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LabelCopyright.Location = new System.Drawing.Point(14, 248);
            this.LabelCopyright.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.LabelCopyright.Name = "LabelCopyright";
            this.LabelCopyright.Size = new System.Drawing.Size(297, 17);
            this.LabelCopyright.TabIndex = 2;
            this.LabelCopyright.Text = "Copyright";
            this.LabelCopyright.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // FormMainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(325, 275);
            this.Controls.Add(this.TableLayoutPanelMain);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormMainMenu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "CS-Importador de cartas de porte";
            this.TableLayoutPanelMain.ResumeLayout(false);
            this.TableLayoutPanelMain.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button ButtonImportarCPs;
        private System.Windows.Forms.Button ButtonVerificarCPs;
        private System.Windows.Forms.TableLayoutPanel TableLayoutPanelMain;
        private System.Windows.Forms.Label LabelCopyright;
    }
}