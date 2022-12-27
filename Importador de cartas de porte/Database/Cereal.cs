using CardonerSistemas.Database.Ado;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte.Database
{
    class Cereal
    {

        #region Properties

        public byte IDCereal { get; set; }
        public string Nombre { get; set; }
        public string Tipo { get; set; }
        public decimal? MermaVolatil { get; set; }
        public decimal? MermaHumedadBase { get; set; }
        public decimal? MermaHumedadManipuleo { get; set; }
        public byte? ONCCA_EspecieCodigo { get; set; }
        public string ONCCA_EspecieNombre { get; set; }
        public byte? ONCCA_GranoTipoCodigo { get; set; }
        public string ONCCA_GranoTipoNombre { get; set; }
        public bool RealizaAnalisisIPRO { get; set; }
        public bool Activo { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;

        #endregion

        #region Methods

        internal bool ObtenerPorNombre(Database database, string nombre)
        {
            try
            {
                SqlCommand command = new SqlCommand
                {
                    CommandType = CommandType.StoredProcedure,
                    Connection = database.Connection,
                    CommandText = "usp_Cereal_GetPorNombre"
                };
                command.Parameters.Add("Nombre", SqlDbType.VarChar).Value = nombre;
                SqlDataReader reader = command.ExecuteReader();

                IsFound = false;
                if (reader.HasRows)
                {
                    reader.Read();
                    IDCereal = SqlServerValues.GetByte(reader, "IDCereal");
                    Nombre = SqlServerValues.GetString(reader, "Nombre");
                    Tipo = SqlServerValues.GetString(reader, "Tipo");
                    MermaVolatil = SqlServerValues.GetDecimalSafeAsNull(reader, "MermaVolatil");
                    MermaHumedadBase = SqlServerValues.GetDecimalSafeAsNull(reader, "MermaHumedadBase");
                    MermaHumedadManipuleo = SqlServerValues.GetDecimalSafeAsNull(reader, "MermaHumedadManipuleo");
                    ONCCA_EspecieCodigo = SqlServerValues.GetByteSafeAsNull(reader, "ONCCA_EspecieCodigo");
                    ONCCA_EspecieNombre = SqlServerValues.GetStringSafeAsNull(reader, "ONCCA_EspecieNombre");
                    ONCCA_GranoTipoCodigo = SqlServerValues.GetByteSafeAsNull(reader, "ONCCA_GranoTipoCodigo");
                    ONCCA_GranoTipoNombre = SqlServerValues.GetStringSafeAsNull(reader, "ONCCA_GranoTipoNombre");
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
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al obtener el cereal desde la base de datos.\n\nError: {ex.Message}", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        #endregion

    }
}