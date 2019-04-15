USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-16
-- Description:	Obtiene los datos de un Formulario 1116RT
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_Get') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_Get
GO

CREATE PROCEDURE usp_Formulario1116RT_Get
	@IDFormulario1116RT int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT IDFormulario1116RT, IDFormulario1116_Talonario, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, Origen_FormularioTipo, Origen_FormularioNumero, Origen_FormularioFecha, Origen_IDFormulario1116A, Origen_IDFormulario1116RT, IDCosecha, IDCereal, Origen_IDPartido, RetiroOTransferencia, TotalKilogramo, GeneraNuevoF1116A, ReceptorIDEntidad, ReceptorRazonSocial, ReceptorDomicilioTipo, ReceptorDomicilioCalle, ReceptorDomicilioNumero, ReceptorDomicilioPiso, ReceptorDomicilioOficina, ReceptorDomicilioCodigoPostal, ReceptorDomicilioIDLocalidad, ReceptorCUIT, ReceptorIDCategoriaIVA, ReceptorIIBB, ReceptorActividad, ReceptorOperadorNumero, KilogramoAplicado
		FROM Formulario1116RT_Cabecera
		WHERE IDFormulario1116RT = @IDFormulario1116RT
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-16
-- Description:	Obtiene los datos de un Formulario 1116RT a partir del número de formulario
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_GetByFormularioNumero') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_GetByFormularioNumero
GO

CREATE PROCEDURE usp_Formulario1116RT_GetByFormularioNumero
	@FormularioNumero char(13)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDFormulario1116RT, IDFormulario1116_Talonario, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, Origen_FormularioTipo, Origen_FormularioNumero, Origen_FormularioFecha, Origen_IDFormulario1116A, Origen_IDFormulario1116RT, IDCosecha, IDCereal, Origen_IDPartido, RetiroOTransferencia, TotalKilogramo, GeneraNuevoF1116A, ReceptorIDEntidad, ReceptorRazonSocial, ReceptorDomicilioTipo, ReceptorDomicilioCalle, ReceptorDomicilioNumero, ReceptorDomicilioPiso, ReceptorDomicilioOficina, ReceptorDomicilioCodigoPostal, ReceptorDomicilioIDLocalidad, ReceptorCUIT, ReceptorIDCategoriaIVA, ReceptorIIBB, ReceptorActividad, ReceptorOperadorNumero, KilogramoAplicado
		FROM Formulario1116RT_Cabecera
		WHERE FormularioNumero = @FormularioNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-26
-- Description:	Agrega un Formulario 1116RT con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_Add') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_Add
GO

