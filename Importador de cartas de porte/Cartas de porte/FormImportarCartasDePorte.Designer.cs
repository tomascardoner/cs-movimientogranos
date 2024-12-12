
namespace CS_Importador_de_cartas_de_porte
{
    partial class FormImportarCartasDePorte
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
            this.FolderBrowserDialogMain = new System.Windows.Forms.FolderBrowserDialog();
            this.TableLayoutPanelMain = new System.Windows.Forms.TableLayoutPanel();
            this.LabelCarpetaOrigen = new System.Windows.Forms.Label();
            this.ButtonCarpetaOrigenExaminar = new System.Windows.Forms.Button();
            this.TextBoxCarpetaOrigen = new System.Windows.Forms.TextBox();
            this.ButtonBuscarCartasPorte = new System.Windows.Forms.Button();
            this.CheckedListBoxArchivos = new System.Windows.Forms.CheckedListBox();
            this.ButtonArchivosSeleccionarTodos = new System.Windows.Forms.Button();
            this.ButtonArchivosSeleccionarHaciaAbajo = new System.Windows.Forms.Button();
            this.ButtonArchivosInvertirSeleccion = new System.Windows.Forms.Button();
            this.ButtonArchivosDeseleccionarTodos = new System.Windows.Forms.Button();
            this.CheckBoxCosecha = new System.Windows.Forms.CheckBox();
            this.ComboBoxCosecha = new System.Windows.Forms.ComboBox();
            this.ButtonImportar = new System.Windows.Forms.Button();
            this.ProgressBarMain = new System.Windows.Forms.ProgressBar();
            this.TableLayoutPanelMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // FolderBrowserDialogMain
            // 
            this.FolderBrowserDialogMain.ShowNewFolderButton = false;
            // 
            // TableLayoutPanelMain
            // 
            this.TableLayoutPanelMain.ColumnCount = 4;
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.TableLayoutPanelMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.TableLayoutPanelMain.Controls.Add(this.LabelCarpetaOrigen, 0, 0);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonCarpetaOrigenExaminar, 1, 0);
            this.TableLayoutPanelMain.Controls.Add(this.TextBoxCarpetaOrigen, 0, 1);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonBuscarCartasPorte, 0, 2);
            this.TableLayoutPanelMain.Controls.Add(this.CheckedListBoxArchivos, 0, 3);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonArchivosSeleccionarTodos, 0, 4);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonArchivosSeleccionarHaciaAbajo, 1, 4);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonArchivosInvertirSeleccion, 2, 4);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonArchivosDeseleccionarTodos, 3, 4);
            this.TableLayoutPanelMain.Controls.Add(this.CheckBoxCosecha, 0, 5);
            this.TableLayoutPanelMain.Controls.Add(this.ComboBoxCosecha, 1, 5);
            this.TableLayoutPanelMain.Controls.Add(this.ButtonImportar, 0, 6);
            this.TableLayoutPanelMain.Controls.Add(this.ProgressBarMain, 0, 7);
            this.TableLayoutPanelMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TableLayoutPanelMain.GrowStyle = System.Windows.Forms.TableLayoutPanelGrowStyle.FixedSize;
            this.TableLayoutPanelMain.Location = new System.Drawing.Point(0, 0);
            this.TableLayoutPanelMain.Name = "TableLayoutPanelMain";
            this.TableLayoutPanelMain.RowCount = 8;
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.TableLayoutPanelMain.Size = new System.Drawing.Size(714, 607);
            this.TableLayoutPanelMain.TabIndex = 0;
            // 
            // LabelCarpetaOrigen
            // 
            this.LabelCarpetaOrigen.AutoSize = true;
            this.LabelCarpetaOrigen.Dock = System.Windows.Forms.DockStyle.Fill;
            this.LabelCarpetaOrigen.Location = new System.Drawing.Point(4, 0);
            this.LabelCarpetaOrigen.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.LabelCarpetaOrigen.Name = "LabelCarpetaOrigen";
            this.LabelCarpetaOrigen.Size = new System.Drawing.Size(170, 33);
            this.LabelCarpetaOrigen.TabIndex = 0;
            this.LabelCarpetaOrigen.Text = "Ubicación de archivos:";
            this.LabelCarpetaOrigen.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // ButtonCarpetaOrigenExaminar
            // 
            this.ButtonCarpetaOrigenExaminar.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ButtonCarpetaOrigenExaminar.Location = new System.Drawing.Point(182, 4);
            this.ButtonCarpetaOrigenExaminar.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonCarpetaOrigenExaminar.Name = "ButtonCarpetaOrigenExaminar";
            this.ButtonCarpetaOrigenExaminar.Size = new System.Drawing.Size(35, 25);
            this.ButtonCarpetaOrigenExaminar.TabIndex = 1;
            this.ButtonCarpetaOrigenExaminar.TabStop = false;
            this.ButtonCarpetaOrigenExaminar.Text = "...";
            this.ButtonCarpetaOrigenExaminar.UseVisualStyleBackColor = true;
            this.ButtonCarpetaOrigenExaminar.Click += new System.EventHandler(this.ButtonCarpetaOrigenExaminar_Click);
            // 
            // TextBoxCarpetaOrigen
            // 
            this.TableLayoutPanelMain.SetColumnSpan(this.TextBoxCarpetaOrigen, 4);
            this.TextBoxCarpetaOrigen.Dock = System.Windows.Forms.DockStyle.Fill;
            this.TextBoxCarpetaOrigen.Location = new System.Drawing.Point(4, 37);
            this.TextBoxCarpetaOrigen.Margin = new System.Windows.Forms.Padding(4);
            this.TextBoxCarpetaOrigen.MaxLength = 512;
            this.TextBoxCarpetaOrigen.Name = "TextBoxCarpetaOrigen";
            this.TextBoxCarpetaOrigen.Size = new System.Drawing.Size(706, 22);
            this.TextBoxCarpetaOrigen.TabIndex = 2;
            // 
            // ButtonBuscarCartasPorte
            // 
            this.ButtonBuscarCartasPorte.AutoSize = true;
            this.ButtonBuscarCartasPorte.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.TableLayoutPanelMain.SetColumnSpan(this.ButtonBuscarCartasPorte, 4);
            this.ButtonBuscarCartasPorte.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonBuscarCartasPorte.Location = new System.Drawing.Point(4, 67);
            this.ButtonBuscarCartasPorte.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonBuscarCartasPorte.Name = "ButtonBuscarCartasPorte";
            this.ButtonBuscarCartasPorte.Size = new System.Drawing.Size(706, 26);
            this.ButtonBuscarCartasPorte.TabIndex = 3;
            this.ButtonBuscarCartasPorte.Text = "Buscar archivos";
            this.ButtonBuscarCartasPorte.UseVisualStyleBackColor = true;
            this.ButtonBuscarCartasPorte.Click += new System.EventHandler(this.ButtonBuscarCartasPorte_Click);
            // 
            // CheckedListBoxArchivos
            // 
            this.CheckedListBoxArchivos.CheckOnClick = true;
            this.TableLayoutPanelMain.SetColumnSpan(this.CheckedListBoxArchivos, 4);
            this.CheckedListBoxArchivos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.CheckedListBoxArchivos.FormattingEnabled = true;
            this.CheckedListBoxArchivos.Location = new System.Drawing.Point(4, 101);
            this.CheckedListBoxArchivos.Margin = new System.Windows.Forms.Padding(4);
            this.CheckedListBoxArchivos.Name = "CheckedListBoxArchivos";
            this.CheckedListBoxArchivos.Size = new System.Drawing.Size(706, 364);
            this.CheckedListBoxArchivos.TabIndex = 4;
            // 
            // ButtonArchivosSeleccionarTodos
            // 
            this.ButtonArchivosSeleccionarTodos.AutoSize = true;
            this.ButtonArchivosSeleccionarTodos.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ButtonArchivosSeleccionarTodos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonArchivosSeleccionarTodos.Location = new System.Drawing.Point(4, 473);
            this.ButtonArchivosSeleccionarTodos.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonArchivosSeleccionarTodos.Name = "ButtonArchivosSeleccionarTodos";
            this.ButtonArchivosSeleccionarTodos.Size = new System.Drawing.Size(170, 26);
            this.ButtonArchivosSeleccionarTodos.TabIndex = 5;
            this.ButtonArchivosSeleccionarTodos.Text = "Marcar todos";
            this.ButtonArchivosSeleccionarTodos.UseVisualStyleBackColor = true;
            this.ButtonArchivosSeleccionarTodos.Click += new System.EventHandler(this.ButtonArchivosSeleccionarTodos_Click);
            // 
            // ButtonArchivosSeleccionarHaciaAbajo
            // 
            this.ButtonArchivosSeleccionarHaciaAbajo.AutoSize = true;
            this.ButtonArchivosSeleccionarHaciaAbajo.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ButtonArchivosSeleccionarHaciaAbajo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonArchivosSeleccionarHaciaAbajo.Location = new System.Drawing.Point(182, 473);
            this.ButtonArchivosSeleccionarHaciaAbajo.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonArchivosSeleccionarHaciaAbajo.Name = "ButtonArchivosSeleccionarHaciaAbajo";
            this.ButtonArchivosSeleccionarHaciaAbajo.Size = new System.Drawing.Size(170, 26);
            this.ButtonArchivosSeleccionarHaciaAbajo.TabIndex = 6;
            this.ButtonArchivosSeleccionarHaciaAbajo.Text = "Marcar hacia abajo";
            this.ButtonArchivosSeleccionarHaciaAbajo.UseVisualStyleBackColor = true;
            this.ButtonArchivosSeleccionarHaciaAbajo.Click += new System.EventHandler(this.ButtonArchivosSeleccionarHaciaAbajo_Click);
            // 
            // ButtonArchivosInvertirSeleccion
            // 
            this.ButtonArchivosInvertirSeleccion.AutoSize = true;
            this.ButtonArchivosInvertirSeleccion.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ButtonArchivosInvertirSeleccion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonArchivosInvertirSeleccion.Location = new System.Drawing.Point(360, 473);
            this.ButtonArchivosInvertirSeleccion.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonArchivosInvertirSeleccion.Name = "ButtonArchivosInvertirSeleccion";
            this.ButtonArchivosInvertirSeleccion.Size = new System.Drawing.Size(170, 26);
            this.ButtonArchivosInvertirSeleccion.TabIndex = 7;
            this.ButtonArchivosInvertirSeleccion.Text = "Invertir selección";
            this.ButtonArchivosInvertirSeleccion.UseVisualStyleBackColor = true;
            this.ButtonArchivosInvertirSeleccion.Click += new System.EventHandler(this.ButtonArchivosInvertirSeleccion_Click);
            // 
            // ButtonArchivosDeseleccionarTodos
            // 
            this.ButtonArchivosDeseleccionarTodos.AutoSize = true;
            this.ButtonArchivosDeseleccionarTodos.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ButtonArchivosDeseleccionarTodos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonArchivosDeseleccionarTodos.Location = new System.Drawing.Point(538, 473);
            this.ButtonArchivosDeseleccionarTodos.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonArchivosDeseleccionarTodos.Name = "ButtonArchivosDeseleccionarTodos";
            this.ButtonArchivosDeseleccionarTodos.Size = new System.Drawing.Size(172, 26);
            this.ButtonArchivosDeseleccionarTodos.TabIndex = 8;
            this.ButtonArchivosDeseleccionarTodos.Text = "Desmarcar todos";
            this.ButtonArchivosDeseleccionarTodos.UseVisualStyleBackColor = true;
            this.ButtonArchivosDeseleccionarTodos.Click += new System.EventHandler(this.ButtonArchivosDeseleccionarTodos_Click);
            // 
            // CheckBoxCosecha
            // 
            this.CheckBoxCosecha.Appearance = System.Windows.Forms.Appearance.Button;
            this.CheckBoxCosecha.AutoSize = true;
            this.CheckBoxCosecha.Dock = System.Windows.Forms.DockStyle.Fill;
            this.CheckBoxCosecha.Location = new System.Drawing.Point(3, 506);
            this.CheckBoxCosecha.Name = "CheckBoxCosecha";
            this.CheckBoxCosecha.Size = new System.Drawing.Size(172, 26);
            this.CheckBoxCosecha.TabIndex = 9;
            this.CheckBoxCosecha.Text = "Cosecha:";
            this.CheckBoxCosecha.UseVisualStyleBackColor = true;
            this.CheckBoxCosecha.CheckedChanged += new System.EventHandler(this.CheckBoxCosecha_CheckedChanged);
            // 
            // ComboBoxCosecha
            // 
            this.TableLayoutPanelMain.SetColumnSpan(this.ComboBoxCosecha, 3);
            this.ComboBoxCosecha.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ComboBoxCosecha.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.ComboBoxCosecha.FormattingEnabled = true;
            this.ComboBoxCosecha.Location = new System.Drawing.Point(182, 507);
            this.ComboBoxCosecha.Margin = new System.Windows.Forms.Padding(4);
            this.ComboBoxCosecha.Name = "ComboBoxCosecha";
            this.ComboBoxCosecha.Size = new System.Drawing.Size(528, 24);
            this.ComboBoxCosecha.TabIndex = 10;
            this.ComboBoxCosecha.Visible = false;
            // 
            // ButtonImportar
            // 
            this.ButtonImportar.AutoSize = true;
            this.ButtonImportar.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.TableLayoutPanelMain.SetColumnSpan(this.ButtonImportar, 4);
            this.ButtonImportar.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ButtonImportar.Location = new System.Drawing.Point(4, 539);
            this.ButtonImportar.Margin = new System.Windows.Forms.Padding(4);
            this.ButtonImportar.Name = "ButtonImportar";
            this.ButtonImportar.Size = new System.Drawing.Size(706, 26);
            this.ButtonImportar.TabIndex = 11;
            this.ButtonImportar.Text = "Importar datos...";
            this.ButtonImportar.UseVisualStyleBackColor = true;
            this.ButtonImportar.Click += new System.EventHandler(this.ButtonImportar_Click);
            // 
            // ProgressBarMain
            // 
            this.TableLayoutPanelMain.SetColumnSpan(this.ProgressBarMain, 4);
            this.ProgressBarMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ProgressBarMain.Location = new System.Drawing.Point(4, 573);
            this.ProgressBarMain.Margin = new System.Windows.Forms.Padding(4);
            this.ProgressBarMain.Name = "ProgressBarMain";
            this.ProgressBarMain.Size = new System.Drawing.Size(706, 30);
            this.ProgressBarMain.TabIndex = 12;
            this.ProgressBarMain.Visible = false;
            // 
            // FormImportarCartasDePorte
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(714, 607);
            this.Controls.Add(this.TableLayoutPanelMain);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "FormImportarCartasDePorte";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Importar cartas de porte a CS-Movimientos de granos";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormImportarCartasDePorte_FormClosing);
            this.TableLayoutPanelMain.ResumeLayout(false);
            this.TableLayoutPanelMain.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.FolderBrowserDialog FolderBrowserDialogMain;
        private System.Windows.Forms.TableLayoutPanel TableLayoutPanelMain;
        private System.Windows.Forms.CheckedListBox CheckedListBoxArchivos;
        private System.Windows.Forms.Button ButtonBuscarCartasPorte;
        private System.Windows.Forms.TextBox TextBoxCarpetaOrigen;
        private System.Windows.Forms.Button ButtonCarpetaOrigenExaminar;
        private System.Windows.Forms.Label LabelCarpetaOrigen;
        private System.Windows.Forms.Button ButtonArchivosSeleccionarTodos;
        private System.Windows.Forms.ProgressBar ProgressBarMain;
        private System.Windows.Forms.Button ButtonImportar;
        private System.Windows.Forms.ComboBox ComboBoxCosecha;
        private System.Windows.Forms.CheckBox CheckBoxCosecha;
        private System.Windows.Forms.Button ButtonArchivosDeseleccionarTodos;
        private System.Windows.Forms.Button ButtonArchivosInvertirSeleccion;
        private System.Windows.Forms.Button ButtonArchivosSeleccionarHaciaAbajo;
    }
}

