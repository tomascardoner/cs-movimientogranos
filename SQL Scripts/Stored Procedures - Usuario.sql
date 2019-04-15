USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	26/01/2014 14:31:21
-- Updated:	
-- Description: Obtiene los datos del Usuario
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Usuario_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Usuario_Get
GO

CREATE PROCEDURE dbo.usp_Usuario_Get
	@IDUsuario tinyint 
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Usuario.IDUsuario, Usuario.Nombre, Usuario.Password, Usuario.IDUsuarioGrupo, Usuario.Activo
		FROM Usuario
		WHERE Usuario.IDUsuario = @IDUsuario 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	26/01/2014 14:31:21
-- Updated:	
-- Description: Obtiene los datos del Usuario a partir del Nombre
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Usuario_GetByNombre') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Usuario_GetByNombre
GO

CREATE PROCEDURE dbo.usp_Usuario_GetByNombre
	@Nombre varchar(50)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Usuario.IDUsuario, Usuario.Nombre, Usuario.Password, Usuario.IDUsuarioGrupo, Usuario.Activo
		FROM Usuario
		WHERE Usuario.Nombre = @Nombre

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	26/01/2014 14:31:21
-- Updated:	
-- Description: Agrega un Usuario
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Usuario_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Usuario_Add
GO

CREATE PROCEDURE dbo.usp_Usuario_Add
	@IDUsuario tinyint OUTPUT, 
	@Nombre varchar(50), 
	@Password varchar(50), 
	@IDUsuarioGrupo tinyint, 
	@Activo bit 
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDUsuario = (SELECT ISNULL(MAX(Usuario.IDUsuario), 0) + 1 FROM Usuario)
		
			INSERT INTO Usuario
				(IDUsuario, Nombre, Password, IDUsuarioGrupo, Activo )
				VALUES (@IDUsuario, @Nombre, @Password, @IDUsuarioGrupo, @Activo )
	
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
-- Created:	26/01/2014 14:31:21
-- Updated:	
-- Description: Actualiza los datos del Usuario
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Usuario_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Usuario_Update
GO

CREATE PROCEDURE dbo.usp_Usuario_Update
	@IDUsuario tinyint, 
	@Nombre varchar(50), 
	@Password varchar(50), 
	@IDUsuarioGrupo tinyint, 
	@Activo bit 
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Usuario
					SET Nombre = @Nombre, Password = @Password, IDUsuarioGrupo = @IDUsuarioGrupo, Activo = @Activo
					WHERE IDUsuario = @IDUsuario 

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
-- Created:	26/01/2014 14:31:21
-- Updated:	
-- Description: Elimina un Usuario
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Usuario_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Usuario_Delete
GO

CREATE PROCEDURE dbo.usp_Usuario_Delete 
	@IDUsuario tinyint AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Usuario
				WHERE IDUsuario = @IDUsuario 

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