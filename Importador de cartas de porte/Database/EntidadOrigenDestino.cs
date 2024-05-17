namespace CS_Importador_de_cartas_de_porte.Database
{
    class EntidadOrigenDestino
    {
        public int IDEntidad { get; set; }
        public short IDOrigenDestino { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public int IDLocalidad { get; set; }
        public short? Kilometro { get; set; }
        public int? ONCCA_Codigo { get; set; }
        public bool ControlaStock { get; set; }
        public bool ConvierteEnSubProducto { get; set; }
        public bool RealizaAnalisisIPRO { get; set; }
        public bool Activo { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;
    }
}