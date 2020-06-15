USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	11/11/2013 00:16:36
-- Updated:	
-- Description: Obtiene los datos del Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Get
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Get
	@IDMovimiento_SubProducto int 
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Movimiento_SubProducto.IDMovimiento_SubProducto, Movimiento_SubProducto.Tipo, Movimiento_SubProducto.ComprobanteNumero, Movimiento_SubProducto.Fecha, Movimiento_SubProducto.COTNumero, Movimiento_SubProducto.IDEntidad_Titular, Movimiento_SubProducto.IDEntidad_Destinatario, Movimiento_SubProducto.IDEntidad_Transportista, Movimiento_SubProducto.IDEntidad_Chofer, Movimiento_SubProducto.IDOrigenDestino_Origen, Movimiento_SubProducto.IDOrigenDestino_Destino, Movimiento_SubProducto.IDMovimiento_Cereal, Movimiento_SubProducto.CotizacionDolarFecha, Movimiento_SubProducto.CotizacionDolarImporte, Movimiento_SubProducto.TransporteDominioCamion, Movimiento_SubProducto.TransporteDominioAcoplado, Movimiento_SubProducto.TransporteKilometro, Movimiento_SubProducto.TransporteTarifaReferencia, Movimiento_SubProducto.TransporteTarifa, Movimiento_SubProducto.EsCanje, Movimiento_SubProducto.FacturaNumero, Movimiento_SubProducto.Notas, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion
		FROM Movimiento_SubProducto
		WHERE Movimiento_SubProducto.IDMovimiento_SubProducto = @IDMovimiento_SubProducto 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	11/11/2013 00:16:36
