USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-03
-- Description:	Lista los Partidos disponibles para un Formularios 1116A
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_ListPartido') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_ListPartido
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Entrada_SinCertificar_ListPartido
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha smallint,
	@IDCereal tinyint,
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT DISTINCT Partido.IDPartido, Partido.Nombre
		FROM ((Movimiento_Cereal INNER JOIN Entidad_OrigenDestino ON Movimiento_Cereal.IDEntidad_Titular = Entidad_OrigenDestino.IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = Entidad_OrigenDestino.IDOrigenDestino)
			INNER JOIN Localidad ON Entidad_OrigenDestino.IDLocalidad = Localidad.IDLocalidad)
			INNER JOIN Partido ON Localidad.IDPartido = Partido.IDPartido
		WHERE Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND Movimiento_Cereal.Certificado = 0
			AND Movimiento_Cereal.Humedad IS NOT NULL AND Movimiento_Cereal.Zaranda IS NOT NULL
			AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad_Depositario AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND Movimiento_Cereal.IDCosecha = @IDCosecha AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Movimiento_Cereal.FechaHoraDescarga BETWEEN @FechaDesde AND DATEADD(minute, -1, DATEADD(day, 1, CAST(@FechaHasta AS datetime)))
		ORDER BY Partido.Nombre
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-25
-- Description:	Lista las Cartas de Porte de Entrada pendientes de Certificar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_List
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Entrada_SinCertificar_List
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha smallint,
	@IDCereal tinyint,
	@IDPartido smallint,
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT Movimiento_Cereal.IDMovimiento_Cereal, 0 AS Selected, Movimiento_Cereal.CTGNumero, Movimiento_Cereal.ComprobanteNumeroConFormato AS ComprobanteNumero, Movimiento_Cereal.FechaHoraArribo, Movimiento_Cereal.PesoNeto, Movimiento_Cereal.MermaZarandaKilogramo, Movimiento_Cereal.Humedad, Movimiento_Cereal.MermaHumedadKilogramo, Movimiento_Cereal.MermaVolatilKilogramo, Movimiento_Cereal.PesoFinal
		FROM ((Movimiento_Cereal INNER JOIN Entidad AS Entidad_Transportista ON Movimiento_Cereal.IDEntidad_Transportista = Entidad_Transportista.IDEntidad) INNER JOIN Entidad_OrigenDestino AS Origen ON Movimiento_Cereal.IDEntidad_Titular = Origen.IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = Origen.IDOrigenDestino) INNER JOIN Localidad AS Localidad_Origen ON Origen.IDLocalidad = Localidad_Origen.IDLocalidad
		WHERE Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND Movimiento_Cereal.Certificado = 0
			AND Movimiento_Cereal.Humedad IS NOT NULL AND Movimiento_Cereal.Zaranda IS NOT NULL
			AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad_Depositario AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND Movimiento_Cereal.IDCosecha = @IDCosecha AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Localidad_Origen.IDPartido = @IDPartido
			AND Movimiento_Cereal.FechaHoraDescarga BETWEEN @FechaDesde AND DATEADD(minute, -1, DATEADD(day, 1, CAST(@FechaHasta AS datetime)))
		ORDER BY Movimiento_Cereal.CTGNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-04
-- Updates: 2022-06-03 - Se agregó el campo CTGNumero
-- Description:	Lista las Cartas de Porte de Salida pendientes de RT o B
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Salida_SinAplicar_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Salida_SinAplicar_List
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Salida_SinAplicar_List
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha smallint,
	@IDCereal tinyint,
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT Movimiento_Cereal.IDMovimiento_Cereal, Movimiento_Cereal.ComprobanteNumero, Movimiento_Cereal.CTGNumero, Movimiento_Cereal.FechaCarga, Movimiento_Cereal.PesoNeto, (Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) AS KilogramoPendiente, 0 AS KilogramoAsignar
		FROM Movimiento_Cereal
		WHERE Movimiento_Cereal.Tipo = 'S' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND (Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) > 0
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad_Depositario AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta AND dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND Movimiento_Cereal.IDCosecha = @IDCosecha AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Movimiento_Cereal.FechaHoraDescarga BETWEEN @FechaDesde AND DATEADD(minute, -1, DATEADD(day, 1, CAST(@FechaHasta AS datetime)))

END
GO