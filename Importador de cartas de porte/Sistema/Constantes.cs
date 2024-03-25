namespace CS_Importador_de_cartas_de_porte
{
    internal static class Constantes
    {
        // Tipos de movimientos
        internal const string MovimientoTipoEntrada = "E";
        internal const string MovimientoTipoSalida = "S";

        // Identificación de cartas de porte
        internal const string ArchivosPatronBusqueda = "cpe-?????-???????*.pdf";
        internal const string ArchivosSufijoAnulada = "anulada.pdf";
        internal const string CartaPorteV1InicioTexto = "\nCarta de Porte Electrónica\n";
        internal const string CartaPorteV2_3_4_5_InicioTexto = "\nFecha: ";
        internal const string CartaPorteV3_4_5_Texto = "\nN° CPE:\nAutomotor";
        internal const string CartaPorteV3Texto = "Localidad:\n";
        internal const string CartaPorteV4Texto = "Grano / especie:";
        internal const string CartaPorteV5Texto = "Campaña:";
    }
}