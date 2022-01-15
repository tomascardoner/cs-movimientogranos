using System;

namespace CS_Importador_de_cartas_de_porte.Database
{
    public class Cosecha
    {
        public byte IDCosecha { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string ONCCA_Codigo { get; set; }
        public bool Activo { get; set; }
    }
}
