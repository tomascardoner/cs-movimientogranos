USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 23/09/2015 14:00:40
-- Updated: 
-- Description: Obtiene los datos de la Cotización de la Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_MonedaCotizacion_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_MonedaCotizacion_Get
GO

CREATE PROCEDURE dbo.usp_MonedaCotizacion_Get
	@IDMoneda smallint,
	@Fecha date
AS

BEGIN
	SET NOCOUNT ON;

	SELECT MonedaCotizacion.Fecha, MonedaCotizacion.CotizacionCompra, MonedaCotizacion.CotizacionVenta, MonedaCotizacion.IDMoneda
		FROM MonedaCotizacion
		WHERE MonedaCotizacion.IDMoneda = @IDMoneda AND MonedaCotizacion.Fecha = @Fecha

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 23/09/2015 14:00:40
-- Updated: 
-- Description: Agrega una Cotización de Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_MonedaCotizacion_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_MonedaCotizacion_Add
GO

CREATE PROCEDURE dbo.usp_MonedaCotizacion_Add
	@IDMoneda smallint,
	@Fecha date,
	@CotizacionCompra money,
	@CotizacionVenta money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			INSERT INTO MonedaCotizacion
				(IDMoneda, Fecha, CotizacionCompra, CotizacionVenta)
				VALUES (@IDMoneda, @Fecha, @CotizacionCompra, @CotizacionVenta)
	
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
-- Created: 23/09/2015 14:00:40
-- Updated: 
-- Description: Actualiza los datos de la Cotización de la Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_MonedaCotizacion_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_MonedaCotizacion_Update
GO

CREATE PROCEDURE dbo.usp_MonedaCotizacion_Update
	@IDMoneda smallint,
	@Fecha date,
	@CotizacionCompra money,
	@CotizacionVenta money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE MonedaCotizacion
					SET CotizacionCompra = @CotizacionCompra, CotizacionVenta = @CotizacionVenta
					WHERE IDMoneda = @IDMoneda AND Fecha = @Fecha

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
-- Created: 23/09/2015 14:00:40
-- Updated: 
-- Description: Elimina una Cotización de Moneda
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_MonedaCotizacion_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_MonedaCotizacion_Delete
GO

CREATE PROCEDURE dbo.usp_MonedaCotizacion_Delete
	@IDMoneda smallint,
	@Fecha date
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM MonedaCotizacion
				WHERE IDMoneda = @IDMoneda AND Fecha = @Fecha

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