using CardonerSistemas.Database.Ado;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal static class EntidadOrigenDestinoMetodos
    {
        private static bool LeerDatos(SqlDataReader dataReader, EntidadOrigenDestino entidadOrigenDestino, string errorMessage)
        {
            try
            {
                entidadOrigenDestino.IDEntidad = SqlServerValues.GetInteger(dataReader, "IDEntidad");
                entidadOrigenDestino.IDOrigenDestino = SqlServerValues.GetShort(dataReader, "IDOrigenDestino");
                entidadOrigenDestino.Nombre = SqlServerValues.GetString(dataReader, "Nombre");
                entidadOrigenDestino.Direccion = SqlServerValues.GetString(dataReader, "Direccion");
                entidadOrigenDestino.IDLocalidad = SqlServerValues.GetInteger(dataReader, "IDLocalidad");
                entidadOrigenDestino.Kilometro = SqlServerValues.GetShortSafeAsNull(dataReader, "Kilometro");
                entidadOrigenDestino.ONCCA_Codigo = SqlServerValues.GetIntegerSafeAsNull(dataReader, "ONCCA_Codigo");
                entidadOrigenDestino.ControlaStock = SqlServerValues.GetBoolean(dataReader, "ControlaStock");
                entidadOrigenDestino.ConvierteEnSubProducto = SqlServerValues.GetBoolean(dataReader, "ConvierteEnSubProducto");
                entidadOrigenDestino.RealizaAnalisisIPRO = SqlServerValues.GetBoolean(dataReader, "RealizaAnalisisIPRO");
                entidadOrigenDestino.Activo = SqlServerValues.GetBoolean(dataReader, "Activo");
                return true;
            }
            catch (System.Exception ex)
            {
                CardonerSistemas.Error.ProcessError(ex, errorMessage);
                return false;
            }
        }

        internal static bool ObtenerPorCodigoOncca(SqlServer database, int idEntidad, int codigoOncca, EntidadOrigenDestino entidadOrigenDestino)
        {
            const string ErrorMessage = "Error al obtener los datos del origen-destino desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("IDEntidad", SqlDbType.Int) { Value = idEntidad },
                new SqlParameter("ONCCA_Codigo", SqlDbType.Int) { Value = codigoOncca }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Entidad_OrigenDestino_GetByCodigoOncca", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                entidadOrigenDestino.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    if (LeerDatos(dataReader, entidadOrigenDestino, ErrorMessage))
                    {
                        entidadOrigenDestino.IsFound = true;
                        entidadOrigenDestino.IsNew = false;
                    }
                }
                dataReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                CardonerSistemas.Error.ProcessError(ex, ErrorMessage);
                return false;
            }
        }

        internal static bool ObtenerPrimeroSinNumeroPlanta(SqlServer database, int idEntidad, EntidadOrigenDestino entidadOrigenDestino)
        {
            const string ErrorMessage = "Error al obtener los datos del origen-destino desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("IDEntidad", SqlDbType.Int) { Value = idEntidad }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Entidad_OrigenDestino_GetFirst", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                entidadOrigenDestino.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    if (LeerDatos(dataReader, entidadOrigenDestino, ErrorMessage))
                    {
                        entidadOrigenDestino.IsFound = true;
                        entidadOrigenDestino.IsNew = false;
                    }
                }
                dataReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                CardonerSistemas.Error.ProcessError(ex, ErrorMessage);
                return false;
            }
        }
    }
}
