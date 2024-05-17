using System;

namespace CS_Importador_de_cartas_de_porte.Database
{
    internal class MovimientoCereal
    {
        internal int IDMovimiento_Cereal { get; set; }
        internal char Tipo { get; set; }
        internal long ComprobanteNumero { get; set; }
        internal string ComprobanteNumeroConFormato { get; set; }
        internal int? IDCartaPorte_Talonario { get; set; }
        internal long? CTGNumero { get; set; }
        internal DateTime FechaCarga { get; set; }
        internal int IDEntidad_Titular { get; set; }
        internal int? IDEntidad_Intermediario { get; set; }
        internal int? IDEntidad_RemitenteComercial { get; set; }
        internal int? IDEntidad_Corredor { get; set; }
        internal int? IDEntidad_Entregador { get; set; }
        internal int? IDEntidad_Destinatario { get; set; }
        internal int? IDEntidad_Destino { get; set; }
        internal int? IDEntidad_Transportista { get; set; }
        internal int? IDEntidad_Chofer { get; set; }
        internal byte IDCosecha { get; set; }
        internal byte IDCereal { get; set; }
        internal int? IDContrato { get; set; }
        internal string ContratoNumero { get; set; }
        internal int PesoBruto { get; set; }
        internal int PesoTara { get; set; }
        internal int PesoNeto { get; set; }
        internal decimal? Volatil { get; set; }
        internal decimal? Humedad { get; set; }
        internal decimal? Zaranda { get; set; }
        internal bool? Fumigado { get; set; }
        internal int? MermaVolatilKilogramo { get; set; }
        internal decimal? MermaHumedadPorcentaje { get; set; }
        internal int? MermaHumedadKilogramo { get; set; }
        internal int? MermaZarandaKilogramo { get; set; }
        internal int? PesoFinal { get; set; }
        internal short? IDOrigenDestino_Origen { get; set; }
        internal short? IDOrigenDestino_Destino { get; set; }
        internal int? CTGCancelacion { get; set; }
        internal string TransporteDominioCamion { get; set; }
        internal string TransporteDominioAcoplado { get; set; }
        internal short? TransporteKilometro { get; set; }
        internal decimal? TransporteTarifaReferencia { get; set; }
        internal decimal? TransporteTarifa { get; set; }
        internal DateTime? FechaHoraArribo { get; set; }
        internal DateTime? FechaHoraDescarga { get; set; }
        internal bool DeclaraIPRO { get; set; }
        internal byte? IDCartaPorte_MotivoAnulacion { get; set; }
        internal string Notas { get; set; }
        internal short? Calculo_TarifaIndice { get; set; }
        internal byte IDUsuarioCreacion { get; set; }
        internal DateTime FechaHoraCreacion { get; set; }
        internal byte IDUsuarioModificacion { get; set; }
        internal DateTime FechaHoraModificacion { get; set; }
        internal DateTime? FechaHoraLiquidacionServicio { get; set; }
        internal DateTime? FechaHoraEnvioBolsaTech { get; set; }
        internal bool? Certificado { get; set; }
        internal int? KilogramoAplicado { get; set; }

        internal bool IsNew { get; set; } = true;
        internal bool IsFound { get; set; } = false;
    }
}
