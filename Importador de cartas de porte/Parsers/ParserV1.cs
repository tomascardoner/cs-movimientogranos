using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    internal class ParserV1 : IParser
    {

        #region Declarations

        // Comunes
        internal const string Finalizacion = "\n";

        // Encabezado
        internal const string FechaPrefijo = "Fecha:";
        internal const string NumeroCartaPortePrefijo = "Automotor\n";
        internal const string CtgPrefijo = "CTG:";

        // Sección A - Intervinientes
        internal const string TitularPrefijo = "Titular Carta de Porte:";
        internal const string RemitenteComercialProductorPrefijo = "Remitente Comercial Productor:";
        internal const string RemitenteComercialVentaPrimariaPrefijo = "Rte. Comercial Venta Primaria:";
        internal const string RemitenteComercialVentaSecundariaPrefijo = "Rte. Comercial Venta secundaria:";
        internal const string RemitenteComercialVentaSecundaria2Prefijo = "Rte. Comercial Venta secundaria 2:";
        internal const string MercadoATerminoPrefijo = "Mercado a Término:";
        internal const string CorredorVentaPrimariaPrefijo = "Corredor Venta Primaria:";
        internal const string CorredorVentaSecundariaPrefijo = "Corredor Venta Secundaria:";
        internal const string RepresentanteEntregadorPrefijo = "Representante entregador:";
        internal const string RepresentanteRecibidorPrefijo = "Representante recibidor:";
        internal const string DestinatarioPrefijo = "Destinatario:";
        internal const string DestinoPrefijo = "Destino:";
        internal const string EmpresaTransportistaPrefijo = "Empresa Transportista:";
        internal const string FletePagadorPrefijo = "Flete pagador :";
        internal const string ChoferPrefijo = "Chofer :";
        internal const string IntermediarioDeFletePrefijo = "Intermediario de flete :";

        // Sección B - Grano / Especie
        internal const string GranoTipoPrefijo = "Tipo: ";
        internal const string PesoBrutoPrefijo = "Peso Bruto (kg):";
        internal const string PesoTaraPrefijo = "Peso Tara (kg):";
        internal const string PesoNetoPrefijo = "Peso Neto (kg):";

        // Sección C - Procedencia
        internal const string ProcedenciaEsUnCampoPrefijo = "Dirección:";
        internal const string ProcedenciaEsUnCampoSufijo = "N° Planta (RUCA):";
        internal const string ProcedenciaNumeroPlantaPrefijo = "Es un campo:";
        internal const string ProcedenciaNumeroPlantaSufijo = "Dirección:";
        internal const string ProcedenciaDireccionPrefijo = "Dirección:";
        internal const string ProcedenciaLocalidadPrefijo = "Localidad:\n";
        internal const string ProcedenciaLocalidadSufijo = "Provincia:";
        internal const string ProcedenciaProvinciaPrefijo = "Provincia:";

        // Sección D - Destino de la mercadería
        internal const string DestinoEsUnCampoPrefijo = "Es un campo:";
        internal const string DestinoEsUnCampoSufijo = "N° Planta (RUCA):";
        internal const string DestinoNumeroPlantaPrefijo = "N° Planta (RUCA):";
        internal const string DestinoNumeroPlantaSufijo = "Dirección:";
        internal const string DestinoDireccionPrefijo = "Dirección:";
        internal const string DestinoLocalidadPrefijo = "Localidad:";
        internal const string DestinoLocalidadSufijo = "Provincia:";
        internal const string DestinoProvinciaPrefijo = "Provincia:";

        // Sección E - Datos del transporte
        internal const string DominiosPrefijo = "Dominios:";
        internal const string KmsARecorrerPrefijo = "Kms. a recorrer:";
        internal const string TarifaDeReferenciaPrefijo = "Tarifa de Referencia:";
        internal const string TarifaDeReferenciaSufijo = "Tarifa:";
        internal const string TarifaPrefijo = "Tarifa:";

        // Sección G - Descarga
        internal const string FechaArriboPrefijo = "Fecha Arribo:";
        internal const string FechaArriboSufijo = "Peso Bruto (kg):";
        internal const string FechaDescargaPrefijo = "Fecha Descarga:";
        internal const string FechaDescargaSufijo = "Peso Tara (kg):";
        internal const string NumeroTurnoPrefijo = "N° Turno:";
        internal const string NumeroTurnoSufijo = "Provincia:";
        internal const string DescargaPesoBrutoPrefijo = "G - DESCARGA\n";
        internal const string DescargaPesoTaraPrefijo = "Peso Tara (kg):";
        internal const string DescargaPesoTaraSufijo = "Localidad:";
        internal const string DescargaPesoNetoPrefijo = "N° Turno:";
        internal const string DescargaPesoNetoSufijo = "Provincia:";
        internal const string DescargaLocalidadPrefijo = "Localidad:";
        internal const string DescargaProvinciaPrefijo = "Peso Neto (kg):";

        #endregion

        public CommonFunctions.ProcesarTextoResultados ProcesarTexto(string texto, CartaDePorte cartaDePorte, int index)
        {
            if (!ProcesarTextoEncabezado(texto, cartaDePorte, ref index))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            if (!ProcesarTextoSeccionA(texto, cartaDePorte, ref index))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            if (!ProcesarTextoSeccionB(texto, cartaDePorte, ref index))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            if (!ProcesarTextoSeccionC(texto, cartaDePorte, ref index))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            if (!ProcesarTextoSeccionD(texto, cartaDePorte, ref index))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            if (!ProcesarTextoSeccionE(texto, cartaDePorte, ref index))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }

            // Si es una carta de salida, no proceso la sección de descarga
            if (cartaDePorte.TitularCartaDePorte.Substring(0, 11) != Properties.Settings.Default.CuitEntidadDestinatarioLocal && !ProcesarTextoSeccionG(texto, cartaDePorte, ref index))
            {
                MessageBox.Show($"CPE nº {cartaDePorte.Numero}: Es una carta de porte de entrada pero no tiene los datos de descarga.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return CommonFunctions.ProcesarTextoResultados.EntradaSinDescarga;
            }

            return CommonFunctions.ProcesarTextoResultados.Ok;
        }

        // Encabezado
        private static bool ProcesarTextoEncabezado(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Fecha
            valorEncontrado = CommonFunctions.ObtenerValor(texto, FechaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Fecha = valorEncontrado;

            // Número
            valorEncontrado = CommonFunctions.ObtenerValor(texto, NumeroCartaPortePrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Numero = valorEncontrado;

            // CTG
            valorEncontrado = CommonFunctions.ObtenerValor(texto, CtgPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Ctg = valorEncontrado;

            return true;
        }

        // Sección A - Intervinientes
        private static bool ProcesarTextoSeccionA(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Titular
            valorEncontrado = CommonFunctions.ObtenerValor(texto, TitularPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.TitularCartaDePorte = valorEncontrado;

            // Remitente comercial productor
            valorEncontrado = CommonFunctions.ObtenerValor(texto, RemitenteComercialProductorPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RemitenteComercialProductor = valorEncontrado;

            // Remitente comercial venta primaria
            valorEncontrado = CommonFunctions.ObtenerValor(texto, RemitenteComercialVentaPrimariaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RteComercialVentaPrimaria = valorEncontrado;

            // Remitente comercial venta secundaria
            valorEncontrado = CommonFunctions.ObtenerValor(texto, RemitenteComercialVentaSecundariaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RteComercialVentaSecundaria = valorEncontrado;

            // Remitente comercial venta secundaria 2
            valorEncontrado = CommonFunctions.ObtenerValor(texto, RemitenteComercialVentaSecundaria2Prefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RteComercialVentaSecundaria2 = valorEncontrado;

            // Mercado a término
            valorEncontrado = CommonFunctions.ObtenerValor(texto, MercadoATerminoPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.MercadoATermino = valorEncontrado;

            // Corredor venta primaria
            valorEncontrado = CommonFunctions.ObtenerValor(texto, CorredorVentaPrimariaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.CorredorVentaPrimaria = valorEncontrado;

            // Corredor venta secundaria
            valorEncontrado = CommonFunctions.ObtenerValor(texto, CorredorVentaSecundariaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.CorredorVentaSecundaria = valorEncontrado;

            // Representante entregador
            valorEncontrado = CommonFunctions.ObtenerValor(texto, RepresentanteEntregadorPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RepresentanteEntregador = valorEncontrado;

            // Representante recibidor
            valorEncontrado = CommonFunctions.ObtenerValor(texto, RepresentanteRecibidorPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RepresentanteRecibidor = valorEncontrado;

            // Destinatario
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DestinatarioPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Destinatario = valorEncontrado;

            // Destino
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DestinoPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Destino = valorEncontrado;

            // Empresa transportista
            valorEncontrado = CommonFunctions.ObtenerValor(texto, EmpresaTransportistaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.EmpresaTransportista = valorEncontrado;

            // Flete pagador
            valorEncontrado = CommonFunctions.ObtenerValor(texto, FletePagadorPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.FletePagador = valorEncontrado;

            // Chofer
            valorEncontrado = CommonFunctions.ObtenerValor(texto, ChoferPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Chofer = valorEncontrado;

            // Intermediario de flete
            valorEncontrado = CommonFunctions.ObtenerValor(texto, IntermediarioDeFletePrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.IntermediarioDeFlete = valorEncontrado;

            return true;
        }

        // Sección B - Grano / Especie
        private static bool ProcesarTextoSeccionB(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Tipo de grano / especie
            valorEncontrado = CommonFunctions.ObtenerValor(texto, GranoTipoPrefijo, ref index, PesoBrutoPrefijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.GranoEspecieTipo = valorEncontrado;

            // Peso bruto
            valorEncontrado = CommonFunctions.ObtenerValor(texto, PesoBrutoPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.PesoBruto = valorEncontrado;

            // Grano / especie
            valorEncontrado = CommonFunctions.ObtenerValor(texto, Finalizacion, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.GranoEspecie = valorEncontrado;

            // Peso tara
            valorEncontrado = CommonFunctions.ObtenerValor(texto, Finalizacion, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.PesoTara = valorEncontrado;

            // Peso neto
            valorEncontrado = CommonFunctions.ObtenerValor(texto, PesoNetoPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.PesoNeto = valorEncontrado;

            return true;
        }

        // Sección C - Procedencia
        private static bool ProcesarTextoSeccionC(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Número de planta
            valorEncontrado = CommonFunctions.ObtenerValor(texto, ProcedenciaNumeroPlantaPrefijo, ref index, ProcedenciaNumeroPlantaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaNumeroPlanta = valorEncontrado;

            // Dirección
            valorEncontrado = CommonFunctions.ObtenerValor(texto, ProcedenciaDireccionPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaDireccion = valorEncontrado;

            // Es un campo
            valorEncontrado = CommonFunctions.ObtenerValor(texto, Finalizacion, ref index, ProcedenciaEsUnCampoSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaEsUnCampo = valorEncontrado;

            // Localidad
            valorEncontrado = CommonFunctions.ObtenerValor(texto, ProcedenciaLocalidadPrefijo, ref index, ProcedenciaLocalidadSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaLocalidad = valorEncontrado;

            // Provincia
            valorEncontrado = CommonFunctions.ObtenerValor(texto, ProcedenciaProvinciaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaProvincia = valorEncontrado;

            return true;
        }

        // Sección D - Destino de la mercadería
        private static bool ProcesarTextoSeccionD(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Es un campo
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DestinoEsUnCampoPrefijo, ref index, DestinoEsUnCampoSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoEsUnCampo = valorEncontrado;

            // Número de planta
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DestinoNumeroPlantaPrefijo, ref index, DestinoNumeroPlantaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoNumeroPlanta = valorEncontrado;

            // Dirección
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DestinoDireccionPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoDireccion = valorEncontrado;

            // Localidad
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DestinoLocalidadPrefijo, ref index, DestinoLocalidadSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoLocalidad = valorEncontrado;

            // Provincia
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DestinoProvinciaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoProvincia = valorEncontrado;

            return true;
        }

        // Sección E - Datos del transporte
        private static bool ProcesarTextoSeccionE(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Dominios
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DominiosPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Dominios = valorEncontrado;

            // Partida
            valorEncontrado = CommonFunctions.ObtenerValor(texto, Finalizacion, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Partida = valorEncontrado;

            // Kms a recorrer
            valorEncontrado = CommonFunctions.ObtenerValor(texto, KmsARecorrerPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.KmsARecorrer = valorEncontrado;

            // Tarifa de referencia
            valorEncontrado = CommonFunctions.ObtenerValor(texto, TarifaDeReferenciaPrefijo, ref index, TarifaDeReferenciaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.TarifaDeReferencia = valorEncontrado;

            // Tarifa
            valorEncontrado = CommonFunctions.ObtenerValor(texto, TarifaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Tarifa = valorEncontrado;

            return true;
        }

        // Sección G - Descarga
        private static bool ProcesarTextoSeccionG(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Peso bruto
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DescargaPesoBrutoPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaPesoBruto = valorEncontrado;

            // Fecha de arribo
            valorEncontrado = CommonFunctions.ObtenerValor(texto, FechaArriboPrefijo, ref index, FechaArriboSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.FechaArribo = valorEncontrado;

            // Fecha de descarga
            valorEncontrado = CommonFunctions.ObtenerValor(texto, FechaDescargaPrefijo, ref index, FechaDescargaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.FechaDescarga = valorEncontrado;

            // Peso tara
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DescargaPesoTaraPrefijo, ref index, DescargaPesoTaraSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaPesoTara = valorEncontrado;

            // Localidad
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DescargaLocalidadPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaLocalidad = valorEncontrado;

            // Provincia
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DescargaProvinciaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaProvincia = valorEncontrado;

            cartaDePorte.NumeroTurno = string.Empty;

            // Peso neto
            valorEncontrado = CommonFunctions.ObtenerValor(texto, DescargaPesoNetoPrefijo, ref index, DescargaPesoNetoSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaPesoNeto = valorEncontrado;

            return true;
        }

    }
}
