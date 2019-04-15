USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 22/09/2015 20:02
-- Updated: 
-- Description: Obtiene los datos de la Pizarra del Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cereal_Pizarra_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cereal_Pizarra_Get
GO

CREATE PROCEDURE dbo.usp_Cereal_Pizarra_Get
	@Fecha date,
	@IDCereal tinyint,
	@IDLocalidad int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Cereal_Pizarra.Fecha, Cereal_Pizarra.IDCereal, Cereal_Pizarra.IDLocalidad, Cereal_Pizarra.Precio
		FROM Cereal_Pizarra
		WHERE Cereal_Pizarra.Fecha = @Fecha AND Cereal_Pizarra.IDCereal = @IDCereal AND Cereal_Pizarra.IDLocalidad = @IDLocalidad

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 22/09/2015 20:02
-- Updated: 
-- Description: Agrega una Pizarra del Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cereal_Pizarra_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cereal_Pizarra_Add
GO

CREATE PROCEDURE dbo.usp_Cereal_Pizarra_Add
	@Fecha date,
	@IDCereal tinyint,
	@IDLocalidad int,
	@Precio money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION
		
			INSERT INTO Cereal_Pizarra
				(Fecha, IDCereal, IDLocalidad, Precio)
				VALUES (@Fecha, @IDCereal, @IDLocalidad, @Precio)
	
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
-- Created: 22/09/2015 20:02
-- Updated: 
-- Description: Actualiza los datos de la Pizarra del Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cereal_Pizarra_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cereal_Pizarra_Update
GO

CREATE PROCEDURE dbo.usp_Cereal_Pizarra_Update
	@Fecha date,
	@IDCereal tinyint,
	@IDLocalidad int,
	@Precio money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Cereal_Pizarra
					SET Fecha = @Fecha, IDCereal = @IDCereal, IDLocalidad = @IDLocalidad, Precio = @Precio
					WHERE Cereal_Pizarra.Fecha = @Fecha AND Cereal_Pizarra.IDCereal = @IDCereal AND Cereal_Pizarra.IDLocalidad = @IDLocalidad

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
-- Created: 22/09/2015 20:02
-- Updated: 
-- Description: Elimina una Pizarra del Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cereal_Pizarra_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cereal_Pizarra_Delete
GO

CREATE PROCEDURE dbo.usp_Cereal_Pizarra_Delete 
	@Fecha date,
	@IDCereal tinyint,
	@IDLocalidad int
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Cereal_Pizarra
				WHERE Cereal_Pizarra.Fecha = @Fecha AND Cereal_Pizarra.IDCereal = @IDCereal AND Cereal_Pizarra.IDLocalidad = @IDLocalidad

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