CREATE PROCEDURE usp_Formulario1116RT_Add
	@IDFormulario1116RT int OUTPUT,
	@IDFormulario1116_Talonario int,
	@FormularioNumero varchar(13),
	@Fecha date,
	@DepositarioIDEntidad int,
	@DepositarioIDPlanta smallint,
	@DepositanteIDEntidad int,
	@DepositanteRazonSocial varchar(100),
	@DepositanteDomicilioTipo tinyint,
	@DepositanteDomicilioCalle varchar(50),
	@DepositanteDomicilioNumero varchar(10),
	@DepositanteDomicilioPiso varchar(10),
	@DepositanteDomicilioOficina varchar(10),
	@DepositanteDomicilioCodigoPostal varchar(8),
	@DepositanteDomicilioIDLocalidad int,
	@DepositanteCUIT varchar(11),
	@DepositanteIIBB varchar(20),
	@DepositanteIDCategoriaIVA tinyint,
	@Origen_FormularioTipo char(1),
	@Origen_FormularioNumero varchar(13),
	@Origen_FormularioFecha date,
	@Origen_IDFormulario1116A int,
	@Origen_IDFormulario1116RT int,
	@Origen_IDPartido smallint,
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@RetiroOTransferencia char(1),	
	@TotalKilogramo int,
	@GeneraNuevoF1116A bit,
	@ReceptorIDEntidad int,
	@ReceptorRazonSocial varchar(100),
	@ReceptorDomicilioTipo tinyint,
	@ReceptorDomicilioCalle varchar(50),
	@ReceptorDomicilioNumero varchar(10),
	@ReceptorDomicilioPiso varchar(10),
	@ReceptorDomicilioOficina varchar(10),
	@ReceptorDomicilioCodigoPostal varchar(8),
	@ReceptorDomicilioIDLocalidad int,
	@ReceptorCUIT varchar(11),
	@ReceptorIIBB varchar(20),
	@ReceptorIDCategoriaIVA tinyint,
	@ReceptorActividad varchar(50),
	@ReceptorOperadorNumero int,
	@StringListOfIDMovimiento_CerealAndKilogramoAplicado varchar(1000)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @SeparatorPos int = 0
	DECLARE @DelimiterPosStart int = 0
	DECLARE @DelimiterPosEnd int = 0
	DECLARE @ValuePairLen int
	DECLARE @ValuePair varchar(25)
	
	DECLARE @Formulario_Detalle__IDRemesa tinyint = 0
	DECLARE @Formulario_Detalle__IDMovimiento_Cereal int
	DECLARE @Formulario_Detalle__KilogramoAplicado int
	
	DECLARE @KilogramoAplicado int
	
	DECLARE @Formulario_Detalle TABLE(IDRemesa int PRIMARY KEY, IDMovimiento_Cereal int NOT NULL, KilogramoAplicado int NOT NULL)
	
	BEGIN TRY
	
		BEGIN TRANSACTION
			--PARSEO LOS MOVIMIENTOS Y LOS GUARDO EN UNA TABLA LOCAL
			WHILE CHARINDEX('|', @StringListOfIDMovimiento_CerealAndKilogramoAplicado, @SeparatorPos + 1) > 0
				BEGIN
					SET @ValuePairLen = CHARINDEX('|', @StringListOfIDMovimiento_CerealAndKilogramoAplicado, @SeparatorPos + 1) - @SeparatorPos
					SET @ValuePair = SUBSTRING(@StringListOfIDMovimiento_CerealAndKilogramoAplicado, @SeparatorPos, @ValuePairLen)
					
					--ID REMESA
					SET @Formulario_Detalle__IDRemesa = @Formulario_Detalle__IDRemesa + 1
					
					--ID MOVIMIENTO CEREAL
					SET @DelimiterPosStart = CHARINDEX('¬', @ValuePair, 1)
					IF @DelimiterPosStart > 0
						SET @Formulario_Detalle__IDMovimiento_Cereal = CAST(SUBSTRING(@ValuePair, 1, @DelimiterPosStart - 1) AS int)
					
					--KILOGRAMO APLICADO
					SET @DelimiterPosEnd = CHARINDEX('¬', @ValuePair, @DelimiterPosStart + 1)
					SET @Formulario_Detalle__KilogramoAplicado = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 25) AS int)
					
					INSERT INTO @Formulario_Detalle
						(IDRemesa, IDMovimiento_Cereal, KilogramoAplicado)
						VALUES (@Formulario_Detalle__IDRemesa, @Formulario_Detalle__IDMovimiento_Cereal, @Formulario_Detalle__KilogramoAplicado)
					
					SET @SeparatorPos = CHARINDEX('|', @StringListOfIDMovimiento_CerealAndKilogramoAplicado, @SeparatorPos + @ValuePairLen) + 1
				END
			
			--OBTENGO EL NUEVO ID DEL FORMULARIO
			SET @IDFormulario1116RT = (SELECT ISNULL(MAX(IDFormulario1116RT), 0) + 1 FROM Formulario1116RT_Cabecera)
			
			--LIMPIO LAS VARIABLES QUE NO CORRESPONDEN
			IF @RetiroOTransferencia = 'R'
				BEGIN
				SET @TotalKilogramo = 0
				SET @ReceptorIDEntidad = NULL
				SET @ReceptorRazonSocial = NULL
				SET @ReceptorDomicilioTipo = NULL
				SET @ReceptorDomicilioCalle = NULL
				SET @ReceptorDomicilioNumero = NULL
				SET @ReceptorDomicilioPiso = NULL
				SET @ReceptorDomicilioOficina = NULL
				SET @ReceptorDomicilioCodigoPostal = NULL
				SET @ReceptorDomicilioIDLocalidad = NULL
				SET @ReceptorCUIT = NULL
				SET @ReceptorIIBB = NULL
				SET @ReceptorIDCategoriaIVA = NULL
				SET @ReceptorActividad = NULL
				SET @ReceptorOperadorNumero = NULL
				SET @KilogramoAplicado = NULL
				SET @StringListOfIDMovimiento_CerealAndKilogramoAplicado = ''
				END
			ELSE
				BEGIN
				SET @GeneraNuevoF1116A = NULL
				SET @KilogramoAplicado = 0
				END
			
			--SI ES UN RETIRO DE MERCADERÍA, SUMO LOS KILOS DE TODAS LAS CP DE SALIDA
			--SI ES UNA TRANSFERENCIA, YA TENGO LOS KILOS EN @TotalKilogramo
			IF @RetiroOTransferencia = 'R'
				BEGIN
				SET @TotalKilogramo = (SELECT ISNULL(SUM(Formulario_Detalle.KilogramoAplicado), 0)
											FROM Movimiento_Cereal INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario_Detalle.IDMovimiento_Cereal
											WHERE Movimiento_Cereal.Tipo = 'S' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND (Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) > 0)
				END
			
			--AGREGO EL FORMULARIO RT
			INSERT INTO Formulario1116RT_Cabecera
				(IDFormulario1116RT, IDFormulario1116_Talonario, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, Origen_FormularioTipo, Origen_FormularioNumero, Origen_FormularioFecha, Origen_IDFormulario1116A, Origen_IDFormulario1116RT, Origen_IDPartido, IDCosecha, IDCereal, RetiroOTransferencia, TotalKilogramo, GeneraNuevoF1116A, ReceptorIDEntidad, ReceptorRazonSocial, ReceptorDomicilioTipo, ReceptorDomicilioCalle, ReceptorDomicilioNumero, ReceptorDomicilioPiso, ReceptorDomicilioOficina, ReceptorDomicilioCodigoPostal, ReceptorDomicilioIDLocalidad, ReceptorCUIT, ReceptorIIBB, ReceptorIDCategoriaIVA, ReceptorActividad, ReceptorOperadorNumero, KilogramoAplicado)
				SELECT @IDFormulario1116RT, @IDFormulario1116_Talonario, @FormularioNumero, @Fecha, @DepositarioIDEntidad, @DepositarioIDPlanta, @DepositanteIDEntidad, @DepositanteRazonSocial, @DepositanteDomicilioTipo, @DepositanteDomicilioCalle, @DepositanteDomicilioNumero, @DepositanteDomicilioPiso, @DepositanteDomicilioOficina, @DepositanteDomicilioCodigoPostal, @DepositanteDomicilioIDLocalidad, @DepositanteCUIT, @DepositanteIIBB, @DepositanteIDCategoriaIVA, @Origen_FormularioTipo, @Origen_FormularioNumero, @Origen_FormularioFecha, @Origen_IDFormulario1116A, @Origen_IDFormulario1116RT, @Origen_IDPartido, @IDCosecha, @IDCereal, @RetiroOTransferencia, @TotalKilogramo, @GeneraNuevoF1116A, @ReceptorIDEntidad, @ReceptorRazonSocial, @ReceptorDomicilioTipo, @ReceptorDomicilioCalle, @ReceptorDomicilioNumero, @ReceptorDomicilioPiso, @ReceptorDomicilioOficina, @ReceptorDomicilioCodigoPostal, @ReceptorDomicilioIDLocalidad, @ReceptorCUIT, @ReceptorIIBB, @ReceptorIDCategoriaIVA, @ReceptorActividad, @ReceptorOperadorNumero, @KilogramoAplicado
			
			--AGREGO EL DETALLE DE CARTAS DE PORTE DEL FORMULARIO
			INSERT INTO Formulario1116RT_Detalle
				(IDFormulario1116RT, IDRemesa, IDMovimiento_Cereal, KilogramoAplicado)
				SELECT @IDFormulario1116RT, Formulario_Detalle.IDRemesa, Formulario_Detalle.IDMovimiento_Cereal, Formulario_Detalle.KilogramoAplicado
					FROM Movimiento_Cereal INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario_Detalle.IDMovimiento_Cereal
					WHERE Movimiento_Cereal.Tipo = 'S' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND (Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) > 0
					
			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DEL FORMULARIO A O RT SEGÚN CORRESPONDA
			IF @Origen_FormularioTipo = 'A'
				BEGIN
				UPDATE Formulario1116A_Cabecera
					SET KilogramoAplicado = KilogramoAplicado + @TotalKilogramo
						WHERE IDFormulario1116A = @Origen_IDFormulario1116A
				END
			ELSE
				BEGIN
				UPDATE Formulario1116RT_Cabecera
					SET KilogramoAplicado = KilogramoAplicado + @TotalKilogramo
						WHERE IDFormulario1116RT = @Origen_IDFormulario1116RT
				END

			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DE LOS MOVIMIENTOS DE CEREAL AFECTADOS AL FORMULARIO
			UPDATE Movimiento_Cereal
				SET Movimiento_Cereal.KilogramoAplicado = Movimiento_Cereal.KilogramoAplicado + Formulario_Detalle.KilogramoAplicado
					FROM Movimiento_Cereal INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario_Detalle.IDMovimiento_Cereal
					WHERE Movimiento_Cereal.Tipo = 'S' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND (Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) > 0

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
-- Create date: 2013-09-08
-- Description:	Elimina un Formulario 1116RT con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_Delete') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_Delete
GO

