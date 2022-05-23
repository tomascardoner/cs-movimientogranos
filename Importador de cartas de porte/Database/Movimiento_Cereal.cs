using CardonerSistemas.Database.Ado;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal class Movimiento_Cereal
    {

        #region Properties

        internal int IDMovimiento_Cereal { get; set; }
        internal string Tipo { get; set; }
        internal long ComprobanteNumero { get; set; }
        internal string ComprobanteNumeroConFormato { get; set; }
        internal int? IDCartaPorte_Talonario { get; set; }
        internal long? CTGNumero { get; set; }
        internal DateTime FechaCarga { get; set; }
        internal int IDEntidad_Titular { get; set; }
        internal int? IDEntidad_Intermediario { get; set; }
        internal int? IDEntidad_RemitenteComercial { get; set; }
        internal int? IDEntidad_Corredor { get; set; }
        internal int? IDEntidad_Entregador { get; set; }
        internal int? IDEntidad_Destinatario { get; set; }
        internal int? IDEntidad_Destino { get; set; }
        internal int? IDEntidad_Transportista { get; set; }
        internal int? IDEntidad_Chofer { get; set; }
        internal byte IDCosecha { get; set; }
        internal byte IDCereal { get; set; }
        internal int? IDContrato { get; set; }
        internal string ContratoNumero { get; set; }
        internal int PesoBruto { get; set; }
        internal int PesoTara { get; set; }
        internal int PesoNeto { get; set; }
        internal decimal? Volatil { get; set; }
        internal decimal? Humedad { get; set; }
        internal decimal? Zaranda { get; set; }
        internal bool? Fumigado { get; set; }
        internal int? MermaVolatilKilogramo { get; set; }
        internal decimal? MermaHumedadPorcentaje { get; set; }
        internal int? MermaHumedadKilogramo { get; set; }
        internal int? MermaZarandaKilogramo { get; set; }
        internal int? PesoFinal { get; set; }
        internal short? IDOrigenDestino_Origen { get; set; }
        internal short? IDOrigenDestino_Destino { get; set; }
        internal int? CTGCancelacion { get; set; }
        internal string TransporteDominioCamion { get; set; }
        internal string TransporteDominioAcoplado { get; set; }
        internal short? TransporteKilometro { get; set; }
        internal decimal? TransporteTarifaReferencia { get; set; }
        internal decimal? TransporteTarifa { get; set; }
        internal DateTime? FechaHoraArribo { get; set; }
        internal DateTime? FechaHoraDescarga { get; set; }
        internal bool DeclaraIPRO { get; set; }
        internal byte? IDCartaPorte_MotivoAnulacion { get; set; }
        internal string Notas { get; set; }
        internal short? Calculo_TarifaIndice { get; set; }
        internal byte IDUsuarioCreacion { get; set; }
        internal DateTime FechaHoraCreacion { get; set; }
        internal byte IDUsuarioModificacion { get; set; }
        internal DateTime FechaHoraModificacion { get; set; }
        internal DateTime? FechaHoraLiquidacionServicio { get; set; }
        internal DateTime? FechaHoraEnvioBolsaTech { get; set; }
        internal bool? Certificado { get; set; }
        internal int? KilogramoAplicado { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;

        #endregion

        #region Methods

        private bool LeerDatos(SqlDataReader reader)
        {
            try
            {
                IDMovimiento_Cereal = SqlServerValues.GetInteger(reader, "IDMovimiento_Cereal");
                Tipo = SqlServerValues.GetString(reader, "Tipo");

                // Encabezado
                ComprobanteNumero = SqlServerValues.GetLong(reader, "ComprobanteNumero");
                ComprobanteNumeroConFormato = SqlServerValues.GetStringSafeAsEmpty(reader, "ComprobanteNumeroConFormato");
                IDCartaPorte_Talonario = SqlServerValues.GetIntegerSafeAsNull(reader, "IDCartaPorte_Talonario");
                CTGNumero = SqlServerValues.GetLongSafeAsNull(reader, "CTGNumero");
                FechaCarga = SqlServerValues.GetDateTime(reader, "FechaCarga");

                // Sección A - Intervinientes
                IDEntidad_Titular = SqlServerValues.GetInteger(reader, "IDEntidad_Titular");
                IDEntidad_Intermediario = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_Intermediario");
                IDEntidad_RemitenteComercial = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_RemitenteComercial");
                IDEntidad_Corredor = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_Corredor");
                IDEntidad_Entregador = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_Entregador");
                IDEntidad_Destinatario = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_Destinatario");
                IDEntidad_Destino = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_Destino");
                IDEntidad_Transportista = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_Transportista");
                IDEntidad_Chofer = SqlServerValues.GetIntegerSafeAsNull(reader, "IDEntidad_Chofer");

                // Sección B - Grano / Especie
                IDCosecha = SqlServerValues.GetByte(reader, "IDCosecha");
                IDCereal = SqlServerValues.GetByte(reader, "IDCereal");
                IDContrato = SqlServerValues.GetIntegerSafeAsNull(reader, "IDContrato");
                PesoBruto = SqlServerValues.GetInteger(reader, "PesoBruto");
                PesoTara = SqlServerValues.GetInteger(reader, "PesoTara");
                PesoNeto = SqlServerValues.GetInteger(reader, "PesoNeto");

                // Datos para mermas
                if (Tipo == Constantes.MovimientoTipoEntrada)
                {
                    Volatil = SqlServerValues.GetDecimalSafeAsNull(reader, "Volatil");
                    Humedad = SqlServerValues.GetDecimalSafeAsNull(reader, "Humedad");
                    Zaranda = SqlServerValues.GetDecimalSafeAsNull(reader, "Zaranda");
                    MermaVolatilKilogramo = SqlServerValues.GetInteger(reader, "MermaVolatilKilogramo");
                    MermaHumedadPorcentaje = SqlServerValues.GetDecimalSafeAsNull(reader, "MermaHumedadPorcentaje");
                    MermaHumedadKilogramo = SqlServerValues.GetIntegerSafeAsNull(reader, "MermaHumedadKilogramo");
                    MermaZarandaKilogramo = SqlServerValues.GetIntegerSafeAsNull(reader, "MermaZarandaKilogramo");
                }
                else
                {
                    Volatil = null;
                    Humedad = null;
                    Zaranda = null;
                    MermaVolatilKilogramo = null;
                    MermaHumedadPorcentaje = null;
                    MermaHumedadKilogramo = null;
                    MermaZarandaKilogramo = null;
                }
                PesoFinal = SqlServerValues.GetIntegerSafeAsNull(reader, "PesoFinal");

                // Sección C - Procedencia
                IDOrigenDestino_Origen = SqlServerValues.GetShortSafeAsNull(reader, "IDOrigenDestino_Origen");

                // Sección D - Destino de la mercadería
                IDOrigenDestino_Destino = SqlServerValues.GetShortSafeAsNull(reader, "IDOrigenDestino_Destino");

                // Sección E - Datos del transporte
                CTGCancelacion = SqlServerValues.GetIntegerSafeAsNull(reader, "CTGCancelacion");
                TransporteDominioCamion = SqlServerValues.GetStringSafeAsEmpty(reader, "TransporteDominioCamion").Trim();
                TransporteDominioAcoplado = SqlServerValues.GetStringSafeAsEmpty(reader, "TransporteDominioAcoplado").Trim();
                TransporteKilometro = SqlServerValues.GetShortSafeAsNull(reader, "TransporteKilometro");
                TransporteTarifaReferencia = SqlServerValues.GetDecimalSafeAsNull(reader, "TransporteTarifaReferencia");
                TransporteTarifa = SqlServerValues.GetDecimalSafeAsNull(reader, "TransporteTarifa");

                // Sección G - Descarga
                if (Tipo == Constantes.MovimientoTipoEntrada)
                {
                    FechaHoraArribo = SqlServerValues.GetDateTimeSafeAsNull(reader, "FechaHoraArribo");
                    FechaHoraDescarga = SqlServerValues.GetDateTimeSafeAsNull(reader, "FechaHoraDescarga");
                }
                else
                {
                    FechaHoraArribo = null;
                    FechaHoraDescarga = null;
                }

                // Datos extras
                DeclaraIPRO = SqlServerValues.GetBoolean(reader, "DeclaraIPRO");
                IDCartaPorte_MotivoAnulacion = SqlServerValues.GetByteSafeAsNull(reader, "IDCartaPorte_MotivoAnulacion");
                Notas = SqlServerValues.GetStringSafeAsNull(reader, "Notas");
                Calculo_TarifaIndice = SqlServerValues.GetShortSafeAsNull(reader, "Calculo_TarifaIndice");

                // Datos del registro
                IDUsuarioCreacion = SqlServerValues.GetByte(reader, "IDUsuarioCreacion");
                FechaHoraCreacion = SqlServerValues.GetDateTime(reader, "FechaHoraCreacion");
                IDUsuarioModificacion = SqlServerValues.GetByte(reader, "IDUsuarioModificacion");
                FechaHoraModificacion = SqlServerValues.GetDateTime(reader, "FechaHoraModificacion");
                FechaHoraLiquidacionServicio = SqlServerValues.GetDateTimeSafeAsNull(reader, "FechaHoraLiquidacionServicio");
                FechaHoraEnvioBolsaTech = SqlServerValues.GetDateTimeSafeAsNull(reader, "FechaHoraEnvioBolsaTech");

                Certificado = (Tipo == Constantes.MovimientoTipoEntrada) && SqlServerValues.GetBoolean(reader, "Certificado");
                KilogramoAplicado = SqlServerValues.GetIntegerSafeAsNull(reader, "KilogramoAplicado");

                return true;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al leer los datos de la carta de porte desde la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        internal bool ObtenerPorId(Database database, int id)
        {
            SqlDataReader reader = null;
            try
            {
                SqlCommand command = new SqlCommand
                {
                    Connection = database.Connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_Movimiento_Cereal_Get"
                };
                command.Parameters.Add("IDMovimiento_Cereal", SqlDbType.Int).Value = id;
                reader = command.ExecuteReader();

                IsFound = false;
                if (reader.HasRows)
                {
                    reader.Read();
                    if (LeerDatos(reader))
                    {
                        IsFound = true;
                        IsNew = false;
                    }
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
                MessageBox.Show($"Error al obtener la carta de porte desde la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        internal bool ObtenerPorCtg(Database database, long ctg)
        {
            SqlDataReader reader = null;
            try
            {
                SqlCommand command = new SqlCommand
                {
                    Connection = database.Connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "usp_Movimiento_Cereal_GetByCtg"
                };
                command.Parameters.Add("Ctg", SqlDbType.BigInt).Value = ctg;
                reader = command.ExecuteReader();
                IsFound = false;

                IsFound = false;
                if (reader.HasRows)
                {
                    reader.Read();
                    if (LeerDatos(reader))
                    {
                        IsFound = true;
                        IsNew = false;
                    }
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
                MessageBox.Show($"Error al obtener la carta de porte desde la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        internal bool Actualizar(Database database)
        {
            try
            {
                SqlCommand command = new SqlCommand
                {
                    Connection = database.Connection,
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter parameterIDMovimiento_Cereal = new SqlParameter("IDMovimiento_Cereal", SqlDbType.Int);
                if (IsNew)
                {
                    IsNew = true;
                    command.CommandText = "usp_Movimiento_Cereal_Add";
                    parameterIDMovimiento_Cereal.Direction = ParameterDirection.Output;
                    command.Parameters.Add(parameterIDMovimiento_Cereal);
                    command.Parameters.Add("Tipo", SqlDbType.Char).Value = Tipo;
                }
                else
                {
                    IsNew = false;
                    command.CommandText = "usp_Movimiento_Cereal_Update";
                    parameterIDMovimiento_Cereal.Value = IDMovimiento_Cereal;
                    command.Parameters.Add(parameterIDMovimiento_Cereal);
                }
                command.Parameters.Add("ComprobanteNumero", SqlDbType.Char).Value = ComprobanteNumero;
                command.Parameters.Add("IDCartaPorte_Talonario", SqlDbType.Int).Value = DBNull.Value;
                command.Parameters.Add("CTGNumero", SqlDbType.BigInt).Value = CTGNumero;
                command.Parameters.Add("FechaCarga", SqlDbType.Date).Value = FechaCarga;
                command.Parameters.Add("IDEntidad_Titular", SqlDbType.Int).Value = IDEntidad_Titular;
                command.Parameters.Add("IDEntidad_Intermediario", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_Intermediario);
                command.Parameters.Add("IDEntidad_RemitenteComercial", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_RemitenteComercial);
                command.Parameters.Add("IDEntidad_Corredor", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_Corredor);
                command.Parameters.Add("IDEntidad_Entregador", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_Entregador);
                command.Parameters.Add("IDEntidad_Destinatario", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_Destinatario);
                command.Parameters.Add("IDEntidad_Destino", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_Destino);
                command.Parameters.Add("IDEntidad_Transportista", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_Transportista);
                command.Parameters.Add("IDEntidad_Chofer", SqlDbType.Int).Value = SqlServerValues.SetValue(IDEntidad_Chofer);
                command.Parameters.Add("IDCosecha", SqlDbType.TinyInt).Value = IDCosecha;
                command.Parameters.Add("IDCereal", SqlDbType.TinyInt).Value = IDCereal;
                command.Parameters.Add("IDContrato", SqlDbType.Int).Value = DBNull.Value;
                command.Parameters.Add("PesoBruto", SqlDbType.Int).Value = PesoBruto;
                command.Parameters.Add("PesoTara", SqlDbType.Int).Value = PesoTara;
                command.Parameters.Add("PesoNeto", SqlDbType.Int).Value = PesoNeto;
                command.Parameters.Add("Volatil", SqlDbType.Decimal).Value = SqlServerValues.SetValue(Volatil);
                command.Parameters.Add("Humedad", SqlDbType.Decimal).Value = DBNull.Value;
                command.Parameters.Add("Zaranda", SqlDbType.Decimal).Value = DBNull.Value;
                command.Parameters.Add("IDOrigenDestino_Origen", SqlDbType.SmallInt).Value = SqlServerValues.SetValue(IDOrigenDestino_Origen);
                command.Parameters.Add("IDOrigenDestino_Destino", SqlDbType.SmallInt).Value = SqlServerValues.SetValue(IDOrigenDestino_Destino);
                command.Parameters.Add("CTGCancelacion", SqlDbType.Int).Value = DBNull.Value;
                command.Parameters.Add("TransporteDominioCamion", SqlDbType.VarChar).Value = SqlServerValues.SetValue(TransporteDominioCamion);
                command.Parameters.Add("TransporteDominioAcoplado", SqlDbType.VarChar).Value = SqlServerValues.SetValue(TransporteDominioAcoplado);
                command.Parameters.Add("TransporteKilometro", SqlDbType.SmallInt).Value = SqlServerValues.SetValue(TransporteKilometro);
                command.Parameters.Add("TransporteTarifaReferencia", SqlDbType.Money).Value = SqlServerValues.SetValue(TransporteTarifaReferencia);
                command.Parameters.Add("TransporteTarifa", SqlDbType.Money).Value = SqlServerValues.SetValue(TransporteTarifa);
                command.Parameters.Add("FechaHoraArribo", SqlDbType.SmallDateTime).Value = SqlServerValues.SetValue(FechaHoraArribo);
                command.Parameters.Add("FechaHoraDescarga", SqlDbType.SmallDateTime).Value = SqlServerValues.SetValue(FechaHoraDescarga);
                command.Parameters.Add("DeclaraIPRO", SqlDbType.Bit).Value = false;
                command.Parameters.Add("IDCartaPorte_MotivoAnulacion", SqlDbType.TinyInt).Value = SqlServerValues.SetValue(IDCartaPorte_MotivoAnulacion);
                command.Parameters.Add("Notas", SqlDbType.VarChar).Value = SqlServerValues.SetValue(Notas);
                command.Parameters.Add("Calculo_TarifaIndice", SqlDbType.SmallInt).Value = DBNull.Value;
                command.Parameters.Add("IDUsuario", SqlDbType.TinyInt).Value = Properties.Settings.Default.IdUsuarioImportador;
                command.Parameters.Add("StringListOfIDPesadaCompleta", SqlDbType.VarChar).Value = DBNull.Value;

                command.ExecuteNonQuery();
                if (IsNew)
                {
                    IDMovimiento_Cereal = (int)parameterIDMovimiento_Cereal.Value;
                }
                IsNew = false;
                command = null;
                return true;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                if (ex.Message.Contains("FK__Entidad_OrigenDestino__Movimiento__Origen"))
                {
                    MessageBox.Show($"La entidad titular de la carta de porte no tiene especificado un origen. Carta de porte nº {ComprobanteNumero}.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    MessageBox.Show($"Error al actualizar los datos de la carta de porte nº {ComprobanteNumero} en la base de datos.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }
        }

        #endregion

    }
}
