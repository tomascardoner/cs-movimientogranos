USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:26:35
-- Updated: 
-- Description: Obtiene los datos de la Localidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Localidad_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Localidad_Get
GO

CREATE PROCEDURE dbo.usp_Localidad_Get
	@IDLocalidad int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Localidad.IDProvincia, Localidad.IDLocalidad, Localidad.IDPartido, Localidad.Nombre
		FROM Localidad
		WHERE Localidad.IDLocalidad = @IDLocalidad 

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:26:35
-- Updated: 
-- Description: Agrega una Localidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Localidad_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Localidad_Add
GO

CREATE PROCEDURE dbo.usp_Localidad_Add
	@IDLocalidad int,
	@Nombre varchar(50),
	@IDPartido smallint,
	@IDProvincia char(1)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			INSERT INTO Localidad
				(IDLocalidad, Nombre, IDPartido, IDProvincia)
				VALUES (@IDLocalidad, @Nombre, @IDPartido, @IDProvincia)
	
		COMMIT TRANSACTION
	END TRY
	
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:26:35
-- Updated: 
-- Description: Actualiza los datos de la Localidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Localidad_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Localidad_Update
GO

CREATE PROCEDURE dbo.usp_Localidad_Update
	@IDLocalidad int,
	@Nombre varchar(50),
	@IDPartido smallint,
	@IDProvincia char(1)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Localidad
					SET Nombre = @Nombre, IDPartido = @IDPartido, IDProvincia = @IDProvincia
					WHERE IDLocalidad = @IDLocalidad 

		COMMIT TRANSACTION
	END TRY
	
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:26:35
-- Updated: 
-- Description: Elimina una Localidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Localidad_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Localidad_Delete
GO

CREATE PROCEDURE dbo.usp_Localidad_Delete 
	@IDLocalidad int AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Localidad
				WHERE IDLocalidad = @IDLocalidad 

		COMMIT TRANSACTION
	END TRY
	
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	2014-01-17
-- Description:	Lista las Localidades
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Localidad_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Localidad_List
GO

CREATE PROCEDURE usp_Localidad_List
	@ListaNinguno bit,
	@IDProvincia char(1),
	@IDPartido smallint,
	@IDLocalidad tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDLocalidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDLocalidad, Nombre, 2 AS Orden
			FROM Localidad
			WHERE (@IDProvincia IS NULL OR IDProvincia = @IDProvincia)
				AND (@IDPartido IS NULL OR IDPartido = @IDPartido))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDLocalidad, Nombre
			FROM Localidad
			WHERE (@IDProvincia IS NULL OR IDProvincia = @IDProvincia)
				AND (@IDPartido IS NULL OR IDPartido = @IDPartido)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	2014-01-17
-- Description:	Lista las Localidades Completas
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Localidad_ListComplete') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Localidad_ListComplete
GO

CREATE PROCEDURE usp_Localidad_ListComplete
	@IDProvincia char(1),
	@IDPartido smallint,
	@IDLocalidad tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT Localidad.IDLocalidad, Localidad.Nombre, Partido.Nombre AS Partido, Provincia.Nombre AS Provincia
		FROM (Localidad LEFT JOIN Partido ON Localidad.IDPartido = Partido.IDPartido) INNER JOIN Provincia ON Localidad.IDProvincia = Provincia.IDProvincia
		WHERE (@IDProvincia IS NULL OR Localidad.IDProvincia = @IDProvincia)
			AND (@IDPartido IS NULL OR ISNULL(Localidad.IDPartido, 0) = @IDPartido)
		ORDER BY Localidad.Nombre

END
GO