USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 24/06/2014 22:35:40
-- Updated: 
-- Description: Obtiene los datos de la Tarifa de Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_Tarifa_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_Tarifa_Get
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_Tarifa_Get
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDCosecha, IDCereal, Indice, IDEntidad, IDOrigenDestino_Origen, IDOrigenDestino_Destino, Nombre, FechaDesde, FechaHasta, TarifaParitariaImporte, TarifaSecadoTipo, TarifaSecadoInicialPunto, TarifaSecadoInicialImporte, TarifaSecadoPuntoExcesoImporte, TarifaSecadoHumedadBase, TarifaSecadoHumedadMargenLibre, TarifaSecadoHumedadRedondeoPuntoTipo, TarifaZarandeoImporte, TarifaFumigadoImporte, TarifaMezclaImporte, AlmacenajeTipo, AlmacenajeDiaGracia, AlmacenajeInicio, AlmacenajePorcentajeMensual
		FROM Cosecha_Cereal_Tarifa
		WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND Indice = @Indice

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 24/06/2014 22:35:40
-- Updated: 
-- Description: Agrega una Tarifa de Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_Tarifa_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_Tarifa_Add
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_Tarifa_Add
	@IDCosecha tinyint, 
	@IDCereal tinyint, 
	@Indice smallint OUTPUT,
	@IDEntidad integer,
	@IDOrigenDestino_Origen smallint,
	@IDOrigenDestino_Destino smallint,
	@Nombre varchar(50),
	@FechaDesde date,
	@FechaHasta date,
	@TarifaParitariaImporte money,
	@TarifaSecadoTipo char(1),
	@TarifaSecadoInicialPunto decimal(5),
	@TarifaSecadoInicialImporte money,
	@TarifaSecadoPuntoExcesoImporte money,
	@TarifaSecadoHumedadBase decimal(5),
	@TarifaSecadoHumedadMargenLibre decimal(5),
	@TarifaSecadoHumedadRedondeoPuntoTipo char(1),
	@TarifaZarandeoImporte money,
	@TarifaFumigadoImporte money,
	@TarifaMezclaImporte money,
	@AlmacenajeTipo char(1),
	@AlmacenajeDiaGracia smallint,
	@AlmacenajeInicio date,
	@AlmacenajePorcentajeMensual decimal(5)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @Indice = (SELECT ISNULL(MAX(Cosecha_Cereal_Tarifa.Indice), 0) + 1 FROM Cosecha_Cereal_Tarifa WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal)
		
			INSERT INTO Cosecha_Cereal_Tarifa
				(IDCosecha, IDCereal, Indice, IDEntidad, IDOrigenDestino_Origen, IDOrigenDestino_Destino, Nombre, FechaDesde, FechaHasta, TarifaParitariaImporte, TarifaSecadoTipo, TarifaSecadoInicialPunto, TarifaSecadoInicialImporte, TarifaSecadoPuntoExcesoImporte, TarifaSecadoHumedadBase, TarifaSecadoHumedadMargenLibre, TarifaSecadoHumedadRedondeoPuntoTipo, TarifaZarandeoImporte, TarifaFumigadoImporte, TarifaMezclaImporte, AlmacenajeTipo, AlmacenajeDiaGracia, AlmacenajeInicio, AlmacenajePorcentajeMensual )
				VALUES (@IDCosecha, @IDCereal, @Indice, @IDEntidad, @IDOrigenDestino_Origen, @IDOrigenDestino_Destino, @Nombre, @FechaDesde, @FechaHasta, @TarifaParitariaImporte, @TarifaSecadoTipo, @TarifaSecadoInicialPunto, @TarifaSecadoInicialImporte, @TarifaSecadoPuntoExcesoImporte, @TarifaSecadoHumedadBase, @TarifaSecadoHumedadMargenLibre, @TarifaSecadoHumedadRedondeoPuntoTipo, @TarifaZarandeoImporte, @TarifaFumigadoImporte, @TarifaMezclaImporte, @AlmacenajeTipo, @AlmacenajeDiaGracia, @AlmacenajeInicio, @AlmacenajePorcentajeMensual )
	
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
-- Created: 24/06/2014 22:35:40
-- Updated: 
-- Description: Actualiza los datos de la Tarifa de Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_Tarifa_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_Tarifa_Update
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_Tarifa_Update
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint,
	@IDEntidad integer,
	@IDOrigenDestino_Origen smallint,
	@IDOrigenDestino_Destino smallint,
	@Nombre varchar(50),
	@FechaDesde date,
	@FechaHasta date,
	@TarifaParitariaImporte money,
	@TarifaSecadoTipo char(1),
	@TarifaSecadoInicialPunto decimal(5),
	@TarifaSecadoInicialImporte money,
	@TarifaSecadoPuntoExcesoImporte money,
	@TarifaSecadoHumedadBase decimal(5),
	@TarifaSecadoHumedadMargenLibre decimal(5),
	@TarifaSecadoHumedadRedondeoPuntoTipo char(1),
	@TarifaZarandeoImporte money,
	@TarifaFumigadoImporte money,
	@TarifaMezclaImporte money,
	@AlmacenajeTipo char(1),
	@AlmacenajeDiaGracia smallint,
	@AlmacenajeInicio date,
	@AlmacenajePorcentajeMensual decimal(5)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Cosecha_Cereal_Tarifa
					SET IDEntidad = @IDEntidad, @IDOrigenDestino_Origen = @IDOrigenDestino_Origen, @IDOrigenDestino_Destino = @IDOrigenDestino_Destino, Nombre = @Nombre, FechaDesde = @FechaDesde, FechaHasta = @FechaHasta, TarifaParitariaImporte = @TarifaParitariaImporte, TarifaSecadoTipo = @TarifaSecadoTipo, TarifaSecadoInicialPunto = @TarifaSecadoInicialPunto, TarifaSecadoInicialImporte = @TarifaSecadoInicialImporte, TarifaSecadoPuntoExcesoImporte = @TarifaSecadoPuntoExcesoImporte, TarifaSecadoHumedadBase = @TarifaSecadoHumedadBase, TarifaSecadoHumedadMargenLibre = @TarifaSecadoHumedadMargenLibre, TarifaSecadoHumedadRedondeoPuntoTipo = @TarifaSecadoHumedadRedondeoPuntoTipo, TarifaZarandeoImporte = @TarifaZarandeoImporte, TarifaFumigadoImporte = @TarifaFumigadoImporte, TarifaMezclaImporte = @TarifaMezclaImporte, AlmacenajeTipo = @AlmacenajeTipo, AlmacenajeDiaGracia = @AlmacenajeDiaGracia, AlmacenajeInicio = @AlmacenajeInicio, AlmacenajePorcentajeMensual = @AlmacenajePorcentajeMensual
					WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND Indice = @Indice

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
-- Created: 24/06/2014 22:35:40
-- Updated: 
-- Description: Elimina una Tarifa de Cereal
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_Tarifa_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_Tarifa_Delete
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_Tarifa_Delete 
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Cosecha_Cereal_Tarifa
				WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND Indice = @Indice

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
-- Created: 22/07/2014 20:32:35
-- Updated: 
-- Description: Obtiene los datos de la Escala de la Tarifa
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_TarifaEscala_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_TarifaEscala_Get
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_TarifaEscala_Get
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint,
	@HumedadExcesoInicio decimal(3,1)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDCosecha, IDCereal, Indice, HumedadExcesoInicio, Tipo, Tarifa
		FROM Cosecha_Cereal_TarifaEscala
		WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND Indice = @Indice AND HumedadExcesoInicio = @HumedadExcesoInicio

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 22/07/2014 22:47
-- Updated: 
-- Description: Obtiene los datos de la Escala de la Tarifa a partir de la Humedad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_TarifaEscala_GetByHumedad') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_TarifaEscala_GetByHumedad
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_TarifaEscala_GetByHumedad
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint,
	@HumedadExceso decimal(3,1)
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDCosecha, IDCereal, Indice, HumedadExcesoInicio, Tipo, Tarifa
		FROM Cosecha_Cereal_TarifaEscala
		WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND Indice = @Indice AND HumedadExcesoInicio <= @HumedadExceso
		ORDER BY HumedadExcesoInicio DESC

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 22/07/2014 20:32:35
-- Updated: 
-- Description: Agrega una Escala de la Tarifa
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_TarifaEscala_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_TarifaEscala_Add
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_TarifaEscala_Add
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint,
	@HumedadExcesoInicio decimal(3,1),
	@Tipo char(1),
	@Tarifa money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			INSERT INTO Cosecha_Cereal_TarifaEscala
				(IDCosecha, IDCereal, Indice, HumedadExcesoInicio, Tipo, Tarifa)
				VALUES (@IDCosecha, @IDCereal, @Indice, @HumedadExcesoInicio, @Tipo, @Tarifa)
	
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
-- Created: 22/07/2014 20:32:35
-- Updated: 
-- Description: Actualiza los datos de la Escala de la Tarifa
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_TarifaEscala_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_TarifaEscala_Update
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_TarifaEscala_Update
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint,
	@HumedadExcesoInicio decimal(3,1),
	@Tipo char(1),
	@Tarifa money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Cosecha_Cereal_TarifaEscala
					SET Tipo = @Tipo, Tarifa = @Tarifa
					WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND Indice = @Indice AND HumedadExcesoInicio = @HumedadExcesoInicio

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
-- Created: 22/07/2014 20:32:35
-- Updated: 
-- Description: Elimina una Escala de la Tarifa
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_TarifaEscala_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_TarifaEscala_Delete
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_TarifaEscala_Delete 
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@Indice smallint,
	@HumedadExcesoInicio decimal(3,1)
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Cosecha_Cereal_TarifaEscala
				WHERE IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND Indice = @Indice AND HumedadExcesoInicio = @HumedadExcesoInicio

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
-- Author:	Tomás A. Cardoner
-- Created: 25/06/2014 00:07
-- Updated: 23/07/2014 23:44
-- Description: Devuelve la Tarifa a utilizar
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Cosecha_Cereal_Tarifa__ObtenerIndice') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Cosecha_Cereal_Tarifa__ObtenerIndice
GO

