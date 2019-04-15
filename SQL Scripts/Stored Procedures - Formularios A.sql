USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-16
-- Description:	Obtiene los datos de un Formulario 1116A
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116A_Get') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116A_Get
GO

CREATE PROCEDURE usp_Formulario1116A_Get
	@IDFormulario1116A int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT IDFormulario1116A, IDFormulario1116_Talonario, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, IDCosecha, IDCereal, TarifaGastoGeneral, TarifaZarandeo, TarifaSecadoDesde, TarifaSecadoHasta, TarifaSecado, TarifaSecadoPuntoExceso, TarifaOtro, Origen_IDPartido, LugarEntregaDescripcion, LugarEntregaIDProvincia, LugarYFecha, PesoBruto, MermaVolatilPorcentaje, MermaVolatilKilogramo, MermaSecadoPorcentaje, MermaSecadoKilogramo, MermaZarandeoPorcentaje, MermaZarandeoKilogramo, MermaTotal, PesoNeto, GastoGeneral, GastoSecado, GastoZarandeo, GastoOtro, GastoIVARI, GastoIVARNI, GastoTotal, GastoIDCondicionPago, KilogramoAplicado
		FROM Formulario1116A_Cabecera
		WHERE IDFormulario1116A = @IDFormulario1116A
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-16
-- Description:	Obtiene los datos de un Formulario 1116A a partir del número de formulario
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116A_GetByFormularioNumero') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116A_GetByFormularioNumero
GO

CREATE PROCEDURE usp_Formulario1116A_GetByFormularioNumero
	@FormularioNumero char(13)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDFormulario1116A, IDFormulario1116_Talonario, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, IDCosecha, IDCereal, TarifaGastoGeneral, TarifaZarandeo, TarifaSecadoDesde, TarifaSecadoHasta, TarifaSecado, TarifaSecadoPuntoExceso, TarifaOtro, Origen_IDPartido, LugarEntregaDescripcion, LugarEntregaIDProvincia, LugarYFecha, PesoBruto, MermaVolatilPorcentaje, MermaVolatilKilogramo, MermaSecadoPorcentaje, MermaSecadoKilogramo, MermaZarandeoPorcentaje, MermaZarandeoKilogramo, MermaTotal, PesoNeto, GastoGeneral, GastoSecado, GastoZarandeo, GastoOtro, GastoIVARI, GastoIVARNI, GastoTotal, GastoIDCondicionPago, KilogramoAplicado
		FROM Formulario1116A_Cabecera
		WHERE FormularioNumero = @FormularioNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-23
-- Description:	Agrega un Formulario 1116A con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116A_Add') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116A_Add
GO

