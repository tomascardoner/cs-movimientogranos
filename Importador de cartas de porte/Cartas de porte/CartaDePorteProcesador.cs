using CardonerSistemas;
using CardonerSistemas.Database.Ado;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Windows.Forms;

namespace CS_Importador_de_cartas_de_porte
{
    internal static class CartaDePorteProcesador
    {

        #region Declaraciones

        internal enum ResultadosProcesamiento : byte
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

        internal static List<ResultadosProcesamiento> Procesar(string carpetaOrigen, string archivo, byte idCosecha, SqlServer database)
        {
            List<ResultadosProcesamiento> resultadosProcesamientos = new List<ResultadosProcesamiento>();
            CartaDePorte cartaDePorte = new CartaDePorte
            {
                ArchivoNombre = archivo
            };

            if (!AbrirArchivoYLeerTexto(carpetaOrigen, archivo, cartaDePorte))
            {
                resultadosProcesamientos.Add(ResultadosProcesamiento.Error);
                return resultadosProcesamientos;
            }

            if (!cartaDePorte.EsEntrada && !cartaDePorte.EsSalida)
            {
                MessageBox.Show($"CPE nº {cartaDePorte.Numero}: No corresponde a una entrada o salida a ninguna de las plantas.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                resultadosProcesamientos.Add(ResultadosProcesamiento.SinCambios);
                return resultadosProcesamientos;
            }
            if (cartaDePorte.EsEntrada)
            {
                Database.MovimientoCereal movimientoCereal = new Database.MovimientoCereal
                {
                    Tipo = Constantes.MovimientoTipoEntrada
                };
                if (!ConvertirDatosAObjetoDestino(cartaDePorte, movimientoCereal, idCosecha, database))
                {
                    resultadosProcesamientos.Add(ResultadosProcesamiento.Error);
                    return resultadosProcesamientos;
                }
                ResultadosProcesamiento resultado = VerificarSiExisteCartaCompararDatosYActualizar(database, movimientoCereal);
                resultadosProcesamientos.Add(resultado);
                if (resultado == ResultadosProcesamiento.Error)
                {
                    return resultadosProcesamientos;
                }
            }
            if (cartaDePorte.EsSalida)
            {
                Database.MovimientoCereal movimientoCereal = new Database.MovimientoCereal
                {
                    Tipo = Constantes.MovimientoTipoSalida
                };
                if (!ConvertirDatosAObjetoDestino(cartaDePorte, movimientoCereal, idCosecha, database))
                {
                    resultadosProcesamientos.Add(ResultadosProcesamiento.Error);
                    return resultadosProcesamientos;
                }
                ResultadosProcesamiento resultado = VerificarSiExisteCartaCompararDatosYActualizar(database, movimientoCereal);
                resultadosProcesamientos.Add(resultado);
                if (resultado == ResultadosProcesamiento.Error)
                {
                    return resultadosProcesamientos;
                }
            }
            return resultadosProcesamientos;
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
                        Cursor.Current = Cursors.Default;
                        return false;
                    }
                }
                pdfReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                Cursor.Current = Cursors.Default;
                MessageBox.Show($"Error al leer el archivo de la carta de porte '{archivo}'.\n\nError: {ex.Message}", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        #endregion

        #region Procesamiento del texto

        private static bool ProcesarTexto(string texto, CartaDePorte cartaDePorte)
        {
            IParser parser;

            if (string.IsNullOrWhiteSpace(texto))
            {
                MessageBox.Show("No se detectó texto en la carta de porte.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }

            // Detecto la versión del formato y ejecuto el parser correspondiente
            if (texto.StartsWith(Constantes.CartaPorteVersion1TextoInicio))
            {
                parser = new ParserV1();
                switch (parser.ProcesarTexto(texto, cartaDePorte, Constantes.CartaPorteVersion1TextoInicio.Length))
                {
                    case CommonFunctions.ProcesarTextoResultados.Ok:
                        return true;
                    case CommonFunctions.ProcesarTextoResultados.FormatError:
                        MessageBox.Show("El texto de la carta de porte no tiene el formato esperado.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return false;
                    case CommonFunctions.ProcesarTextoResultados.EntradaSinDescarga:
                        return false;
                    default:
                        return false;
                }
            }
            else if (texto.StartsWith(Constantes.CartaPorteVersion2_3_4_5_6TextoInicio))
            {
                if (texto.Contains(Constantes.CartaPorteVersion3_4_5_6Texto))
                {
                    if (texto.Contains(Constantes.CartaPorteVersion3Texto))
                    {
                        parser = new ParserV3();
                    }
                    else if(texto.Contains(Constantes.CartaPorteVersion4Texto))
                    {
                        parser = new ParserV4();
                    }
                    else if (texto.Contains(Constantes.CartaPorteVersion5_6Texto))
                    {
                        if (texto.Contains(Constantes.CartaPorteVersion5Texto))
                        {
                            parser = new ParserV5();
                        }
                        else
                        {
                            parser = new ParserV6();
                        }
                    }
                    else
                    {
                        MessageBox.Show("El texto de la carta de porte no tiene el formato esperado.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return false;
                    }
                }
                else
                {
                    parser = new ParserV2();
                }
                switch (parser.ProcesarTexto(texto, cartaDePorte, 1))
                {
                    case CommonFunctions.ProcesarTextoResultados.Ok:
                        return true;
                    case CommonFunctions.ProcesarTextoResultados.FormatError:
                        MessageBox.Show("El texto de la carta de porte no tiene el formato esperado.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return false;
                    case CommonFunctions.ProcesarTextoResultados.EntradaSinDescarga:
                        return false;
                    default:
                        return false;
                }
            }
            else
            {
                MessageBox.Show("El texto de la carta de porte no tiene el formato esperado.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }
        }

        #endregion

        #region Conversión de datos - Entidades

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
                valor = valor.Replace(" SOCIEDAD ANONIM", " S.A.");
                valor = valor.ReplaceEnd(" SA", " S.A.");
                valor = valor.ReplaceEnd(" S A", " S.A.");
                valor = valor.ReplaceEnd(" CIA S.A.", " CIA. S.A.");
                valor = valor.ReplaceEnd(" S.A. I Y C", " S.A.I.C.");

                // Reemplazo los valores posibles de Sociedad de Responsabilidad Limitada
                valor = valor.ReplaceEnd(" S R L", " S.R.L.");
                valor = valor.ReplaceEnd(" SRL", " S.R.L.");
                valor = valor.ReplaceEnd(" SOCIEDAD DE RESPONSABILIDAD LIMITADA", " S.R.L.");
                valor = valor.ReplaceEnd(" CIA S.R.L.", " CIA. S.R.L.");

                // Elimino espacios al inicio o al final y espacios dobles
                valor = valor.TrimAndReduce();

                // Establezco las mayúsculas y minúsculas correspondientes
                valor = valor.ToTitleCaseAll();
            }

            return valor;
        }

        private static int? ProcesarEntidad(SqlServer database, string valor, TiposEntidad tipoEntidad)
        {
            if (!string.IsNullOrWhiteSpace(valor))
            {
                string cuitString = string.Empty;
                string nombre = string.Empty;

                CommonFunctions.Separar2Valores(valor, CommonFunctions.CuitYNombreSeparador, ref cuitString, ref nombre);
                if (!string.IsNullOrWhiteSpace(cuitString) && long.TryParse(cuitString, out long cuitLong))
                {
                    // Proceso nombre por si tiene siglas sin puntos o palabras completas reemplazables
                    nombre = ProcesarNombreEntidad(nombre);

                    // Busco la entidad en la base de datos
                    Database.Entidad entidad = new Database.Entidad();
                    if (!Database.EntidadMetodos.ObtenerPorCuit(database, cuitLong, entidad))
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
                            Database.EntidadMetodos.Actualizar(database, entidad);
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
                        Database.EntidadMetodos.Actualizar(database, entidad);
                    }
                    return entidad.IDEntidad;
                }
            }
            return null;
        }

        #endregion

        #region Conversión de datos

        private static bool ConvertirDatosAObjetoDestino(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal, byte idCosecha, SqlServer database)
        {
            if (!ConvertiDatosAObjetoDestinoEncabezado(cartaDePorte, movimientoCereal))
            {
                return false;
            }

            if (!ConvertiDatosAObjetoDestinoSeccionA(cartaDePorte, movimientoCereal, database))
            {
                return false;
            }

            if (!ConvertiDatosAObjetoDestinoSeccionB(cartaDePorte, movimientoCereal, idCosecha, database))
            {
                return false;
            }

            if (!ConvertiDatosAObjetoDestinoSeccionC(cartaDePorte, movimientoCereal, database))
            {
                return false;
            }

            if (!ConvertiDatosAObjetoDestinoSeccionD(cartaDePorte, movimientoCereal, database))
            {
                return false;
            }

            if (!ConvertiDatosAObjetoDestinoSeccionE(cartaDePorte, movimientoCereal))
            {
                return false;
            }

            if (!ConvertiDatosAObjetoDestinoSeccionG(cartaDePorte, movimientoCereal))
            {
                return false;
            }

            // Motivo de anulación
            if (cartaDePorte.ArchivoNombre.Contains(Constantes.ArchivosSufijoAnulada))
            {
                movimientoCereal.IDCartaPorte_MotivoAnulacion = Properties.Settings.Default.IdCartaPorteMotivoAnulacion;
            }

            // Certificado
            if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada)
            {
                movimientoCereal.Certificado = false;
            }

            return true;
        }

        private static bool ConvertiDatosAObjetoDestinoEncabezado(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal)
        {
            // Comprobante número
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Numero) && long.TryParse(cartaDePorte.Numero.Trim().Replace("-", ""), out long longTemp))
            {
                movimientoCereal.ComprobanteNumero = longTemp;
            }

            // CTG
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Ctg))
            {
                if (long.TryParse(cartaDePorte.Ctg, out longTemp))
                {
                    movimientoCereal.CTGNumero = longTemp;
                    if (longTemp == 0)
                    {
                        MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se pudo obtener el CTG.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return false;
                    }
                }
                else
                {
                    MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se pudo obtener el CTG.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
            }
            else
            {
                MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se pudo obtener el CTG.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }

            // Fecha de carga
            if (!(string.IsNullOrWhiteSpace(cartaDePorte.Fecha) || !DateTime.TryParse(cartaDePorte.Fecha, CultureInfo.CreateSpecificCulture("es-AR"), DateTimeStyles.None, out DateTime datetimeTemp)))
            {
                movimientoCereal.FechaCarga = datetimeTemp;
            }

            return true;
        }

        private static bool ConvertiDatosAObjetoDestinoSeccionA(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal, SqlServer database)
        {
            // Entidad titular
            movimientoCereal.IDEntidad_Titular = ProcesarEntidad(database, cartaDePorte.TitularCartaDePorte, TiposEntidad.Titular).Value;

            // Entidad intermediario y entidad remitente comercial
            if (!string.IsNullOrWhiteSpace(cartaDePorte.RemitenteComercialProductor) && !string.IsNullOrWhiteSpace(cartaDePorte.RteComercialVentaPrimaria))
            {
                // Entidad intermediario
                movimientoCereal.IDEntidad_Intermediario = ProcesarEntidad(database, cartaDePorte.RemitenteComercialProductor, TiposEntidad.Intermediario);

                // Entidad remitente comercial
                movimientoCereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RteComercialVentaPrimaria, TiposEntidad.RemitenteComercial);
            }
            else if (!string.IsNullOrWhiteSpace(cartaDePorte.RemitenteComercialProductor))
            {
                // Entidad remitente comercial
                movimientoCereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RemitenteComercialProductor, TiposEntidad.RemitenteComercial);
            }
            else if (!string.IsNullOrWhiteSpace(cartaDePorte.RteComercialVentaPrimaria))
            {
                // Entidad remitente comercial
                movimientoCereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RteComercialVentaPrimaria, TiposEntidad.RemitenteComercial);
            }
            else if (!string.IsNullOrWhiteSpace(cartaDePorte.RteComercialVentaSecundaria))
            {
                // Entidad remitente comercial
                movimientoCereal.IDEntidad_RemitenteComercial = ProcesarEntidad(database, cartaDePorte.RteComercialVentaSecundaria, TiposEntidad.RemitenteComercial);
            }

