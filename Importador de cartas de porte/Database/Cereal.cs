namespace CS_Importador_de_cartas_de_porte.Database
{
    class Cereal
    {
        public byte IDCereal { get; set; }
        public string Nombre { get; set; }
        public string Tipo { get; set; }
        public decimal? MermaVolatil { get; set; }
        public decimal? MermaHumedadBase { get; set; }
        public decimal? MermaHumedadManipuleo { get; set; }
        public byte? ONCCA_EspecieCodigo { get; set; }
        public string ONCCA_EspecieNombre { get; set; }
        public byte? ONCCA_GranoTipoCodigo { get; set; }
        public string ONCCA_GranoTipoNombre { get; set; }
        public bool RealizaAnalisisIPRO { get; set; }
        public bool Activo { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;
    }
}