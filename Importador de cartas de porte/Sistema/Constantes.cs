namespace CS_Importador_de_cartas_de_porte
{
    internal static class Constantes
    {
        // Tipos de movimientos
        internal const char MovimientoTipoEntrada = 'E';
        internal const char MovimientoTipoSalida = 'S';

        // Identificación de cartas de porte
        internal const string ArchivosPatronBusqueda = "cpe-?????-???????*.pdf";
        internal const string ArchivosSufijoAnulada = "anulada.pdf";
        internal const string CartaPorteVersion1TextoInicio = "\nCarta de Porte Electrónica\n";
        internal const string CartaPorteVersion2_3_4_5_6TextoInicio = "\nFecha: ";
        internal const string CartaPorteVersion3_4_5_6Texto = "\nN° CPE:\nAutomotor";
        internal const string CartaPorteVersion3Texto = "Localidad:\n";
        internal const string CartaPorteVersion4Texto = "Grano / especie:";
        internal const string CartaPorteVersion5_6Texto = "Campaña:";
        internal const string CartaPorteVersion5Texto = "Es un campo: Dirección:";

    }
}