-- Updated:	
-- Description: Agrega un Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Add
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Add
	@IDMovimiento_SubProducto int OUTPUT, 
	@Tipo char(1),
	@ComprobanteNumero varchar(13), 
	@Fecha date, 
	@COTNumero varchar(16), 
	@IDEntidad_Titular int, 
	@IDEntidad_Destinatario int, 
	@IDEntidad_Transportista int, 
	@IDEntidad_Chofer int, 
	@IDOrigenDestino_Origen smallint, 
	@IDOrigenDestino_Destino smallint, 
	@IDMovimiento_Cereal int, 
	@CotizacionDolarFecha date, 
	@CotizacionDolarImporte money, 
	@TransporteDominioCamion char(7),
	@TransporteDominioAcoplado char(7),
	@TransporteKilometro smallint, 
	@TransporteTarifaReferencia money, 
	@TransporteTarifa money,
	@EsCanje bit,
	@FacturaNumero varchar(13),
	@Notas varchar(1000),
	@IDUsuario tinyint,
	@StringList varchar(1000)
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @SeparatorPos int = 0
	DECLARE @DelimiterPosStart int = 0
	DECLARE @DelimiterPosEnd int = 0
	DECLARE @ValuePairLen int
	DECLARE @ValuePair varchar(25)

	DECLARE @Linea tinyint
	DECLARE @IDSubProducto tinyint = 0
	DECLARE @Kilogramo int
	DECLARE @PrecioToneladaDolar money
	DECLARE @PrecioToneladaPeso money
	
	BEGIN TRY
	
		BEGIN TRANSACTION
			--OBTENGO EL NUEVO ID DEL MOVIMIENTO
			SET @IDMovimiento_SubProducto = (SELECT ISNULL(MAX(IDMovimiento_SubProducto), 0) + 1 FROM Movimiento_SubProducto)

			--INSERTO EL MOVIMIENTO
			INSERT INTO Movimiento_SubProducto
				(IDMovimiento_SubProducto, Tipo, ComprobanteNumero, Fecha, COTNumero, IDEntidad_Titular, IDEntidad_Destinatario, IDEntidad_Transportista, IDEntidad_Chofer, IDOrigenDestino_Origen, IDOrigenDestino_Destino, IDMovimiento_Cereal, CotizacionDolarFecha, CotizacionDolarImporte, TransporteDominioCamion, TransporteDominioAcoplado, TransporteKilometro, TransporteTarifaReferencia, TransporteTarifa, EsCanje, FacturaNumero, Notas, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion)
				VALUES (@IDMovimiento_SubProducto, @Tipo, @ComprobanteNumero, @Fecha, @COTNumero, @IDEntidad_Titular, @IDEntidad_Destinatario, @IDEntidad_Transportista, @IDEntidad_Chofer, @IDOrigenDestino_Origen, @IDOrigenDestino_Destino, @IDMovimiento_Cereal, @CotizacionDolarFecha, @CotizacionDolarImporte, @TransporteDominioCamion, @TransporteDominioAcoplado, @TransporteKilometro, @TransporteTarifaReferencia, @TransporteTarifa, @EsCanje, @FacturaNumero, @Notas, @IDUsuario, GETDATE(), @IDUsuario, GETDATE())
		
			--PARSEO LOS ITEMS Y LOS AGREGO A LA TABLA DE DETALLE DE SUBPRODUCTOS
			WHILE CHARINDEX('|', @StringList, @SeparatorPos + 1) > 0
				BEGIN				
					SET @ValuePairLen = CHARINDEX('|', @StringList, @SeparatorPos + 1) - @SeparatorPos
					SET @ValuePair = SUBSTRING(@StringList, @SeparatorPos, @ValuePairLen)
					
					--LÍNEA
					SET @Linea = (SELECT ISNULL(MAX(Linea), 0) + 1 FROM Movimiento_SubProducto_Detalle WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto)
					
					--ID SUB PRODUCTO
					SET @DelimiterPosStart = CHARINDEX('¬', @ValuePair, 1)
					IF @DelimiterPosStart > 0
						SET @IDSubProducto = CAST(SUBSTRING(@ValuePair, 1, @DelimiterPosStart - 1) AS tinyint)
					
					--KILOGRAMO
					SET @DelimiterPosEnd = CHARINDEX('¬', @ValuePair, @DelimiterPosStart + 1)
					SET @Kilogramo = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS int)
					IF @Tipo = 'S' OR @Tipo = 'B'
						SET @Kilogramo = @Kilogramo * -1
					
					--PRECIO TONELADA DOLAR
					SET @DelimiterPosStart = @DelimiterPosEnd
					SET @DelimiterPosEnd = CHARINDEX('¬', @ValuePair, @DelimiterPosStart + 1)
					IF SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) = 'NULL'
						SET @PrecioToneladaDolar = NULL
					ELSE
						SET @PrecioToneladaDolar = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS money)
					
					--PRECIO TONELADA PESO
					SET @DelimiterPosStart = @DelimiterPosEnd
					IF SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 10) = 'NULL'
						SET @PrecioToneladaPeso = NULL
					ELSE
						SET @PrecioToneladaPeso = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 10) AS money)
					
					--INSERTO EL DETALLE DEL MOVIMIENTO
					INSERT INTO Movimiento_SubProducto_Detalle
						(IDMovimiento_SubProducto, Linea, IDSubProducto, Kilogramo, PrecioToneladaDolar, PrecioToneladaPeso)
						VALUES (@IDMovimiento_SubProducto, @Linea, @IDSubProducto, @Kilogramo, @PrecioToneladaDolar, @PrecioToneladaPeso)
					
					SET @SeparatorPos = CHARINDEX('|', @StringList, @SeparatorPos + @ValuePairLen) + 1
				END
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
-- Created:	11/11/2013 00:16:36
-- Updated:	30/07/2016 20:20
-- Description: Actualiza los datos del Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Update
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Update
	@IDMovimiento_SubProducto int,
	@Tipo char(1),
	@ComprobanteNumero varchar(13),
	@Fecha date,
	@COTNumero varchar(16),
	@IDEntidad_Titular int,
	@IDEntidad_Destinatario int,
	@IDEntidad_Transportista int,
	@IDEntidad_Chofer int,
	@IDOrigenDestino_Origen smallint,
	@IDOrigenDestino_Destino smallint,
	@IDMovimiento_Cereal int,
	@CotizacionDolarFecha date,
	@CotizacionDolarImporte money,
	@TransporteDominioCamion char(7),
	@TransporteDominioAcoplado char(7),
	@TransporteKilometro smallint,
	@TransporteTarifaReferencia money,
	@TransporteTarifa money,
	@EsCanje bit,
	@FacturaNumero varchar(13),
	@Notas varchar(1000),
	@IDUsuario tinyint,
	@StringList varchar(1000)
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @SeparatorPos int = 0
	DECLARE @DelimiterPosStart int = 0
	DECLARE @DelimiterPosEnd int = 0
	DECLARE @ValuePairLen int
	DECLARE @ValuePair varchar(25)

	DECLARE @Linea tinyint
	DECLARE @IDSubProducto tinyint = 0
	DECLARE @Kilogramo int
	DECLARE @PrecioToneladaDolar money
	DECLARE @PrecioToneladaPeso money
	
	BEGIN TRY
	
		BEGIN TRANSACTION
			--ACTUALIZO EL MOVIMIENTO
			UPDATE Movimiento_SubProducto
				SET ComprobanteNumero = @ComprobanteNumero, Fecha = @Fecha, COTNumero = @COTNumero, IDEntidad_Titular = @IDEntidad_Titular, IDEntidad_Destinatario = @IDEntidad_Destinatario, IDEntidad_Transportista = @IDEntidad_Transportista, IDEntidad_Chofer = @IDEntidad_Chofer, IDOrigenDestino_Origen = @IDOrigenDestino_Origen, IDOrigenDestino_Destino = @IDOrigenDestino_Destino, IDMovimiento_Cereal = @IDMovimiento_Cereal, CotizacionDolarFecha = @CotizacionDolarFecha, CotizacionDolarImporte = @CotizacionDolarImporte, TransporteDominioCamion = @TransporteDominioCamion, TransporteDominioAcoplado = @TransporteDominioAcoplado, TransporteKilometro = @TransporteKilometro, TransporteTarifaReferencia = @TransporteTarifaReferencia, TransporteTarifa = @TransporteTarifa, EsCanje = @EsCanje, FacturaNumero = @FacturaNumero, Notas = @Notas, IDUsuarioModificacion = @IDUsuario, FechaHoraModificacion = GETDATE()
				WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto 

			--ELIMINO LOS DETALLES DE SUBPRODUCTOS, AUNQUE NO ES LO MÁS EFICIENTE, ES LO MÁS SIMPLE
			DELETE
				FROM Movimiento_SubProducto_Detalle
				WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto

			--PARSEO LOS ITEMS Y PARA AGREGARLOS A LA TABLA DE DETALLE DE SUBPRODUCTOS
			WHILE CHARINDEX('|', @StringList, @SeparatorPos + 1) > 0
				BEGIN				
					SET @ValuePairLen = CHARINDEX('|', @StringList, @SeparatorPos + 1) - @SeparatorPos
					SET @ValuePair = SUBSTRING(@StringList, @SeparatorPos, @ValuePairLen)

					--LÍNEA
					SET @Linea = (SELECT ISNULL(MAX(Linea), 0) + 1 FROM Movimiento_SubProducto_Detalle WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto)
										
					--ID SUB PRODUCTO
					SET @DelimiterPosStart = CHARINDEX('¬', @ValuePair, 1)
					IF @DelimiterPosStart > 0
						SET @IDSubProducto = CAST(SUBSTRING(@ValuePair, 1, @DelimiterPosStart - 1) AS tinyint)
					
					--KILOGRAMO
					SET @DelimiterPosEnd = CHARINDEX('¬', @ValuePair, @DelimiterPosStart + 1)
					SET @Kilogramo = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS int)
					IF @Tipo = 'S' OR @Tipo = 'B'
						SET @Kilogramo = @Kilogramo * -1
					
					--PRECIO TONELADA DOLAR
					SET @DelimiterPosStart = @DelimiterPosEnd
					SET @DelimiterPosEnd = CHARINDEX('¬', @ValuePair, @DelimiterPosStart + 1)
					IF SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) = 'NULL'
						SET @PrecioToneladaDolar = NULL
					ELSE
						SET @PrecioToneladaDolar = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS money)
					
					--PRECIO TONELADA PESO
					SET @DelimiterPosStart = @DelimiterPosEnd
					IF SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 10) = 'NULL'
						SET @PrecioToneladaPeso = NULL
					ELSE
						SET @PrecioToneladaPeso = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 10) AS money)

					--INSERTO EL DETALLE DEL MOVIMIENTO
					INSERT INTO Movimiento_SubProducto_Detalle
						(IDMovimiento_SubProducto, Linea, IDSubProducto, Kilogramo, PrecioToneladaDolar, PrecioToneladaPeso)
						VALUES (@IDMovimiento_SubProducto, @Linea, @IDSubProducto, @Kilogramo, @PrecioToneladaDolar, @PrecioToneladaPeso)
					
					SET @SeparatorPos = CHARINDEX('|', @StringList, @SeparatorPos + @ValuePairLen) + 1
				END
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
-- Created:	11/11/2013 00:16
-- Updated:	13/11/2013 23:27
-- Description: Elimina un Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Delete
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Delete 
	@IDMovimiento_SubProducto int AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION
			--ELIMINO LOS DETALLES DEL MOVIMIENTO DE SUBPRODUCTO
			DELETE
				FROM Movimiento_SubProducto_Detalle
				WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto 
		
			--ELIMINO EL MOVIMIENTO DE SUBPRODUCTO
			DELETE
				FROM Movimiento_SubProducto
				WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto

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
-- Created:	04/11/2013 20:37:51
-- Updated:	
-- Description: Obtiene los datos del Detalle del Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Detalle_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Detalle_Get
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Detalle_Get
	@IDMovimiento_SubProducto int, 
	@Linea tinyint 
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto, Movimiento_SubProducto_Detalle.Linea, Movimiento_SubProducto_Detalle.IDSubProducto, Movimiento_SubProducto_Detalle.Porcentaje, Movimiento_SubProducto_Detalle.Kilogramo, Movimiento_SubProducto_Detalle.PrecioToneladaDolar, Movimiento_SubProducto_Detalle.PrecioToneladaPeso
		FROM Movimiento_SubProducto_Detalle
		WHERE Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto = @IDMovimiento_SubProducto AND Movimiento_SubProducto_Detalle.Linea = @Linea 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	04/11/2013 20:37:51