CREATE PROCEDURE usp_Formulario1116A_Add
	@IDFormulario1116A int OUTPUT,
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
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@TarifaGastosGenerales money,
	@TarifaZarandeo money,
	@TarifaSecadoDesde decimal(3,1),
	@TarifaSecadoHasta decimal(3,1),
	@TarifaSecado money,
	@TarifaSecadoPuntoExceso money,
	@TarifaOtro money,
	@Origen_IDPartido smallint,
	@LugarEntregaDescripcion varchar(100),
	@LugarEntregaIDProvincia char(1),
	@LugarYFecha varchar(100),
	@GastoGeneral money,
	@GastoSecado money,
	@GastoZarandeo money,
	@GastoOtro money,
	@GastoIVARI money,
	@GastoIVARNI money,
	@GastoTotal money,
	@GastoIDCondicionPago smallint,
	@StringListOfIDMovimiento_Cereal varchar(1000)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Pos int = 0
	DECLARE @Len int
	DECLARE @Value varchar(10)
	DECLARE @Formulario_Detalle__IDRemesa tinyint = 0
	DECLARE @Formulario_Detalle__IDMovimiento_Cereal int
	
	DECLARE @Formulario_Detalle TABLE(IDRemesa int PRIMARY KEY, IDMovimiento_Cereal int NOT NULL)
	
	BEGIN TRY
	
		BEGIN TRANSACTION
			--PARSEO LOS Movimiento_CerealS Y LOS GUARDO EN UNA TABLA LOCAL
			WHILE CHARINDEX('|', @StringListOfIDMovimiento_Cereal, @Pos + 1) > 0
				BEGIN
					SET @Len = CHARINDEX('|', @StringListOfIDMovimiento_Cereal, @Pos + 1) - @Pos
					SET @Value = SUBSTRING(@StringListOfIDMovimiento_Cereal, @Pos, @Len)
					SET @Formulario_Detalle__IDMovimiento_Cereal = CAST(@Value AS int)
					SET @Formulario_Detalle__IDRemesa = @Formulario_Detalle__IDRemesa + 1
					
					INSERT INTO @Formulario_Detalle
						VALUES (@Formulario_Detalle__IDRemesa, @Formulario_Detalle__IDMovimiento_Cereal)
					
					SET @Pos = CHARINDEX('|', @StringListOfIDMovimiento_Cereal, @Pos + @Len) + 1
				END
			
			--OBTENGO EL NUEVO ID DEL FORMULARIO
			SET @IDFormulario1116A = (SELECT ISNULL(MAX(IDFormulario1116A), 0) + 1 FROM Formulario1116A_Cabecera)
			
			--AGREGO EL FORMULARIO A CON LOS TOTALES OBTENIDOS DE LOS Movimiento_CerealS
			INSERT INTO Formulario1116A_Cabecera
				(IDFormulario1116A, IDFormulario1116_Talonario, FormularioNumero, Fecha, DepositarioIDEntidad, DepositarioIDPlanta, DepositanteIDEntidad, DepositanteRazonSocial, DepositanteDomicilioTipo, DepositanteDomicilioCalle, DepositanteDomicilioNumero, DepositanteDomicilioPiso, DepositanteDomicilioOficina, DepositanteDomicilioCodigoPostal, DepositanteDomicilioIDLocalidad, DepositanteCUIT, DepositanteIIBB, DepositanteIDCategoriaIVA, IDCosecha, IDCereal, TarifaGastoGeneral, TarifaZarandeo, TarifaSecadoDesde, TarifaSecadoHasta, TarifaSecado, TarifaSecadoPuntoExceso, TarifaOtro, Origen_IDPartido, LugarEntregaDescripcion, LugarEntregaIDProvincia, LugarYFecha, PesoBruto, MermaVolatilPorcentaje, MermaVolatilKilogramo, MermaSecadoPorcentaje, MermaSecadoKilogramo, MermaZarandeoPorcentaje, MermaZarandeoKilogramo, MermaTotal, PesoNeto, GastoGeneral, GastoSecado, GastoZarandeo, GastoOtro, GastoIVARI, GastoIVARNI, GastoTotal, GastoIDCondicionPago, KilogramoAplicado)
				SELECT @IDFormulario1116A, @IDFormulario1116_Talonario, @FormularioNumero, @Fecha, @DepositarioIDEntidad, @DepositarioIDPlanta, @DepositanteIDEntidad, @DepositanteRazonSocial, @DepositanteDomicilioTipo, @DepositanteDomicilioCalle, @DepositanteDomicilioNumero, @DepositanteDomicilioPiso, @DepositanteDomicilioOficina, @DepositanteDomicilioCodigoPostal, @DepositanteDomicilioIDLocalidad, @DepositanteCUIT, @DepositanteIIBB, @DepositanteIDCategoriaIVA, @IDCosecha, @IDCereal, @TarifaGastosGenerales, @TarifaZarandeo, @TarifaSecadoDesde, @TarifaSecadoHasta, @TarifaSecado, @TarifaSecadoPuntoExceso, @TarifaOtro, @Origen_IDPartido, @LugarEntregaDescripcion, @LugarEntregaIDProvincia, @LugarYFecha, ISNULL(SUM(Movimiento_Cereal.PesoNeto), 0), ROUND(ISNULL(AVG(Movimiento_Cereal.Volatil), 0), 2), ISNULL(SUM(Movimiento_Cereal.MermaVolatilKilogramo), 0), ROUND(ISNULL(AVG(Movimiento_Cereal.MermaHumedadPorcentaje), 0), 2), ISNULL(SUM(Movimiento_Cereal.MermaHumedadKilogramo), 0), ROUND(ISNULL(AVG(Movimiento_Cereal.Zaranda), 0), 2), ISNULL(SUM(Movimiento_Cereal.MermaZarandaKilogramo), 0), ISNULL(SUM(Movimiento_Cereal.MermaVolatilKilogramo), 0) + ISNULL(SUM(Movimiento_Cereal.MermaHumedadKilogramo), 0) + ISNULL(SUM(Movimiento_Cereal.MermaZarandaKilogramo), 0), ISNULL(SUM(Movimiento_Cereal.PesoFinal), 0), @GastoGeneral, @GastoSecado, @GastoZarandeo, @GastoOtro, @GastoIVARI, @GastoIVARNI, @GastoTotal, @GastoIDCondicionPago, 0
					FROM Movimiento_Cereal INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario_Detalle.IDMovimiento_Cereal
					WHERE Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND Movimiento_Cereal.Certificado = 0
			
			--AGREGO EL DETALLE DE CARTAS DE PORTE DEL FORMULARIO
			INSERT INTO Formulario1116A_Detalle
				SELECT @IDFormulario1116A, Formulario_Detalle.IDRemesa, Formulario_Detalle.IDMovimiento_Cereal
					FROM Movimiento_Cereal INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario_Detalle.IDMovimiento_Cereal
					WHERE Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND Movimiento_Cereal.Certificado = 0
					
			--ACTUALIZO EL CAMPO CERTIFICADO DE LOS Movimiento_CerealS AFECTADOS AL FORMULARIO
			UPDATE Movimiento_Cereal
				SET Movimiento_Cereal.Certificado = 1
					FROM Movimiento_Cereal INNER JOIN @Formulario_Detalle AS Formulario_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario_Detalle.IDMovimiento_Cereal
					WHERE Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND Movimiento_Cereal.Certificado = 0

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
-- Create date: 2013-08-23
-- Description:	Elimina un Formulario 1116A con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116A_Delete') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116A_Delete
GO

