USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 11/01/2022 11:15
-- Updated: 
-- Description: Obtiene un Cereal por nombre
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cereal_GetPorNombre') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cereal_GetPorNombre
GO

CREATE PROCEDURE dbo.usp_Cereal_GetPorNombre
	@Nombre varchar(50)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDCereal, Nombre, Tipo, MermaVolatil, MermaHumedadBase, MermaHumedadManipuleo, ONCCA_EspecieCodigo, ONCCA_EspecieNombre, ONCCA_GranoTipoCodigo, ONCCA_GranoTipoNombre, RealizaAnalisisIPRO, Activo
		FROM Cereal
		WHERE Nombre = @Nombre
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	2013-11-17
-- Description:	Lista los Cereales
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Cereal_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Cereal_List
GO

CREATE PROCEDURE usp_Cereal_List
	@ListaNinguno bit,
	@MostrarEspecieCodigo bit,
	@Activo bit,
	@IDCereal tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDCereal, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDCereal, Nombre + (CASE @MostrarEspecieCodigo WHEN 1 THEN ' (' + CAST(ONCCA_EspecieCodigo AS varchar) + ')' ELSE '' END) AS Nombre, 2 AS Orden
			FROM Cereal
			WHERE (@Activo IS NULL OR Activo = @Activo OR IDCereal = @IDCereal))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDCereal, Nombre + (CASE @MostrarEspecieCodigo WHEN 1 THEN ' (' + CAST(ONCCA_EspecieCodigo AS varchar) + ')' ELSE '' END) AS Nombre
			FROM Cereal
			WHERE (@Activo IS NULL OR Activo = @Activo OR IDCereal = @IDCereal)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2014-01-23
-- Updated: 2024-08-05 - se corrigió un error ya que restaba lo liquidado del stock físico
-- Description:	Muestra los saldos de Cereal
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Cereal_Saldo') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Cereal_Saldo
GO

CREATE PROCEDURE usp_Cereal_Saldo
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@FechaDesde smalldatetime,
	@FechaHasta smalldatetime
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @EntradaBruto int
	DECLARE @EntradaNeto int
	DECLARE @Salida int
	DECLARE @StockActual int
	DECLARE @Certificado int
	DECLARE @Retirado int
	DECLARE @Liquidado int
	DECLARE @Existencia int
	
	--ENTRADAS O AJUSTES (SUBE)
	SELECT @EntradaBruto = SUM(PesoNeto), @EntradaNeto = SUM(PesoFinal)
		FROM Movimiento_Cereal
		WHERE (@IDEntidad_Depositario IS NULL OR (IDEntidad_Destino = @IDEntidad_Depositario AND IDOrigenDestino_Destino = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND (Tipo = 'E' OR Tipo = 'U')
			AND IDCartaPorte_MotivoAnulacion IS NULL
			AND (@FechaDesde IS NULL OR FechaHoraDescarga >= @FechaDesde)
			AND (@FechaHasta IS NULL OR FechaHoraDescarga <= @FechaHasta)

	--SALIDAS O AJUSTES (BAJA)
	SELECT @Salida = SUM(PesoNeto)
		FROM Movimiento_Cereal
		WHERE (@IDEntidad_Depositario IS NULL OR (IDEntidad_Titular = @IDEntidad_Depositario AND IDOrigenDestino_Origen = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND (Tipo = 'S' OR Tipo = 'B')
			AND IDCartaPorte_MotivoAnulacion IS NULL
			AND (@FechaDesde IS NULL OR FechaCarga >= @FechaDesde)
			AND (@FechaHasta IS NULL OR FechaCarga <= @FechaHasta)
	
	--LIQUIDADO
	SELECT @Liquidado = SUM(OperacionCantidad)
		FROM Formulario1116B_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--STOCK ACTUAL
	SET @StockActual = ISNULL(@EntradaNeto, 0) - ISNULL(@Salida, 0)
			
	--CERTIFICADOS
	SELECT @Certificado = SUM(PesoNeto)
		FROM Formulario1116A_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--RETIRADOS
	SELECT @Retirado = SUM(TotalKilogramo)
		FROM Formulario1116RT_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND RetiroOTransferencia = 'R'
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--EXISTENCIA
	SET @Existencia = ISNULL(@Certificado, 0) - ISNULL(@Retirado, 0) - ISNULL(@Liquidado, 0)
	
	--DEVUELVO LOS RESULTADOS
	SELECT ISNULL(@EntradaBruto, 0) AS EntradaBruto, ISNULL(@EntradaNeto, 0) AS EntradaNeto, ISNULL(@Salida, 0) AS Salida, @StockActual AS StockActual, ISNULL(@Certificado, 0) AS Certificado, ISNULL(@Retirado, 0) AS Retirado, ISNULL(@Liquidado, 0) AS Liquidado, @Existencia AS Existencia
END
GO