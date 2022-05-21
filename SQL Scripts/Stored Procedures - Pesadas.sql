USE CSPesaje
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	2022-05-17 14:41
-- Description: Obtiene los datos de humedad y zarandeo para aplicar a las Cartas de Porte
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ObtenerPesadasDeCtg') AND type in (N'P', N'PC'))
	 DROP PROCEDURE ObtenerPesadasDeCtg
GO

CREATE PROCEDURE dbo.ObtenerPesadasDeCtg
	@Ctg bigint AS

BEGIN

	SELECT p.IDPesada, p.KilogramoNeto, pa.Humedad, pa.Zaranda
		FROM Pesada AS p
			LEFT JOIN Pesada_Analisis AS pa ON p.IDPesada = pa.IDPesada
		WHERE p.Ctg = @Ctg
		ORDER BY p.IDPesada

END
GO