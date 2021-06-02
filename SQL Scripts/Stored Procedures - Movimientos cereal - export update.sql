USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	31/05/2021 19:59
-- Updated:	
-- Description: Actualiza la fecha de exportación a BolsaTech
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_UpdateExport') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_UpdateExport
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_UpdateExport
	@IDCereal tinyint,
	@IDDepositario int,
	@IDPlanta smallint,
	@FechaDesde date,
	@FechaHasta date AS

BEGIN

	UPDATE Movimiento_Cereal
		SET FechaHoraEnvioBolsaTech = GETDATE()
		FROM (((((((((((Movimiento_Cereal INNER JOIN Movimiento_Cereal_Analisis ON Movimiento_Cereal.IDMovimiento_Cereal = Movimiento_Cereal_Analisis.IDMovimiento_Cereal)
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
			AND Movimiento_Cereal.FechaHoraEnvioBolsaTech IS NULL
			AND Movimiento_Cereal.FechaCarga BETWEEN @FechaDesde AND @FechaHasta

END
GO