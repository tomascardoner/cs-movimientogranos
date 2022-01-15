using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    internal static class CartaDePorteProcesador
    {

        internal enum ResultadosProcesamiento
        {
            Agregada,
            Modificada,
            SinCambios,
            Error
        }

        #region Procesamiento general

        internal static ResultadosProcesamiento Procesar(string carpetaOrigen, string archivo, byte idCosecha, Database.Database database)
        {
            CartaDePorte cartaDePorte = new CartaDePorte();
            Database.Movimiento_Cereal movimiento_Cereal = new Database.Movimiento_Cereal();

            cartaDePorte.ArchivoNombre = archivo;

            if (!AbrirArchivoYLeerTexto(carpetaOrigen, archivo, cartaDePorte))
            {
                return ResultadosProcesamiento.Error;
            }

            if (!ConvertirDatosAObjetoDestino(cartaDePorte, movimiento_Cereal, idCosecha, database))
            {
                return ResultadosProcesamiento.Error;
            }

            bool actualizar = false;
            if (!VerificarSiExisteCartaYCompararDatos(movimiento_Cereal, ref actualizar))
            {
                return ResultadosProcesamiento.Error;
            }

            if (actualizar)
            {
                if (movimiento_Cereal.Actualizar(database))
                {
                    return ResultadosProcesamiento.Agregada;
                }
                else
                {
                    return ResultadosProcesamiento.Error;
                }
            }
            else
            {
                return ResultadosProcesamiento.SinCambios;
            }
        }

        #endregion

        #region Apertura y lectura del archivo

        private static bool AbrirArchivoYLeerTexto(string carpetaOrigen, string archivo, CartaDePorte cartaDePorte)
        {
            try
            {
                // Abro el archivo de la carta de porte
                PdfReader pdfReader = new PdfReader(System.IO.Path.Combine(carpetaOrigen, archivo));

                for (int page = 1; page <= 1; page++)
                {
                    // Leo sólo la primera página
                    ITextExtractionStrategy strategy = new LocationTextExtractionStrategy();
                    string currentText = PdfTextExtractor.GetTextFromPage(pdfReader, page, strategy);

                    if (!ProcesarTexto(currentText, cartaDePorte))
                    {
                        pdfReader.Close();
                        pdfReader = null;
                        Cursor.Current = Cursors.Default;
                        return false;
                    }
                }
                pdfReader.Close();
                pdfReader = null;
                return true;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al leer el archivo de la carta de porte '{archivo}'.\n\nError: {ex.Message}", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        #endregion

        #region Procesamiento del texto por secciones

        private static bool ProcesarTexto(string texto, CartaDePorte cartaDePorte)
        {
            if (string.IsNullOrWhiteSpace(texto))
            {
                MessageBox.Show("No se detectó texto en la carta de porte.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }
            if (!texto.StartsWith(Constantes.CartaPorteInicioTexto))
            {
                MessageBox.Show("El texto de la carta de porte no tiene el formato esperado.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }

            int index = Constantes.CartaPorteInicioTexto.Length;

            if (!ProcesarTextoEncabezado(texto, cartaDePorte, ref index))
            {
                return false;
            }
            if (!ProcesarTextoSeccionA(texto, cartaDePorte, ref index))
            {
                return false;
            }
            if (!ProcesarTextoSeccionB(texto, cartaDePorte, ref index))
            {
                return false;
            }
            if (!ProcesarTextoSeccionC(texto, cartaDePorte, ref index))
            {
                return false;
            }
            if (!ProcesarTextoSeccionD(texto, cartaDePorte, ref index))
            {
                return false;
            }
            if (!ProcesarTextoSeccionE(texto, cartaDePorte, ref index))
            {
                return false;
            }
            if (!ProcesarTextoSeccionG(texto, cartaDePorte, ref index))
            {
                return false;
            }

            return true;
        }

        // Encabezado
        private static bool ProcesarTextoEncabezado(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Fecha
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.FechaPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Fecha = valorEncontrado;

            // Número
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.NumeroCartaPortePrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Numero = valorEncontrado;

            // CTG
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.CtgPrefijo, ref index, ConstantesParsing.Finalizacion);
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
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.TitularPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.TitularCartaDePorte = valorEncontrado;

            // Remitente comercial productor
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.RemitenteComercialProductorPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RemitenteComercialProductor = valorEncontrado;

            // Remitente comercial venta primaria
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.RemitenteComercialVentaPrimariaPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RteComercialVentaPrimaria = valorEncontrado;

            // Remitente comercial venta secundaria
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.RemitenteComercialVentaSecundariaPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RteComercialVentaSecundaria = valorEncontrado;

            // Remitente comercial venta secundaria 2
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.RemitenteComercialVentaSecundaria2Prefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RteComercialVentaSecundaria2 = valorEncontrado;

            // Mercado a término
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.MercadoATerminoPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.MercadoATermino = valorEncontrado;

            // Corredor venta primaria
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.CorredorVentaPrimariaPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.CorredorVentaPrimaria = valorEncontrado;

            // Corredor venta secundaria
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.CorredorVentaSecundariaPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.CorredorVentaSecundaria = valorEncontrado;

            // Representante entregador
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.RepresentanteEntregadorPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RepresentanteEntregador = valorEncontrado;

            // Representante recibidor
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.RepresentanteRecibidorPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.RepresentanteRecibidor = valorEncontrado;

            // Destinatario
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DestinatarioPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Destinatario = valorEncontrado;

            // Destino
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DestinoPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Destino = valorEncontrado;

            // Empresa transportista
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.EmpresaTransportistaPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.EmpresaTransportista = valorEncontrado;

            // Flete pagador
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.FletePagadorPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.FletePagador = valorEncontrado;

            // Chofer
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.ChoferPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Chofer = valorEncontrado;

            // Intermediario de flete
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.IntermediarioDeFletePrefijo, ref index, ConstantesParsing.Finalizacion);
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
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.GranoTipoPrefijo, ref index, ConstantesParsing.PesoBrutoPrefijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.GranoEspecieTipo = valorEncontrado;

            // Peso bruto
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.PesoBrutoPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.PesoBruto = valorEncontrado;

            // Grano / especie
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.Finalizacion, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.GranoEspecie = valorEncontrado;

            // Peso tara
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.Finalizacion, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.PesoTara = valorEncontrado;

            // Peso neto
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.PesoNetoPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.PesoNeto = valorEncontrado;

            // TODO: Declaración de calidad (Conforme / Condicional)
        
            return true;
        }

        // Sección C - Procedencia
        private static bool ProcesarTextoSeccionC(string texto, CartaDePorte cartaDePorte, ref int index)
        {
            string valorEncontrado;

            // Número de planta
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.ProcedenciaNumeroPlantaPrefijo, ref index, ConstantesParsing.ProcedenciaNumeroPlantaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaNumeroPlanta = valorEncontrado;

            // Dirección
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.ProcedenciaDireccionPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaDireccion = valorEncontrado;

            // Es un campo
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.Finalizacion, ref index, ConstantesParsing.ProcedenciaEsUnCampoSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaEsUnCampo = valorEncontrado;

            // Localidad
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.ProcedenciaLocalidadPrefijo, ref index, ConstantesParsing.ProcedenciaLocalidadSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.ProcedenciaLocalidad = valorEncontrado;

            // Provincia
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.ProcedenciaProvinciaPrefijo, ref index, ConstantesParsing.Finalizacion);
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
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DestinoEsUnCampoPrefijo, ref index, ConstantesParsing.DestinoEsUnCampoSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoEsUnCampo = valorEncontrado;

            // Número de planta
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DestinoNumeroPlantaPrefijo, ref index, ConstantesParsing.DestinoNumeroPlantaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoNumeroPlanta = valorEncontrado;

            // Dirección
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DestinoDireccionPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoDireccion = valorEncontrado;

            // Localidad
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DestinoLocalidadPrefijo, ref index, ConstantesParsing.DestinoLocalidadSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DestinoLocalidad = valorEncontrado;

            // Provincia
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DestinoProvinciaPrefijo, ref index, ConstantesParsing.Finalizacion);
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
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DominiosPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Dominios = valorEncontrado;

            // Partida
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.Finalizacion, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.Partida = valorEncontrado;

            // Kms a recorrer
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.KmsARecorrerPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.KmsARecorrer = valorEncontrado;

            // Tarifa de referencia
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.TarifaDeReferenciaPrefijo, ref index, ConstantesParsing.TarifaDeReferenciaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.TarifaDeReferencia = valorEncontrado;

            // Tarifa
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.TarifaPrefijo, ref index, ConstantesParsing.Finalizacion);
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
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DescargaPesoBrutoPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaPesoBruto = valorEncontrado;

            // Fecha de arribo
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.FechaArriboPrefijo, ref index, ConstantesParsing.FechaArriboSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.FechaArribo = valorEncontrado;

            // Fecha de descarga
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.FechaDescargaPrefijo, ref index, ConstantesParsing.FechaDescargaSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.FechaDescarga = valorEncontrado;

            // Peso tara
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DescargaPesoTaraPrefijo, ref index, ConstantesParsing.DescargaPesoTaraSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaPesoTara = valorEncontrado;

            // Localidad
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DescargaLocalidadPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaLocalidad = valorEncontrado;

            // Provincia
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DescargaProvinciaPrefijo, ref index, ConstantesParsing.Finalizacion);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaProvincia = valorEncontrado;

            // Nº de turno
            //valorEncontrado = ObtenerValor(texto, ConstantesParsing.NumeroTurnoPrefijo, ref index, ConstantesParsing.NumeroTurnoSufijo);
            //if (index == -1)
            //{
            //    return false;
            //}
            cartaDePorte.NumeroTurno = valorEncontrado;

            // Peso neto
            valorEncontrado = ObtenerValor(texto, ConstantesParsing.DescargaPesoNetoPrefijo, ref index, ConstantesParsing.DescargaPesoNetoSufijo);
            if (index == -1)
            {
                return false;
            }
            cartaDePorte.DescargaPesoNeto = valorEncontrado;

            return true;
        }

        #endregion

        #region Funciones de parsing

        private static string ObtenerValor(string textoOriginal, string textoABuscar, ref int indice, string textoFin)
        {
            indice = textoOriginal.IndexOf(textoABuscar, indice);
            if (indice == -1)
            {
                return string.Empty;
            }
            else
            {
                int indiceFin = textoOriginal.IndexOf(textoFin, indice + textoABuscar.Length);
                if (indiceFin == -1)
                {
                    return string.Empty;
                }
                else
                {
                    string resultado = textoOriginal.Substring(indice + textoABuscar.Length, indiceFin - indice - textoABuscar.Length).Trim();
                    indice = indiceFin;
                    return resultado;
                }
            }
        }

        private static void Separar2Valores(string textoOriginal, string separador, ref string valor1, ref string valor2)
        {
            if (string.IsNullOrWhiteSpace(textoOriginal) | string.IsNullOrEmpty(separador))
            {
                valor1 = string.Empty;
                valor2 = string.Empty;
                return;
            }

            int index;
            index = textoOriginal.IndexOf(separador);
            if (index > -1)
            {
                valor1 = textoOriginal.Substring(0, index);
                valor2 = textoOriginal.Substring(index + separador.Length, textoOriginal.Length - index - separador.Length);
            }
        }

        #endregion

        #region Guardado en base de datos

        private static int? ProcesarEntidad(Database.Database database, string valor)
        {
            if (!string.IsNullOrWhiteSpace(valor))
            {
                string cuitString = string.Empty;
                string nombre = string.Empty;

                Separar2Valores(valor, ConstantesParsing.CuitYNombreSeparador, ref cuitString, ref nombre);
                if (!string.IsNullOrWhiteSpace(cuitString))
                {
                    if (long.TryParse(cuitString, out long cuitLong))
                    {
                        // Busco la entidad en la base de datos
                        Database.Entidad entidad = new Database.Entidad();
                        if (!entidad.ObtenerPorCuit(database, cuitLong))
                        {
                            // No se encontró la entidad, crearla
                            entidad.Cuit = cuitLong;
                            entidad.Nombre = nombre;
                            entidad.Activo = true;
                            entidad.Actualizar(database);
                        }
                        return entidad.IDEntidad;
                    }
                }
            }
            return null;
        }

        private static bool ConvertirDatosAObjetoDestino(CartaDePorte cartaDePorte, Database.Movimiento_Cereal movimiento_Cereal, byte idCosecha, Database.Database database)
        {
            int intTemp;
            decimal decimalTemp;
            DateTime datetimeTemp;
            string stringTemp1 = null;
            string stringTemp2 = null;

            // Comprobante número
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Numero))
            {
                if (long.TryParse(cartaDePorte.Numero.Trim().Replace("-", ""), out long longTemp))
                {
                    movimiento_Cereal.ComprobanteNumero = longTemp;
                }
            }

            // CTG
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Ctg))
            {
                if (long.TryParse(cartaDePorte.Ctg, out long longTemp))
                {
                    movimiento_Cereal.CTGNumero = longTemp;
                }
            }

            // Fecha de carga
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Fecha))
            {
                if (DateTime.TryParse(cartaDePorte.Fecha, out datetimeTemp))
                {
                    movimiento_Cereal.FechaCarga = datetimeTemp;
                }
            }

            // Entidad titular
            movimiento_Cereal.IDEntidad_Titular = ProcesarEntidad(database, cartaDePorte.TitularCartaDePorte).Value;
            // Determino el tipo de carta de acuerdo al Cuit del destinatario
            if (movimiento_Cereal.IDEntidad_Titular == Properties.Settings.Default.IdEntidadDestinatarioLocal)
            {
                movimiento_Cereal.Tipo = Constantes.MovimientoTipoSalida;
            }
            else
            {
                movimiento_Cereal.Tipo = Constantes.MovimientoTipoEntrada;
            }

            // Entidad intermediario y entidad remitente comercial
            if (!string.IsNullOrWhiteSpace(cartaDePorte.RemitenteComercialProductor) && !string.IsNullOrWhiteSpace(cartaDePorte.RteComercialVentaPrimaria))
            {
                // Entidad intermediario
                movimiento_Cereal.IDEntidad_Intermediario = ProcesarEntidad(database, cartaDePorte.RemitenteComercialProductor);

                // Entidad remitente comercial
                movimiento_Cereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RteComercialVentaPrimaria);
            }
            else
            {
                // Entidad remitente comercial
                movimiento_Cereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RemitenteComercialProductor);
            }

            // Entidad corredor
            movimiento_Cereal.IDEntidad_Corredor = ProcesarEntidad(database, cartaDePorte.CorredorVentaPrimaria);

            // Entidad entregador
            movimiento_Cereal.IDEntidad_Entregador = ProcesarEntidad(database, cartaDePorte.RepresentanteEntregador);

            // Entidad destinatario
            movimiento_Cereal.IDEntidad_Destinatario = ProcesarEntidad(database, cartaDePorte.Destinatario);

            // Entidad destino
            movimiento_Cereal.IDEntidad_Destino = ProcesarEntidad(database, cartaDePorte.Destino);

            // Entidad transportista
            movimiento_Cereal.IDEntidad_Transportista = ProcesarEntidad(database, cartaDePorte.EmpresaTransportista);

            // Entidad chofer
            movimiento_Cereal.IDEntidad_Chofer = ProcesarEntidad(database, cartaDePorte.Chofer);

            // Cosecha
            movimiento_Cereal.IDCosecha = idCosecha;

            // Cereal
            if (!string.IsNullOrWhiteSpace(cartaDePorte.GranoEspecie))
            {
                Database.Cereal cereal = new Database.Cereal();
                if (cereal.ObtenerPorNombre(database, cartaDePorte.GranoEspecie))
                {
                    movimiento_Cereal.IDCereal = cereal.IDCereal;
                }
                movimiento_Cereal.Volatil = cereal.MermaVolatil;
            }

            // Pesos
            if (movimiento_Cereal.Tipo == Constantes.MovimientoTipoEntrada)
            {
                if (!string.IsNullOrWhiteSpace(cartaDePorte.DescargaPesoBruto))
                {
                    if (int.TryParse(cartaDePorte.DescargaPesoBruto, out intTemp))
                    {
                        movimiento_Cereal.PesoBruto = intTemp;
                    }
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.DescargaPesoTara))
                {
                    if (int.TryParse(cartaDePorte.DescargaPesoTara, out intTemp))
                    {
                        movimiento_Cereal.PesoTara = intTemp;
                    }
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.DescargaPesoNeto))
                {
                    if (int.TryParse(cartaDePorte.DescargaPesoNeto, out intTemp))
                    {
                        movimiento_Cereal.PesoNeto = intTemp;
                    }
                }
                if (movimiento_Cereal.PesoBruto == 0 && movimiento_Cereal.PesoTara == 0 && movimiento_Cereal.PesoNeto == 0)
                {
                    MessageBox.Show("CPE nº {movimiento_Cereal.ComprobanteNumero}: No se detectaron los kilogramos, es posible que esta carta esté anulada o sin confirmar.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(cartaDePorte.PesoBruto))
                {
                    if (int.TryParse(cartaDePorte.PesoBruto, out intTemp))
                    {
                        movimiento_Cereal.PesoBruto = intTemp;
                    }
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.PesoTara))
                {
                    if (int.TryParse(cartaDePorte.PesoTara, out intTemp))
                    {
                        movimiento_Cereal.PesoTara = intTemp;
                    }
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.PesoNeto))
                {
                    if (int.TryParse(cartaDePorte.PesoNeto, out intTemp))
                    {
                        movimiento_Cereal.PesoNeto = intTemp;
                    }
                }
            }
            if (movimiento_Cereal.PesoBruto - movimiento_Cereal.PesoTara != movimiento_Cereal.PesoNeto)
            {
                MessageBox.Show("CPE nº {movimiento_Cereal.ComprobanteNumero}: El peso neto no coincide con el peso bruto - peso tara.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }

            // Origen
            if (!string.IsNullOrWhiteSpace(cartaDePorte.ProcedenciaEsUnCampo))
            {
                if (cartaDePorte.ProcedenciaEsUnCampo.Trim() == Properties.Settings.Default.DireccionEsUnCampoNo)
                {
                    if (!string.IsNullOrWhiteSpace(cartaDePorte.ProcedenciaNumeroPlanta))
                    {
                        // Buscar por número de planta
                        if (int.TryParse(cartaDePorte.ProcedenciaNumeroPlanta, out intTemp))
                        {
                            Database.Entidad_OrigenDestino origen = new Database.Entidad_OrigenDestino();
                            while (true)
                            {
                                if (origen.ObtenerPorCodigoOncca(database, movimiento_Cereal.IDEntidad_Titular, intTemp))
                                {
                                    movimiento_Cereal.IDOrigenDestino_Origen = origen.IDOrigenDestino;
                                    break;
                                }
                                else
                                {
                                    if (MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se encontró el origen con nº de planta {intTemp} perteneciente a {cartaDePorte.TitularCartaDePorte}.\n\n¿Desea reintentar?", "CS-Importador de cartas de porte", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) == DialogResult.No)
                                    {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        //Buscar por dirección
                    }
                }
                else
                {
                    // Ver la forma de establecer Zona Rural, por ahora, poner índice 1
                    movimiento_Cereal.IDOrigenDestino_Origen = 1;
                }
            }

            // Destino
            if (!string.IsNullOrWhiteSpace(cartaDePorte.DestinoEsUnCampo))
            {
                if (cartaDePorte.DestinoEsUnCampo.Trim() == Properties.Settings.Default.DireccionEsUnCampoNo)
                {
                    if (!string.IsNullOrWhiteSpace(cartaDePorte.DestinoNumeroPlanta) && movimiento_Cereal.IDEntidad_Destino.HasValue)
                    {
                        // Buscar por número de planta
                        if (int.TryParse(cartaDePorte.DestinoNumeroPlanta, out intTemp))
                        {
                            Database.Entidad_OrigenDestino destino = new Database.Entidad_OrigenDestino();
                            while (true)
                            {
                                if (destino.ObtenerPorCodigoOncca(database, movimiento_Cereal.IDEntidad_Destino.Value, intTemp))
                                {
                                    movimiento_Cereal.IDOrigenDestino_Destino = destino.IDOrigenDestino;
                                    break;
                                }
                                else
                                {
                                    if (MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se encontró el destino con nº de planta {intTemp} perteneciente a {cartaDePorte.Destino}.\n\n¿Desea reintentar?", "CS-Importador de cartas de porte", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) == DialogResult.No)
                                    {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        //Buscar por dirección
                    }
                }
            }

            // Dominios
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Dominios))
            {
                Separar2Valores(cartaDePorte.Dominios, ConstantesParsing.DominiosSeparador, ref stringTemp1, ref stringTemp2);
                if (string.IsNullOrWhiteSpace(stringTemp1))
                {
                    movimiento_Cereal.TransporteDominioCamion = string.Empty;
                }
                else
                {
                    movimiento_Cereal.TransporteDominioCamion = stringTemp1;
                }
                if (string.IsNullOrWhiteSpace(stringTemp2))
                {
                    movimiento_Cereal.TransporteDominioAcoplado = string.Empty;
                }
                else
                {
                    movimiento_Cereal.TransporteDominioAcoplado = stringTemp2;
                }
            }

            // Kilometros
            if (!string.IsNullOrWhiteSpace(cartaDePorte.KmsARecorrer))
            {
                if (short.TryParse(cartaDePorte.KmsARecorrer, out short shortTemp))
                {
                    movimiento_Cereal.TransporteKilometro = shortTemp;
                }
            }

            // Tarifa de referencia
            if (!string.IsNullOrWhiteSpace(cartaDePorte.TarifaDeReferencia))
            {
                if (decimal.TryParse(cartaDePorte.TarifaDeReferencia.Replace(".", Application.CurrentCulture.NumberFormat.NumberDecimalSeparator), out decimalTemp))
                {
                    movimiento_Cereal.TransporteTarifaReferencia = decimalTemp;
                }
            }

            // Tarifa
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Tarifa))
            {
                if (decimal.TryParse(cartaDePorte.Tarifa.Replace(".", Application.CurrentCulture.NumberFormat.NumberDecimalSeparator), out decimalTemp))
                {
                    movimiento_Cereal.TransporteTarifa = decimalTemp;
                }
            }

            // Fechas de arribo y de descarga
            if (movimiento_Cereal.Tipo == Constantes.MovimientoTipoEntrada)
            {
                if (!string.IsNullOrWhiteSpace(cartaDePorte.FechaArribo))
                {
                    if (DateTime.TryParse(cartaDePorte.FechaArribo, out datetimeTemp))
                    {
                        // Le paso la fecha/hora sin los segundos porque si no, redondea los minutos porque el campo de destino es smalldatetime
                        movimiento_Cereal.FechaHoraArribo = new DateTime(datetimeTemp.Year, datetimeTemp.Month, datetimeTemp.Day, datetimeTemp.Hour, datetimeTemp.Minute, 0);
                    }
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.FechaDescarga))
                {
                    if (DateTime.TryParse(cartaDePorte.FechaDescarga, out datetimeTemp))
                    {
                        // Le paso la fecha/hora sin los segundos porque si no, redondea los minutos porque el campo de destino es smalldatetime
                        movimiento_Cereal.FechaHoraDescarga = new DateTime(datetimeTemp.Year, datetimeTemp.Month, datetimeTemp.Day, datetimeTemp.Hour, datetimeTemp.Minute, 0);
                    }
                }
            }

            // Motivo de anulación
            if (cartaDePorte.ArchivoNombre.Contains(Constantes.ArchivosSufijoAnulada))
            {
                movimiento_Cereal.IDCartaPorte_MotivoAnulacion = Properties.Settings.Default.IdCartaPorteMotivoAnulacion;
            }

            return true;
        }

        private static bool VerificarSiExisteCartaYCompararDatos(Database.Movimiento_Cereal movimiento_Cereal, ref bool actualizar)
        {
            actualizar = true;
            return true;
        }

        #endregion

    }
}