CREATE PROCEDURE usp_Formulario1116RT_Delete
	@IDFormulario1116RT int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Origen_FormularioTipo char(1)
	DECLARE @Origen_IDFormulario1116A int
	DECLARE @Origen_IDFormulario1116RT int
	DECLARE @TotalKilogramo int
	
	BEGIN TRY
	
		BEGIN TRANSACTION
	
			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DE LOS Movimiento_CerealS AFECTADOS AL FORMULARIO
			UPDATE Movimiento_Cereal
				SET Movimiento_Cereal.KilogramoAplicado = Movimiento_Cereal.KilogramoAplicado - Formulario1116RT_Detalle.KilogramoAplicado
				FROM Movimiento_Cereal INNER JOIN Formulario1116RT_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario1116RT_Detalle.IDMovimiento_Cereal
				WHERE Formulario1116RT_Detalle.IDFormulario1116RT = @IDFormulario1116RT

			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DEL FORMULARIO A O RT SEGUN CORRESPONDA
			SELECT @Origen_FormularioTipo = Origen_FormularioTipo, @Origen_IDFormulario1116A = Origen_IDFormulario1116A, @Origen_IDFormulario1116RT = Origen_IDFormulario1116RT, @TotalKilogramo = TotalKilogramo
				FROM Formulario1116RT_Cabecera
				WHERE IDFormulario1116RT = @IDFormulario1116RT
			IF @Origen_FormularioTipo = 'A'
				BEGIN
				UPDATE Formulario1116A_Cabecera
					SET KilogramoAplicado = KilogramoAplicado - @TotalKilogramo
					WHERE IDFormulario1116A = @Origen_IDFormulario1116A
				END
			ELSE
				BEGIN
				UPDATE Formulario1116RT_Cabecera
					SET KilogramoAplicado = KilogramoAplicado - @TotalKilogramo
					WHERE IDFormulario1116RT = @Origen_IDFormulario1116RT
				END
			
			--ELIMINO EL DETALLE DE CARTAS DE PORTE DEL FORMULARIO
			DELETE
				FROM Formulario1116RT_Detalle
				WHERE IDFormulario1116RT = @IDFormulario1116RT
			
			--ELIMINO EL FORMULARIO RT
			DELETE
				FROM Formulario1116RT_Cabecera
				WHERE IDFormulario1116RT = @IDFormulario1116RT
	
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
-- Create date: 2013-09-08
-- Description:	Datos para el Reporte del Formulario 1116RT
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_Report') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_Report
GO

