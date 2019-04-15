USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-16
-- Description:	Obtiene los datos de un Formulario 1116B
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_Get') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_Get
GO

CREATE PROCEDURE usp_Formulario1116B_Get
	@IDFormulario1116B int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT IDFormulario1116B, OperacionTipo, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, DepositanteGanancia_Inscripto, DepositanteReFOG_Situacion, DepositanteCBU, IDCosecha, IDCereal, ActuoCorredor, CondicionOperacionFecha, CondicionOperacionPrecioTonelada, CondicionOperacionFlete, OperacionCantidad, OperacionPrecioKilogramo, OperacionSubtotal, OperacionAlicuotaIVA, OperacionImporteIVA, OperacionImporteConIVA, RetencionImporteAFIP, RetencionImporteOtra, TotalImporteNetoAPagar, TotalIVARG, TotalPagoSegunCondicion
		FROM Formulario1116B_Cabecera
		WHERE IDFormulario1116B = @IDFormulario1116B
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-16
-- Description:	Obtiene los datos de un Formulario 1116B a partir del número de formulario
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_GetByFormularioNumero') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_GetByFormularioNumero
GO

CREATE PROCEDURE usp_Formulario1116B_GetByFormularioNumero
	@FormularioNumero char(13)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDFormulario1116B, OperacionTipo, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, DepositanteGanancia_Inscripto, DepositanteReFOG_Situacion, DepositanteCBU, IDCosecha, IDCereal, ActuoCorredor, CondicionOperacionFecha, CondicionOperacionPrecioTonelada, CondicionOperacionFlete, OperacionCantidad, OperacionPrecioKilogramo, OperacionSubtotal, OperacionAlicuotaIVA, OperacionImporteIVA, OperacionImporteConIVA, RetencionImporteAFIP, RetencionImporteOtra, TotalImporteNetoAPagar, TotalIVARG, TotalPagoSegunCondicion
		FROM Formulario1116B_Cabecera
		WHERE FormularioNumero = @FormularioNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-16
-- Description:	Agrega un Formulario 1116B con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_Add') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_Add
GO

