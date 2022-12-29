namespace CS_Importador_de_cartas_de_porte
{
    internal interface IParser
    {
        bool ProcesarTexto(string texto, CartaDePorte cartaDePorte, int index);
    }
}