CREATE PROCEDURE usp_Formulario1116RT_Report
	@IDFormulario1116RT int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT Formulario1116RT_Cabecera.Fecha, Formulario1116RT_Cabecera.FormularioNumero, Formulario1116RT_Cabecera.RetiroOTransferencia, Formulario1116RT_Cabecera.Origen_FormularioTipo, Formulario1116RT_Cabecera.Origen_FormularioNumero, Formulario1116RT_Cabecera.TotalKilogramo AS KilogramoTotal
		--DEPOSITANTE
		, Formulario1116RT_Cabecera.DepositanteIDEntidad AS DepositanteCodigoCliente, Formulario1116RT_Cabecera.DepositanteRazonSocial, Formulario1116RT_Cabecera.DepositanteCUIT, DepositanteCategoriaIVA.Nombre AS DepositanteCondicionIVA, dbo.udf_GetDomicilioCompleto(Formulario1116RT_Cabecera.DepositanteDomicilioCalle, Formulario1116RT_Cabecera.DepositanteDomicilioNumero, Formulario1116RT_Cabecera.DepositanteDomicilioPiso, Formulario1116RT_Cabecera.DepositanteDomicilioOficina) AS DepositanteDomicilioCompleto, Formulario1116RT_Cabecera.DepositanteDomicilioCalle, Formulario1116RT_Cabecera.DepositanteDomicilioNumero, Formulario1116RT_Cabecera.DepositanteDomicilioPiso, Formulario1116RT_Cabecera.DepositanteDomicilioOficina, dbo.udf_GetCodigoPostalLocalidad(Formulario1116RT_Cabecera.DepositanteDomicilioCodigoPostal, DepositanteLocalidad.Nombre) AS DepositanteCodigoPostalYLocalidad, Formulario1116RT_Cabecera.DepositanteDomicilioCodigoPostal, DepositanteLocalidad.Nombre AS DepositanteDomicilioLocalidad, DepositanteProvincia.Nombre AS DepositanteDomicilioProvincia
		--RETIRO DE GRANOS - DATOS
		, Formulario1116RT_Cabecera.GeneraNuevoF1116A
		--RETIRO DE GRANOS - DETALLE DE CARTAS DE PORTE
		, Formulario1116RT_Detalle.IDRemesa AS RemesaOrden, Movimiento_Cereal.FechaCarga AS RemesaFechaRetiro, Movimiento_Cereal.ComprobanteNumero AS RemesaNumeroCartaPorte, RetiroCereal.ONCCA_EspecieNombre AS RemesaGranoNombre, RetiroCereal.ONCCA_EspecieCodigo AS RemesaGranoCodigo, Formulario1116RT_Detalle.KilogramoAplicado AS RemesaKilos
		--TRANSFERENCIA DE GRANOS - DATOS
		, Formulario1116RT_Cabecera.ReceptorRazonSocial, Formulario1116RT_Cabecera.ReceptorCUIT, ReceptorCategoriaIVA.Nombre AS ReceptorCondicionIVA, Formulario1116RT_Cabecera.ReceptorActividad, Formulario1116RT_Cabecera.ReceptorOperadorNumero, dbo.udf_GetDomicilioCompleto(Formulario1116RT_Cabecera.ReceptorDomicilioCalle, Formulario1116RT_Cabecera.ReceptorDomicilioNumero, Formulario1116RT_Cabecera.ReceptorDomicilioPiso, Formulario1116RT_Cabecera.ReceptorDomicilioOficina) AS ReceptorDomicilioCompleto, Formulario1116RT_Cabecera.ReceptorDomicilioCalle, Formulario1116RT_Cabecera.ReceptorDomicilioNumero, Formulario1116RT_Cabecera.ReceptorDomicilioPiso, Formulario1116RT_Cabecera.ReceptorDomicilioOficina, dbo.udf_GetCodigoPostalLocalidad(Formulario1116RT_Cabecera.ReceptorDomicilioCodigoPostal, ReceptorLocalidad.Nombre) AS ReceptorCodigoPostalYLocalidad,  Formulario1116RT_Cabecera.ReceptorDomicilioCodigoPostal, ReceptorLocalidad.Nombre AS ReceptorDomicilioLocalidad, ReceptorProvincia.Nombre AS ReceptorDomicilioProvincia
		--TRANSFERENCIA DE GRANOS - DETALLE
		, Formulario1116RT_Cabecera.Origen_FormularioFecha, TransferenciaCereal.ONCCA_EspecieNombre AS TransferenciaGranoNombre, TransferenciaCereal.ONCCA_EspecieCodigo AS TransferenciaGranoCodigo
		FROM (((((((((Formulario1116RT_Cabecera LEFT JOIN Formulario1116RT_Detalle ON Formulario1116RT_Cabecera.IDFormulario1116RT = Formulario1116RT_Detalle.IDFormulario1116RT) LEFT JOIN Movimiento_Cereal ON Formulario1116RT_Detalle.IDMovimiento_Cereal = Movimiento_Cereal.IDMovimiento_Cereal) INNER JOIN Localidad AS DepositanteLocalidad ON Formulario1116RT_Cabecera.DepositanteDomicilioIDLocalidad = DepositanteLocalidad.IDLocalidad) INNER JOIN Provincia AS DepositanteProvincia ON DepositanteLocalidad.IDProvincia = DepositanteProvincia.IDProvincia) INNER JOIN CategoriaIVA AS DepositanteCategoriaIVA ON Formulario1116RT_Cabecera.DepositanteIDCategoriaIVA = DepositanteCategoriaIVA.IDCategoriaIVA) LEFT JOIN Localidad AS ReceptorLocalidad ON Formulario1116RT_Cabecera.ReceptorDomicilioIDLocalidad = ReceptorLocalidad.IDLocalidad) LEFT JOIN Provincia AS ReceptorProvincia ON ReceptorLocalidad.IDProvincia = ReceptorProvincia.IDProvincia) LEFT JOIN CategoriaIVA AS ReceptorCategoriaIVA ON Formulario1116RT_Cabecera.ReceptorIDCategoriaIVA = ReceptorCategoriaIVA.IDCategoriaIVA) LEFT JOIN Cereal AS RetiroCereal ON Movimiento_Cereal.IDCereal = RetiroCereal.IDCereal) INNER JOIN Cereal AS TransferenciaCereal ON Formulario1116RT_Cabecera.IDCereal = TransferenciaCereal.IDCereal
		WHERE Formulario1116RT_Cabecera.IDFormulario1116RT = @IDFormulario1116RT
		ORDER BY Formulario1116RT_Detalle.IDRemesa
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-16
-- Description:	Obtiene los datos de la Cabecera de los Formularios 1116RT (Retiro) para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_Retiro_Cabecera_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_Retiro_Cabecera_ListForExport
GO

