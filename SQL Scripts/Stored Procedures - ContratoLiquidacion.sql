USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 30/08/2015 21:27
-- Updated: 
-- Description: Obtiene los datos de las Liquidaciones del Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_ContratoLiquidacion_List') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_ContratoLiquidacion_List
GO

CREATE PROCEDURE dbo.usp_ContratoLiquidacion_List
	@IDContrato int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDContrato, IDLiquidacion, Numero, Fecha, Kilogramo, Precio, ImporteNeto, Notas
		FROM ContratoLiquidacion
		WHERE IDContrato = @IDContrato
		ORDER BY Numero

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 30/08/2015 20:55
-- Updated: 
-- Description: Obtiene los datos de la Liquidación de un Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_ContratoLiquidacion_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_ContratoLiquidacion_Get
GO

CREATE PROCEDURE dbo.usp_ContratoLiquidacion_Get
	@IDContratoLiquidacion int,
	@IDLiquidacion tinyint
AS

BEGIN
	SET NOCOUNT ON;

	SELECT ContratoLiquidacion.IDContrato, ContratoLiquidacion.IDLiquidacion, ContratoLiquidacion.Numero, ContratoLiquidacion.Fecha, ContratoLiquidacion.Kilogramo, ContratoLiquidacion.Precio, ContratoLiquidacion.ImporteNeto, ContratoLiquidacion.Notas
		FROM ContratoLiquidacion
		WHERE ContratoLiquidacion.IDContrato = @IDContratoLiquidacion AND ContratoLiquidacion.IDLiquidacion = @IDLiquidacion

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 30/08/2015 20:55
-- Updated: 
-- Description: Agrega una Liquidación a un Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_ContratoLiquidacion_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_ContratoLiquidacion_Add
GO

CREATE PROCEDURE dbo.usp_ContratoLiquidacion_Add
	@IDContrato int,
	@IDLiquidacion tinyint OUTPUT,
	@Numero varchar(20),
	@Fecha date,
	@Kilogramo int,
	@Precio money,
	@Notas varchar(8000)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDLiquidacion = (SELECT ISNULL(MAX(ContratoLiquidacion.IDLiquidacion), 0) + 1 FROM ContratoLiquidacion WHERE IDContrato = @IDContrato)
		
			INSERT INTO ContratoLiquidacion
				(IDContrato, IDLiquidacion, Numero, Fecha, Kilogramo, Precio, Notas)
				VALUES (@IDContrato, @IDLiquidacion, @Numero, @Fecha, @Kilogramo, @Precio, @Notas)
	
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
-- Created: 30/08/2015 20:55
-- Updated: 
-- Description: Actualiza los datos de la Liquidación del Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_ContratoLiquidacion_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_ContratoLiquidacion_Update
GO

CREATE PROCEDURE dbo.usp_ContratoLiquidacion_Update
	@IDContrato int,
	@IDLiquidacion Tinyint,
	@Numero varchar(20),
	@Fecha date,
	@Kilogramo int,
	@Precio money,
	@Notas varchar(8000)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE ContratoLiquidacion
					SET Numero = @Numero, Fecha = @Fecha, Kilogramo = @Kilogramo, Precio = @Precio, Notas = @Notas
					WHERE IDContrato = @IDContrato AND IDLiquidacion = @IDLiquidacion

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
-- Created: 30/08/2015 20:55
-- Updated: 
-- Description: Elimina una Liquidación de un Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_ContratoLiquidacion_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_ContratoLiquidacion_Delete
GO

CREATE PROCEDURE dbo.usp_ContratoLiquidacion_Delete 
	@IDContrato int,
	@IDLiquidacion tinyint
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM ContratoLiquidacion
				WHERE IDContrato = @IDContrato AND IDLiquidacion = @IDLiquidacion

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