using CardonerSistemas.Database.Ado;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using CardonerSistemas;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal static class MovimientoCerealMetodos
    {
        private static bool LeerDatos(SqlDataReader dataReader, MovimientoCereal movimientoCereal, string errorMessage)
        {
            try
            {
                movimientoCereal.IDMovimiento_Cereal = SqlServerValues.GetInteger(dataReader, "IDMovimiento_Cereal");
                movimientoCereal.Tipo = SqlServerValues.GetString(dataReader, "Tipo")[0];

                // Encabezado
                movimientoCereal.ComprobanteNumero = SqlServerValues.GetLong(dataReader, "ComprobanteNumero");
                movimientoCereal.ComprobanteNumeroConFormato = SqlServerValues.GetStringSafeAsEmpty(dataReader, "ComprobanteNumeroConFormato");
                movimientoCereal.IDCartaPorte_Talonario = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDCartaPorte_Talonario");
                movimientoCereal.CTGNumero = SqlServerValues.GetLongSafeAsNull(dataReader, "CTGNumero");
                movimientoCereal.FechaCarga = SqlServerValues.GetDateTime(dataReader, "FechaCarga");

                // Sección A - Intervinientes
                movimientoCereal.IDEntidad_Titular = SqlServerValues.GetInteger(dataReader, "IDEntidad_Titular");
                movimientoCereal.IDEntidad_Intermediario = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_Intermediario");
                movimientoCereal.IDEntidad_RemitenteComercial = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_RemitenteComercial");
                movimientoCereal.IDEntidad_Corredor = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_Corredor");
                movimientoCereal.IDEntidad_Entregador = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_Entregador");
                movimientoCereal.IDEntidad_Destinatario = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_Destinatario");
                movimientoCereal.IDEntidad_Destino = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_Destino");
                movimientoCereal.IDEntidad_Transportista = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_Transportista");
                movimientoCereal.IDEntidad_Chofer = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDEntidad_Chofer");

                // Sección B - Grano / Especie
                movimientoCereal.IDCosecha = SqlServerValues.GetByte(dataReader, "IDCosecha");
                movimientoCereal.IDCereal = SqlServerValues.GetByte(dataReader, "IDCereal");
                movimientoCereal.IDContrato = SqlServerValues.GetIntegerSafeAsNull(dataReader, "IDContrato");
                movimientoCereal.PesoBruto = SqlServerValues.GetInteger(dataReader, "PesoBruto");
                movimientoCereal.PesoTara = SqlServerValues.GetInteger(dataReader, "PesoTara");
                movimientoCereal.PesoNeto = SqlServerValues.GetInteger(dataReader, "PesoNeto");

                // Datos para mermas
                if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada)
                {
                    movimientoCereal.Volatil = SqlServerValues.GetDecimalSafeAsNull(dataReader, "Volatil");
                    movimientoCereal.Humedad = SqlServerValues.GetDecimalSafeAsNull(dataReader, "Humedad");
                    movimientoCereal.Zaranda = SqlServerValues.GetDecimalSafeAsNull(dataReader, "Zaranda");
                    movimientoCereal.MermaVolatilKilogramo = SqlServerValues.GetInteger(dataReader, "MermaVolatilKilogramo");
                    movimientoCereal.MermaHumedadPorcentaje = SqlServerValues.GetDecimalSafeAsNull(dataReader, "MermaHumedadPorcentaje");
                    movimientoCereal.MermaHumedadKilogramo = SqlServerValues.GetIntegerSafeAsNull(dataReader, "MermaHumedadKilogramo");
                    movimientoCereal.MermaZarandaKilogramo = SqlServerValues.GetIntegerSafeAsNull(dataReader, "MermaZarandaKilogramo");
                }
                else
                {
                    movimientoCereal.Volatil = null;
                    movimientoCereal.Humedad = null;
                    movimientoCereal.Zaranda = null;
                    movimientoCereal.MermaVolatilKilogramo = null;
                    movimientoCereal.MermaHumedadPorcentaje = null;
                    movimientoCereal.MermaHumedadKilogramo = null;
                    movimientoCereal.MermaZarandaKilogramo = null;
                }
                movimientoCereal.PesoFinal = SqlServerValues.GetIntegerSafeAsNull(dataReader, "PesoFinal");

                // Sección C - Procedencia
                movimientoCereal.IDOrigenDestino_Origen = SqlServerValues.GetShortSafeAsNull(dataReader, "IDOrigenDestino_Origen");

                // Sección D - Destino de la mercadería
                movimientoCereal.IDOrigenDestino_Destino = SqlServerValues.GetShortSafeAsNull(dataReader, "IDOrigenDestino_Destino");

                // Sección E - Datos del transporte
                movimientoCereal.CTGCancelacion = SqlServerValues.GetIntegerSafeAsNull(dataReader, "CTGCancelacion");
                movimientoCereal.TransporteDominioCamion = SqlServerValues.GetStringSafeAsEmpty(dataReader, "TransporteDominioCamion").Trim();
                movimientoCereal.TransporteDominioAcoplado = SqlServerValues.GetStringSafeAsEmpty(dataReader, "TransporteDominioAcoplado").Trim();
                movimientoCereal.TransporteKilometro = SqlServerValues.GetShortSafeAsNull(dataReader, "TransporteKilometro");
                movimientoCereal.TransporteTarifaReferencia = SqlServerValues.GetDecimalSafeAsNull(dataReader, "TransporteTarifaReferencia");
                movimientoCereal.TransporteTarifa = SqlServerValues.GetDecimalSafeAsNull(dataReader, "TransporteTarifa");

                // Sección G - Descarga
                if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada)
                {
                    movimientoCereal.FechaHoraArribo = SqlServerValues.GetDateTimeSafeAsNull(dataReader, "FechaHoraArribo");
                    movimientoCereal.FechaHoraDescarga = SqlServerValues.GetDateTimeSafeAsNull(dataReader, "FechaHoraDescarga");
                }
                else
                {
                    movimientoCereal.FechaHoraArribo = null;
                    movimientoCereal.FechaHoraDescarga = null;
                }

                // Datos extras
                movimientoCereal.DeclaraIPRO = SqlServerValues.GetBoolean(dataReader, "DeclaraIPRO");
                movimientoCereal.IDCartaPorte_MotivoAnulacion = SqlServerValues.GetByteSafeAsNull(dataReader, "IDCartaPorte_MotivoAnulacion");
                movimientoCereal.Notas = SqlServerValues.GetStringSafeAsNull(dataReader, "Notas");
                movimientoCereal.Calculo_TarifaIndice = SqlServerValues.GetShortSafeAsNull(dataReader, "Calculo_TarifaIndice");

                // Datos del registro
                movimientoCereal.IDUsuarioCreacion = SqlServerValues.GetByte(dataReader, "IDUsuarioCreacion");
                movimientoCereal.FechaHoraCreacion = SqlServerValues.GetDateTime(dataReader, "FechaHoraCreacion");
                movimientoCereal.IDUsuarioModificacion = SqlServerValues.GetByte(dataReader, "IDUsuarioModificacion");
                movimientoCereal.FechaHoraModificacion = SqlServerValues.GetDateTime(dataReader, "FechaHoraModificacion");
                movimientoCereal.FechaHoraLiquidacionServicio = SqlServerValues.GetDateTimeSafeAsNull(dataReader, "FechaHoraLiquidacionServicio");
                movimientoCereal.FechaHoraEnvioBolsaTech = SqlServerValues.GetDateTimeSafeAsNull(dataReader, "FechaHoraEnvioBolsaTech");

                if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada)
                {
                    movimientoCereal.Certificado = SqlServerValues.GetBooleanSafeAsNull(dataReader, "Certificado");
                }
                else
                {
                    movimientoCereal.Certificado = null;
                }
                movimientoCereal.KilogramoAplicado = SqlServerValues.GetIntegerSafeAsNull(dataReader, "KilogramoAplicado");

                return true;
            }
            catch (Exception ex)
            {
                Error.ProcessError(ex, errorMessage);
                return false;
            }
        }

        internal static bool ObtenerPorId(SqlServer database, int id, MovimientoCereal movimientoCereal)
        {
            const string ErrorMessage = "Error al obtener los datos del movimiento de cereal desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("IDMovimiento_Cereal", SqlDbType.Int) { Value = id }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Movimiento_Cereal_Get", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                movimientoCereal.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    if (LeerDatos(dataReader, movimientoCereal, ErrorMessage))
                    {
                        movimientoCereal.IsFound = true;
                        movimientoCereal.IsNew = false;
                    }
                }
                dataReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                Error.ProcessError(ex, ErrorMessage);
                return false;
            }
        }

        internal static bool ObtenerPorCtg(SqlServer database, long ctg, MovimientoCereal movimientoCereal)
        {
            const string ErrorMessage = "Error al obtener los datos del movimiento de cereal desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("Ctg", SqlDbType.BigInt) { Value = ctg }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Movimiento_Cereal_GetByCtg", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                movimientoCereal.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    if (LeerDatos(dataReader, movimientoCereal, ErrorMessage))
                    {
                        movimientoCereal.IsFound = true;
                        movimientoCereal.IsNew = false;
                    }
                }
                dataReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                Error.ProcessError(ex, ErrorMessage);
                return false;
            }
        }

        internal static bool ObtenerPorCtgYTipo(SqlServer database, long ctg, char tipo, MovimientoCereal movimientoCereal)
        {
            const string ErrorMessage = "Error al obtener los datos del movimiento de cereal desde la base de datos.";

            List<SqlParameter> sqlParameters = new List<SqlParameter>
            {
                new SqlParameter("Ctg", SqlDbType.BigInt) { Value = ctg },
                new SqlParameter("Tipo", SqlDbType.Char, 1) { Value = tipo }
            };
            if (!database.OpenDataReader(out SqlDataReader dataReader, "usp_Movimiento_Cereal_GetByCtgYTipo", CommandType.StoredProcedure, CommandBehavior.SingleResult, sqlParameters, ErrorMessage))
            {
                return false;
            }
            try
            {
                movimientoCereal.IsFound = false;
                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    if (LeerDatos(dataReader, movimientoCereal, ErrorMessage))
                    {
                        movimientoCereal.IsFound = true;
                        movimientoCereal.IsNew = false;
                    }
                }
                dataReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                Error.ProcessError(ex, ErrorMessage);
                return false;
            }
        }

        internal static bool Actualizar(SqlServer database, MovimientoCereal movimientoCereal)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>()
            {
                new SqlParameter("ComprobanteNumero", SqlDbType.Char) { Value = movimientoCereal.ComprobanteNumero },
                new SqlParameter("IDCartaPorte_Talonario", SqlDbType.Int) { Value = DBNull.Value },
                new SqlParameter("CTGNumero", SqlDbType.BigInt) { Value = movimientoCereal.CTGNumero },
                new SqlParameter("FechaCarga", SqlDbType.Date) { Value = movimientoCereal.FechaCarga },
                new SqlParameter("IDEntidad_Titular", SqlDbType.Int) { Value = movimientoCereal.IDEntidad_Titular },
                new SqlParameter("IDEntidad_Intermediario", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_Intermediario) },
                new SqlParameter("IDEntidad_RemitenteComercial", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_RemitenteComercial) },
                new SqlParameter("IDEntidad_Corredor", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_Corredor) },
                new SqlParameter("IDEntidad_Entregador", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_Entregador) },
                new SqlParameter("IDEntidad_Destinatario", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_Destinatario) },
                new SqlParameter("IDEntidad_Destino", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_Destino) },
                new SqlParameter("IDEntidad_Transportista", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_Transportista) },
                new SqlParameter("IDEntidad_Chofer", SqlDbType.Int) { Value = SqlServerValues.SetValue(movimientoCereal.IDEntidad_Chofer) },
                new SqlParameter("IDCosecha", SqlDbType.TinyInt) { Value = movimientoCereal.IDCosecha },
                new SqlParameter("IDCereal", SqlDbType.TinyInt) { Value = movimientoCereal.IDCereal },
                new SqlParameter("IDContrato", SqlDbType.Int) { Value = DBNull.Value },
                new SqlParameter("PesoBruto", SqlDbType.Int) { Value = movimientoCereal.PesoBruto },
                new SqlParameter("PesoTara", SqlDbType.Int) { Value = movimientoCereal.PesoTara },
                new SqlParameter("PesoNeto", SqlDbType.Int) { Value = movimientoCereal.PesoNeto },
                new SqlParameter("Volatil", SqlDbType.Decimal) { Value = SqlServerValues.SetValue(movimientoCereal.Volatil) },
                new SqlParameter("Humedad", SqlDbType.Decimal) { Value = DBNull.Value },
                new SqlParameter("Zaranda", SqlDbType.Decimal) { Value = DBNull.Value },
                new SqlParameter("IDOrigenDestino_Origen", SqlDbType.SmallInt) { Value = SqlServerValues.SetValue(movimientoCereal.IDOrigenDestino_Origen) },
                new SqlParameter("IDOrigenDestino_Destino", SqlDbType.SmallInt) { Value = SqlServerValues.SetValue(movimientoCereal.IDOrigenDestino_Destino) },
                new SqlParameter("CTGCancelacion", SqlDbType.Int) { Value = DBNull.Value },
                new SqlParameter("TransporteDominioCamion", SqlDbType.VarChar) { Value = SqlServerValues.SetValue(movimientoCereal.TransporteDominioCamion) },
                new SqlParameter("TransporteDominioAcoplado", SqlDbType.VarChar) { Value = SqlServerValues.SetValue(movimientoCereal.TransporteDominioAcoplado) },
                new SqlParameter("TransporteKilometro", SqlDbType.SmallInt) { Value = SqlServerValues.SetValue(movimientoCereal.TransporteKilometro) },
                new SqlParameter("TransporteTarifaReferencia", SqlDbType.Money) { Value = SqlServerValues.SetValue(movimientoCereal.TransporteTarifaReferencia) },
                new SqlParameter("TransporteTarifa", SqlDbType.Money) { Value = SqlServerValues.SetValue(movimientoCereal.TransporteTarifa) },
                new SqlParameter("FechaHoraArribo", SqlDbType.SmallDateTime) { Value = SqlServerValues.SetValue(movimientoCereal.FechaHoraArribo) },
                new SqlParameter("FechaHoraDescarga", SqlDbType.SmallDateTime) { Value = SqlServerValues.SetValue(movimientoCereal.FechaHoraDescarga) },
                new SqlParameter("DeclaraIPRO", SqlDbType.Bit) { Value = false },
                new SqlParameter("IDCartaPorte_MotivoAnulacion", SqlDbType.TinyInt) { Value = SqlServerValues.SetValue(movimientoCereal.IDCartaPorte_MotivoAnulacion) },
                new SqlParameter("Notas", SqlDbType.VarChar) { Value = SqlServerValues.SetValue(movimientoCereal.Notas) },
                new SqlParameter("Calculo_TarifaIndice", SqlDbType.SmallInt) { Value = DBNull.Value },
                new SqlParameter("IDUsuario", SqlDbType.TinyInt) { Value = Properties.Settings.Default.IdUsuarioImportador },
                new SqlParameter("StringListOfIDPesadaCompleta", SqlDbType.VarChar) { Value = DBNull.Value }
            };
            if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada)
            {
                sqlParameters.Add(new SqlParameter("Certificado", SqlDbType.Bit) { Value = SqlServerValues.SetValue(movimientoCereal.Certificado) });
            }
            else
            {
                sqlParameters.Add(new SqlParameter("Certificado", SqlDbType.Bit) { Value = DBNull.Value });
            }
            try
            {
                if (movimientoCereal.IsNew)
                {
                    SqlParameter parameterIDMovimientoCereal = new SqlParameter("IDMovimiento_Cereal", SqlDbType.Int) { Direction = ParameterDirection.Output };
                    sqlParameters.Add(parameterIDMovimientoCereal);
                    sqlParameters.Add(new SqlParameter("Tipo", SqlDbType.Char) { Value = movimientoCereal.Tipo });
                    bool result = database.Execute("usp_Movimiento_Cereal_Add", CommandType.StoredProcedure, sqlParameters, $"Error al agregar la carta de porte Nº {movimientoCereal.ComprobanteNumero} en la base de datos.");
                    if (result)
                    {
                        movimientoCereal.IDMovimiento_Cereal = (int)parameterIDMovimientoCereal.Value;
                    }
                    return result;
                }
                else
                {
                    sqlParameters.Add(new SqlParameter("IDMovimiento_Cereal", SqlDbType.Int) { Value = movimientoCereal.IDMovimiento_Cereal });
                    return database.Execute("usp_Movimiento_Cereal_Update", CommandType.StoredProcedure, sqlParameters, string.Empty, true);
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("FK__Entidad_OrigenDestino__Movimiento__Origen"))
                {
                    MessageBox.Show($"La entidad titular de la carta de porte no tiene especificado un origen. Carta de porte Nº {movimientoCereal.ComprobanteNumero}.", My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    if (movimientoCereal.IsNew)
                    {
                        Error.ProcessError(ex, $"Error al agregar la carta de porte Nº {movimientoCereal.ComprobanteNumero} en la base de datos.");
                    }
                    else
                    {
                        Error.ProcessError(ex, $"Error al actualizar los datos de la carta de porte Nº '{movimientoCereal.ComprobanteNumero}' en la base de datos.");
                    }
                }
                return false;
            }
        }
    }
}