CREATE PROCEDURE usp_Formulario1116RT_Retiro_Cabecera_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario1116RT_Cabecera.FormularioNumero AS NumeroFormularioRT, Formulario1116RT_Cabecera.Origen_FormularioNumero AS NumeroFormularioA, Formulario1116RT_Cabecera.GeneraNuevoF1116A, Planta.ONCCA_Codigo AS CodigoEstablecimiento
		, Cereal.ONCCA_EspecieCodigo AS CodigoEspecie, Cereal.ONCCA_GranoTipoCodigo AS CodigoTipoGrano
		, Formulario1116RT_Cabecera.DepositanteCUIT AS CUITDepositante, Formulario1116RT_Cabecera.DepositanteRazonSocial AS RazonSocialDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioTipo AS TipoDomicilioDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioCalle AS CalleORutaDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioNumero AS NumeroOKilometroDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioPiso AS PisoDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioOficina AS OficinaODepartamentoDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioIDLocalidad AS CodigoLocalidadDepositante, Depositante_Localidad.IDPartido AS CodigoPartidoDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioCodigoPostal AS CodigoPostalDepositante
		, Formulario1116_Talonario.CAC AS NumeroCAC
		FROM ((((Formulario1116RT_Cabecera INNER JOIN Formulario1116_Talonario ON Formulario1116RT_Cabecera.IDFormulario1116_Talonario = Formulario1116_Talonario.IDFormulario1116_Talonario) INNER JOIN Entidad_OrigenDestino AS Planta ON Formulario1116RT_Cabecera.DepositarioIDEntidad = Planta.IDEntidad AND Formulario1116RT_Cabecera.DepositarioIDPlanta = Planta.IDOrigenDestino) INNER JOIN Localidad AS Planta_Localidad ON Planta.IDLocalidad = Planta_Localidad.IDLocalidad) INNER JOIN Localidad AS Depositante_Localidad ON Formulario1116RT_Cabecera.DepositanteDomicilioIDLocalidad = Depositante_Localidad.IDLocalidad) INNER JOIN Cereal ON Formulario1116RT_Cabecera.IDCereal = Cereal.IDCereal
		WHERE Formulario1116RT_Cabecera.RetiroOTransferencia = 'R' AND Formulario1116RT_Cabecera.Fecha >= @FechaDesde AND Formulario1116RT_Cabecera.Fecha <= @FechaHasta
		ORDER BY Formulario1116RT_Cabecera.Fecha, Formulario1116RT_Cabecera.FormularioNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-16
