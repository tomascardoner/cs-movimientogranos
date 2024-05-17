using CardonerSistemas.Database.Ado;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal static class CerealMetodos
    {
        internal static bool ObtenerPorNombre(SqlServer database, string nombre, Cereal cereal)
        {
            const string ErrorMessage = "Error al obtener los datos del cereal desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("Nombre", SqlDbType.VarChar) { Value = nombre }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Cereal_GetPorNombre", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                cereal.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    cereal.IDCereal = SqlServerValues.GetByte(dataReader, "IDCereal");
                    cereal.Nombre = SqlServerValues.GetString(dataReader, "Nombre");
                    cereal.Tipo = SqlServerValues.GetString(dataReader, "Tipo");
                    cereal.MermaVolatil = SqlServerValues.GetDecimalSafeAsNull(dataReader, "MermaVolatil");
                    cereal.MermaHumedadBase = SqlServerValues.GetDecimalSafeAsNull(dataReader, "MermaHumedadBase");
                    cereal.MermaHumedadManipuleo = SqlServerValues.GetDecimalSafeAsNull(dataReader, "MermaHumedadManipuleo");
                    cereal.ONCCA_EspecieCodigo = SqlServerValues.GetByteSafeAsNull(dataReader, "ONCCA_EspecieCodigo");
                    cereal.ONCCA_EspecieNombre = SqlServerValues.GetStringSafeAsNull(dataReader, "ONCCA_EspecieNombre");
                    cereal.ONCCA_GranoTipoCodigo = SqlServerValues.GetByteSafeAsNull(dataReader, "ONCCA_GranoTipoCodigo");
                    cereal.ONCCA_GranoTipoNombre = SqlServerValues.GetStringSafeAsNull(dataReader, "ONCCA_GranoTipoNombre");
                    cereal.RealizaAnalisisIPRO = SqlServerValues.GetBoolean(dataReader, "RealizaAnalisisIPRO");
                    cereal.Activo = SqlServerValues.GetBoolean(dataReader, "Activo");
                    cereal.IsFound = true;
                    cereal.IsNew = false;
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
