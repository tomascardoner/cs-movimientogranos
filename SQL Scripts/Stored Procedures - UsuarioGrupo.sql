USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	26/01/2014 14:29:36
-- Updated:	
-- Description: Obtiene los datos del Grupo de Usuarios
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_UsuarioGrupo_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_UsuarioGrupo_Get
GO

CREATE PROCEDURE dbo.usp_UsuarioGrupo_Get
	@IDUsuarioGrupo tinyint 
AS

BEGIN
	SET NOCOUNT ON;

	SELECT UsuarioGrupo.IDUsuarioGrupo, UsuarioGrupo.Nombre, UsuarioGrupo.Activo
		FROM UsuarioGrupo
		WHERE UsuarioGrupo.IDUsuarioGrupo = @IDUsuarioGrupo 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	26/01/2014 14:29:36
-- Updated:	
-- Description: Agrega un Grupo de Usuarios
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_UsuarioGrupo_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_UsuarioGrupo_Add
GO

CREATE PROCEDURE dbo.usp_UsuarioGrupo_Add
	@IDUsuarioGrupo tinyint OUTPUT, 
	@Nombre varchar(50), 
	@Activo bit 
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDUsuarioGrupo = (SELECT ISNULL(MAX(UsuarioGrupo.IDUsuarioGrupo), 0) + 1 FROM UsuarioGrupo)
		
			INSERT INTO UsuarioGrupo
				(IDUsuarioGrupo, Nombre, Activo )
				VALUES (@IDUsuarioGrupo, @Nombre, @Activo )
	
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
-- Created:	26/01/2014 14:29:36
-- Updated:	
-- Description: Actualiza los datos del Grupo de Usuarios
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_UsuarioGrupo_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_UsuarioGrupo_Update
GO

CREATE PROCEDURE dbo.usp_UsuarioGrupo_Update
	@IDUsuarioGrupo tinyint, 
	@Nombre varchar(50), 
	@Activo bit 
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE UsuarioGrupo
					SET Nombre = @Nombre, Activo = @Activo
					WHERE IDUsuarioGrupo = @IDUsuarioGrupo 

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
-- Created:	26/01/2014 14:29:36
-- Updated:	
-- Description: Elimina un Grupo de Usuarios
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_UsuarioGrupo_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_UsuarioGrupo_Delete
GO

CREATE PROCEDURE dbo.usp_UsuarioGrupo_Delete 
	@IDUsuarioGrupo tinyint AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM UsuarioGrupo
				WHERE IDUsuarioGrupo = @IDUsuarioGrupo 

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