-- Description:	Obtiene los datos del Detalle de los Formularios 1116RT (Retiro) para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_Retiro_Detalle_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_Retiro_Detalle_ListForExport
GO

CREATE PROCEDURE usp_Formulario1116RT_Retiro_Detalle_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario1116RT_Cabecera.FormularioNumero AS NumeroFormularioRT, Movimiento_Cereal.FechaCarga AS FechaRetiro, Movimiento_Cereal.ComprobanteNumero AS NumeroCartaPorte, Formulario1116RT_Detalle.KilogramoAplicado AS KilogramosRetiro
		FROM (Formulario1116RT_Cabecera INNER JOIN Formulario1116RT_Detalle ON Formulario1116RT_Cabecera.IDFormulario1116RT = Formulario1116RT_Detalle.IDFormulario1116RT) INNER JOIN Movimiento_Cereal ON Formulario1116RT_Detalle.IDMovimiento_Cereal = Movimiento_Cereal.IDMovimiento_Cereal
		WHERE Formulario1116RT_Cabecera.RetiroOTransferencia = 'R' AND Formulario1116RT_Cabecera.Fecha >= @FechaDesde AND Formulario1116RT_Cabecera.Fecha <= @FechaHasta
		ORDER BY Formulario1116RT_Cabecera.Fecha, Formulario1116RT_Detalle.IDRemesa
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-16
-- Description:	Obtiene los datos de la Cabecera de los Formularios 1116RT (Retiro) para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116RT_Transferencia_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116RT_Transferencia_ListForExport
GO

