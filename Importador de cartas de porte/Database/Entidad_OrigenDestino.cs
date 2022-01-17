using CardonerSistemas.Database.Ado;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte.Database
{
    class Entidad_OrigenDestino
    {

        #region Properties

        public int IDEntidad { get; set; }
        public short IDOrigenDestino { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public int IDLocalidad { get; set; }
        public short? Kilometro { get; set; }
        public int? ONCCA_Codigo { get; set; }
        public bool ControlaStock { get; set; }
        public bool ConvierteEnSubProducto { get; set; }
        public bool RealizaAnalisisIPRO { get; set; }
        public bool Activo { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;

        #endregion

        #region Methods

        internal bool ObtenerPorCodigoOncca(Database database, int idEntidad, int codigoOncca)
        {
            SqlDataReader reader = null;

            try
            {
                SqlCommand command = new SqlCommand
                {
                    CommandType = CommandType.StoredProcedure,
                    Connection = database.Connection,
                    CommandText = "usp_Entidad_OrigenDestino_GetByCodigoOncca"
                };
                command.Parameters.Add("IDEntidad", SqlDbType.Int).Value = idEntidad;
                command.Parameters.Add("ONCCA_Codigo", SqlDbType.Int).Value = codigoOncca;
                reader = command.ExecuteReader();

                IsFound = false;
                if (reader.HasRows)
                {
                    reader.Read();
                    IDEntidad = SqlServerValues.GetInteger(reader, "IDEntidad");
                    IDOrigenDestino = SqlServerValues.GetShort(reader, "IDOrigenDestino");
                    Nombre = SqlServerValues.GetString(reader, "Nombre");
                    Direccion = SqlServerValues.GetString(reader, "Direccion");
                    IDLocalidad = SqlServerValues.GetInteger(reader, "IDLocalidad");
                    Kilometro = SqlServerValues.GetShortSafeAsNull(reader, "Kilometro");
                    ONCCA_Codigo = SqlServerValues.GetIntegerSafeAsNull(reader, "ONCCA_Codigo");
                    ControlaStock = SqlServerValues.GetBoolean(reader, "ControlaStock");
                    ConvierteEnSubProducto = SqlServerValues.GetBoolean(reader, "ConvierteEnSubProducto");
                    RealizaAnalisisIPRO = SqlServerValues.GetBoolean(reader, "RealizaAnalisisIPRO");
                    Activo = SqlServerValues.GetBoolean(reader, "Activo");
                    IsFound = true;
                    IsNew = false;
                }
                reader.Close();
                reader = null;
                command = null;
                return true;
            }
            catch (Exception ex)
            {
                if (reader != null)
                {
                    reader.Close();
                }
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al obtener el origen / destino desde la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        #endregion

    }
}