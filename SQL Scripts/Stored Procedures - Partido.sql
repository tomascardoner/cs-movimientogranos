USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	2014-01-17
-- Description:	Lista los Partidos
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Partido_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Partido_List
GO

CREATE PROCEDURE usp_Partido_List
	@ListaNinguno bit,
	@IDProvincia char(1)
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDPartido, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDPartido, Nombre, 2 AS Orden
			FROM Partido
			WHERE (@IDProvincia IS NULL OR IDProvincia = @IDProvincia))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDPartido, Nombre
			FROM Partido
			WHERE (@IDProvincia IS NULL OR IDProvincia = @IDProvincia)
			ORDER BY Nombre
		END
END
GO