CREATE PROCEDURE usp_Formulario1116RT_Transferencia_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario1116RT_Cabecera.FormularioNumero AS NumeroFormularioRT, Formulario1116RT_Cabecera.Origen_FormularioNumero AS NumeroFormularioA, Formulario1116RT_Cabecera.Fecha AS FechaTransferencia, Planta.ONCCA_Codigo AS CodigoEstablecimiento
		, Cereal.ONCCA_EspecieCodigo AS CodigoEspecie, Cereal.ONCCA_GranoTipoCodigo AS CodigoTipoGrano
		, Formulario1116RT_Cabecera.TotalKilogramo AS KilogramosTransferencia
		, Formulario1116RT_Cabecera.DepositanteCUIT AS CUITDepositante, Formulario1116RT_Cabecera.DepositanteRazonSocial AS RazonSocialDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioTipo AS TipoDomicilioDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioCalle AS CalleORutaDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioNumero AS NumeroOKilometroDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioPiso AS PisoDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioOficina AS OficinaODepartamentoDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioIDLocalidad AS CodigoLocalidadDepositante, Depositante_Localidad.IDPartido AS CodigoPartidoDepositante, Formulario1116RT_Cabecera.DepositanteDomicilioCodigoPostal AS CodigoPostalDepositante
		, Formulario1116RT_Cabecera.ReceptorCUIT AS CUITReceptor, Formulario1116RT_Cabecera.ReceptorRazonSocial AS RazonSocialReceptor, Formulario1116RT_Cabecera.ReceptorIDCategoriaIVA AS SituacionAnteIVAReceptor, dbo.udf_GetDomicilioCompleto(Formulario1116RT_Cabecera.ReceptorDomicilioCalle, Formulario1116RT_Cabecera.ReceptorDomicilioNumero, Formulario1116RT_Cabecera.ReceptorDomicilioPiso, Formulario1116RT_Cabecera.ReceptorDomicilioOficina) AS DomicilioFiscalReceptor, Formulario1116RT_Cabecera.ReceptorDomicilioIDLocalidad AS CodigoLocalidadReceptor, Formulario1116RT_Cabecera.ReceptorOperadorNumero AS NumeroONCCAReceptor, 1 AS RolReceptor
		, Formulario1116_Talonario.CAC AS NumeroCAC
		FROM ((((Formulario1116RT_Cabecera INNER JOIN Formulario1116_Talonario ON Formulario1116RT_Cabecera.IDFormulario1116_Talonario = Formulario1116_Talonario.IDFormulario1116_Talonario) INNER JOIN Entidad_OrigenDestino AS Planta ON Formulario1116RT_Cabecera.DepositarioIDEntidad = Planta.IDEntidad AND Formulario1116RT_Cabecera.DepositarioIDPlanta = Planta.IDOrigenDestino) INNER JOIN Localidad AS Planta_Localidad ON Planta.IDLocalidad = Planta_Localidad.IDLocalidad) INNER JOIN Localidad AS Depositante_Localidad ON Formulario1116RT_Cabecera.DepositanteDomicilioIDLocalidad = Depositante_Localidad.IDLocalidad) INNER JOIN Cereal ON Formulario1116RT_Cabecera.IDCereal = Cereal.IDCereal
		WHERE Formulario1116RT_Cabecera.RetiroOTransferencia = 'T' AND Formulario1116RT_Cabecera.Fecha >= @FechaDesde AND Formulario1116RT_Cabecera.Fecha <= @FechaHasta
		ORDER BY Formulario1116RT_Cabecera.Fecha, Formulario1116RT_Cabecera.FormularioNumero
END
GO