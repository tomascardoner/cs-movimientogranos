using CardonerSistemas.Database.Ado;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal static class CosechaMetodos
    {
        internal static List<Cosecha> ObtenerVarias(SqlServer database)
        {
            const string ErrorMessage = "Error al obtener la lista de cosechas desde la base de datos.";

            List<Cosecha> cosechas = new List<Cosecha>();
            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("ListaNinguno", SqlDbType.Bit) { Value = 0 },
                new SqlParameter("Activo", SqlDbType.Bit) { Value = 1 },
                new SqlParameter("IDCosecha", SqlDbType.TinyInt) { Value = 0 }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Cosecha_List", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return cosechas;
            }
            try
            {
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        Cosecha cosecha = new Cosecha()
                        {
                            IDCosecha = SqlServerValues.GetByte(dataReader, "IDCosecha"),
                            Nombre = SqlServerValues.GetString(dataReader, "Nombre"),
                            // FechaInicio = reader.GetDateTime(reader.GetOrdinal("FechaInicio")),
                            // FechaFin = reader.GetDateTime(reader.GetOrdinal("FechaFin")),
                            // ONCCA_Codigo = reader.GetString(reader.GetOrdinal("ONCCA_Codigo")),
                            // Activo = reader.GetBoolean(reader.GetOrdinal("Activo"))
                        };
                        cosechas.Add(cosecha);
                    }
                }
                dataReader.Close();
            }
            catch (System.Exception ex)
            {
                CardonerSistemas.Error.ProcessError(ex, ErrorMessage);
            }
            return cosechas;
        }

        internal static bool ObtenerPorCodigoOncca(SqlServer database, string codigoOncca, Cosecha cosecha)
        {
            const string ErrorMessage = "Error al obtener los datos de la cosecha desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("CodigoOncca", SqlDbType.Char, 5) { Value = codigoOncca }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Cosecha_GetPorCodigoOncca", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                cosecha.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    cosecha.IDCosecha = SqlServerValues.GetByte(dataReader, "IDCosecha");
                    cosecha.Nombre = SqlServerValues.GetString(dataReader, "Nombre");
                    cosecha.FechaInicio = SqlServerValues.GetDateTime(dataReader, "FechaInicio");
                    cosecha.FechaFin = SqlServerValues.GetDateTime(dataReader, "FechaFin");
                    cosecha.ONCCA_Codigo = SqlServerValues.GetStringSafeAsEmpty(dataReader, "ONCCA_Codigo");
                    cosecha.Activo = SqlServerValues.GetBoolean(dataReader, "Activo");
                    cosecha.IsFound = true;
                    cosecha.IsNew = false;
                }
                dataReader.Close();
                return true;
            }
            catch (System.Exception ex)
            {
                CardonerSistemas.Error.ProcessError(ex, ErrorMessage);
                return false;
            }
        }
    }
}
