USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	2014-01-17
-- Description:	Lista las Provincias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Provincia_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Provincia_List
GO

CREATE PROCEDURE usp_Provincia_List
	@ListaNinguno bit
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT '' AS IDProvincia, 0 AS IDProvinciaASCII, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDProvincia, ASCII(IDProvincia) AS IDProvinciaASCII, Nombre, 2 AS Orden
			FROM Provincia)
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDProvincia, ASCII(IDProvincia) AS IDProvinciaASCII, Nombre
			FROM Provincia
			ORDER BY Nombre
		END
END
GO