namespace CS_Importador_de_cartas_de_porte
{
    internal interface IParser
    {
        CommonFunctions.ProcesarTextoResultados ProcesarTexto(string texto, CartaDePorte cartaDePorte, int index);
    }
}