CREATE PROCEDURE usp_Formulario1116B_Add
	@IDFormulario1116B int OUTPUT,
	@OperacionTipo char(1),
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
	@DepositanteGanancia_Inscripto bit,
	@DepositanteReFOG_Situacion char(1),
	@DepositanteCBU varchar(22),
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@ActuoCorredor bit,
	@CondicionOperacionFecha date,
	@CondicionOperacionPrecioTonelada money,
	@CondicionOperacionFlete money,
	@OperacionCantidad int,
	@OperacionPrecioKilogramo money,
	@OperacionAlicuotaIVA decimal(3,1),
	@StringList varchar(1000)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @DepositanteReFOG_Activo bit
	
	DECLARE @OperacionSubtotal money
	DECLARE @OperacionImporteIVA money
	DECLARE @OperacionImporteConIVA money
	DECLARE @RetencionImporteAFIP money
	DECLARE @RetencionImporteOtra money
	DECLARE @RetencionIVAImporte money
	
	DECLARE @SeparatorPos int = 0
	DECLARE @DelimiterPosStart int = 0
	DECLARE @DelimiterPosEnd int = 0
	DECLARE @ValuePairLen int
	DECLARE @ValuePair varchar(25)
	
	DECLARE @Formulario_Detalle__FormularioTipo char(1)
	DECLARE @Formulario_Detalle__FormularioNumero varchar(13)
	DECLARE @Formulario_Detalle__FormularioFecha date
	DECLARE @Formulario_Detalle__IDFormulario1116A int
	DECLARE @Formulario_Detalle__IDFormulario1116RT int
	DECLARE @Formulario_Detalle__IDLocalidad int
	DECLARE @Formulario_Detalle__KilogramoAplicado int
	
	DECLARE @Formulario_Detalle TABLE(FormularioTipo char(1) NOT NULL, FormularioNumero varchar(13) NOT NULL, FormularioFecha date NOT NULL, IDFormulario1116A int NULL, IDFormulario1116RT int NULL, IDLocalidad int NOT NULL, KilogramoAplicado int NOT NULL)

	BEGIN TRY
	
		BEGIN TRANSACTION
			--PARSEO LOS DATOS DEL DETALLE Y LOS GUARDO EN UNA TABLA LOCAL
			WHILE CHARINDEX('|', @StringList, @SeparatorPos + 1) > 0
				BEGIN
					SET @ValuePairLen = CHARINDEX('|', @StringList, @SeparatorPos + 1) - @SeparatorPos
					SET @ValuePair = SUBSTRING(@StringList, @SeparatorPos, @ValuePairLen)
					
					--FORMULARIO TIPO
					SET @DelimiterPosStart = CHARINDEX('¬', @ValuePair, 1)
					SET @Formulario_Detalle__FormularioTipo = SUBSTRING(@ValuePair, 1, @DelimiterPosStart - 1)
					
					--ID FORMULARIO 1116
					SET @DelimiterPosEnd = CHARINDEX('¬', @ValuePair, @DelimiterPosStart + 1)
					IF @Formulario_Detalle__FormularioTipo = 'A'
						BEGIN
						SET @Formulario_Detalle__IDFormulario1116A = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS int)
						SET @Formulario_Detalle__IDFormulario1116RT = NULL
						END
					ELSE
						BEGIN
						SET @Formulario_Detalle__IDFormulario1116A = NULL
						SET @Formulario_Detalle__IDFormulario1116RT = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS int)
						END
					
					--KILOGRAMO APLICADO
					SET @DelimiterPosStart = @DelimiterPosEnd
					SET @Formulario_Detalle__KilogramoAplicado = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 25) AS int)
					
					--FORMULARIO NUMERO, FECHA Y LOCALIDAD ORIGEN
					IF @Formulario_Detalle__FormularioTipo = 'A'
						SELECT @Formulario_Detalle__FormularioNumero = FormularioNumero, @Formulario_Detalle__FormularioFecha = Fecha, @Formulario_Detalle__IDLocalidad = 8842
							FROM Formulario1116A_Cabecera
							WHERE IDFormulario1116A = @Formulario_Detalle__IDFormulario1116A
					ELSE
						SELECT @Formulario_Detalle__FormularioNumero = FormularioNumero, @Formulario_Detalle__FormularioFecha = Fecha, @Formulario_Detalle__IDLocalidad = 8842
							FROM Formulario1116RT_Cabecera
							WHERE IDFormulario1116RT = @Formulario_Detalle__IDFormulario1116RT
					
					--AGREGO LOS DATOS A LA TABLA LOCAL
					INSERT INTO @Formulario_Detalle
						(FormularioTipo, FormularioNumero, FormularioFecha, IDFormulario1116A, IDFormulario1116RT, IDLocalidad, KilogramoAplicado)
						VALUES (@Formulario_Detalle__FormularioTipo, @Formulario_Detalle__FormularioNumero, @Formulario_Detalle__FormularioFecha, @Formulario_Detalle__IDFormulario1116A, @Formulario_Detalle__IDFormulario1116RT, @Formulario_Detalle__IDLocalidad, @Formulario_Detalle__KilogramoAplicado)
					
					SET @SeparatorPos = CHARINDEX('|', @StringList, @SeparatorPos + @ValuePairLen) + 1
				END

			IF @DepositanteReFOG_Situacion = 'A'
				SET @DepositanteReFOG_Activo = 1
			ELSE
				SET @DepositanteReFOG_Activo = 0
			
			--OBTENGO EL NUEVO ID DEL FORMULARIO
			SET @IDFormulario1116B = (SELECT ISNULL(MAX(IDFormulario1116B), 0) + 1 FROM Formulario1116B_Cabecera)

			--AGREGO EL FORMULARIO B
			SET @OperacionSubtotal = ROUND(@OperacionCantidad * (@CondicionOperacionPrecioTonelada - @CondicionOperacionFlete) / 1000, 2)
			SET @OperacionImporteIVA = ROUND(@OperacionSubtotal * @OperacionAlicuotaIVA / 100, 2)
			SET @OperacionImporteConIVA = @OperacionSubtotal + @OperacionImporteIVA
			INSERT INTO Formulario1116B_Cabecera
				(IDFormulario1116B, OperacionTipo, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, DepositanteGanancia_Inscripto, DepositanteReFOG_Situacion, DepositanteCBU, IDCosecha, IDCereal, ActuoCorredor, CondicionOperacionFecha, CondicionOperacionPrecioTonelada, CondicionOperacionFlete, OperacionCantidad, OperacionPrecioKilogramo, OperacionSubtotal, OperacionAlicuotaIVA, OperacionImporteIVA, OperacionImporteConIVA, RetencionImporteAFIP, RetencionImporteOtra, TotalImporteNetoAPagar, TotalIVARG, TotalPagoSegunCondicion)
				VALUES (@IDFormulario1116B, @OperacionTipo, @FormularioNumero, @Fecha, @DepositarioIDEntidad, @DepositarioIDPlanta, @DepositanteIDEntidad, @DepositanteRazonSocial, @DepositanteDomicilioTipo, @DepositanteDomicilioCalle, @DepositanteDomicilioNumero, @DepositanteDomicilioPiso, @DepositanteDomicilioOficina, @DepositanteDomicilioCodigoPostal, @DepositanteDomicilioIDLocalidad, @DepositanteCUIT, @DepositanteIIBB, @DepositanteIDCategoriaIVA, @DepositanteGanancia_Inscripto, @DepositanteReFOG_Situacion, @DepositanteCBU, @IDCosecha, @IDCereal, @ActuoCorredor, @CondicionOperacionFecha, @CondicionOperacionPrecioTonelada, @CondicionOperacionFlete, @OperacionCantidad, @OperacionPrecioKilogramo, @OperacionSubtotal, @OperacionAlicuotaIVA, @OperacionImporteIVA, @OperacionImporteConIVA, 0, 0, 0, 0, 0)
				
			--AGREGO EL DETALLE DE FORMULARIOS APLICADOS
			INSERT INTO Formulario1116B_Detalle
				(IDFormulario1116B, FormularioTipo, FormularioNumero, FormularioFecha, IDFormulario1116A, IDFormulario1116RT, IDLocalidad, KilogramoAplicado)
				SELECT @IDFormulario1116B, FormularioTipo, FormularioNumero, FormularioFecha, IDFormulario1116A, IDFormulario1116RT, IDLocalidad, KilogramoAplicado
					FROM @Formulario_Detalle
			
			--AGREGO EL DETALLE DE RETENCIONES DEL FORMULARIO
			INSERT INTO Formulario1116B_Retencion
				(IDFormulario1116B, IDRetencion, BaseCalculo, Alicuota, Importe)
				SELECT @IDFormulario1116B, IDRetencion, (CASE BaseCalculoTipo WHEN 'IN' THEN @OperacionSubtotal - ISNULL(MinimoNoImponible, 0) WHEN 'IB' THEN @OperacionImporteConIVA - ISNULL(MinimoNoImponible, 0) END), Alicuota, ROUND((CASE BaseCalculoTipo WHEN 'IN' THEN @OperacionSubtotal - ISNULL(MinimoNoImponible, 0) WHEN 'IB' THEN @OperacionImporteConIVA - ISNULL(MinimoNoImponible, 0) END) * Alicuota / 100, 2)
					FROM Retencion
					WHERE AplicableEn = 'FB' AND Activo = 1
						AND (OperacionTipo IS NULL OR OperacionTipo = @OperacionTipo)
						AND (ReFOG_Activo IS NULL OR ReFOG_Activo = @DepositanteReFOG_Activo)
						AND (Ganancia_Inscripto IS NULL OR Ganancia_Inscripto = @DepositanteGanancia_Inscripto)
						AND (CASE BaseCalculoTipo WHEN 'IN' THEN @OperacionSubtotal - ISNULL(MinimoNoImponible, 0) WHEN 'IB' THEN @OperacionImporteConIVA - ISNULL(MinimoNoImponible, 0) END) > 0
			
			--ACTUALIZO LOS TOTALES DEL FORMULARIO SEGUN LAS RETENCIONES APLICADAS
			SET @RetencionImporteAFIP = ISNULL((SELECT SUM(Formulario1116B_Retencion.Importe) FROM Formulario1116B_Retencion INNER JOIN Retencion ON Formulario1116B_Retencion.IDRetencion = Retencion.IDRetencion WHERE Formulario1116B_Retencion.IDFormulario1116B = @IDFormulario1116B AND (Retencion.Concepto = 'I' OR Retencion.Concepto = 'G')), 0)
			SET @RetencionImporteOtra = ISNULL((SELECT SUM(Formulario1116B_Retencion.Importe) FROM Formulario1116B_Retencion INNER JOIN Retencion ON Formulario1116B_Retencion.IDRetencion = Retencion.IDRetencion WHERE Formulario1116B_Retencion.IDFormulario1116B = @IDFormulario1116B AND Retencion.Concepto <> 'I' AND Retencion.Concepto <> 'G'), 0)
			SET @RetencionIVAImporte = ISNULL((SELECT Formulario1116B_Retencion.Importe FROM Formulario1116B_Retencion INNER JOIN Retencion ON Formulario1116B_Retencion.IDRetencion = Retencion.IDRetencion WHERE Formulario1116B_Retencion.IDFormulario1116B = @IDFormulario1116B AND Retencion.Concepto = 'I'), 0)
			UPDATE Formulario1116B_Cabecera
				SET RetencionImporteAFIP = @RetencionImporteAFIP, RetencionImporteOtra = @RetencionImporteOtra, TotalImporteNetoAPagar = @OperacionImporteConIVA - @RetencionImporteAFIP - @RetencionImporteOtra, TotalIVARG = (CASE @OperacionTipo WHEN 'V' THEN @OperacionImporteIVA - @RetencionIVAImporte ELSE 0 END), TotalPagoSegunCondicion = (@OperacionImporteConIVA - @RetencionImporteAFIP - @RetencionImporteOtra) - (CASE @OperacionTipo WHEN 'V' THEN @OperacionImporteIVA - @RetencionIVAImporte ELSE 0 END)
				WHERE IDFormulario1116B = @IDFormulario1116B 
			
			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DE LOS FORMULARIOS A CORRESPONDIENTES
			UPDATE Formulario1116A_Cabecera
				SET Formulario1116A_Cabecera.KilogramoAplicado = Formulario1116A_Cabecera.KilogramoAplicado + Formulario_Detalle.KilogramoAplicado
					FROM Formulario1116A_Cabecera INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Formulario1116A_Cabecera.IDFormulario1116A = Formulario_Detalle.IDFormulario1116A
					WHERE Formulario_Detalle.FormularioTipo = 'A'
			
			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DE LOS FORMULARIOS RT CORRESPONDIENTES
			UPDATE Formulario1116RT_Cabecera
				SET Formulario1116RT_Cabecera.KilogramoAplicado = Formulario1116RT_Cabecera.KilogramoAplicado + Formulario_Detalle.KilogramoAplicado
					FROM Formulario1116RT_Cabecera INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Formulario1116RT_Cabecera.IDFormulario1116RT = Formulario_Detalle.IDFormulario1116RT
					WHERE Formulario_Detalle.FormularioTipo = 'R'
			
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
-- Create date: 2013-09-16
-- Description:	Elimina un Formulario 1116B con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_Delete') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_Delete
GO

