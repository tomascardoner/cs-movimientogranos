using CardonerSistemas.Database.Ado;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte.Database
{
    public class Cosecha
    {

        #region Properties

        public byte IDCosecha { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string ONCCA_Codigo { get; set; }
        public bool Activo { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;

        #endregion

        #region Methods

        internal bool ObtenerPorCodigoOncca(Database database, string codigoOncca)
        {
            try
            {
                SqlCommand command = new SqlCommand
                {
                    CommandType = CommandType.StoredProcedure,
                    Connection = database.Connection,
                    CommandText = "usp_Cosecha_GetPorCodigoOncca"
                };
                command.Parameters.Add("CodigoOncca", SqlDbType.Char, 5).Value = codigoOncca;
                SqlDataReader reader = command.ExecuteReader();

                IsFound = false;
                if (reader.HasRows)
                {
                    reader.Read();
                    IDCosecha = SqlServerValues.GetByte(reader, "IDCosecha");
                    Nombre = SqlServerValues.GetString(reader, "Nombre");
                    FechaInicio = SqlServerValues.GetDateTime(reader, "FechaInicio");
                    FechaFin = SqlServerValues.GetDateTime(reader, "FechaFin");
                    ONCCA_Codigo = SqlServerValues.GetStringSafeAsEmpty(reader, "ONCCA_Codigo");
                    Activo = SqlServerValues.GetBoolean(reader, "Activo");
                    IsFound = true;
                    IsNew = false;
                }
                reader.Close();
                return true;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al obtener la cosecha desde la base de datos.\n\nError: {ex.Message}", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        #endregion

    }
}