CREATE PROCEDURE usp_Formulario1116A_Delete
	@IDFormulario1116A int
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
	
		BEGIN TRANSACTION
	
			--ACTUALIZO EL CAMPO CERTIFICADO DE LOS Movimiento_CerealS AFECTADOS AL FORMULARIO
			UPDATE Movimiento_Cereal
				SET Movimiento_Cereal.Certificado = 0
				FROM Movimiento_Cereal INNER JOIN Formulario1116A_Detalle ON Movimiento_Cereal.IDMovimiento_Cereal = Formulario1116A_Detalle.IDMovimiento_Cereal
				WHERE Formulario1116A_Detalle.IDFormulario1116A = @IDFormulario1116A AND Movimiento_Cereal.Certificado = 1
			
			--ELIMINO EL DETALLE DE CARTAS DE PORTE DEL FORMULARIO
			DELETE
				FROM Formulario1116A_Detalle
				WHERE IDFormulario1116A = @IDFormulario1116A
			
			--ELIMINO EL FORMULARIO A
			DELETE
				FROM Formulario1116A_Cabecera
				WHERE IDFormulario1116A = @IDFormulario1116A
	
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
-- Create date: 2013-08-25
-- Description:	Datos para el Reporte del Formulario 1116A
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116A_Report') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116A_Report
GO