CREATE PROCEDURE dbo.usp_Cosecha_Cereal_Tarifa__ObtenerIndice
	@IDMovimiento_Cereal integer,
	@Indice smallint OUTPUT
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @IDCosecha tinyint
	DECLARE @IDCereal tinyint
	DECLARE @IDEntidad integer
	DECLARE @IDOrigenDestino_Origen smallint
	DECLARE @IDOrigenDestino_Destino smallint
	DECLARE @FechaDescarga date
	DECLARE @Calculo_TarifaIndice smallint

	--GUARDO LOS DATOS EN LAS VARIABLES QUE NECESITO
	SELECT @IDCosecha = IDCosecha, @IDCereal = IDCereal, @IDEntidad = dbo.udf_GetRemitenteCereal(IDEntidad_Titular, IDEntidad_Intermediario, IDEntidad_RemitenteComercial), @IDOrigenDestino_Origen = IDOrigenDestino_Origen, @IDOrigenDestino_Destino = IDOrigenDestino_Destino, @FechaDescarga = FechaHoraDescarga, @Calculo_TarifaIndice = Calculo_TarifaIndice
		FROM Movimiento_Cereal
		WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal

	IF @Calculo_TarifaIndice IS NULL
		SELECT TOP 1 @Indice = Indice
			FROM Cosecha_Cereal_Tarifa
			WHERE IDCosecha = @IDCosecha
				AND IDCereal = @IDCereal
				AND (IDEntidad = @IDEntidad OR IDEntidad IS NULL)
				AND (IDOrigenDestino_Origen = @IDOrigenDestino_Origen OR IDOrigenDestino_Origen IS NULL)
				AND (IDOrigenDestino_Destino = @IDOrigenDestino_Destino OR IDOrigenDestino_Destino IS NULL)
				AND (FechaDesde <= @FechaDescarga OR FechaDesde IS NULL)
				AND (DATEADD(minute, -1, DATEADD(day, 1, CAST(FechaHasta AS datetime))) >= @FechaDescarga OR FechaHasta IS NULL)
			ORDER BY IDEntidad DESC, IDOrigenDestino_Origen DESC, IDOrigenDestino_Destino DESC, Indice
	ELSE
		SET @Indice = @Calculo_TarifaIndice
END
GO