            // Entidad corredor
            movimientoCereal.IDEntidad_Corredor = ProcesarEntidad(database, cartaDePorte.CorredorVentaPrimaria, TiposEntidad.Corredor);

            // Entidad entregador
            movimientoCereal.IDEntidad_Entregador = ProcesarEntidad(database, cartaDePorte.RepresentanteEntregador, TiposEntidad.Entregador);

            // Entidad destinatario
            movimientoCereal.IDEntidad_Destinatario = ProcesarEntidad(database, cartaDePorte.Destinatario, TiposEntidad.Destinatario);

            // Entidad destino
            movimientoCereal.IDEntidad_Destino = ProcesarEntidad(database, cartaDePorte.Destino, TiposEntidad.Destino);

            // Entidad transportista
            movimientoCereal.IDEntidad_Transportista = ProcesarEntidad(database, cartaDePorte.EmpresaTransportista, TiposEntidad.Transportista);

            // Entidad chofer
            movimientoCereal.IDEntidad_Chofer = ProcesarEntidad(database, cartaDePorte.Chofer, TiposEntidad.Chofer);

            return true;
        }

        private static bool ConvertiDatosAObjetoDestinoSeccionB(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal, byte idCosecha, SqlServer database)
        {
            int intTemp;

            // Cereal
            if (!string.IsNullOrWhiteSpace(cartaDePorte.GranoEspecie))
            {
                Database.Cereal cereal = new Database.Cereal();
                if (!Database.CerealMetodos.ObtenerPorNombre(database, cartaDePorte.GranoEspecie, cereal))
                {
                    return false;
                }
                if (cereal.IsFound)
                {
                    movimientoCereal.IDCereal = cereal.IDCereal;
                    movimientoCereal.Volatil = cereal.MermaVolatil;
                }
                else
                {
                    MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se encontró el cereal.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
            }

            // Cosecha
            if (string.IsNullOrWhiteSpace(cartaDePorte.Campania))
            { 
                movimientoCereal.IDCosecha = idCosecha;
            }
            else
            {
                Database.Cosecha cosecha = new Database.Cosecha();
                if (!Database.CosechaMetodos.ObtenerPorCodigoOncca(database, cartaDePorte.Campania, cosecha))
                {
                    return false;
                }
                if (cosecha.IsFound)
                {
                    movimientoCereal.IDCosecha = cosecha.IDCosecha;
                }
                else
                {
                    MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se encontró la cosecha.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
            }

            // Pesaje
            if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada)
            {
                if (!string.IsNullOrWhiteSpace(cartaDePorte.DescargaPesoBruto) && int.TryParse(cartaDePorte.DescargaPesoBruto, out intTemp))
                {
                    movimientoCereal.PesoBruto = intTemp;
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.DescargaPesoTara) && int.TryParse(cartaDePorte.DescargaPesoTara, out intTemp))
                {
                    movimientoCereal.PesoTara = intTemp;
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.DescargaPesoNeto) && int.TryParse(cartaDePorte.DescargaPesoNeto, out intTemp))
                {
                    movimientoCereal.PesoNeto = intTemp;
                }
                if (movimientoCereal.PesoBruto == 0 && movimientoCereal.PesoTara == 0 && movimientoCereal.PesoNeto == 0)
                {
                    MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se detectaron los kilogramos, es posible que esta carta esté anulada o sin confirmar.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    return false;
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(cartaDePorte.PesoBruto) && int.TryParse(cartaDePorte.PesoBruto, out intTemp))
                {
                    movimientoCereal.PesoBruto = intTemp;
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.PesoTara) && int.TryParse(cartaDePorte.PesoTara, out intTemp))
                {
                    movimientoCereal.PesoTara = intTemp;
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.PesoNeto) && int.TryParse(cartaDePorte.PesoNeto, out intTemp))
                {
                    movimientoCereal.PesoNeto = intTemp;
                }
            }
            if (movimientoCereal.PesoBruto - movimientoCereal.PesoTara != movimientoCereal.PesoNeto)
            {
                MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: El peso neto no coincide con el peso bruto - peso tara.", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }

            return true;
        }

        private static bool ConvertiDatosAObjetoDestinoSeccionC(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal, SqlServer database)
        {
            // Origen
            if (!string.IsNullOrWhiteSpace(cartaDePorte.ProcedenciaEsUnCampo))
            {
                if (cartaDePorte.ProcedenciaEsUnCampo.Trim() == Properties.Settings.Default.DireccionEsUnCampoNo)
                {
                    if (!string.IsNullOrWhiteSpace(cartaDePorte.ProcedenciaNumeroPlanta))
                    {
                        // Buscar por número de planta
                        if (int.TryParse(cartaDePorte.ProcedenciaNumeroPlanta, out int intTemp))
                        {
                            Database.EntidadOrigenDestino origen = new Database.EntidadOrigenDestino();
                            while (true)
                            {
                                if (!Database.EntidadOrigenDestinoMetodos.ObtenerPorCodigoOncca(database, movimientoCereal.IDEntidad_Titular, intTemp, origen))
                                {
                                    return false;
                                }
                                if (origen.IsFound)
                                {
                                    movimientoCereal.IDOrigenDestino_Origen = origen.IDOrigenDestino;
                                    break;
                                }
                                else
                                {
                                    if (MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se encontró el origen con nº de planta {intTemp} perteneciente a {cartaDePorte.TitularCartaDePorte}.\n\n¿Desea reintentar?", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) == DialogResult.No)
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
                    Database.EntidadOrigenDestino origen = new Database.EntidadOrigenDestino();
                    while (true)
                    {
                        if (!Database.EntidadOrigenDestinoMetodos.ObtenerPrimeroSinNumeroPlanta(database, movimientoCereal.IDEntidad_Titular, origen))
                        {
                            return false;
                        }
                        if (origen.IsFound)
                        {
                            movimientoCereal.IDOrigenDestino_Origen = origen.IDOrigenDestino;
                            break;
                        }
                        else
                        {
                            if (MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se encontró ningún origen perteneciente a {cartaDePorte.TitularCartaDePorte}.\n\n¿Desea reintentar?", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) == DialogResult.No)
                            {
                                break;
                            }
                        }
                    }
                }
            }

            return true;
        }

        private static bool ConvertiDatosAObjetoDestinoSeccionD(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal, SqlServer database)
        {
            // Destino
            if (!string.IsNullOrWhiteSpace(cartaDePorte.DestinoEsUnCampo) && cartaDePorte.DestinoEsUnCampo.Trim() == Properties.Settings.Default.DireccionEsUnCampoNo)
            {
                if (!string.IsNullOrWhiteSpace(cartaDePorte.DestinoNumeroPlanta) && movimientoCereal.IDEntidad_Destino.HasValue)
                {
                    // Buscar por número de planta
                    if (int.TryParse(cartaDePorte.DestinoNumeroPlanta, out int intTemp))
                    {
                        Database.EntidadOrigenDestino destino = new Database.EntidadOrigenDestino();
                        while (true)
                        {
                            if (!Database.EntidadOrigenDestinoMetodos.ObtenerPorCodigoOncca(database, movimientoCereal.IDEntidad_Destino.Value, intTemp, destino))
                            {
                                return false;
                            }
                            if (destino.IsFound)
                            {
                                movimientoCereal.IDOrigenDestino_Destino = destino.IDOrigenDestino;
                                if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada && intTemp == Properties.Settings.Default.NumeroPlantaAceitera)
                                {
                                    movimientoCereal.Volatil = null;
                                }
                                break;
                            }
                            else
                            {
                                if (MessageBox.Show($"CPE nº {movimientoCereal.ComprobanteNumero}: No se encontró el destino con nº de planta {intTemp} perteneciente a {cartaDePorte.Destino}.\n\n¿Desea reintentar?", CardonerSistemas.My.Application.Info.Title, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation) == DialogResult.No)
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

            return true;
        }

        private static bool ConvertiDatosAObjetoDestinoSeccionE(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal)
        {
            string stringTemp1 = null;
            string stringTemp2 = null;

            // Dominios
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Dominios))
            {
                CommonFunctions.Separar2Valores(cartaDePorte.Dominios, CommonFunctions.DominiosSeparador, ref stringTemp1, ref stringTemp2);
                if (string.IsNullOrWhiteSpace(stringTemp1))
                {
                    movimientoCereal.TransporteDominioCamion = string.Empty;
                }
                else
                {
                    movimientoCereal.TransporteDominioCamion = stringTemp1;
                }
                if (string.IsNullOrWhiteSpace(stringTemp2))
                {
                    movimientoCereal.TransporteDominioAcoplado = string.Empty;
                }
                else
                {
                    movimientoCereal.TransporteDominioAcoplado = stringTemp2;
                }
            }

            // Kilometros
            if (!string.IsNullOrWhiteSpace(cartaDePorte.KmsARecorrer) && short.TryParse(cartaDePorte.KmsARecorrer, out short shortTemp))
            {
                movimientoCereal.TransporteKilometro = shortTemp;
            }

            // Tarifa de referencia
            if (!string.IsNullOrWhiteSpace(cartaDePorte.TarifaDeReferencia) && decimal.TryParse(cartaDePorte.TarifaDeReferencia.Replace(".", Application.CurrentCulture.NumberFormat.NumberDecimalSeparator), out decimal decimalTemp))
            {
                movimientoCereal.TransporteTarifaReferencia = decimalTemp;
            }

            // Tarifa
            if (!string.IsNullOrWhiteSpace(cartaDePorte.Tarifa) && decimal.TryParse(cartaDePorte.Tarifa.Replace(".", Application.CurrentCulture.NumberFormat.NumberDecimalSeparator), out decimalTemp))
            {
                movimientoCereal.TransporteTarifa = decimalTemp;
            }
            return true;
        }

        private static bool ConvertiDatosAObjetoDestinoSeccionG(CartaDePorte cartaDePorte, Database.MovimientoCereal movimientoCereal)
        {
            // Fechas de arribo y de descarga
            if (movimientoCereal.Tipo == Constantes.MovimientoTipoEntrada)
            {
                if (!string.IsNullOrWhiteSpace(cartaDePorte.FechaArribo) && DateTime.TryParse(cartaDePorte.FechaArribo, CultureInfo.CreateSpecificCulture("es-AR"), DateTimeStyles.None, out DateTime datetimeTemp))
                {
                    // Le paso la fecha/hora sin los segundos porque si no, redondea los minutos porque el campo de destino es smalldatetime
                    movimientoCereal.FechaHoraArribo = new DateTime(datetimeTemp.Year, datetimeTemp.Month, datetimeTemp.Day, datetimeTemp.Hour, datetimeTemp.Minute, 0, DateTimeKind.Unspecified);
                }
                if (!string.IsNullOrWhiteSpace(cartaDePorte.FechaDescarga) && DateTime.TryParse(cartaDePorte.FechaDescarga, CultureInfo.CreateSpecificCulture("es-AR"), DateTimeStyles.None, out datetimeTemp))
                {
                    movimientoCereal.FechaHoraDescarga = new DateTime(datetimeTemp.Year, datetimeTemp.Month, datetimeTemp.Day, datetimeTemp.Hour, datetimeTemp.Minute, 0, DateTimeKind.Unspecified);
                }
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

        private static ResultadosProcesamiento VerificarSiExisteCartaCompararDatosYActualizar(SqlServer database, Database.MovimientoCereal movimiento_CerealEnPdf)
        {
            Database.MovimientoCereal movimiento_CerealEnBD = new Database.MovimientoCereal();
            if (!Database.MovimientoCerealMetodos.ObtenerPorCtgYTipo(database, movimiento_CerealEnPdf.CTGNumero.Value, movimiento_CerealEnPdf.Tipo, movimiento_CerealEnBD))
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
                // Sólo actualizo el porcentaje de volátil en caso de que esté completo con un valor diferente
                if (movimiento_CerealEnBD.Volatil.HasValue)
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
                    if (Database.MovimientoCerealMetodos.Actualizar(database, movimiento_CerealEnBD))
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
                if (Database.MovimientoCerealMetodos.Actualizar(database, movimiento_CerealEnPdf))
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