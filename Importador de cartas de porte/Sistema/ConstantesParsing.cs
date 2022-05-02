namespace CS_Importador_de_cartas_de_porte
{
    static class ConstantesParsing
    {
        // Comunes
        internal const string Finalizacion = "\n";
        internal const string CuitYNombreSeparador = " - ";

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
        internal const string DominiosSeparador = " - ";
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
    }
}
