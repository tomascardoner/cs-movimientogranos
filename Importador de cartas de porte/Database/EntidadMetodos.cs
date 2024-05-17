using CardonerSistemas.Database.Ado;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal static class EntidadMetodos
    {
        internal static bool ObtenerPorCuit(SqlServer database, long cuit, Entidad entidad)
        {
            const string ErrorMessage = "Error al obtener los datos de la entidad desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("Cuit", SqlDbType.BigInt) { Value = cuit }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Entidad_GetPorCuit", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                entidad.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    entidad.IDEntidad = SqlServerValues.GetInteger(dataReader, "IDEntidad");
                    entidad.Nombre = SqlServerValues.GetString(dataReader, "Nombre");
                    entidad.Cuit = SqlServerValues.GetLongSafeAsNull(dataReader, "CUIT");
                    entidad.EsTitular = SqlServerValues.GetBoolean(dataReader, "EsTitular");
                    entidad.EsIntermediario = SqlServerValues.GetBoolean(dataReader, "EsIntermediario");
                    entidad.EsRemitenteComercial = SqlServerValues.GetBoolean(dataReader, "EsRemitenteComercial");
                    entidad.EsCorredor = SqlServerValues.GetBoolean(dataReader, "EsCorredor");
                    entidad.EsEntregador = SqlServerValues.GetBoolean(dataReader, "EsEntregador");
                    entidad.EsDestinatario = SqlServerValues.GetBoolean(dataReader, "EsDestinatario");
                    entidad.EsDestino = SqlServerValues.GetBoolean(dataReader, "EsDestino");
                    entidad.EsTransportista = SqlServerValues.GetBoolean(dataReader, "EsTransportista");
                    entidad.EsChofer = SqlServerValues.GetBoolean(dataReader, "EsChofer");
                    entidad.EsClienteSubProducto = SqlServerValues.GetBoolean(dataReader, "EsClienteSubProducto");
                    entidad.Notas = SqlServerValues.GetStringSafeAsNull(dataReader, "Notas");
                    entidad.Activo = SqlServerValues.GetBoolean(dataReader, "Activo");
                    entidad.IDUsuarioCreacion = SqlServerValues.GetByte(dataReader, "IDUsuarioCreacion");
                    entidad.FechaHoraCreacion = SqlServerValues.GetDateTime(dataReader, "FechaHoraCreacion");
                    entidad.IDUsuarioModificacion = SqlServerValues.GetByte(dataReader, "IDUsuarioModificacion");
                    entidad.FechaHoraModificacion = SqlServerValues.GetDateTime(dataReader, "FechaHoraModificacion");
                    entidad.IsFound = true;
                    entidad.IsNew = false;
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

        internal static bool Actualizar(SqlServer database, Entidad entidad)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>()
            {
                new SqlParameter("Nombre", SqlDbType.VarChar) { Value = entidad.Nombre },
                new SqlParameter("CUIT", SqlDbType.BigInt) { Value = entidad.Cuit },
                new SqlParameter("EsTitular", SqlDbType.Bit) { Value = entidad.EsTitular },
                new SqlParameter("EsIntermediario", SqlDbType.Bit) { Value = entidad.EsIntermediario },
                new SqlParameter("EsRemitenteComercial", SqlDbType.Bit) { Value = entidad.EsRemitenteComercial },
                new SqlParameter("EsCorredor", SqlDbType.Bit) { Value = entidad.EsCorredor },
                new SqlParameter("EsEntregador", SqlDbType.Bit) { Value = entidad.EsEntregador },
                new SqlParameter("EsDestinatario", SqlDbType.Bit) { Value = entidad.EsDestinatario },
                new SqlParameter("EsDestino", SqlDbType.Bit) { Value = entidad.EsDestino },
                new SqlParameter("EsTransportista", SqlDbType.Bit) { Value = entidad.EsTransportista },
                new SqlParameter("EsChofer", SqlDbType.Bit) { Value = entidad.EsChofer },
                new SqlParameter("EsClienteSubProducto", SqlDbType.Bit) { Value = entidad.EsClienteSubProducto },
                new SqlParameter("Activo", SqlDbType.Bit) { Value = entidad.Activo },
                new SqlParameter("IDUsuario", SqlDbType.TinyInt) { Value = Properties.Settings.Default.IdUsuarioImportador }
            };
            if (string.IsNullOrWhiteSpace(entidad.Notas))
            {
                sqlParameters.Add(new SqlParameter("Notas", SqlDbType.VarChar) { Value = DBNull.Value });
            }
            else
            {
                sqlParameters.Add(new SqlParameter("Notas", SqlDbType.VarChar) { Value = entidad.Notas });
            }
            if (entidad.IsNew)
            {
                SqlParameter parameterIDEntidad = new SqlParameter("IDEntidad", SqlDbType.Int) { Direction = ParameterDirection.Output };
                sqlParameters.Add(parameterIDEntidad);
                bool result = database.Execute("usp_Entidad_Add", CommandType.StoredProcedure, sqlParameters, $"Error al agregar la entidad '{entidad.Nombre}' en la base de datos.");
                if (result)
                {
                    entidad.IDEntidad = (int)parameterIDEntidad.Value;
                }
                return result;
            }
            else
            {
                sqlParameters.Add(new SqlParameter("IDEntidad", SqlDbType.Int) { Value = entidad.IDEntidad });
                return database.Execute("usp_Entidad_Update", CommandType.StoredProcedure, sqlParameters, $"Error al actualizar los datos de la entidad '{entidad.Nombre}' en la base de datos.");
            }
        }
    }
}
