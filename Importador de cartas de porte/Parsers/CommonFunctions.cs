namespace CS_Importador_de_cartas_de_porte
{
    internal static class CommonFunctions
    {

        internal const string CuitYNombreSeparador = " - ";
        internal const string DominiosSeparador = " - ";

        internal static string ObtenerValor(string textoOriginal, string textoABuscar, ref int indice, string textoFin)
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

        internal static void Separar2Valores(string textoOriginal, string separador, ref string valor1, ref string valor2)
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

    }
}
