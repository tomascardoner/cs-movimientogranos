using CardonerSistemas;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    internal static class CartaDePorteProcesador
    {

        #region Declaraciones

        internal enum ResultadosProcesamiento
        {
            Agregada,
            Modificada,
            SinCambios,
            Error
        }

        internal enum TiposEntidad
        { 
            Titular,
            Intermediario,
            RemitenteComercial,
            Corredor,
            Entregador,
            Destinatario,
            Destino,
            Transportista,
            Chofer
        }

        #endregion

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

            return VerificarSiExisteCartaCompararDatosYActualizar(database, movimiento_Cereal);
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

            // Si es una carta de salida, no proceso la sección de descarga
            if (cartaDePorte.TitularCartaDePorte.Substring(0, 11) != Properties.Settings.Default.CuitEntidadDestinatarioLocal)
            {
                if (!ProcesarTextoSeccionG(texto, cartaDePorte, ref index))
                {
                    MessageBox.Show($"CPE nº {cartaDePorte.Numero}: Es una carta de porte de entrada pero no tiene los datos de descarga.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
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
            cartaDePorte.NumeroTurno = string.Empty;

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

        #region Conversión de datos

        private static bool VerificarTipoEntidad(bool valor, ref bool actualizar)
        {
            if (!valor)
            {
                actualizar = true;
            }
            return true;
        }

        private static string ProcesarNombreEntidad(string valor)
        {
            if (!string.IsNullOrWhiteSpace(valor))
            {
                // En caso de existir, elimino las comillas al inicio y al fin del nombre
                if (valor.StartsWith("\"") && valor.EndsWith("\""))
                {
                    valor = valor.Substring(1, valor.Length - 2);
                }

                // Reemplazo los valores posibles de Sociedad Anónima
                valor = valor.Replace(" SOCIEDAD ANONIMA", " S.A.");
                valor = valor.ReplaceEnd(" SA", " S.A.");
                valor = valor.ReplaceEnd(" S A", " S.A.");
                valor = valor.ReplaceEnd(" CIA S.A.", " CIA. S.A.");
                valor = valor.ReplaceEnd(" S.A. I Y C", " S.A.I.C.");

                // Reemplazo los valores posibles de Sociedad de Responsabilidad Limitada
                valor = valor.ReplaceEnd(" S R L", " S.R.L.");
                valor = valor.ReplaceEnd(" SOCIEDAD DE RESPONSABILIDAD LIMITADA", " S.R.L.");
                valor = valor.ReplaceEnd(" CIA S.R.L.", " CIA. S.R.L.");

                // Elimino espacios al inicio o al final y espacios dobles
                valor = valor.TrimAndReduce();

                // Establezco las mayúsculas y minúsculas correspondientes
                valor = valor.ToTitleCaseAll();
            }

            return valor;
        }

        private static int? ProcesarEntidad(Database.Database database, string valor, TiposEntidad tipoEntidad)
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
                        // Proceso nombre por si tiene siglas sin puntos o palabras completas reemplazables
                        nombre = ProcesarNombreEntidad(nombre);

                        // Busco la entidad en la base de datos
                        Database.Entidad entidad = new Database.Entidad();
                        if (!entidad.ObtenerPorCuit(database, cuitLong))
                        {
                            return null;
                        }
                        if (entidad.IsFound)
                        {
                            // La entidad existe
                            bool actualizar = false;

                            // Verifico el nombre
                            if (string.Compare(entidad.Nombre, nombre, false) != 0)
                            {
                                entidad.Nombre = nombre;
                                actualizar = true;
                            }

                            // Verifico que sea del tipo especificado
                            switch (tipoEntidad)
                            {
                                case TiposEntidad.Titular:
                                    entidad.EsTitular = VerificarTipoEntidad(entidad.EsTitular, ref actualizar);
                                    break;
                                case TiposEntidad.Intermediario:
                                    entidad.EsIntermediario = VerificarTipoEntidad(entidad.EsIntermediario, ref actualizar);
                                    break;
                                case TiposEntidad.RemitenteComercial:
                                    entidad.EsRemitenteComercial = VerificarTipoEntidad(entidad.EsRemitenteComercial, ref actualizar);
                                    break;
                                case TiposEntidad.Corredor:
                                    entidad.EsCorredor = VerificarTipoEntidad(entidad.EsCorredor, ref actualizar);
                                    break;
                                case TiposEntidad.Entregador:
                                    entidad.EsEntregador = VerificarTipoEntidad(entidad.EsEntregador, ref actualizar);
                                    break;
                                case TiposEntidad.Destinatario:
                                    entidad.EsDestinatario = VerificarTipoEntidad(entidad.EsDestinatario, ref actualizar);
                                    break;
                                case TiposEntidad.Destino:
                                    entidad.EsDestino = VerificarTipoEntidad(entidad.EsDestino, ref actualizar);
                                    break;
                                case TiposEntidad.Transportista:
                                    entidad.EsTransportista = VerificarTipoEntidad(entidad.EsTransportista, ref actualizar);
                                    break;
                                case TiposEntidad.Chofer:
                                    entidad.EsChofer = VerificarTipoEntidad(entidad.EsChofer, ref actualizar);
                                    break;
                                default:
                                    break;
                            }

                            // Verifico que esté activa
                            if (!entidad.Activo)
                            {
                                entidad.Activo = true;
                                actualizar = true;
                            }

                            // Si corresponde, actualizo
                            if (actualizar)
                            {
                                entidad.Actualizar(database);
                            }
                        }
                        else
                        {
                            // No se encontró la entidad, crearla
                            entidad.Cuit = cuitLong;
                            entidad.Nombre = nombre;
                            switch (tipoEntidad)
                            {
                                case TiposEntidad.Titular:
                                    entidad.EsTitular = true;
                                    break;
                                case TiposEntidad.Intermediario:
                                    entidad.EsIntermediario = true;
                                    break;
                                case TiposEntidad.RemitenteComercial:
                                    entidad.EsRemitenteComercial = true;
                                    break;
                                case TiposEntidad.Corredor:
                                    entidad.EsCorredor = true;
                                    break;
                                case TiposEntidad.Entregador:
                                    entidad.EsEntregador = true;
                                    break;
                                case TiposEntidad.Destinatario:
                                    entidad.EsDestinatario = true;
                                    break;
                                case TiposEntidad.Destino:
                                    entidad.EsDestino = true;
                                    break;
                                case TiposEntidad.Transportista:
                                    entidad.EsTransportista = true;
                                    break;
                                case TiposEntidad.Chofer:
                                    entidad.EsChofer = true;
                                    break;
                                default:
                                    break;
                            }
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
                    if (longTemp == 0)
                    {
                        MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se pudo obtener el CTG.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return false;
                    }
                }
                else
                {
                    MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se pudo obtener el CTG.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
            }
            else
            {
                MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se pudo obtener el CTG.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
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
            movimiento_Cereal.IDEntidad_Titular = ProcesarEntidad(database, cartaDePorte.TitularCartaDePorte, TiposEntidad.Titular).Value;
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
                movimiento_Cereal.IDEntidad_Intermediario = ProcesarEntidad(database, cartaDePorte.RemitenteComercialProductor, TiposEntidad.Intermediario);

                // Entidad remitente comercial
                movimiento_Cereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RteComercialVentaPrimaria, TiposEntidad.RemitenteComercial);
            }
            else if (!string.IsNullOrWhiteSpace(cartaDePorte.RemitenteComercialProductor))
            {
                // Entidad remitente comercial
                movimiento_Cereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RemitenteComercialProductor, TiposEntidad.RemitenteComercial);
            }
            else if (!string.IsNullOrWhiteSpace(cartaDePorte.RteComercialVentaPrimaria))
            {
                // Entidad remitente comercial
                movimiento_Cereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RteComercialVentaPrimaria, TiposEntidad.RemitenteComercial);
            }

            // Entidad corredor
            movimiento_Cereal.IDEntidad_Corredor = ProcesarEntidad(database, cartaDePorte.CorredorVentaPrimaria, TiposEntidad.Corredor);

            // Entidad entregador
            movimiento_Cereal.IDEntidad_Entregador = ProcesarEntidad(database, cartaDePorte.RepresentanteEntregador, TiposEntidad.Entregador);

            // Entidad destinatario
            movimiento_Cereal.IDEntidad_Destinatario = ProcesarEntidad(database, cartaDePorte.Destinatario, TiposEntidad.Destinatario);

            // Entidad destino
            movimiento_Cereal.IDEntidad_Destino = ProcesarEntidad(database, cartaDePorte.Destino, TiposEntidad.Destino);

            // Entidad transportista
            movimiento_Cereal.IDEntidad_Transportista = ProcesarEntidad(database, cartaDePorte.EmpresaTransportista, TiposEntidad.Transportista);

            // Entidad chofer
            movimiento_Cereal.IDEntidad_Chofer = ProcesarEntidad(database, cartaDePorte.Chofer, TiposEntidad.Chofer);

            // Cosecha
            movimiento_Cereal.IDCosecha = idCosecha;

            // Cereal
            if (!string.IsNullOrWhiteSpace(cartaDePorte.GranoEspecie))
            {
                Database.Cereal cereal = new Database.Cereal();
                if (!cereal.ObtenerPorNombre(database, cartaDePorte.GranoEspecie))
                {
                    return false;
                }
                if (cereal.IsFound)
                {
                    movimiento_Cereal.IDCereal = cereal.IDCereal;
                    movimiento_Cereal.Volatil = cereal.MermaVolatil;
                }
                else
                {
                    MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se encontró el cereal.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
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
                    MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se detectaron los kilogramos, es posible que esta carta esté anulada o sin confirmar.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
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
                MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: El peso neto no coincide con el peso bruto - peso tara.", "CS-Importador de cartas de porte", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
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
                                if (!origen.ObtenerPorCodigoOncca(database, movimiento_Cereal.IDEntidad_Titular, intTemp))
                                {
                                    return false;
                                }
                                if (origen.IsFound)
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
                    // Ver la forma de establecer Zona Rural, por ahora, seleccionar el primer origen disponible
                    Database.Entidad_OrigenDestino origen = new Database.Entidad_OrigenDestino();
                    while (true)
                    {
                        if (!origen.ObtenerPrimero(database, movimiento_Cereal.IDEntidad_Titular))
                        {
                            return false;
                        }
                        if (origen.IsFound)
                        {
                            movimiento_Cereal.IDOrigenDestino_Origen = origen.IDOrigenDestino;
                            break;
                        }
                        else
                        {
                            if (MessageBox.Show($"CPE nº {movimiento_Cereal.ComprobanteNumero}: No se encontró ningún origen perteneciente a {cartaDePorte.TitularCartaDePorte}.\n\n¿Desea reintentar?", "CS-Importador de cartas de porte", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) == DialogResult.No)
                            {
                                break;
                            }
                        }
                    }
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
                                if (!destino.ObtenerPorCodigoOncca(database, movimiento_Cereal.IDEntidad_Destino.Value, intTemp))
                                {
                                    return false;
                                }
                                if (destino.IsFound)
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

        #endregion

        #region Verificación y comparación con datos existentes

        private static string VerificarValores(string valorEnBD, string valorEnPdf, ref bool actualizar)
        {
            if (valorEnBD != valorEnPdf)
            {
                actualizar = true;
            }
            return valorEnPdf;
        }

        private static long? VerificarValores(long? valorEnBD, long? valorEnPdf, ref bool actualizar)
        {
            if (valorEnBD != valorEnPdf)
            {
                actualizar = true;
            }
            return valorEnPdf;
        }

        private static int? VerificarValores(int? valorEnBD, int? valorEnPdf, ref bool actualizar)
        {
            if (valorEnBD != valorEnPdf)
            {
                actualizar = true;
            }
            return valorEnPdf;
        }

        private static short? VerificarValores(short? valorEnBD, short? valorEnPdf, ref bool actualizar)
        {
            if (valorEnBD != valorEnPdf)
            {
                actualizar = true;
            }
            return valorEnPdf;
        }

        private static byte? VerificarValores(byte? valorEnBD, byte? valorEnPdf, ref bool actualizar)
        {
            if (valorEnBD != valorEnPdf)
            {
                actualizar = true;
            }
            return valorEnPdf;
        }

        private static decimal? VerificarValores(decimal? valorEnBD, decimal? valorEnPdf, ref bool actualizar)
        {
            if (valorEnBD != valorEnPdf)
            {
                actualizar = true;
            }
            return valorEnPdf;
        }

        private static DateTime? VerificarValores(DateTime? valorEnBD, DateTime? valorEnPdf, ref bool actualizar)
        {
            if (valorEnBD != valorEnPdf)
            {
                actualizar = true;
            }
            return valorEnPdf;
        }

        private static ResultadosProcesamiento VerificarSiExisteCartaCompararDatosYActualizar(Database.Database database, Database.Movimiento_Cereal movimiento_CerealEnPdf)
        {
            Database.Movimiento_Cereal movimiento_CerealEnBD = new Database.Movimiento_Cereal();
            if (!movimiento_CerealEnBD.ObtenerPorCtg(database, movimiento_CerealEnPdf.CTGNumero.Value))
            {
                return ResultadosProcesamiento.Error;
            }

            if (movimiento_CerealEnBD.IsFound)
            {
                // La carta ya existe en la base de datos, así que hay que comparar los datos
                bool actualizar = false;
                movimiento_CerealEnBD.ComprobanteNumero = VerificarValores(movimiento_CerealEnBD.ComprobanteNumero, movimiento_CerealEnPdf.ComprobanteNumero, ref actualizar).Value;
                movimiento_CerealEnBD.FechaCarga = VerificarValores(movimiento_CerealEnBD.FechaCarga, movimiento_CerealEnPdf.FechaCarga, ref actualizar).Value;
                movimiento_CerealEnBD.IDEntidad_Titular = VerificarValores(movimiento_CerealEnBD.IDEntidad_Titular, movimiento_CerealEnPdf.IDEntidad_Titular, ref actualizar).Value;
                movimiento_CerealEnBD.IDEntidad_Intermediario = VerificarValores(movimiento_CerealEnBD.IDEntidad_Intermediario, movimiento_CerealEnPdf.IDEntidad_Intermediario, ref actualizar);
                movimiento_CerealEnBD.IDEntidad_RemitenteComercial = VerificarValores(movimiento_CerealEnBD.IDEntidad_RemitenteComercial, movimiento_CerealEnPdf.IDEntidad_RemitenteComercial, ref actualizar);
                movimiento_CerealEnBD.IDEntidad_Corredor = VerificarValores(movimiento_CerealEnBD.IDEntidad_Corredor, movimiento_CerealEnPdf.IDEntidad_Corredor, ref actualizar);
                movimiento_CerealEnBD.IDEntidad_Entregador = VerificarValores(movimiento_CerealEnBD.IDEntidad_Entregador, movimiento_CerealEnPdf.IDEntidad_Entregador, ref actualizar);
                movimiento_CerealEnBD.IDEntidad_Destinatario = VerificarValores(movimiento_CerealEnBD.IDEntidad_Destinatario, movimiento_CerealEnPdf.IDEntidad_Destinatario, ref actualizar);
                movimiento_CerealEnBD.IDEntidad_Destino = VerificarValores(movimiento_CerealEnBD.IDEntidad_Destino, movimiento_CerealEnPdf.IDEntidad_Destino, ref actualizar);
                movimiento_CerealEnBD.IDEntidad_Transportista = VerificarValores(movimiento_CerealEnBD.IDEntidad_Transportista, movimiento_CerealEnPdf.IDEntidad_Transportista, ref actualizar);
                movimiento_CerealEnBD.IDEntidad_Chofer = VerificarValores(movimiento_CerealEnBD.IDEntidad_Chofer, movimiento_CerealEnPdf.IDEntidad_Chofer, ref actualizar);
                movimiento_CerealEnBD.IDCosecha = VerificarValores(movimiento_CerealEnBD.IDCosecha, movimiento_CerealEnPdf.IDCosecha, ref actualizar).Value;
                movimiento_CerealEnBD.IDCereal = VerificarValores(movimiento_CerealEnBD.IDCereal, movimiento_CerealEnPdf.IDCereal, ref actualizar).Value;
                movimiento_CerealEnBD.PesoBruto = VerificarValores(movimiento_CerealEnBD.PesoBruto, movimiento_CerealEnPdf.PesoBruto, ref actualizar).Value;
                movimiento_CerealEnBD.PesoTara = VerificarValores(movimiento_CerealEnBD.PesoTara, movimiento_CerealEnPdf.PesoTara, ref actualizar).Value;
                movimiento_CerealEnBD.PesoNeto = VerificarValores(movimiento_CerealEnBD.PesoNeto, movimiento_CerealEnPdf.PesoNeto, ref actualizar).Value;
                // Sólo actualizo el porcentaje de volátil en caso de que esté completo con nu valor diferente
                if (movimiento_CerealEnBD.Volatil.Value != -1)
                {
                    movimiento_CerealEnBD.Volatil = VerificarValores(movimiento_CerealEnBD.Volatil, movimiento_CerealEnPdf.Volatil, ref actualizar);
                }
                movimiento_CerealEnBD.IDOrigenDestino_Origen = VerificarValores(movimiento_CerealEnBD.IDOrigenDestino_Origen, movimiento_CerealEnPdf.IDOrigenDestino_Origen, ref actualizar);
                movimiento_CerealEnBD.IDOrigenDestino_Destino = VerificarValores(movimiento_CerealEnBD.IDOrigenDestino_Destino, movimiento_CerealEnPdf.IDOrigenDestino_Destino, ref actualizar);
                movimiento_CerealEnBD.TransporteDominioCamion = VerificarValores(movimiento_CerealEnBD.TransporteDominioCamion, movimiento_CerealEnPdf.TransporteDominioCamion, ref actualizar);
                movimiento_CerealEnBD.TransporteDominioAcoplado = VerificarValores(movimiento_CerealEnBD.TransporteDominioAcoplado, movimiento_CerealEnPdf.TransporteDominioAcoplado, ref actualizar);
                movimiento_CerealEnBD.TransporteKilometro = VerificarValores(movimiento_CerealEnBD.TransporteKilometro, movimiento_CerealEnPdf.TransporteKilometro, ref actualizar);
                movimiento_CerealEnBD.TransporteTarifaReferencia = VerificarValores(movimiento_CerealEnBD.TransporteTarifaReferencia, movimiento_CerealEnPdf.TransporteTarifaReferencia, ref actualizar);
                movimiento_CerealEnBD.TransporteTarifa = VerificarValores(movimiento_CerealEnBD.TransporteTarifa, movimiento_CerealEnPdf.TransporteTarifa, ref actualizar);
                movimiento_CerealEnBD.FechaHoraArribo = VerificarValores(movimiento_CerealEnBD.FechaHoraArribo, movimiento_CerealEnPdf.FechaHoraArribo, ref actualizar);
                movimiento_CerealEnBD.FechaHoraDescarga = VerificarValores(movimiento_CerealEnBD.FechaHoraDescarga, movimiento_CerealEnPdf.FechaHoraDescarga, ref actualizar);
                movimiento_CerealEnBD.IDCartaPorte_MotivoAnulacion = VerificarValores(movimiento_CerealEnBD.IDCartaPorte_MotivoAnulacion, movimiento_CerealEnPdf.IDCartaPorte_MotivoAnulacion, ref actualizar);
                if (actualizar)
                {
                    if (movimiento_CerealEnBD.Actualizar(database))
                    {
                        return ResultadosProcesamiento.Modificada;
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
            else
            {
                // La carta no existe, hay que crearla
                if (movimiento_CerealEnPdf.Actualizar(database))
                {
                    return ResultadosProcesamiento.Agregada;
                }
                else
                {
                    return ResultadosProcesamiento.Error;
                }
            }
        }

        #endregion

    }
}