CREATE PROCEDURE usp_Formulario1116A_Report
	@IDFormulario1116A int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT Formulario1116A_Cabecera.Fecha, Formulario1116A_Cabecera.FormularioNumero
		--DEPOSITANTE
		, Formulario1116A_Cabecera.DepositanteIDEntidad AS DepositanteCodigoCliente, Formulario1116A_Cabecera.DepositanteRazonSocial, dbo.udf_GetDomicilioCompleto(Formulario1116A_Cabecera.DepositanteDomicilioCalle, Formulario1116A_Cabecera.DepositanteDomicilioNumero, Formulario1116A_Cabecera.DepositanteDomicilioPiso, Formulario1116A_Cabecera.DepositanteDomicilioOficina) AS DepositanteDomicilioCompleto, Formulario1116A_Cabecera.DepositanteDomicilioCalle, Formulario1116A_Cabecera.DepositanteDomicilioNumero, Formulario1116A_Cabecera.DepositanteDomicilioPiso, Formulario1116A_Cabecera.DepositanteDomicilioOficina, dbo.udf_GetCodigoPostalLocalidad(Formulario1116A_Cabecera.DepositanteDomicilioCodigoPostal, DepositanteLocalidad.Nombre) AS DepositanteCodigoPostalYLocalidad, Formulario1116A_Cabecera.DepositanteDomicilioCodigoPostal, DepositanteLocalidad.Nombre AS DepositanteDomicilioLocalidad, DepositanteProvincia.Nombre AS DepositanteDomicilioProvincia, Formulario1116A_Cabecera.DepositanteCUIT, Formulario1116A_Cabecera.DepositanteIIBB, CategoriaIVA.Nombre AS DepositanteCondicionIVA
		--CEREAL
		, Cereal.ONCCA_EspecieNombre AS CerealNombre, Cereal.ONCCA_GranoTipoNombre AS CerealTipo, Cereal.ONCCA_EspecieCodigo AS CerealCodigo
		--TARIFAS
		, Formulario1116A_Cabecera.TarifaGastoGeneral, Formulario1116A_Cabecera.TarifaZarandeo, Formulario1116A_Cabecera.TarifaSecadoDesde, Formulario1116A_Cabecera.TarifaSecadoHasta, Formulario1116A_Cabecera.TarifaSecado, Formulario1116A_Cabecera.TarifaSecadoPuntoExceso, Formulario1116A_Cabecera.TarifaOtro
		--DATOS OPERACIÓN
		, OrigenPartido.Nombre AS OrigenPartido, OrigenProvincia.Nombre AS OrigenProvincia, Formulario1116A_Cabecera.LugarEntregaDescripcion, LugarEntregaProvincia.Nombre AS LugarEntregaProvincia, Formulario1116A_Cabecera.LugarYFecha
		--MERMAS Y KILOGRAMOS FINALES
		, Formulario1116A_Cabecera.PesoBruto, Formulario1116A_Cabecera.MermaVolatilPorcentaje, Formulario1116A_Cabecera.MermaVolatilKilogramo, Formulario1116A_Cabecera.MermaSecadoPorcentaje, Formulario1116A_Cabecera.MermaSecadoKilogramo, Formulario1116A_Cabecera.MermaZarandeoPorcentaje, Formulario1116A_Cabecera.MermaZarandeoKilogramo, Formulario1116A_Cabecera.MermaTotal, Formulario1116A_Cabecera.PesoNeto
		--GASTOS
		, Formulario1116A_Cabecera.GastoGeneral, Formulario1116A_Cabecera.GastoSecado, Formulario1116A_Cabecera.GastoZarandeo, Formulario1116A_Cabecera.GastoOtro, Formulario1116A_Cabecera.GastoIVARI, Formulario1116A_Cabecera.GastoIVARNI, Formulario1116A_Cabecera.GastoTotal, CondicionPago.Nombre AS GastoCondicionPago
		--DETALLE DE CARTAS DE PORTES
		, Formulario1116A_Detalle.IDRemesa AS RemesaOrden, Movimiento_Cereal.FechaHoraArribo AS RemesaFecha, Movimiento_Cereal.ComprobanteNumero AS RemesaRomaneo, Movimiento_Cereal.PesoNeto AS RemesaKgsBrutos, Movimiento_Cereal.MermaZarandaKilogramo AS RemesaZarandeoMermaKgs, Movimiento_Cereal_Calculo.ZarandeoTarifa AS RemesaZarandeoTarifa, Movimiento_Cereal_Calculo.ZarandeoImporte AS RemesaZarandeoImporte, Movimiento_Cereal.Humedad AS RemesaSecadoHumedad, Movimiento_Cereal.MermaHumedadKilogramo AS RemesaSecadoMermaKgs, (Movimiento_Cereal_Calculo.SecadoTarifa + Movimiento_Cereal_Calculo.SecadoExcesoTarifa) AS RemesaSecadoTarifa, (Movimiento_Cereal_Calculo.SecadoImporte + Movimiento_Cereal_Calculo.SecadoExcesoImporte) AS RemesaSecadoImporte
		FROM ((((((((((Formulario1116A_Cabecera INNER JOIN Formulario1116A_Detalle ON Formulario1116A_Cabecera.IDFormulario1116A = Formulario1116A_Detalle.IDFormulario1116A) INNER JOIN Movimiento_Cereal ON Formulario1116A_Detalle.IDMovimiento_Cereal = Movimiento_Cereal.IDMovimiento_Cereal) LEFT JOIN Movimiento_Cereal_Calculo ON Movimiento_Cereal.IDMovimiento_Cereal = Movimiento_Cereal_Calculo.IDMovimiento_Cereal) INNER JOIN Localidad AS DepositanteLocalidad ON Formulario1116A_Cabecera.DepositanteDomicilioIDLocalidad = DepositanteLocalidad.IDLocalidad) INNER JOIN Provincia AS DepositanteProvincia ON DepositanteLocalidad.IDProvincia = DepositanteProvincia.IDProvincia) INNER JOIN CategoriaIVA ON Formulario1116A_Cabecera.DepositanteIDCategoriaIVA = CategoriaIVA.IDCategoriaIVA) INNER JOIN Partido AS OrigenPartido ON Formulario1116A_Cabecera.Origen_IDPartido = OrigenPartido.IDPartido) INNER JOIN Provincia AS OrigenProvincia ON OrigenPartido.IDProvincia = OrigenProvincia.IDProvincia) INNER JOIN Provincia AS LugarEntregaProvincia ON Formulario1116A_Cabecera.LugarEntregaIDProvincia = LugarEntregaProvincia.IDProvincia) INNER JOIN Cereal ON Formulario1116A_Cabecera.IDCereal = Cereal.IDCereal) INNER JOIN CondicionPago ON Formulario1116A_Cabecera.GastoIDCondicionPago = CondicionPago.IDCondicionPago
		WHERE Formulario1116A_Cabecera.IDFormulario1116A = @IDFormulario1116A
		ORDER BY Formulario1116A_Detalle.IDRemesa
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-15
-- Description:	Obtiene los datos de la Cabecera de los Formularios 1116A para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116A_Cabecera_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116A_Cabecera_ListForExport
GO

