using System;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    internal class ParserV6 : IParser
    {

        #region Declarations

        // Comunes
        private static readonly char[] separators = new char[] { '\n' };
        internal const string Finalizacion = "\n";

        // Encabezado
        internal const string FechaPrefijo = "Fecha:";
        internal const string NumeroCartaPortePrefijo = "Automotor\n";
        internal const string CtgPrefijo = "CTG:";

        // Sección A - Intervinientes
        internal const string SeccionA = "A - INTERVINIENTES";
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
        internal const string SeccionB = "B - GRANO / ESPECIE";
        internal const string GranoTipoPrefijo = "Tipo: ";
        internal const string CampaniaPrefijo = "Campaña: ";
        internal const string PesoBrutoPrefijo = "Peso Bruto ";
        internal const string PesoTaraPrefijo = "Peso Tara ";
        internal const string PesoNetoPrefijo = "Peso Neto ";

        // Secciones
        private const string SeccionC = "C - PROCEDENCIA";
        private const string SeccionD = "D - DESTINO DE LA MERCADERÍA";

        // Sección E - Datos del transporte
        internal const string SeccionE = "E - DATOS DEL TRANSPORTE";
        internal const string DominiosPrefijo = "Dominios:";
        internal const string KmsARecorrerPrefijo = "Kms. a recorrer:";
        internal const string TarifaDeReferenciaPrefijo = "Tarifa de Referencia:";
        internal const string TarifaDeReferenciaSufijo = "Tarifa:";
        internal const string TarifaPrefijo = "Tarifa:";

        // Sección G - Descarga
        internal const string SeccionG = "G - DESCARGA";
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
            if (!ProcesarTextoSeccionC(texto, cartaDePorte))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            if (!ProcesarTextoSeccionD(texto, cartaDePorte))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            if (!ProcesarTextoSeccionE(texto, cartaDePorte, ref index))
            {
                return CommonFunctions.ProcesarTextoResultados.FormatError;
            }
            DetectarTipoDeCartaDePorte(cartaDePorte);
            if (cartaDePorte.EsEntrada && !ProcesarTextoSeccionG(texto, cartaDePorte, ref index))
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
            else if (string.IsNullOrEmpty(valorEncontrado))
            {
                MessageBox.Show($"No se pudo leer el número de carta de porte.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
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
            valorEncontrado = CommonFunctions.ObtenerValor(texto, GranoTipoPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.GranoEspecieTipo = valorEncontrado;

            // Grano / especie
            valorEncontrado = CommonFunctions.ObtenerValor(texto, Finalizacion, ref index, CampaniaPrefijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.GranoEspecie = valorEncontrado;

            // Campaña
            valorEncontrado = CommonFunctions.ObtenerValor(texto, CampaniaPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Campania = valorEncontrado;

            // Peso bruto
            valorEncontrado = CommonFunctions.ObtenerValor(texto, PesoBrutoPrefijo, ref index, PesoTaraPrefijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.PesoBruto = valorEncontrado;

            // Peso tara
            valorEncontrado = CommonFunctions.ObtenerValor(texto, PesoTaraPrefijo, ref index, Finalizacion);
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
        private static bool ProcesarTextoSeccionC(string texto, CartaDePorte cartaDePorte)
        {
            const string NumeroPlanta = "N° Planta";
            const string NumeroPlantaInicio = "Es un campo: ";
            const string NumeroPlantaFin = " ";
            const string LocalidadInicio = "Localidad: ";
            const string LocalidadFin = "Provincia: ";
            const string ProvinciaInicio = "Provincia: ";

            string[] filas = CommonFunctions.ObtenerTextoEntreDelimitadores(texto, SeccionC, SeccionD).Split(separators, StringSplitOptions.RemoveEmptyEntries);
            if (filas[1].Contains(NumeroPlanta))
            {
                cartaDePorte.ProcedenciaNumeroPlanta = CommonFunctions.ObtenerTextoLimpioEntreDelimitadores(filas[0], NumeroPlantaInicio, NumeroPlantaFin);
            }
            else
            {
                cartaDePorte.ProcedenciaNumeroPlanta = string.Empty;
            }
            cartaDePorte.ProcedenciaEsUnCampo = filas[1].Substring(0, 2);
            cartaDePorte.ProcedenciaLocalidad = CommonFunctions.ObtenerTextoLimpioEntreDelimitadores(filas[2], LocalidadInicio, LocalidadFin);
            cartaDePorte.ProcedenciaProvincia = CommonFunctions.ObtenerTextoLimpioDesdeDelimitador(filas[2], ProvinciaInicio);
            return true;
        }

        // Sección D - Destino de la mercadería
        private static bool ProcesarTextoSeccionD(string texto, CartaDePorte cartaDePorte)
        {
            const string EsUnCampoInicio = "Es un campo: ";
            const string NumeroPlantaInicio = "N° Planta ";
            const string NumeroPlantaFin = " ";
            const string LocalidadInicio = "Localidad: ";
            const string LocalidadFin = "Provincia: ";
            const string ProvinciaInicio = "Provincia: ";

            string[] filas = CommonFunctions.ObtenerTextoEntreDelimitadores(texto, SeccionD, SeccionE).Split(separators, StringSplitOptions.RemoveEmptyEntries);
            cartaDePorte.DestinoEsUnCampo = CommonFunctions.ObtenerTextoLimpioDesdeDelimitador(filas[0], EsUnCampoInicio).Substring(0, 2);
            cartaDePorte.DestinoNumeroPlanta = CommonFunctions.ObtenerTextoLimpioEntreDelimitadores(filas[0], NumeroPlantaInicio, NumeroPlantaFin);
            cartaDePorte.DestinoLocalidad = CommonFunctions.ObtenerTextoLimpioEntreDelimitadores(filas[1], LocalidadInicio, LocalidadFin);
            cartaDePorte.DestinoProvincia = CommonFunctions.ObtenerTextoLimpioDesdeDelimitador(filas[1], ProvinciaInicio);
            return true;
        }

        // Tipo de carta de porte
        private static void DetectarTipoDeCartaDePorte(CartaDePorte cartaDePorte)
        {
            if (cartaDePorte.TitularCartaDePorte.Substring(0, 11) != Properties.Settings.Default.CuitEntidadDestinatarioLocal)
            {
                cartaDePorte.EsEntrada = true;
                cartaDePorte.EsSalida = false;
            }
            else
            {
                if (!string.IsNullOrEmpty(cartaDePorte.DestinoNumeroPlanta) && int.TryParse(cartaDePorte.DestinoNumeroPlanta, out int destinoNumeroPlanta))
                {
                    cartaDePorte.EsEntrada = destinoNumeroPlanta == Properties.Settings.Default.NumeroPlantaAcondicionador || destinoNumeroPlanta == Properties.Settings.Default.NumeroPlantaAceitera;
                }
                if (!string.IsNullOrEmpty(cartaDePorte.ProcedenciaNumeroPlanta) && int.TryParse(cartaDePorte.ProcedenciaNumeroPlanta, out int procedenciaNumeroPlanta))
                {
                    cartaDePorte.EsSalida = procedenciaNumeroPlanta == Properties.Settings.Default.NumeroPlantaAcondicionador || procedenciaNumeroPlanta == Properties.Settings.Default.NumeroPlantaAceitera;
                }
            }
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

            // Kms a recorrer
            valorEncontrado = CommonFunctions.ObtenerValor(texto, KmsARecorrerPrefijo, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.KmsARecorrer = valorEncontrado;

            // Partida
            valorEncontrado = CommonFunctions.ObtenerValor(texto, Finalizacion, ref index, Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Partida = valorEncontrado;

            // Tarifa de referencia
            // A partir del 22 o 23 de junio de 2025, se quitó el campo "Tarifa de Referencia" y se dejó solo "Tarifa"
            // por lo que se debe modificar el prefijo de la tarifa si la de referencia no existe
            int indexSaved = index;
            string usarTarifaPrefijo = TarifaPrefijo;
            valorEncontrado = CommonFunctions.ObtenerValor(texto, TarifaDeReferenciaPrefijo, ref index, TarifaDeReferenciaSufijo);
            if (index == -1)
            {
                index = indexSaved; // Restaurar el índice si no se encontró la tarifa de referencia
                usarTarifaPrefijo = TarifaPrefijo + "\n";
            }
            cartaDePorte.TarifaDeReferencia = valorEncontrado;

            // Tarifa
            valorEncontrado = CommonFunctions.ObtenerValor(texto, usarTarifaPrefijo, ref index, Finalizacion);
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

            // Nº de turno
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