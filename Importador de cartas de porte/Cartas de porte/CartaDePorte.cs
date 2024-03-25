namespace CS_Importador_de_cartas_de_porte
{
    internal class CartaDePorte
    {
        // Control
        internal string ArchivoNombre { get; set; }

        // Encabezado
        internal string Fecha { get; set; }
        internal string Numero { get; set; }
        internal string Ctg { get; set; }


        // Sección A - Intervinientes
        internal string TitularCartaDePorte { get; set; }
        internal string RemitenteComercialProductor { get; set; }
        internal string RteComercialVentaPrimaria { get; set; }
        internal string RteComercialVentaSecundaria { get; set; }
        internal string RteComercialVentaSecundaria2 { get; set; }
        internal string MercadoATermino { get; set; }
        internal string CorredorVentaPrimaria { get; set; }
        internal string CorredorVentaSecundaria { get; set; }
        internal string RepresentanteEntregador { get; set; }
        internal string RepresentanteRecibidor { get; set; }
        internal string Destinatario { get; set; }
        internal string Destino { get; set; }
        internal string EmpresaTransportista { get; set; }
        internal string FletePagador { get; set; }
        internal string Chofer { get; set; }
        internal string IntermediarioDeFlete { get; set; }


        // Sección B - Grano / Especie
        internal string GranoEspecie { get; set; }
        internal string GranoEspecieTipo { get; set; }
        internal string Campania { get; set; }
        internal string CalidadConforme { get; set; }
        internal string CalidadCondicional { get; set; }
        internal string PesoBruto { get; set; }
        internal string PesoTara { get; set; }
        internal string PesoNeto { get; set; }


        // Sección C - Procedencia
        internal string ProcedenciaEsUnCampo { get; set; }
        internal string ProcedenciaNumeroPlanta { get; set; }
        internal string ProcedenciaDireccion { get; set; }
        internal string ProcedenciaLocalidad { get; set; }
        internal string ProcedenciaProvincia { get; set; }


        // Sección D - Destino de la mercadería
        internal string DestinoEsUnCampo { get; set; }
        internal string DestinoNumeroPlanta { get; set; }
        internal string DestinoDireccion { get; set; }
        internal string DestinoLocalidad { get; set; }
        internal string DestinoProvincia { get; set; }


        // Sección E - Datos del transporte
        internal string Dominios { get; set; }
        internal string Partida { get; set; }
        internal string KmsARecorrer { get; set; }
        internal string TarifaDeReferencia { get; set; }
        internal string Tarifa { get; set; }


        // Sección G - Descarga
        internal string FechaArribo { get; set; }
        internal string FechaDescarga { get; set; }
        internal string NumeroTurno { get; set; }
        internal string DescargaPesoBruto { get; set; }
        internal string DescargaPesoTara { get; set; }
        internal string DescargaPesoNeto { get; set; }
        internal string DescargaLocalidad { get; set; }
        internal string DescargaProvincia { get; set; }
    }
}
