namespace CS_Importador_de_cartas_de_porte
{
    internal static class CommonFunctions
    {

        internal const string CuitYNombreSeparador = " - ";
        internal const string DominiosSeparador = " - ";

        internal enum ProcesarTextoResultados
        {
            Ok,
            FormatError,
            EntradaSinDescarga
        }

        internal static string ObtenerTextoDesdeDelimitador(string texto, string delimitador)
        {
            int inicioDelimitador = texto.IndexOf(delimitador);
            if (inicioDelimitador > -1)
            {
                int finDelimitador = inicioDelimitador + delimitador.Length;
                return texto.Substring(finDelimitador);
            }
            return string.Empty;
        }

        internal static string ObtenerTextoLimpioDesdeDelimitador(string texto, string delimitador)
        { 
            return ObtenerTextoDesdeDelimitador(texto, delimitador).Replace("\n", string.Empty).Trim();
        }

        internal static string ObtenerTextoEntreDelimitadores(string texto, string delimitadorInicial, string delimitadorFinal)
        {
            int inicioDelimitadorInicial = texto.IndexOf(delimitadorInicial);
            if (inicioDelimitadorInicial > -1)
            {
                int finDelimitadorInicial = inicioDelimitadorInicial + delimitadorInicial.Length;
                int inicioDelimitadorFinal = texto.IndexOf(delimitadorFinal, finDelimitadorInicial);
                if (inicioDelimitadorFinal > 0)
                {
                    return texto.Substring(finDelimitadorInicial, inicioDelimitadorFinal - finDelimitadorInicial);
                }
            }
            return string.Empty;
        }

        internal static string ObtenerTextoLimpioEntreDelimitadores(string texto, string delimitadorInicial, string delimitadorFinal)
        {
            return ObtenerTextoEntreDelimitadores(texto, delimitadorInicial, delimitadorFinal).Replace("\n", string.Empty).Trim();
        }

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
            if (string.IsNullOrWhiteSpace(textoOriginal) || string.IsNullOrEmpty(separador))
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
