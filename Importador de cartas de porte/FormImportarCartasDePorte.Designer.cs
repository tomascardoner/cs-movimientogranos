
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
            this.labelCarpetaOrigen = new System.Windows.Forms.Label();
            this.textboxCarpetaOrigen = new System.Windows.Forms.TextBox();
            this.buttonCarpetaOrigenExaminar = new System.Windows.Forms.Button();
            this.folderbrowserdialogMain = new System.Windows.Forms.FolderBrowserDialog();
            this.buttonBuscarCartasPorte = new System.Windows.Forms.Button();
            this.checkedlistboxArchivos = new System.Windows.Forms.CheckedListBox();
            this.buttonArchivosSeleccionarTodos = new System.Windows.Forms.Button();
            this.buttonArchivosInvertirSeleccion = new System.Windows.Forms.Button();
            this.buttonArchivosDeseleccionarTodos = new System.Windows.Forms.Button();
            this.buttonImportar = new System.Windows.Forms.Button();
            this.labelCosecha = new System.Windows.Forms.Label();
            this.comboboxCosecha = new System.Windows.Forms.ComboBox();
            this.progressbarMain = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // labelCarpetaOrigen
            // 
            this.labelCarpetaOrigen.AutoSize = true;
            this.labelCarpetaOrigen.Location = new System.Drawing.Point(12, 9);
            this.labelCarpetaOrigen.Name = "labelCarpetaOrigen";
            this.labelCarpetaOrigen.Size = new System.Drawing.Size(116, 13);
            this.labelCarpetaOrigen.TabIndex = 0;
            this.labelCarpetaOrigen.Text = "Ubicación de archivos:";
            // 
            // textboxCarpetaOrigen
            // 
            this.textboxCarpetaOrigen.Location = new System.Drawing.Point(12, 25);
            this.textboxCarpetaOrigen.MaxLength = 512;
            this.textboxCarpetaOrigen.Name = "textboxCarpetaOrigen";
            this.textboxCarpetaOrigen.Size = new System.Drawing.Size(309, 20);
            this.textboxCarpetaOrigen.TabIndex = 1;
            // 
            // buttonCarpetaOrigenExaminar
            // 
            this.buttonCarpetaOrigenExaminar.Location = new System.Drawing.Point(321, 25);
            this.buttonCarpetaOrigenExaminar.Name = "buttonCarpetaOrigenExaminar";
            this.buttonCarpetaOrigenExaminar.Size = new System.Drawing.Size(26, 20);
            this.buttonCarpetaOrigenExaminar.TabIndex = 2;
            this.buttonCarpetaOrigenExaminar.TabStop = false;
            this.buttonCarpetaOrigenExaminar.Text = "...";
            this.buttonCarpetaOrigenExaminar.UseVisualStyleBackColor = true;
            this.buttonCarpetaOrigenExaminar.Click += new System.EventHandler(this.buttonCarpetaOrigenExaminar_Click);
            // 
            // folderbrowserdialogMain
            // 
            this.folderbrowserdialogMain.ShowNewFolderButton = false;
            // 
            // buttonBuscarCartasPorte
            // 
            this.buttonBuscarCartasPorte.Location = new System.Drawing.Point(12, 51);
            this.buttonBuscarCartasPorte.Name = "buttonBuscarCartasPorte";
            this.buttonBuscarCartasPorte.Size = new System.Drawing.Size(336, 28);
            this.buttonBuscarCartasPorte.TabIndex = 3;
            this.buttonBuscarCartasPorte.Text = "Buscar archivos";
            this.buttonBuscarCartasPorte.UseVisualStyleBackColor = true;
            this.buttonBuscarCartasPorte.Click += new System.EventHandler(this.buttonBuscarCartasPorte_Click);
            // 
            // checkedlistboxArchivos
            // 
            this.checkedlistboxArchivos.CheckOnClick = true;
            this.checkedlistboxArchivos.FormattingEnabled = true;
            this.checkedlistboxArchivos.Location = new System.Drawing.Point(12, 85);
            this.checkedlistboxArchivos.Name = "checkedlistboxArchivos";
            this.checkedlistboxArchivos.Size = new System.Drawing.Size(336, 274);
            this.checkedlistboxArchivos.TabIndex = 4;
            // 
            // buttonArchivosSeleccionarTodos
            // 
            this.buttonArchivosSeleccionarTodos.Location = new System.Drawing.Point(11, 365);
            this.buttonArchivosSeleccionarTodos.Name = "buttonArchivosSeleccionarTodos";
            this.buttonArchivosSeleccionarTodos.Size = new System.Drawing.Size(108, 28);
            this.buttonArchivosSeleccionarTodos.TabIndex = 5;
            this.buttonArchivosSeleccionarTodos.Text = "Seleccionar todos";
            this.buttonArchivosSeleccionarTodos.UseVisualStyleBackColor = true;
            this.buttonArchivosSeleccionarTodos.Click += new System.EventHandler(this.buttonArchivosSeleccionarTodos_Click);
            // 
            // buttonArchivosInvertirSeleccion
            // 
            this.buttonArchivosInvertirSeleccion.Location = new System.Drawing.Point(126, 365);
            this.buttonArchivosInvertirSeleccion.Name = "buttonArchivosInvertirSeleccion";
            this.buttonArchivosInvertirSeleccion.Size = new System.Drawing.Size(102, 28);
            this.buttonArchivosInvertirSeleccion.TabIndex = 6;
            this.buttonArchivosInvertirSeleccion.Text = "Invertir selección";
            this.buttonArchivosInvertirSeleccion.UseVisualStyleBackColor = true;
            this.buttonArchivosInvertirSeleccion.Click += new System.EventHandler(this.buttonArchivosInvertirSeleccion_Click);
            // 
            // buttonArchivosDeseleccionarTodos
            // 
            this.buttonArchivosDeseleccionarTodos.Location = new System.Drawing.Point(234, 365);
            this.buttonArchivosDeseleccionarTodos.Name = "buttonArchivosDeseleccionarTodos";
            this.buttonArchivosDeseleccionarTodos.Size = new System.Drawing.Size(114, 28);
            this.buttonArchivosDeseleccionarTodos.TabIndex = 7;
            this.buttonArchivosDeseleccionarTodos.Text = "Deseleccionar todos";
            this.buttonArchivosDeseleccionarTodos.UseVisualStyleBackColor = true;
            this.buttonArchivosDeseleccionarTodos.Click += new System.EventHandler(this.buttonArchivosDeseleccionarTodos_Click);
            // 
            // buttonImportar
            // 
            this.buttonImportar.Location = new System.Drawing.Point(12, 426);
            this.buttonImportar.Name = "buttonImportar";
            this.buttonImportar.Size = new System.Drawing.Size(336, 27);
            this.buttonImportar.TabIndex = 10;
            this.buttonImportar.Text = "Importar datos...";
            this.buttonImportar.UseVisualStyleBackColor = true;
            this.buttonImportar.Click += new System.EventHandler(this.buttonImportar_Click);
            // 
            // labelCosecha
            // 
            this.labelCosecha.AutoSize = true;
            this.labelCosecha.Location = new System.Drawing.Point(12, 402);
            this.labelCosecha.Name = "labelCosecha";
            this.labelCosecha.Size = new System.Drawing.Size(52, 13);
            this.labelCosecha.TabIndex = 8;
            this.labelCosecha.Text = "Cosecha:";
            // 
            // comboboxCosecha
            // 
            this.comboboxCosecha.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboboxCosecha.FormattingEnabled = true;
            this.comboboxCosecha.Location = new System.Drawing.Point(70, 399);
            this.comboboxCosecha.Name = "comboboxCosecha";
            this.comboboxCosecha.Size = new System.Drawing.Size(277, 21);
            this.comboboxCosecha.TabIndex = 9;
            // 
            // progressbarMain
            // 
            this.progressbarMain.Location = new System.Drawing.Point(12, 365);
            this.progressbarMain.Name = "progressbarMain";
            this.progressbarMain.Size = new System.Drawing.Size(335, 28);
            this.progressbarMain.TabIndex = 11;
            // 
            // FormImportarCartasDePorte
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(359, 462);
            this.Controls.Add(this.comboboxCosecha);
            this.Controls.Add(this.labelCosecha);
            this.Controls.Add(this.buttonImportar);
            this.Controls.Add(this.buttonArchivosDeseleccionarTodos);
            this.Controls.Add(this.buttonArchivosInvertirSeleccion);
            this.Controls.Add(this.buttonArchivosSeleccionarTodos);
            this.Controls.Add(this.checkedlistboxArchivos);
            this.Controls.Add(this.buttonBuscarCartasPorte);
            this.Controls.Add(this.buttonCarpetaOrigenExaminar);
            this.Controls.Add(this.textboxCarpetaOrigen);
            this.Controls.Add(this.labelCarpetaOrigen);
            this.Controls.Add(this.progressbarMain);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "FormImportarCartasDePorte";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Importar cartas de porte";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormImportarCartasDePorte_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelCarpetaOrigen;
        private System.Windows.Forms.TextBox textboxCarpetaOrigen;
        private System.Windows.Forms.Button buttonCarpetaOrigenExaminar;
        private System.Windows.Forms.FolderBrowserDialog folderbrowserdialogMain;
        private System.Windows.Forms.Button buttonBuscarCartasPorte;
        private System.Windows.Forms.CheckedListBox checkedlistboxArchivos;
        private System.Windows.Forms.Button buttonArchivosSeleccionarTodos;
        private System.Windows.Forms.Button buttonArchivosInvertirSeleccion;
        private System.Windows.Forms.Button buttonArchivosDeseleccionarTodos;
        private System.Windows.Forms.Button buttonImportar;
        private System.Windows.Forms.Label labelCosecha;
        private System.Windows.Forms.ComboBox comboboxCosecha;
        private System.Windows.Forms.ProgressBar progressbarMain;
    }
}

