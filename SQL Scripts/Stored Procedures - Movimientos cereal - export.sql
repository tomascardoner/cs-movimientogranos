USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	20/06/2018 10:14
-- Updated:	04/05/2021 11:39
-- Description: Obtiene los datos para exportar las Cartas de Porte y Análisis para el sistema BolsaTech
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_ListForExport') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_ListForExport
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_ListForExport
	@IDCereal tinyint,
	@IDDepositario int,
	@IDPlanta smallint,
	@FechaDesde date,
	@FechaHasta date AS

BEGIN

	SELECT Movimiento_Cereal.ComprobanteNumero, Movimiento_Cereal.CTGNumero, Cereal.ONCCA_EspecieCodigo AS CerealCodigo, Cosecha.ONCCA_Codigo AS Cosecha,
		Entidad_Destino.CUIT AS Destino_CUIT, Entidad_Destinatario.CUIT AS Destinatario_CUIT, Entidad_Titular.Nombre AS Titular_Nombre, Entidad_Titular.CUIT AS Titular_CUIT,
		Entidad_RemitenteComercial.Nombre AS RemitenteComercial_Nombre, Entidad_RemitenteComercial.CUIT AS RemitenteComercial_CUIT, Destino.ONCCA_Codigo AS CodigoEstablecimiento,
		Origen.IDLocalidad AS LocalidadOrigen, Destino.IDLocalidad AS LocalidadDestino, Movimiento_Cereal.PesoNeto AS Peso,
		Movimiento_Cereal.DeclaraIPRO, Movimiento_Cereal_Analisis.MuestraNumero, Destino.ONCCA_Codigo AS LaboratorioCuantitativo, Destino.ONCCA_Codigo AS LaboratorioCualitativo,
		Movimiento_Cereal.FechaHoraDescarga AS FechaDescarga, Destino.ONCCA_Codigo AS NumeroPlantaDestino, Entidad_Corredor.Nombre AS Corredor_Nombre,
		Entidad_Corredor.CUIT AS Corredor_CUIT, Entidad_Intermediario.Nombre AS Intermediario_Nombre, Entidad_Intermediario.CUIT AS Intermediario_CUIT,
		Entidad_Entregador.Nombre AS Entregador_Nombre, Entidad_Entregador.CUIT AS Entregador_CUIT, Cosecha.ONCCA_Codigo AS Cosecha, Movimiento_Cereal.ContratoNumero,
		Movimiento_Cereal_Analisis.ResultadoIPRO, Movimiento_Cereal_Analisis.Fecha AS FechaAnalisis
		FROM (((((((((((Movimiento_Cereal LEFT JOIN Movimiento_Cereal_Analisis ON Movimiento_Cereal.IDMovimiento_Cereal = Movimiento_Cereal_Analisis.IDMovimiento_Cereal)
			INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal)
			INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha)
			INNER JOIN Entidad AS Entidad_Titular ON Movimiento_Cereal.IDEntidad_Titular = Entidad_Titular.IDEntidad)
			LEFT JOIN Entidad AS Entidad_Intermediario ON Movimiento_Cereal.IDEntidad_Intermediario = Entidad_Intermediario.IDEntidad)
			LEFT JOIN Entidad AS Entidad_RemitenteComercial ON Movimiento_Cereal.IDEntidad_RemitenteComercial = Entidad_RemitenteComercial.IDEntidad)
			LEFT JOIN Entidad AS Entidad_Corredor ON Movimiento_Cereal.IDEntidad_Corredor = Entidad_Corredor.IDEntidad)
			LEFT JOIN Entidad AS Entidad_Entregador ON Movimiento_Cereal.IDEntidad_Entregador = Entidad_Entregador.IDEntidad)
			INNER JOIN Entidad AS Entidad_Destinatario ON Movimiento_Cereal.IDEntidad_Destinatario = Entidad_Destinatario.IDEntidad)
			INNER JOIN Entidad AS Entidad_Destino ON Movimiento_Cereal.IDEntidad_Destino = Entidad_Destino.IDEntidad)
			INNER JOIN Entidad_OrigenDestino AS Origen ON dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = Origen.IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = Origen.IDOrigenDestino)
			INNER JOIN Entidad_OrigenDestino AS Destino ON Movimiento_Cereal.IDEntidad_Destino = Destino.IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Destino = Destino.IDOrigenDestino		
		WHERE Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Movimiento_Cereal.Tipo = 'E'
			AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND Movimiento_Cereal.FechaCarga BETWEEN @FechaDesde AND @FechaHasta

END
GO