CREATE PROCEDURE usp_Formulario1116B_Delete
	@IDFormulario1116B int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Origen_FormularioTipo char(1)
	DECLARE @Origen_IDFormulario1116A int
	DECLARE @Origen_IDFormulario1116RT int
	DECLARE @OperacionCantidad int
	
	BEGIN TRY
	
		BEGIN TRANSACTION
	
			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DE LOS FORMULARIOS A CORRESPONDIENTES
			UPDATE Formulario1116A_Cabecera
				SET Formulario1116A_Cabecera.KilogramoAplicado = Formulario1116A_Cabecera.KilogramoAplicado - Formulario1116B_Detalle.KilogramoAplicado
					FROM Formulario1116A_Cabecera INNER JOIN Formulario1116B_Detalle ON Formulario1116A_Cabecera.IDFormulario1116A = Formulario1116B_Detalle.IDFormulario1116A
					WHERE Formulario1116B_Detalle.FormularioTipo = 'A' AND Formulario1116B_Detalle.IDFormulario1116B = @IDFormulario1116B
			
			--ACTUALIZO EL CAMPO KILOGRAMO APLICADO DE LOS FORMULARIOS RT CORRESPONDIENTES
			UPDATE Formulario1116RT_Cabecera
				SET Formulario1116RT_Cabecera.KilogramoAplicado = Formulario1116RT_Cabecera.KilogramoAplicado - Formulario1116B_Detalle.KilogramoAplicado
					FROM Formulario1116RT_Cabecera INNER JOIN Formulario1116B_Detalle ON Formulario1116RT_Cabecera.IDFormulario1116RT = Formulario1116B_Detalle.IDFormulario1116RT
					WHERE Formulario1116B_Detalle.FormularioTipo = 'R' AND Formulario1116B_Detalle.IDFormulario1116B = @IDFormulario1116B

			--ELIMINO EL DETALLE DE RETENCIONES DEL FORMULARIO
			DELETE
				FROM Formulario1116B_Retencion
				WHERE IDFormulario1116B = @IDFormulario1116B
			
			--ELIMINO EL DETALLE DE FORMULARIOS APLICADOS DEL FORMULARIO
			DELETE
				FROM Formulario1116B_Detalle
				WHERE IDFormulario1116B = @IDFormulario1116B
			
			--ELIMINO EL FORMULARIO B
			DELETE
				FROM Formulario1116B_Cabecera
				WHERE IDFormulario1116B = @IDFormulario1116B
	
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
-- Create date: 2013-09-17
-- Description:	Datos para el Reporte del Formulario 1116B
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_Report') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_Report
GO