CREATE PROCEDURE usp_Formulario1116A_Cabecera_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario1116A_Cabecera.FormularioNumero AS NumeroCertificado, Planta.ONCCA_Codigo AS CodigoEstablecimiento
		, Formulario1116A_Cabecera.DepositanteCUIT AS CUITProductor, Formulario1116A_Cabecera.DepositanteRazonSocial AS RazonSocialProductor, Formulario1116A_Cabecera.DepositanteDomicilioTipo AS TipoDomicilioProductor, Formulario1116A_Cabecera.DepositanteDomicilioCalle AS CalleORutaProductor, Formulario1116A_Cabecera.DepositanteDomicilioNumero AS NumeroOKilometroProductor, Formulario1116A_Cabecera.DepositanteDomicilioPiso AS PisoProductor, Formulario1116A_Cabecera.DepositanteDomicilioOficina AS OficinaODepartamentoProductor, Formulario1116A_Cabecera.DepositanteDomicilioIDLocalidad AS CodigoLocalidadProductor, Productor_Localidad.IDPartido AS CodigoPartidoProductor, Formulario1116A_Cabecera.DepositanteDomicilioCodigoPostal AS CodigoPostalProductor
		, Cereal.ONCCA_EspecieCodigo AS CodigoEspecie, Cosecha.ONCCA_Codigo AS Cosecha
		, 0 AS AlmacenajeDiasLibres, 0 AS TarifaAlmacenajeCada100Kg, 0 AS GastosGenerales, 0 AS Zarandeo, 0 AS SecadoDe, 0 AS SecadoHasta, 0 AS TarifaSecado, 0 AS PuntoExceso, 0 AS TarifaOtros
		, Formulario1116A_Cabecera.Origen_IDPartido AS CodigoPartidoOrigen, Planta_Localidad.IDPartido AS CodigoPartidoEntrega
		, '' AS NumeroAnalisis, 0 AS NumeroBoletin, CAST(NULL AS date) AS FechaAnalisis, 0 AS Grado, 0 AS Factor, 0 AS ContenidoProteico, '' AS CUITLaboratorio, '' AS NombreLaboratorio
		, Formulario1116A_Cabecera.PesoBruto, Formulario1116A_Cabecera.MermaVolatilKilogramo, Formulario1116A_Cabecera.MermaZarandeoKilogramo, Formulario1116A_Cabecera.MermaSecadoKilogramo, Formulario1116A_Cabecera.PesoNeto
		, Formulario1116A_Cabecera.Fecha AS FechaCierre, 0 AS ImporteIVAServicios, 0 AS TotalServicios, Formulario1116_Talonario.CAC AS NumeroCAC
		FROM (((((Formulario1116A_Cabecera INNER JOIN Formulario1116_Talonario ON Formulario1116A_Cabecera.IDFormulario1116_Talonario = Formulario1116_Talonario.IDFormulario1116_Talonario) INNER JOIN Entidad_OrigenDestino AS Planta ON Formulario1116A_Cabecera.DepositarioIDEntidad = Planta.IDEntidad AND Formulario1116A_Cabecera.DepositarioIDPlanta = Planta.IDOrigenDestino) INNER JOIN Localidad AS Planta_Localidad ON Planta.IDLocalidad = Planta_Localidad.IDLocalidad) INNER JOIN Localidad AS Productor_Localidad ON Formulario1116A_Cabecera.DepositanteDomicilioIDLocalidad = Productor_Localidad.IDLocalidad) INNER JOIN Cereal ON Formulario1116A_Cabecera.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Formulario1116A_Cabecera.IDCosecha = Cosecha.IDCosecha
		WHERE Formulario1116A_Cabecera.Fecha >= @FechaDesde AND Formulario1116A_Cabecera.Fecha <= @FechaHasta
		ORDER BY Formulario1116A_Cabecera.Fecha, Formulario1116A_Cabecera.FormularioNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-16
-- Description:	Obtiene los datos del Detalle de los Formularios 1116A para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116A_Detalle_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116A_Detalle_ListForExport
GO

CREATE PROCEDURE usp_Formulario1116A_Detalle_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario1116A_Cabecera.FormularioNumero AS NumeroCertificado, Movimiento_Cereal.ComprobanteNumero AS NumeroCartaPorte, Formulario1116A_Cabecera.FormularioNumero AS NumeroCertificadoAsociado, Movimiento_Cereal.PesoNeto AS KilogramosBrutos, Movimiento_Cereal.FechaHoraArribo AS FechaRemesa
		FROM (Formulario1116A_Cabecera INNER JOIN Formulario1116A_Detalle ON Formulario1116A_Cabecera.IDFormulario1116A = Formulario1116A_Detalle.IDFormulario1116A) INNER JOIN Movimiento_Cereal ON Formulario1116A_Detalle.IDMovimiento_Cereal = Movimiento_Cereal.IDMovimiento_Cereal
		WHERE Formulario1116A_Cabecera.Fecha >= @FechaDesde AND Formulario1116A_Cabecera.Fecha <= @FechaHasta
		ORDER BY Formulario1116A_Cabecera.Fecha, Formulario1116A_Detalle.IDRemesa
END
GO