-- Updated:	
-- Description: Agrega un Detalle del Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Detalle_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Detalle_Add
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Detalle_Add
	@IDMovimiento_SubProducto int OUTPUT, 
	@Linea tinyint OUTPUT, 
	@IDSubProducto tinyint, 
	@Porcentaje decimal(5), 
	@Kilogramo int, 
	@PrecioToneladaDolar money, 
	@PrecioToneladaPeso money 
AS

BEGIN
	SET NOCOUNT ON;

	SET @IDMovimiento_SubProducto = (SELECT ISNULL(MAX(Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto), 0) + 1 FROM Movimiento_SubProducto_Detalle)
	SET @Linea = (SELECT ISNULL(MAX(Movimiento_SubProducto_Detalle.Linea), 0) + 1 FROM Movimiento_SubProducto_Detalle)

	INSERT INTO Movimiento_SubProducto_Detalle
		(IDMovimiento_SubProducto, Linea, IDSubProducto, Porcentaje, Kilogramo, PrecioToneladaDolar, PrecioToneladaPeso )
		VALUES (@IDMovimiento_SubProducto, @Linea, @IDSubProducto, @Porcentaje, @Kilogramo, @PrecioToneladaDolar, @PrecioToneladaPeso )

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	04/11/2013 20:37:51
-- Updated:	
-- Description: Actualiza los datos del Detalle del Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Detalle_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Detalle_Update
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Detalle_Update
	@IDMovimiento_SubProducto int, 
	@Linea tinyint, 
	@IDSubProducto tinyint, 
	@Porcentaje decimal(5), 
	@Kilogramo int, 
	@PrecioToneladaDolar money, 
	@PrecioToneladaPeso money 
