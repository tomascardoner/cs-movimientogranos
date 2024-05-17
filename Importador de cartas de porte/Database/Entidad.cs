using System;

namespace CS_Importador_de_cartas_de_porte.Database
{
    class Entidad
    {
        public int IDEntidad { get; set; }
        public string Nombre { get; set; }
        public long? Cuit { get; set; }
        public bool EsTitular { get; set; }
        public bool EsIntermediario { get; set; }
        public bool EsRemitenteComercial { get; set; }
        public bool EsCorredor { get; set; }
        public bool EsEntregador { get; set; }
        public bool EsDestinatario { get; set; }
        public bool EsDestino { get; set; }
        public bool EsTransportista { get; set; }
        public bool EsChofer { get; set; }
        public bool EsClienteSubProducto { get; set; }
        public string Notas { get; set; }
        public bool Activo { get; set; }
        public byte IDUsuarioCreacion { get; set; }
        public DateTime FechaHoraCreacion { get; set; }
        public byte IDUsuarioModificacion { get; set; }
        public DateTime FechaHoraModificacion { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;
    }
}