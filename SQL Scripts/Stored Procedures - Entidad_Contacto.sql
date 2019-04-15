USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 20/08/2014 21:15:09
-- Updated: 
-- Description: Obtiene los datos de los Contacto de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Contacto_List') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Contacto_List
GO

CREATE PROCEDURE dbo.usp_Entidad_Contacto_List
	@IDEntidad int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDEntidad, IDContacto, Cargo, Nombre, Telefono1Nombre, Telefono1Numero, Telefono2Nombre, Telefono2Numero, Email1, Email2, Notas
		FROM Entidad_Contacto
		WHERE IDEntidad = @IDEntidad
		ORDER BY Cargo, Nombre

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 20/08/2014 21:15:09
-- Updated: 
-- Description: Obtiene los datos del Contacto de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Contacto_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Contacto_Get
GO

CREATE PROCEDURE dbo.usp_Entidad_Contacto_Get
	@IDEntidad int,
	@IDContacto tinyint
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDEntidad, IDContacto, Cargo, Nombre, Telefono1Nombre, Telefono1Numero, Telefono2Nombre, Telefono2Numero, Email1, Email2, Notas
		FROM Entidad_Contacto
		WHERE IDEntidad = @IDEntidad AND IDContacto = @IDContacto

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 20/08/2014 21:15:09
-- Updated: 
-- Description: Agrega un Contacto a la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Contacto_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Contacto_Add
GO

CREATE PROCEDURE dbo.usp_Entidad_Contacto_Add
	@IDEntidad int, 
	@IDContacto tinyint OUTPUT, 
	@Cargo varchar(20),
	@Nombre varchar(50),
	@Telefono1Nombre varchar(20),
	@Telefono1Numero varchar(20),
	@Telefono2Nombre varchar(20),
	@Telefono2Numero varchar(20),
	@Email1 varchar(30),
	@Email2 varchar(30),
	@Notas varchar(8000)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDContacto = (SELECT ISNULL(MAX(IDContacto), 0) + 1 FROM Entidad_Contacto WHERE IDEntidad = @IDEntidad)
		
			INSERT INTO Entidad_Contacto
				(IDEntidad, IDContacto, Cargo, Nombre, Telefono1Nombre, Telefono1Numero, Telefono2Nombre, Telefono2Numero, Email1, Email2, Notas)
				VALUES (@IDEntidad, @IDContacto, @Cargo, @Nombre, @Telefono1Nombre, @Telefono1Numero, @Telefono2Nombre, @Telefono2Numero, @Email1, @Email2, @Notas)
	
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
-- Created: 20/08/2014 21:15:09
-- Updated: 
-- Description: Actualiza los datos del Contacto de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Contacto_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Contacto_Update
GO

CREATE PROCEDURE dbo.usp_Entidad_Contacto_Update
	@IDEntidad int,
	@IDContacto tinyint,
	@Cargo varchar(20),
	@Nombre varchar(50),
	@Telefono1Nombre varchar(20),
	@Telefono1Numero varchar(20),
	@Telefono2Nombre varchar(20),
	@Telefono2Numero varchar(20),
	@Email1 varchar(30),
	@Email2 varchar(30),
	@Notas varchar(8000)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Entidad_Contacto
					SET Cargo = @Cargo, Nombre = @Nombre, Telefono1Nombre = @Telefono1Nombre, Telefono1Numero = @Telefono1Numero, Telefono2Nombre = @Telefono2Nombre, Telefono2Numero = @Telefono2Numero, Email1 = @Email1, Email2 = @Email2, Notas = @Notas
					WHERE IDEntidad = @IDEntidad AND IDContacto = @IDContacto

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
-- Created: 20/08/2014 21:15:09
-- Updated: 
-- Description: Elimina un Contacto de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Contacto_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Contacto_Delete
GO

CREATE PROCEDURE dbo.usp_Entidad_Contacto_Delete 
	@IDEntidad int,
	@IDContacto tinyint
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Entidad_Contacto
				WHERE IDEntidad = @IDEntidad AND IDContacto = @IDContacto 

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