AS

BEGIN
	SET NOCOUNT ON;

	UPDATE Movimiento_SubProducto_Detalle
		SET IDSubProducto = @IDSubProducto, Porcentaje = @Porcentaje, Kilogramo = @Kilogramo, PrecioToneladaDolar = @PrecioToneladaDolar, PrecioToneladaPeso = @PrecioToneladaPeso
		WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto AND Linea = @Linea 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	04/11/2013 20:37:51
-- Updated:	
-- Description: Elimina un Detalle del Movimiento de SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Detalle_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Detalle_Delete
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Detalle_Delete 
	@IDMovimiento_SubProducto int, 
	@Linea tinyint AS
	
BEGIN
	SET NOCOUNT ON;

	DELETE
		FROM Movimiento_SubProducto_Detalle
		WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto AND Linea = @Linea 

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	25/02/2014 00:34
-- Updated:	
-- Description: Obtiene los datos para el Reporte de Remito de Venta
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Report_Remito') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Report_Remito
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Report_Remito 
	@IDMovimiento_SubProducto int AS
	
BEGIN
	SET NOCOUNT ON;

	SELECT Movimiento_SubProducto.ComprobanteNumero, Movimiento_SubProducto.Fecha, Movimiento_SubProducto.COTNumero, UPPER(Destinatario.Nombre) AS Destinatario_Nombre, Destinatario.CUIT AS Destinatario_CUIT, UPPER(dbo.udf_GetDomicilioCompleto(Destinatario_Domicilio.Calle, Destinatario_Domicilio.Numero, Destinatario_Domicilio.Piso, Destinatario_Domicilio.Oficina)) AS Destinatario_DomicilioCompleto, UPPER(dbo.udf_GetCodigoPostalLocalidad(Destinatario_Domicilio.CodigoPostal, Destinatario_Localidad.Nombre)) AS Destinatario_DomicilioLocalidad, UPPER(Destinatario_CategoriaIVA.Nombre) AS CategoriaIVANombre, UPPER(Destino.Direccion + ' - ' + Destino_Localidad.Nombre) AS Destino_Domicilio, ABS(Movimiento_SubProducto_Detalle.Kilogramo) AS SubProducto_Kilogramo, UPPER(SubProducto.Nombre) AS SubProductoNombre, UPPER(Transportista.Nombre) AS Transportista_Nombre, Transportista.CUIT AS Transportista_CUIT, Movimiento_SubProducto.TransporteDominioCamion, Movimiento_SubProducto.TransporteDominioAcoplado, UPPER(Chofer.Nombre) AS Chofer_Nombre, Chofer.CUIT AS Chofer_CUIL
		FROM ((((((((((Movimiento_SubProducto INNER JOIN Entidad AS Destinatario ON Movimiento_SubProducto.IDEntidad_Destinatario = Destinatario.IDEntidad) INNER JOIN Entidad_Impuesto AS Destinatario_Impuesto ON Destinatario.IDEntidad = Destinatario_Impuesto.IDEntidad) INNER JOIN CategoriaIVA AS Destinatario_CategoriaIVA ON Destinatario_Impuesto.IDCategoriaIVA = Destinatario_CategoriaIVA.IDCategoriaIVA) INNER JOIN Entidad_Domicilio AS Destinatario_Domicilio ON Destinatario.IDEntidad = Destinatario_Domicilio.IDEntidad) INNER JOIN Localidad AS Destinatario_Localidad ON Destinatario_Domicilio.IDLocalidad = Destinatario_Localidad.IDLocalidad) INNER JOIN Entidad_OrigenDestino AS Destino ON Movimiento_SubProducto.IDEntidad_Destinatario = Destino.IDEntidad AND Movimiento_SubProducto.IDOrigenDestino_Destino = Destino.IDOrigenDestino) INNER JOIN Localidad AS Destino_Localidad ON Destino.IDLocalidad = Destino_Localidad.IDLocalidad) INNER JOIN Entidad AS Transportista ON Movimiento_SubProducto.IDEntidad_Transportista = Transportista.IDEntidad) INNER JOIN Entidad AS Chofer ON Movimiento_SubProducto.IDEntidad_Chofer = Chofer.IDEntidad) INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE Movimiento_SubProducto.IDMovimiento_SubProducto = @IDMovimiento_SubProducto

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	23/03/2014 20:29
-- Updated:	
-- Description: Obtiene los datos para el Libro de Subproductos
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_Report_Libro') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_Report_Libro
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_Report_Libro 
	@IDSubProducto tinyint,
	@Anio smallint,
	@Mes tinyint AS
	
BEGIN
	DECLARE @SubProductoNombre varchar(50)
	DECLARE @PrimerDiaDelMes date
	DECLARE @SaldoAnterior int
	
	SET NOCOUNT ON;
	
	SET @SubProductoNombre = (SELECT Nombre FROM SubProducto WHERE IDSubProducto = @IDSubProducto)
	SET @PrimerDiaDelMes = CAST(CAST(@Anio AS char(4)) + '/' + CAST(@Mes AS varchar(2)) + '/01' AS date)
	SET @SaldoAnterior = (SELECT SUM(Movimiento_SubProducto_Detalle.Kilogramo)
							FROM Movimiento_SubProducto INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto
							WHERE Movimiento_SubProducto_Detalle.IDSubProducto = @IDSubProducto AND Movimiento_SubProducto.Fecha < @PrimerDiaDelMes)

	(SELECT @SubProductoNombre AS SubProductoNombre, '-' AS Tipo, NULL AS Fecha, '------------' AS ComprobanteNumero, NULL AS Destinatario_Nombre, @SaldoAnterior AS Kilogramo)
	UNION
	(SELECT SubProducto.Nombre AS SubProductoNombre,Movimiento_SubProducto.Tipo, Movimiento_SubProducto.Fecha, Movimiento_SubProducto.ComprobanteNumero, UPPER(Destinatario.Nombre) AS Destinatario_Nombre, Movimiento_SubProducto_Detalle.Kilogramo
		FROM ((Movimiento_SubProducto LEFT JOIN Entidad AS Destinatario ON Movimiento_SubProducto.IDEntidad_Destinatario = Destinatario.IDEntidad) INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE Movimiento_SubProducto_Detalle.IDSubProducto = @IDSubProducto AND YEAR(Movimiento_SubProducto.Fecha) = @Anio AND MONTH(Movimiento_SubProducto.Fecha) = @Mes)
	ORDER BY Fecha

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	24/03/2014 18:07
-- Updated:	
-- Description: Obtiene los datos para la planilla MC15_G del Minagri
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_MC15_G') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_MC15_G
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_MC15_G
	@IDEntidad int,
	@IDPlanta smallint,
	@Anio smallint,
	@Mes tinyint AS
	
BEGIN	
	SET NOCOUNT ON;
		
	(SELECT Cereal.ONCCA_EspecieCodigo AS EspecieCodigo, Cereal.ONCCA_EspecieNombre AS EspecieNombre, Cosecha.ONCCA_Codigo AS Cosecha, (CASE Movimiento_Cereal.Tipo WHEN 'E' THEN Entidad_Destinatario.CUIT ELSE Entidad_Titular.CUIT END) AS CUIT_Usuario
		, 'Entradas Especie' AS TipoValor
		, CAST(ROUND(CAST(SUM(ABS(Movimiento_Cereal.PesoFinal)) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Valor
		FROM (((Movimiento_Cereal INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha) LEFT JOIN Entidad AS Entidad_Titular ON Movimiento_Cereal.IDEntidad_Titular = Entidad_Titular.IDEntidad) LEFT JOIN Entidad AS Entidad_Destinatario ON Movimiento_Cereal.IDEntidad_Destinatario = Entidad_Destinatario.IDEntidad
		WHERE Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND ((Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad) OR (Movimiento_Cereal.Tipo IN ('U', 'T') AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad))
			AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND DATEPART(year, Movimiento_Cereal.FechaHoraDescarga) = @Anio
			AND DATEPART(month, Movimiento_Cereal.FechaHoraDescarga) = @Mes
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cereal.ONCCA_EspecieNombre, Cosecha.ONCCA_Codigo, (CASE Movimiento_Cereal.Tipo WHEN 'E' THEN Entidad_Destinatario.CUIT ELSE Entidad_Titular.CUIT END))
	UNION
	(SELECT Cereal.ONCCA_EspecieCodigo AS EspecieCodigo, Cereal.ONCCA_EspecieNombre AS EspecieNombre, Cosecha.ONCCA_Codigo AS Cosecha, Entidad_Titular.CUIT AS CUIT_Usuario
		, 'Salidas para Elaboración' AS TipoValor
		, CAST(ROUND(CAST(SUM(Movimiento_Cereal.PesoNeto) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Valor
		FROM ((Movimiento_Cereal INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha) INNER JOIN Entidad AS Entidad_Titular ON Movimiento_Cereal.IDEntidad_Titular = Entidad_Titular.IDEntidad
		WHERE Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND Movimiento_Cereal.Tipo = 'P'
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad
			AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND YEAR(Movimiento_Cereal.FechaCarga) = @Anio
			AND MONTH(Movimiento_Cereal.FechaCarga) = @Mes
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cereal.ONCCA_EspecieNombre, Cosecha.ONCCA_Codigo, Entidad_Titular.CUIT)
	UNION
	(SELECT Cereal.ONCCA_EspecieCodigo AS EspecieCodigo, Cereal.ONCCA_EspecieNombre AS EspecieNombre, Cosecha.ONCCA_Codigo AS Cosecha, Entidad_Titular.CUIT AS CUIT_Usuario
		, 'Otras Salidas' AS TipoValor
		, CAST(ROUND(CAST(SUM(Movimiento_Cereal.PesoNeto) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Valor
		FROM ((Movimiento_Cereal INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha) INNER JOIN Entidad AS Entidad_Titular ON Movimiento_Cereal.IDEntidad_Titular = Entidad_Titular.IDEntidad
		WHERE Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND Movimiento_Cereal.Tipo IN ('S', 'T', 'B')
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad
			AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND YEAR(Movimiento_Cereal.FechaCarga) = @Anio
			AND MONTH(Movimiento_Cereal.FechaCarga) = @Mes
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cereal.ONCCA_EspecieNombre, Cosecha.ONCCA_Codigo, Entidad_Titular.CUIT)
END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	24/03/2014 20:10
-- Updated:	
-- Description: Obtiene los datos para la planilla MC15_P del Minagri
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_MC15_P') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_MC15_P
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_MC15_P
	@IDEntidad int,
	@IDEntidad_OrigenDestino smallint,
	@Anio smallint,
	@Mes tinyint AS
	
BEGIN	
	SET NOCOUNT ON;
	
	(SELECT SubProducto.ONCCA_Codigo AS ProductoCodigo, SubProducto.Nombre AS ProductoNombre
		, 'Entradas Elaboración' AS TipoValor
		, CAST(ROUND(CAST(SUM(Movimiento_SubProducto_Detalle.Kilogramo) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Valor
		FROM (Movimiento_SubProducto INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE Movimiento_SubProducto.Tipo = 'E'
			AND Movimiento_SubProducto.IDEntidad_Titular = @IDEntidad
			AND Movimiento_SubProducto.IDOrigenDestino_Origen = @IDEntidad_OrigenDestino
			AND YEAR(Movimiento_SubProducto.Fecha) = @Anio
			AND MONTH(Movimiento_SubProducto.Fecha) = @Mes
		GROUP BY SubProducto.ONCCA_Codigo, SubProducto.Nombre)
	UNION
	(SELECT SubProducto.ONCCA_Codigo AS ProductoCodigo, SubProducto.Nombre AS ProductoNombre
		, 'Otras Entradas' AS TipoValor
		, CAST(ROUND(CAST(SUM(Movimiento_SubProducto_Detalle.Kilogramo) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Valor
		FROM (Movimiento_SubProducto INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE Movimiento_SubProducto.Tipo = 'U'
			AND Movimiento_SubProducto.IDEntidad_Titular = @IDEntidad
			AND Movimiento_SubProducto.IDOrigenDestino_Origen = @IDEntidad_OrigenDestino
			AND YEAR(Movimiento_SubProducto.Fecha) = @Anio
			AND MONTH(Movimiento_SubProducto.Fecha) = @Mes
		GROUP BY SubProducto.ONCCA_Codigo, SubProducto.Nombre)
	UNION
	(SELECT SubProducto.ONCCA_Codigo AS ProductoCodigo, SubProducto.Nombre AS ProductoNombre
		, 'Salidas Consumo Interno' AS TipoValor
		, CAST(ROUND(CAST(ABS(SUM(Movimiento_SubProducto_Detalle.Kilogramo)) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Valor
		FROM (Movimiento_SubProducto INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE Movimiento_SubProducto.Tipo = 'S'
			AND Movimiento_SubProducto.IDEntidad_Titular = @IDEntidad
			AND Movimiento_SubProducto.IDOrigenDestino_Origen = @IDEntidad_OrigenDestino
			AND YEAR(Movimiento_SubProducto.Fecha) = @Anio
			AND MONTH(Movimiento_SubProducto.Fecha) = @Mes
		GROUP BY SubProducto.ONCCA_Codigo, SubProducto.Nombre)
	UNION
	(SELECT SubProducto.ONCCA_Codigo AS ProductoCodigo, SubProducto.Nombre AS ProductoNombre
		, 'Otras Salidas' AS TipoValor
		, CAST(ROUND(CAST(ABS(SUM(Movimiento_SubProducto_Detalle.Kilogramo)) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Valor
		FROM (Movimiento_SubProducto INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE Movimiento_SubProducto.Tipo = 'B'
			AND Movimiento_SubProducto.IDEntidad_Titular = @IDEntidad
			AND Movimiento_SubProducto.IDOrigenDestino_Origen = @IDEntidad_OrigenDestino
			AND YEAR(Movimiento_SubProducto.Fecha) = @Anio
			AND MONTH(Movimiento_SubProducto.Fecha) = @Mes
		GROUP BY SubProducto.ONCCA_Codigo, SubProducto.Nombre)
	
END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	24/03/2014 20:32
-- Updated:	
-- Description: Obtiene los datos para la planilla MC15_E del Minagri
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_MC15_E') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_MC15_E
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_MC15_E
	@IDEntidad int,
	@IDEntidad_OrigenDestino smallint,
	@Anio smallint,
	@Mes tinyint AS
	
BEGIN	
	SET NOCOUNT ON;
	
	SELECT Cereal.ONCCA_EspecieCodigo AS EspecieCodigo, Cereal.ONCCA_EspecieNombre AS EspecieNombre, SubProducto.ONCCA_Codigo AS ProductoCodigo, SubProducto.Nombre AS ProductoNombre
		, CAST(ROUND(CAST(SUM(Movimiento_Cereal.PesoNeto) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS EntradasEspecie
		, CAST(ROUND(SUM(Movimiento_SubProducto_Detalle.Kilogramo) / CAST(SUM(Movimiento_Cereal.PesoNeto) AS decimal(10,2)) * 100, 2) AS decimal(7,2)) AS ExtraccionPorcentaje
		FROM (((Movimiento_Cereal INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) INNER JOIN Movimiento_SubProducto ON Movimiento_Cereal.IDMovimiento_Cereal = Movimiento_SubProducto.IDMovimiento_Cereal) INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE Movimiento_Cereal.Tipo = 'P'
			AND Movimiento_SubProducto.Tipo = 'E'
			AND Movimiento_SubProducto.IDEntidad_Titular = @IDEntidad
			AND Movimiento_SubProducto.IDOrigenDestino_Origen = @IDEntidad_OrigenDestino
			AND YEAR(Movimiento_SubProducto.Fecha) = @Anio
			AND MONTH(Movimiento_SubProducto.Fecha) = @Mes
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cereal.ONCCA_EspecieNombre, SubProducto.ONCCA_Codigo, SubProducto.Nombre
	
END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	30/10/2015 09:42
-- Updated:	
-- Description: Obtiene los datos para las planillas MC15 del Minagri
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_SubProducto_MC15') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_SubProducto_MC15
GO

CREATE PROCEDURE dbo.usp_Movimiento_SubProducto_MC15
	@IDEntidad int,
	@IDPlanta smallint,
	@Anio smallint,
	@Mes tinyint AS
	
BEGIN	
	SET NOCOUNT ON;
		
	EXEC dbo.usp_Movimiento_SubProducto_MC15_G @IDEntidad, @IDPlanta, @Anio, @Mes
	EXEC dbo.usp_Movimiento_SubProducto_MC15_P @IDEntidad, @IDPlanta, @Anio, @Mes
	EXEC dbo.usp_Movimiento_SubProducto_MC15_E @IDEntidad, @IDPlanta, @Anio, @Mes

END
GO