CREATE PROCEDURE usp_Formulario1116B_Report
	@IDFormulario1116B int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT Formulario1116B_Cabecera.Fecha, Formulario1116B_Cabecera.OperacionTipo, Formulario1116B_Cabecera.FormularioNumero, Formulario1116B_Cabecera.ActuoCorredor
		--DEPOSITANTE
		, Formulario1116B_Cabecera.DepositanteIDEntidad AS DepositanteCodigoCliente, Formulario1116B_Cabecera.DepositanteRazonSocial, Formulario1116B_Cabecera.DepositanteCUIT, CategoriaIVA.Nombre AS DepositanteCondicionIVA, Formulario1116B_Cabecera.DepositanteIIBB, dbo.udf_GetDomicilioCompleto(Formulario1116B_Cabecera.DepositanteDomicilioCalle, Formulario1116B_Cabecera.DepositanteDomicilioNumero, Formulario1116B_Cabecera.DepositanteDomicilioPiso, Formulario1116B_Cabecera.DepositanteDomicilioOficina) AS DepositanteDomicilioCompleto, Formulario1116B_Cabecera.DepositanteDomicilioCalle, Formulario1116B_Cabecera.DepositanteDomicilioNumero, Formulario1116B_Cabecera.DepositanteDomicilioPiso, Formulario1116B_Cabecera.DepositanteDomicilioOficina, dbo.udf_GetCodigoPostalLocalidad(Formulario1116B_Cabecera.DepositanteDomicilioCodigoPostal, DepositanteLocalidad.Nombre) AS DepositanteCodigoPostalYLocalidad, Formulario1116B_Cabecera.DepositanteDomicilioCodigoPostal, DepositanteLocalidad.Nombre AS DepositanteDomicilioLocalidad, DepositanteProvincia.Nombre AS DepositanteDomicilioProvincia
		--CONDICIONES OPERACION
		, Formulario1116B_Cabecera.CondicionOperacionFecha, Formulario1116B_Cabecera.CondicionOperacionPrecioTonelada, Cereal.ONCCA_EspecieNombre AS CerealNombre, Formulario1116B_Cabecera.CondicionOperacionFlete
		--MERCADERIA ENTREGADA
		, dbo.udf_GetFormulario1116TipoNumero(Formulario1116B_Detalle.FormularioTipo, Formulario1116B_Detalle.FormularioNumero) AS Detalle_FormularioTipoNumero, Formulario1116B_Detalle.FormularioFecha AS Detalle_FormularioFecha, OrigenLocalidad.Nombre AS Detalle_OrigenLocalidad, OrigenProvincia.Nombre AS Detalle_OrigenProvincia, Formulario1116B_Detalle.KilogramoAplicado AS Detalle_KilogramoAplicado
		--OPERACION
		, Formulario1116B_Cabecera.OperacionCantidad, Formulario1116B_Cabecera.OperacionPrecioKilogramo, Formulario1116B_Cabecera.OperacionSubtotal, Formulario1116B_Cabecera.OperacionAlicuotaIVA, Formulario1116B_Cabecera.OperacionImporteIVA, Formulario1116B_Cabecera.OperacionImporteConIVA
		--TOTALES DE LA LIQUIDACION
		, Formulario1116B_Cabecera.RetencionImporteAFIP, Formulario1116B_Cabecera.RetencionImporteOtra, Formulario1116B_Cabecera.TotalImporteNetoAPagar, Formulario1116B_Cabecera.TotalIVARG, Formulario1116B_Cabecera.TotalPagoSegunCondicion		
		FROM ((((((Formulario1116B_Cabecera INNER JOIN Formulario1116B_Detalle ON Formulario1116B_Cabecera.IDFormulario1116B = Formulario1116B_Detalle.IDFormulario1116B) INNER JOIN Localidad AS DepositanteLocalidad ON Formulario1116B_Cabecera.DepositanteDomicilioIDLocalidad = DepositanteLocalidad.IDLocalidad) INNER JOIN Provincia AS DepositanteProvincia ON DepositanteLocalidad.IDProvincia = DepositanteProvincia.IDProvincia) INNER JOIN CategoriaIVA ON Formulario1116B_Cabecera.DepositanteIDCategoriaIVA = CategoriaIVA.IDCategoriaIVA) INNER JOIN Localidad AS OrigenLocalidad ON Formulario1116B_Detalle.IDLocalidad = OrigenLocalidad.IDLocalidad) INNER JOIN Provincia AS OrigenProvincia ON OrigenLocalidad.IDProvincia = OrigenProvincia.IDProvincia) INNER JOIN Cereal ON Formulario1116B_Cabecera.IDCereal = Cereal.IDCereal
		WHERE Formulario1116B_Cabecera.IDFormulario1116B = @IDFormulario1116B
		ORDER BY Formulario1116B_Detalle.FormularioFecha, Formulario1116B_Detalle.FormularioNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2014-01-23
