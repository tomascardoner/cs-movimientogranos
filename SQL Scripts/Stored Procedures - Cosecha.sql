USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 24/03/2024 20:14
-- Updated: 
-- Description: Obtiene una Cosecha por el código Oncca
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_GetPorCodigoOncca') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_GetPorCodigoOncca
GO

CREATE PROCEDURE dbo.usp_Cosecha_GetPorCodigoOncca
	@CodigoOncca char(5)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDCosecha, Nombre, FechaInicio, FechaFin, ONCCA_Codigo, Activo
		FROM Cosecha
		WHERE ONCCA_Codigo = @CodigoOncca
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-10
-- Description:	Lista las Cosechas
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Cosecha_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Cosecha_List
GO

CREATE PROCEDURE usp_Cosecha_List
	@ListaNinguno bit,
	@Activo bit,
	@IDCosecha tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDCosecha, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDCosecha, Nombre, 2 AS Orden
			FROM Cosecha
			WHERE (@Activo IS NULL OR Activo = @Activo OR IDCosecha = @IDCosecha))
		ORDER BY Orden, Nombre DESC
		END
	ELSE
		BEGIN
		SELECT IDCosecha, Nombre
			FROM Cosecha
			WHERE (@Activo IS NULL OR Activo = @Activo OR IDCosecha = @IDCosecha)
			ORDER BY Nombre DESC
		END
END
GO
