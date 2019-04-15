USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 23/09/2015 13:21
-- Updated: 
-- Description: Obtiene los datos de la Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Moneda_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Moneda_Get
GO

CREATE PROCEDURE dbo.usp_Moneda_Get
	@IDMoneda smallint
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Moneda.IDMoneda, Moneda.Nombre, Moneda.Simbolo, Moneda.CodigoAFIP, Moneda.Activo
		FROM Moneda
		WHERE Moneda.IDMoneda = @IDMoneda 

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 23/09/2015 13:21
-- Updated: 
-- Description: Agrega una Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Moneda_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Moneda_Add
GO

CREATE PROCEDURE dbo.usp_Moneda_Add
	@IDMoneda smallint OUTPUT,
	@Nombre varchar(50),
	@Simbolo varchar(10),
	@CodigoAFIP char(3),
	@Activo bit
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDMoneda = (SELECT ISNULL(MAX(Moneda.IDMoneda), 0) + 1 FROM Moneda)
		
			INSERT INTO Moneda
				(IDMoneda, Nombre, Simbolo, CodigoAFIP, Activo)
				VALUES (@IDMoneda, @Nombre, @Simbolo, @CodigoAFIP, @Activo)
	
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
-- Created: 23/09/2015 13:21
-- Updated: 
-- Description: Actualiza los datos de la Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Moneda_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Moneda_Update
GO

CREATE PROCEDURE dbo.usp_Moneda_Update
	@IDMoneda smallint,
	@Nombre varchar(50),
	@Simbolo varchar(10),
	@CodigoAFIP char(3),
	@Activo bit
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Moneda
					SET Nombre = @Nombre, Simbolo = @Simbolo, CodigoAFIP = @CodigoAFIP, Activo = @Activo
					WHERE IDMoneda = @IDMoneda

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
-- Created: 23/09/2015 13:21
-- Updated: 
-- Description: Elimina un Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Moneda_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Moneda_Delete
GO

CREATE PROCEDURE dbo.usp_Moneda_Delete 
	@IDMoneda smallint
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Moneda
				WHERE IDMoneda = @IDMoneda 

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
-- Create date: 2016-05-17
-- Description:	Lista las Monedas
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Moneda_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Moneda_List
GO

CREATE PROCEDURE usp_Moneda_List
	@ListaNinguno bit,
	@Activo bit,
	@IDMoneda int
AS
BEGIN
	SET NOCOUNT ON;

	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDMoneda, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDMoneda, Nombre, 2 AS Orden
			FROM Moneda
			WHERE @Activo IS NULL OR Activo = @Activo OR IDMoneda = @IDMoneda)
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDMoneda, Nombre, 2 AS Orden
			FROM Moneda
			WHERE @Activo IS NULL OR Activo = @Activo OR IDMoneda = @IDMoneda
			ORDER BY Nombre
		END
END
GO