-- Description:	Datos para el SubReporte de Retenciones del Formulario 1116B
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_Report_Retencion') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_Report_Retencion
GO

CREATE PROCEDURE usp_Formulario1116B_Report_Retencion
	@IDFormulario1116B int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT Retencion.Concepto, Retencion.Nombre, Formulario1116B_Retencion.BaseCalculo, Formulario1116B_Retencion.Alicuota, Formulario1116B_Retencion.Importe
		FROM Formulario1116B_Retencion INNER JOIN Retencion ON Formulario1116B_Retencion.IDRetencion = Retencion.IDRetencion
		WHERE Formulario1116B_Retencion.IDFormulario1116B = @IDFormulario1116B
		ORDER BY Formulario1116B_Retencion.IDRetencion
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-16
-- Description:	Obtiene los datos de la Cabecera de los Formularios 1116B para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_Cabecera_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_Cabecera_ListForExport
GO

CREATE PROCEDURE usp_Formulario1116B_Cabecera_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario1116B_Cabecera.FormularioNumero AS NumeroCertificado, Cereal.ONCCA_EspecieCodigo AS CodigoEspecie
		, Formulario1116B_Cabecera.DepositanteCUIT AS CUITProductor, Formulario1116B_Cabecera.DepositanteRazonSocial AS RazonSocialProductor, Formulario1116B_Cabecera.DepositanteDomicilioTipo AS TipoDomicilioProductor, Formulario1116B_Cabecera.DepositanteDomicilioCalle AS CalleORutaProductor, Formulario1116B_Cabecera.DepositanteDomicilioNumero AS NumeroOKilometroProductor, Formulario1116B_Cabecera.DepositanteDomicilioPiso AS PisoProductor, Formulario1116B_Cabecera.DepositanteDomicilioOficina AS OficinaODepartamentoProductor, Formulario1116B_Cabecera.DepositanteDomicilioIDLocalidad AS CodigoLocalidadProductor, Productor_Localidad.IDPartido AS CodigoPartidoProductor, Formulario1116B_Cabecera.DepositanteDomicilioCodigoPostal AS CodigoPostalProductor
		, '' AS CUITCorredor, '' AS RazonSocialCorredor
		, Formulario1116B_Retencion.Importe AS ImporteRetencionIVA, (CASE SIGN(Formulario1116B_Cabecera.OperacionCantidad) WHEN -1 THEN 1 ELSE 0 END) AS SignoPesoNetoKilogramo, Formulario1116B_Cabecera.OperacionCantidad AS PesoNetoKilogramo, (CASE SIGN(Formulario1116B_Cabecera.OperacionImporteConIVA) WHEN -1 THEN 1 ELSE 0 END) AS SignoImporteBruto, Formulario1116B_Cabecera.OperacionImporteConIVA AS ImporteBruto
		, Formulario1116B_Cabecera.Fecha AS FechaCierre, Formulario1116B_Cabecera.FormularioNumero AS NumeroCAC
		FROM (((Formulario1116B_Cabecera INNER JOIN Formulario1116B_Retencion ON Formulario1116B_Cabecera.IDFormulario1116B = Formulario1116B_Retencion.IDFormulario1116B) INNER JOIN Retencion ON Formulario1116B_Retencion.IDRetencion = Retencion.IDRetencion) INNER JOIN Localidad AS Productor_Localidad ON Formulario1116B_Cabecera.DepositanteDomicilioIDLocalidad = Productor_Localidad.IDLocalidad) INNER JOIN Cereal ON Formulario1116B_Cabecera.IDCereal = Cereal.IDCereal
		WHERE Retencion.Concepto = 'I' AND Formulario1116B_Cabecera.Fecha >= @FechaDesde AND Formulario1116B_Cabecera.Fecha <= @FechaHasta
		ORDER BY Formulario1116B_Cabecera.Fecha, Formulario1116B_Cabecera.FormularioNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-16
-- Description:	Obtiene los datos del Detalle de los Formularios 1116B para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116B_Detalle_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116B_Detalle_ListForExport
GO

CREATE PROCEDURE usp_Formulario1116B_Detalle_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario1116B_Cabecera.FormularioNumero AS NumeroCertificado, (CASE Formulario1116B_Detalle.FormularioTipo WHEN 'A' THEN 1 ELSE 2 END) AS TipoCertificadoART, Formulario1116B_Detalle.FormularioNumero AS NumeroCertificadoART
		FROM Formulario1116B_Cabecera INNER JOIN Formulario1116B_Detalle ON Formulario1116B_Cabecera.IDFormulario1116B = Formulario1116B_Detalle.IDFormulario1116B
		WHERE Formulario1116B_Cabecera.Fecha >= @FechaDesde AND Formulario1116B_Cabecera.Fecha <= @FechaHasta
		ORDER BY Formulario1116B_Detalle.FormularioFecha, Formulario1116B_Detalle.FormularioNumero
END
GO