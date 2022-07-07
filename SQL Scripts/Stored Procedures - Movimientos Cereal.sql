USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-23
-- Description:	Lista los talonarios de Cartas de Porte
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_CartaPorte_Talonario_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_CartaPorte_Talonario_List
GO

CREATE PROCEDURE usp_CartaPorte_Talonario_List
	@IDCartaPorte_Talonario int,
	@FechaCarga date,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDCartaPorte_Talonario, CEENumero + ISNULL(' - ' + CONVERT(char(10), FechaVencimiento, 103), '') AS Nombre
		FROM CartaPorte_Talonario
		WHERE IDCartaPorte_Talonario = @IDCartaPorte_Talonario
			OR ((@IDEntidad = IDEntidad OR @IDEntidad IS NULL)
				AND
				((DATEDIFF(day, @FechaCarga, FechaVencimiento) >= 0) OR @FechaCarga IS NULL))
		ORDER BY CEENumero DESC
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2020-07-29
-- Description:	Lista los motivos de anulación de las Cartas de Porte
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_CartaPorte_MotivoAnulacion_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_CartaPorte_MotivoAnulacion_List
GO

CREATE PROCEDURE usp_CartaPorte_MotivoAnulacion_List
	@MostrarTodos bit,
	@MostrarNo bit,
	@MostrarSi bit
AS
BEGIN
	DECLARE @MotivosAnulacion TABLE (IDCartaPorte_MotivoAnulacion tinyint, Nombre varchar(50), Orden tinyint)

	SET NOCOUNT ON;
	
	IF @MostrarTodos = 1
		INSERT INTO @MotivosAnulacion
			VALUES(0, '«Todas»', 1)

	IF @MostrarNo = 1
		IF @MostrarTodos = 1
			INSERT INTO @MotivosAnulacion
				VALUES(254, '«No»', 2)
		ELSE
			INSERT INTO @MotivosAnulacion
				VALUES(0, '«No»', 1)

	IF @MostrarSi = 1
		INSERT INTO @MotivosAnulacion
			VALUES(255, '«Si»', 3)

	INSERT INTO @MotivosAnulacion
		SELECT IDCartaPorte_MotivoAnulacion, Nombre, 4
			FROM CartaPorte_MotivoAnulacion
			WHERE Activo = 1

	SELECT IDCartaPorte_MotivoAnulacion, Nombre
		FROM @MotivosAnulacion
		ORDER BY Orden, IDCartaPorte_MotivoAnulacion
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-09
-- Description:	Obtiene los datos de un Movimiento de Cereal
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Get') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Get
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Get
	@IDMovimiento_Cereal int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDMovimiento_Cereal, Tipo, ComprobanteNumero, ComprobanteNumeroConFormato, IDCartaPorte_Talonario, CTGNumero, FechaCarga, IDEntidad_Titular, IDEntidad_Intermediario, IDEntidad_RemitenteComercial, IDEntidad_Corredor, IDEntidad_Entregador, IDEntidad_Destinatario, IDEntidad_Destino, IDEntidad_Transportista, IDEntidad_Chofer, IDCosecha, IDCereal, IDContrato, PesoBruto, PesoTara, PesoNeto, Volatil, Humedad, Zaranda, MermaVolatilKilogramo, MermaHumedadPorcentaje, MermaHumedadKilogramo, MermaZarandaKilogramo, PesoFinal, IDOrigenDestino_Origen, IDOrigenDestino_Destino, CTGCancelacion, TransporteDominioCamion, TransporteDominioAcoplado, TransporteKilometro, TransporteTarifaReferencia, TransporteTarifa, FechaHoraArribo, FechaHoraDescarga, DeclaraIPRO, IDCartaPorte_MotivoAnulacion, Notas, Calculo_TarifaIndice, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion, FechaHoraLiquidacionServicio, FechaHoraEnvioBolsaTech, Certificado, KilogramoAplicado
		FROM Movimiento_Cereal
		WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-09
-- Description:	Obtiene los datos de un Movimiento de Cereal a partir del número de comprobante
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_GetByComprobanteNumero') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_GetByComprobanteNumero
GO

CREATE PROCEDURE usp_Movimiento_Cereal_GetByComprobanteNumero
	@ComprobanteNumero char(13)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDMovimiento_Cereal, Tipo, ComprobanteNumero, ComprobanteNumeroConFormato, IDCartaPorte_Talonario, CTGNumero, FechaCarga, IDEntidad_Titular, IDEntidad_Intermediario, IDEntidad_RemitenteComercial, IDEntidad_Corredor, IDEntidad_Entregador, IDEntidad_Destinatario, IDEntidad_Destino, IDEntidad_Transportista, IDEntidad_Chofer, IDCosecha, IDCereal, IDContrato, PesoBruto, PesoTara, PesoNeto, Volatil, Humedad, Zaranda, MermaVolatilKilogramo, MermaHumedadPorcentaje, MermaHumedadKilogramo, MermaZarandaKilogramo, PesoFinal, IDOrigenDestino_Origen, IDOrigenDestino_Destino, CTGCancelacion, TransporteDominioCamion, TransporteDominioAcoplado, TransporteKilometro, TransporteTarifaReferencia, TransporteTarifa, FechaHoraArribo, FechaHoraDescarga, DeclaraIPRO, IDCartaPorte_MotivoAnulacion, Notas, Calculo_TarifaIndice, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion, FechaHoraLiquidacionServicio, FechaHoraEnvioBolsaTech, Certificado, KilogramoAplicado
		FROM Movimiento_Cereal
		WHERE ComprobanteNumero = @ComprobanteNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2022-01-14
-- Description:	Obtiene los datos de un Movimiento de Cereal a partir del CTG
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_GetByCtg') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_GetByCtg
GO

CREATE PROCEDURE usp_Movimiento_Cereal_GetByCtg
	@Ctg bigint
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDMovimiento_Cereal, Tipo, ComprobanteNumero, ComprobanteNumeroConFormato, IDCartaPorte_Talonario, CTGNumero, FechaCarga, IDEntidad_Titular, IDEntidad_Intermediario, IDEntidad_RemitenteComercial, IDEntidad_Corredor, IDEntidad_Entregador, IDEntidad_Destinatario, IDEntidad_Destino, IDEntidad_Transportista, IDEntidad_Chofer, IDCosecha, IDCereal, IDContrato, PesoBruto, PesoTara, PesoNeto, Volatil, Humedad, Zaranda, MermaVolatilKilogramo, MermaHumedadPorcentaje, MermaHumedadKilogramo, MermaZarandaKilogramo, PesoFinal, IDOrigenDestino_Origen, IDOrigenDestino_Destino, CTGCancelacion, TransporteDominioCamion, TransporteDominioAcoplado, TransporteKilometro, TransporteTarifaReferencia, TransporteTarifa, FechaHoraArribo, FechaHoraDescarga, DeclaraIPRO, IDCartaPorte_MotivoAnulacion, Notas, Calculo_TarifaIndice, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion, FechaHoraLiquidacionServicio, FechaHoraEnvioBolsaTech, Certificado, KilogramoAplicado
		FROM Movimiento_Cereal
		WHERE CTGNumero = @Ctg
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-28
-- Modification: 2021-05-19 - Se agregó el redondeo de kgs en los cálculos
-- Description:	Calcula las mermas para un Movimiento de Cereal
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_UpdateMerma') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_UpdateMerma
GO

CREATE PROCEDURE usp_Movimiento_Cereal_UpdateMerma
	@IDMovimiento_Cereal int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Tipo char(1)
	DECLARE @IDCereal tinyint
	DECLARE @PesoNeto int
	DECLARE @Volatil decimal(2,2)
	DECLARE @Humedad decimal(3,1)
	DECLARE @Zaranda decimal(3,1)
	DECLARE @MermaVolatilKilogramo int
	DECLARE @MermaHumedadPorcentaje decimal(4,2)
	DECLARE @MermaHumedadKilogramo int
	DECLARE @MermaZarandaKilogramo int
	DECLARE @PesoFinal int
	
	DECLARE @MermaHumedadBase decimal(3,1)
	DECLARE @MermaHumedadManipuleo decimal(2,2)
	
	DECLARE @Cereal_HumedadMerma decimal(4,2)
	
	SELECT @Tipo = Tipo, @IDCereal = IDCereal, @PesoNeto = PesoNeto, @Volatil = ISNULL(Volatil, 0), @Humedad = Humedad, @Zaranda = ISNULL(Zaranda, 0)
		FROM Movimiento_Cereal
		WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
	
	IF @Tipo = 'E'
		BEGIN
		SET @PesoFinal = @PesoNeto
		
		--VOLATIL
		SET @MermaVolatilKilogramo = ROUND(@PesoNeto * (@Volatil / 100), 0)
		SET @PesoFinal = @PesoFinal - @MermaVolatilKilogramo
		
		--SECADO
		SELECT @MermaHumedadBase = MermaHumedadBase, @MermaHumedadManipuleo = MermaHumedadManipuleo
			FROM Cereal
			WHERE IDCereal = @IDCereal
			
		IF @MermaHumedadBase IS NULL
			BEGIN
			SET @MermaHumedadPorcentaje = 0
			SET @MermaHumedadKilogramo = 0
			END
		ELSE
			BEGIN
			IF @Humedad > @MermaHumedadBase
				BEGIN
				SELECT @Cereal_HumedadMerma = Merma
					FROM Cereal_Humedad
					WHERE IDCereal = @IDCereal AND Humedad = @Humedad
				SET @MermaHumedadPorcentaje = @MermaHumedadManipuleo + @Cereal_HumedadMerma
				SET @MermaHumedadKilogramo = ROUND(@PesoNeto * (@MermaHumedadPorcentaje / 100), 0)
				END
			ELSE
				BEGIN
				SET @MermaHumedadPorcentaje = 0
				SET @MermaHumedadKilogramo = 0
				END
			END
		SET @PesoFinal = @PesoFinal - @MermaHumedadKilogramo
		
		--ZARANDA
		SET @MermaZarandaKilogramo = ROUND(@PesoNeto * (@Zaranda / 100), 0)
		SET @PesoFinal = @PesoFinal - @MermaZarandaKilogramo
		END
	ELSE
		BEGIN
		SET @MermaVolatilKilogramo = NULL
		SET @MermaHumedadPorcentaje = NULL
		SET @MermaHumedadKilogramo = NULL
		SET @MermaZarandaKilogramo = NULL
		IF @Tipo = 'U'
			SET @PesoFinal = @PesoNeto
		ELSE
			SET @PesoFinal = (@PesoNeto * -1)
		END
	
	UPDATE Movimiento_Cereal
		SET MermaVolatilKilogramo = @MermaVolatilKilogramo, MermaHumedadPorcentaje = @MermaHumedadPorcentaje, MermaHumedadKilogramo = @MermaHumedadKilogramo, MermaZarandaKilogramo = @MermaZarandaKilogramo, PesoFinal = @PesoFinal
		WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2022-05-17
-- Description:	Parsea las pesadas y las agrega a la tabla correspondiente
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_ParseAndInsertPesadas') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_ParseAndInsertPesadas
GO

CREATE PROCEDURE usp_Movimiento_Cereal_ParseAndInsertPesadas
	@IDMovimiento_Cereal int,
	@StringListOfIDPesadaCompleta varchar(1000)
AS
BEGIN
	DECLARE @Separator char(1) = '|'
	DECLARE @Delimiter char(1) = '¬'
	DECLARE @NullValueString char(4) = 'NULL'

	DECLARE @SeparatorPos int = 0
	DECLARE @DelimiterPosStart int = 0
	DECLARE @DelimiterPosEnd int = 0
	DECLARE @ValuePairLen int
	DECLARE @ValuePair varchar(25)

	DECLARE @IDPesada int
	DECLARE @PesoNeto int
	DECLARE @Humedad decimal(3,1)
	DECLARE @Zaranda decimal(3,1)

	WHILE CHARINDEX(@Separator, @StringListOfIDPesadaCompleta, @SeparatorPos + 1) > 0
		BEGIN
			SET @ValuePairLen = CHARINDEX(@Separator, @StringListOfIDPesadaCompleta, @SeparatorPos + 1) - @SeparatorPos
			SET @ValuePair = SUBSTRING(@StringListOfIDPesadaCompleta, @SeparatorPos, @ValuePairLen)
					
			--ID PESADA
			SET @DelimiterPosStart = CHARINDEX(@Delimiter, @ValuePair, 1)
			IF @DelimiterPosStart > 0
				SET @IDPesada = CAST(SUBSTRING(@ValuePair, 1, @DelimiterPosStart - 1) AS int)
					
			--PESO NETO
			SET @DelimiterPosEnd = CHARINDEX(@Delimiter, @ValuePair, @DelimiterPosStart + 1)
			IF SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) = @NullValueString
				SET @PesoNeto = NULL
			ELSE
				SET @PesoNeto = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS int)
					
			--HUMEDAD
			SET @DelimiterPosStart = @DelimiterPosEnd
			SET @DelimiterPosEnd = CHARINDEX(@Delimiter, @ValuePair, @DelimiterPosStart + 1)
			IF SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) = @NullValueString
				SET @Humedad = NULL
			ELSE
				SET @Humedad = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS decimal(3,1))
					
			--ZARANDA
			SET @DelimiterPosStart = @DelimiterPosEnd
			IF SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 25) = @NullValueString
				SET @Zaranda = NULL
			ELSE
				SET @Zaranda = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 25) AS decimal(3,1))
					
			INSERT INTO Movimiento_Cereal_Pesada
				(IDMovimiento_Cereal, IDPesada, PesoNeto, Humedad, Zaranda)
				VALUES (@IDMovimiento_Cereal, @IDPesada, @PesoNeto, @Humedad, @Zaranda)
					
			SET @SeparatorPos = CHARINDEX(@Separator, @StringListOfIDPesadaCompleta, @SeparatorPos + @ValuePairLen) + 1
		END
	RETURN
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2022-05-17
-- Description:	Calcula la humedad y el zarandeo desde las pesadas
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_CalcularYActualizarHumedadYZarandeoMultiples') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_CalcularYActualizarHumedadYZarandeoMultiples
GO

CREATE PROCEDURE usp_Movimiento_Cereal_CalcularYActualizarHumedadYZarandeoMultiples
	@IDMovimiento_Cereal int,
	@IDUsuario tinyint,
	@SobrescribirDatos bit
AS
BEGIN
	DECLARE @CantidadPesadas int = 0
	DECLARE @SumaHumedades decimal(3,1) = 0
	DECLARE @CantidadHumedades tinyint = 0

	DECLARE @IDCereal tinyint
	DECLARE @MermaHumedadBase decimal(3,1)

	DECLARE @PesoNeto int
	DECLARE @Humedad decimal(3,1)
	DECLARE @Zaranda decimal(3,1)

	DECLARE @HumedadMerma decimal(4,2)
	DECLARE @KilogramoNetoTotal int = 0
	DECLARE @MermaSecadoTotal int = 0
	DECLARE @MermaZarandeoTotal int = 0

	-- OBTENGO LA CANTIDAD DE PESADAS ASOCIADAS A LA CARTA DE PORTE
	SET @CantidadPesadas = (SELECT COUNT(*) FROM Movimiento_Cereal_Pesada WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal)

	-- OBTENGO EL ID DEL CEREAL DESDE LA CARTA DE PORTE
	SELECT @IDCereal = IDCereal FROM Movimiento_Cereal WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal

	-- OBTENGO LA INFORMACIÓN DEL CEREAL
	SELECT @MermaHumedadBase = MermaHumedadBase FROM Cereal WHERE IDCereal = @IDCereal

	IF @CantidadPesadas = 1
		-- OBTENGO LOS DATOS DESDE LA ÚNICA PESADA
		SELECT @Humedad = Humedad, @Zaranda = Zaranda FROM Movimiento_Cereal_Pesada WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal

	IF @CantidadPesadas > 1
		BEGIN
		-- CALCULO LAS MERMAS DE CADA UNA DE LAS PESADAS PARA BUSCAR EL PORCENTAJE DE HUMEDAD y ZARANDEO MÁS PRECISO
		DECLARE CursorPesadas CURSOR LOCAL FORWARD_ONLY STATIC FOR
			SELECT PesoNeto, Humedad, Zaranda
				FROM Movimiento_Cereal_Pesada
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal

		OPEN CursorPesadas
		FETCH NEXT FROM CursorPesadas INTO @PesoNeto, @Humedad, @Zaranda

		WHILE @@FETCH_STATUS = 0
			BEGIN
			-- SUMO LOS KILOGRAMOS DE CADA PESADA
			SET @KilogramoNetoTotal = @KilogramoNetoTotal + @PesoNeto

			-- CALCULO LA MERMA POR HUMEDAD
			IF @MermaHumedadBase IS NOT NULL AND @Humedad IS NOT NULL
				IF @Humedad > 0 AND @Humedad < 50
					BEGIN
					SET @CantidadHumedades = @CantidadHumedades + 1
					SET @SumaHumedades = @SumaHumedades + @Humedad
					IF @Humedad > @MermaHumedadBase
						BEGIN
						SELECT @HumedadMerma = Merma FROM Cereal_Humedad WHERE IDCereal = @IDCereal AND Humedad = @Humedad
						IF @HumedadMerma IS NOT NULL
							SET @MermaSecadoTotal = @MermaSecadoTotal + (@PesoNeto * @HumedadMerma / 100)
						END
					END

			-- CALCULO LA MERMA POR ZARANDEO
			IF @Zaranda IS NOT NULL
				IF @Zaranda > 0 AND @Zaranda < 50
					SET @MermaZarandeoTotal = @MermaZarandeoTotal + (@PesoNeto * @Zaranda)
			
			FETCH NEXT FROM CursorPesadas INTO @PesoNeto, @Humedad, @Zaranda
			END

		CLOSE CursorPesadas
		DEALLOCATE CursorPesadas

		-- BUSCO LA HUMEDAD MÁS CERCANA A LA SUMA DE LAS MERMAS DE LAS PESADAS
		IF @MermaSecadoTotal = 0
			BEGIN
			SET @Humedad = @SumaHumedades / @CantidadHumedades
			SELECT @SumaHumedades, @CantidadHumedades, @SumaHumedades / @CantidadHumedades
			END
		ELSE IF @KilogramoNetoTotal > 0
			SELECT @Humedad = Humedad FROM Cereal_Humedad WHERE IDCereal = @IDCereal AND Merma >= (@MermaSecadoTotal / @KilogramoNetoTotal * 100)

		-- CALCULO EL ZARANDEO CORRESPONDIENTE A LA SUMA DE LAS MERMAS DE LAS PESADAS
		IF @KilogramoNetoTotal > 0 AND @MermaZarandeoTotal > 0
			SET @Zaranda = ROUND((@MermaZarandeoTotal / @KilogramoNetoTotal * 100) + 0.04, 1)
		END

	-- ACTUALIZO LOS DATOS DE LA CARTA DE PORTE
	IF @SobrescribirDatos = 1
		UPDATE Movimiento_Cereal
			SET Humedad = @Humedad, Zaranda = @Zaranda, IDUsuarioModificacion = @IDUsuario, FechaHoraModificacion = GETDATE()
			WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
	ELSE
		BEGIN
			UPDATE Movimiento_Cereal
				SET Humedad = @Humedad, IDUsuarioModificacion = @IDUsuario, FechaHoraModificacion = GETDATE()
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal AND Humedad IS NULL
			UPDATE Movimiento_Cereal
				SET Zaranda = @Zaranda, IDUsuarioModificacion = @IDUsuario, FechaHoraModificacion = GETDATE()
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal AND Zaranda IS NULL
		END
			
	-- CALCULO LAS MERMAS
	EXEC usp_Movimiento_Cereal_UpdateMerma @IDMovimiento_Cereal

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-26
-- Description:	Agrega un Movimiento de Cereal con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Add') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Add
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Add
	@IDMovimiento_Cereal int OUTPUT,
	@Tipo char(1),
	@ComprobanteNumero bigint,
	@IDCartaPorte_Talonario int,
	@CTGNumero bigint,
	@FechaCarga date,
	@IDEntidad_Titular int,
	@IDEntidad_Intermediario int,
	@IDEntidad_RemitenteComercial int,
	@IDEntidad_Corredor int,
	@IDEntidad_Entregador int,
	@IDEntidad_Destinatario int,
	@IDEntidad_Destino int,
	@IDEntidad_Transportista int,
	@IDEntidad_Chofer int,
	@IDCosecha int,
	@IDCereal int,
	@IDContrato int,
	@PesoBruto int,
	@PesoTara int,
	@PesoNeto int,
	@Volatil decimal(2,2),
	@Humedad decimal(3,1),
	@Zaranda decimal(3,1),
	@IDOrigenDestino_Origen smallint,
	@IDOrigenDestino_Destino smallint,
	@CTGCancelacion int,
	@TransporteDominioCamion char(7),
	@TransporteDominioAcoplado char(7),
	@TransporteKilometro smallint,
	@TransporteTarifaReferencia money,
	@TransporteTarifa money,
	@FechaHoraArribo smalldatetime,
	@FechaHoraDescarga smalldatetime,
	@DeclaraIPRO bit,
	@IDCartaPorte_MotivoAnulacion tinyint,
	@Notas varchar(1000),
	@Calculo_TarifaIndice smallint,
	@IDUsuario tinyint,
	@StringListOfIDPesadaCompleta varchar(1000)
AS
BEGIN
	SET NOCOUNT ON;
		
	DECLARE @Movimiento_Cereal_Pesada TABLE(IDPesada int PRIMARY KEY NOT NULL, PesoNeto int NULL, Humedad decimal(3,1) NULL, Zaranda decimal(3,1) NULL)
	
	DECLARE @Certificado bit
	DECLARE @KilogramoAplicado int
	
	BEGIN TRY
	
		BEGIN TRANSACTION
			-- OBTENGO EL NUEVO ID DEL Movimiento_Cereal
			SET @IDMovimiento_Cereal = (SELECT ISNULL(MAX(IDMovimiento_Cereal), 0) + 1 FROM Movimiento_Cereal)
			
			-- PREPARO LAS VARIABLES CORRESPONDIENTES
			IF @Tipo = 'E'
				BEGIN
				SET @Certificado = 0
				SET @KilogramoAplicado = NULL
				END
			IF @Tipo = 'S'
				BEGIN
				SET @Volatil = NULL
				SET @Humedad = NULL
				SET @Zaranda = NULL
				SET @FechaHoraArribo = @FechaCarga
				SET @FechaHoraDescarga = @FechaCarga
				SET @Certificado = NULL
				SET @KilogramoAplicado = 0
				END
			IF @Tipo = 'T' OR @Tipo = 'P' OR @Tipo = 'B' OR @Tipo = 'U'
				BEGIN
				SET @IDCartaPorte_Talonario = NULL
				SET @CTGNumero = NULL
				SET @IDEntidad_Intermediario = NULL
				SET @IDEntidad_RemitenteComercial = NULL
				SET @IDEntidad_Corredor = NULL
				SET @IDEntidad_Entregador = NULL
				SET @IDEntidad_Destinatario = NULL
				SET @IDEntidad_Transportista = NULL
				SET @IDEntidad_Chofer = NULL
				SET @IDContrato = NULL
				SET @Volatil = NULL
				SET @Humedad = NULL
				SET @Zaranda = NULL
				SET @CTGCancelacion = NULL
				SET @TransporteDominioCamion = NULL
				SET @TransporteDominioAcoplado = NULL
				SET @TransporteKilometro = NULL
				SET @TransporteTarifaReferencia = NULL
				SET @TransporteTarifa = NULL
				SET @FechaHoraArribo = @FechaCarga
				SET @FechaHoraDescarga = @FechaCarga
				SET @IDCartaPorte_MotivoAnulacion = NULL
				SET @Certificado = NULL
				SET @KilogramoAplicado = NULL
				END
			
			-- AGREGO EL MOVIMIENTO DE CEREAL
			INSERT INTO Movimiento_Cereal
				(IDMovimiento_Cereal, Tipo, ComprobanteNumero, IDCartaPorte_Talonario, CTGNumero, FechaCarga, IDEntidad_Titular, IDEntidad_Intermediario, IDEntidad_RemitenteComercial, IDEntidad_Corredor, IDEntidad_Entregador, IDEntidad_Destinatario, IDEntidad_Destino, IDEntidad_Transportista, IDEntidad_Chofer, IDCosecha, IDCereal, IDContrato, PesoBruto, PesoTara, PesoNeto, Volatil, Humedad, Zaranda, IDOrigenDestino_Origen, IDOrigenDestino_Destino, CTGCancelacion, TransporteDominioCamion, TransporteDominioAcoplado, TransporteKilometro, TransporteTarifaReferencia, TransporteTarifa, FechaHoraArribo, FechaHoraDescarga, DeclaraIPRO, IDCartaPorte_MotivoAnulacion, Notas, Calculo_TarifaIndice, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion, FechaHoraLiquidacionServicio, Certificado, KilogramoAplicado)
				VALUES (@IDMovimiento_Cereal, @Tipo, @ComprobanteNumero, @IDCartaPorte_Talonario, @CTGNumero, @FechaCarga, @IDEntidad_Titular, @IDEntidad_Intermediario, @IDEntidad_RemitenteComercial, @IDEntidad_Corredor, @IDEntidad_Entregador, @IDEntidad_Destinatario, @IDEntidad_Destino, @IDEntidad_Transportista, @IDEntidad_Chofer, @IDCosecha, @IDCereal, @IDContrato, @PesoBruto, @PesoTara, @PesoNeto, @Volatil, @Humedad, @Zaranda, @IDOrigenDestino_Origen, @IDOrigenDestino_Destino, @CTGCancelacion, @TransporteDominioCamion, @TransporteDominioAcoplado, @TransporteKilometro, @TransporteTarifaReferencia, @TransporteTarifa, @FechaHoraArribo, @FechaHoraDescarga, @DeclaraIPRO, @IDCartaPorte_MotivoAnulacion, @Notas, @Calculo_TarifaIndice, @IDUsuario, GETDATE(), @IDUsuario, GETDATE(), NULL, @Certificado, @KilogramoAplicado)
			
			-- CALCULO LAS MERMAS
			EXEC usp_Movimiento_Cereal_UpdateMerma @IDMovimiento_Cereal
			
			-- AGREGO EL DETALLE DE PESADAS
			EXEC dbo.usp_Movimiento_Cereal_ParseAndInsertPesadas @IDMovimiento_Cereal, @StringListOfIDPesadaCompleta

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
-- Create date: 2013-09-09
-- Description:	Modifico un Movimiento de Cereal con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Update') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Update
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Update
	@IDMovimiento_Cereal int,
	@ComprobanteNumero bigint,
	@IDCartaPorte_Talonario int,
	@CTGNumero bigint,
	@FechaCarga date,
	@IDEntidad_Titular int,
	@IDEntidad_Intermediario int,
	@IDEntidad_RemitenteComercial int,
	@IDEntidad_Corredor int,
	@IDEntidad_Entregador int,
	@IDEntidad_Destinatario int,
	@IDEntidad_Destino int,
	@IDEntidad_Transportista int,
	@IDEntidad_Chofer int,
	@IDCosecha int,
	@IDCereal int,
	@IDContrato int,
	@PesoBruto int,
	@PesoTara int,
	@PesoNeto int,
	@Volatil decimal(2,2),
	@Humedad decimal(3,1),
	@Zaranda decimal(3,1),
	@IDOrigenDestino_Origen smallint,
	@IDOrigenDestino_Destino smallint,
	@CTGCancelacion int,
	@TransporteDominioCamion char(7),
	@TransporteDominioAcoplado char(7),
	@TransporteKilometro smallint,
	@TransporteTarifaReferencia money,
	@TransporteTarifa money,
	@FechaHoraArribo smalldatetime,
	@FechaHoraDescarga smalldatetime,
	@DeclaraIPRO bit,
	@IDCartaPorte_MotivoAnulacion tinyint,
	@Notas varchar(1000),
	@Calculo_TarifaIndice smallint,
	@IDUsuario tinyint,
	@StringListOfIDPesadaCompleta varchar(1000)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Tipo char(1)
	
	DECLARE @Certificado bit
	DECLARE @KilogramoAplicado int
	
	BEGIN TRY
	
		BEGIN TRANSACTION

			--ACTUALIZO EL MOVIMIENTO DE CEREAL
			SET @Tipo = (SELECT Tipo FROM Movimiento_Cereal WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal)
			IF @Tipo <> 'E'
				BEGIN
				SET @FechaHoraArribo = @FechaCarga
				SET @FechaHoraDescarga = @FechaCarga
				END
			UPDATE Movimiento_Cereal
				SET ComprobanteNumero = @ComprobanteNumero, IDCartaPorte_Talonario = @IDCartaPorte_Talonario, CTGNumero = @CTGNumero, FechaCarga = @FechaCarga, IDEntidad_Titular = @IDEntidad_Titular, IDEntidad_Intermediario = @IDEntidad_Intermediario, IDEntidad_RemitenteComercial = @IDEntidad_RemitenteComercial, IDEntidad_Corredor = @IDEntidad_Corredor, IDEntidad_Entregador = @IDEntidad_Entregador, IDEntidad_Destinatario = @IDEntidad_Destinatario, IDEntidad_Destino = @IDEntidad_Destino, IDEntidad_Transportista = @IDEntidad_Transportista, IDEntidad_Chofer = @IDEntidad_Chofer, IDCosecha = @IDCosecha, IDCereal = @IDCereal, IDContrato = @IDContrato, PesoBruto = @PesoBruto, PesoTara = @PesoTara, PesoNeto = @PesoNeto, Volatil = @Volatil, Humedad = @Humedad, Zaranda = @Zaranda, IDOrigenDestino_Origen = @IDOrigenDestino_Origen, IDOrigenDestino_Destino = @IDOrigenDestino_Destino, CTGCancelacion = @CTGCancelacion, TransporteDominioCamion = @TransporteDominioCamion, TransporteDominioAcoplado = @TransporteDominioAcoplado, TransporteKilometro = @TransporteKilometro, TransporteTarifaReferencia = @TransporteTarifaReferencia, TransporteTarifa = @TransporteTarifa, FechaHoraArribo = @FechaHoraArribo, FechaHoraDescarga = @FechaHoraDescarga, DeclaraIPRO = @DeclaraIPRO, IDCartaPorte_MotivoAnulacion = @IDCartaPorte_MotivoAnulacion, Notas = @Notas, Calculo_TarifaIndice = @Calculo_TarifaIndice, IDUsuarioModificacion = @IDUsuario, FechaHoraModificacion = GETDATE()
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
			
			--CALCULO LAS MERMAS
			EXEC usp_Movimiento_Cereal_UpdateMerma @IDMovimiento_Cereal
			
			--ACTUALIZO EL DETALLE DE PESADAS
			--(ELIMINO Y VUELVO A AGREGAR), AUNQUE NO ES LO MÁS EFICIENTE, ES LO MÁS SIMPLE
			DELETE
				FROM Movimiento_Cereal_Pesada
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
			
			EXEC dbo.usp_Movimiento_Cereal_ParseAndInsertPesadas @IDMovimiento_Cereal, @StringListOfIDPesadaCompleta

			--ACTUALIZO LA FECHA DEL MOVIMIENTO DE SUBPRODUCTOS QUE EXISTIERA
			UPDATE Movimiento_SubProducto
				SET Movimiento_SubProducto.Fecha = @FechaCarga
				WHERE Movimiento_SubProducto.IDMovimiento_Cereal = @IDMovimiento_Cereal

			--ACTUALIZO LA FECHA Y LOS KGS DE LOS DETALLES DE MOVIMIENTO DE SUBPRODUCTOS QUE EXISTIERAN
			UPDATE Movimiento_SubProducto_Detalle
				SET Movimiento_SubProducto_Detalle.Kilogramo = @PesoNeto * Movimiento_SubProducto_Detalle.Porcentaje / 100
				FROM Movimiento_SubProducto INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto
				WHERE Movimiento_SubProducto.IDMovimiento_Cereal = @IDMovimiento_Cereal
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
-- Create date: 2022-05-17
-- Description:	Actualiza la humedad, zarandeo y pesadas de un Movimiento de Cereal
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_ActualizarPesadasHumedadYZarandeo') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_ActualizarPesadasHumedadYZarandeo
GO

CREATE PROCEDURE usp_Movimiento_Cereal_ActualizarPesadasHumedadYZarandeo
	@IDMovimiento_Cereal int,
	@IDUsuario tinyint,
	@StringListOfIDPesadaCompleta varchar(1000),
	@SobrescribirDatos bit
AS
BEGIN
	SET NOCOUNT ON;
		
	BEGIN TRY
	
		BEGIN TRANSACTION
			--ACTUALIZO EL DETALLE DE PESADAS
			--(ELIMINO Y VUELVO A AGREGAR), AUNQUE NO ES LO MÁS EFICIENTE, ES LO MÁS SIMPLE
			DELETE
				FROM Movimiento_Cereal_Pesada
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
			
			EXEC dbo.usp_Movimiento_Cereal_ParseAndInsertPesadas @IDMovimiento_Cereal, @StringListOfIDPesadaCompleta

			-- OBTENGO LA HUMEDAD Y EL ZARANDEO DESDE LAS PESADAS
			EXEC dbo.usp_Movimiento_Cereal_CalcularYActualizarHumedadYZarandeoMultiples @IDMovimiento_Cereal, @IDUsuario, @SobrescribirDatos

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
-- Create date: 2013-09-09
-- Description:	Elimina un Movimiento de Cereal con sus dependencias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Delete') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Delete
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Delete
	@IDMovimiento_Cereal int
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
	
		BEGIN TRANSACTION
	
			--ELIMINO LAS PESADAS ASOCIADAS AL MOVIMIENTO
			DELETE
				FROM Movimiento_Cereal_Pesada
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
			
			--ELIMINO EL CALCULO ASOCIADO AL MOVIMIENTO
			DELETE
				FROM Movimiento_Cereal_Calculo
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
				
			--ELIMINO EL ANALISIS ASOCIADO AL MOVIMIENTO
			DELETE
				FROM Movimiento_Cereal_Analisis
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
				
			--ELIMINO EL MOVIMIENTO
			DELETE
				FROM Movimiento_Cereal
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal
	
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
-- Created: 24/06/2014 23:34:54
-- Updated: 
-- Description: Obtiene los datos del Movimiento_Cereal_Calculo
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Calculo_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Calculo_Get
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Calculo_Get
	@IDMovimiento_Cereal int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDMovimiento_Cereal, TarifaIndice, ParitariaTarifa, ParitariaImporte, SecadoTarifa, SecadoImporte, HumedadExcesoReal, HumedadExcesoCalculo, SecadoExcesoTarifa, SecadoExcesoImporte, ZarandeoTarifa, ZarandeoImporte, FumigadoTarifa, FumigadoImporte, MezclaTarifa, MezclaImporte, ImporteTotal
		FROM Movimiento_Cereal_Calculo
		WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal 

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 24/06/2014 23:34:54
-- Updated: 
-- Description: Agrega un Movimiento_Cereal_Calculo
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Calculo_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Calculo_Add
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Calculo_Add
	@IDMovimiento_Cereal int, 
	@TarifaIndice tinyint,
	@ParitariaTarifa money,
	@ParitariaImporte money,
	@SecadoTarifa money,
	@SecadoImporte money,
	@HumedadExcesoReal decimal(5),
	@HumedadExcesoCalculo decimal(5),
	@SecadoExcesoTarifa money,
	@SecadoExcesoImporte money,
	@ZarandeoTarifa money,
	@ZarandeoImporte money,
	@FumigadoTarifa money,
	@FumigadoImporte money,
	@MezclaTarifa money,
	@MezclaImporte money,
	@ImporteTotal money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			INSERT INTO Movimiento_Cereal_Calculo
				(IDMovimiento_Cereal, TarifaIndice, ParitariaTarifa, ParitariaImporte, SecadoTarifa, SecadoImporte, HumedadExcesoReal, HumedadExcesoCalculo, SecadoExcesoTarifa, SecadoExcesoImporte, ZarandeoTarifa, ZarandeoImporte, FumigadoTarifa, FumigadoImporte, MezclaTarifa, MezclaImporte, ImporteTotal)
				VALUES (@IDMovimiento_Cereal, @TarifaIndice, @ParitariaTarifa, @ParitariaImporte, @SecadoTarifa, @SecadoImporte, @HumedadExcesoReal, @HumedadExcesoCalculo, @SecadoExcesoTarifa, @SecadoExcesoImporte, @ZarandeoTarifa, @ZarandeoImporte, @FumigadoTarifa, @FumigadoImporte, @MezclaTarifa, @MezclaImporte, @ImporteTotal)
	
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
-- Created: 24/06/2014 23:34:54
-- Updated: 
-- Description: Actualiza los datos del Movimiento_Cereal_Calculo
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Calculo_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Calculo_Update
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Calculo_Update
	@IDMovimiento_Cereal int,
	@TarifaIndice tinyint,
	@ParitariaTarifa money,
	@ParitariaImporte money,
	@SecadoTarifa money,
	@SecadoImporte money,
	@HumedadExcesoReal decimal(5),
	@HumedadExcesoCalculo decimal(5),
	@SecadoExcesoTarifa money,
	@SecadoExcesoImporte money,
	@ZarandeoTarifa money,
	@ZarandeoImporte money,
	@FumigadoTarifa money,
	@FumigadoImporte money,
	@MezclaTarifa money,
	@MezclaImporte money,
	@ImporteTotal money
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Movimiento_Cereal_Calculo
					SET TarifaIndice = @TarifaIndice, ParitariaTarifa = @ParitariaTarifa, ParitariaImporte = @ParitariaImporte, SecadoTarifa = @SecadoTarifa, SecadoImporte = @SecadoImporte, HumedadExcesoReal = @HumedadExcesoReal, HumedadExcesoCalculo = @HumedadExcesoCalculo, SecadoExcesoTarifa = @SecadoExcesoTarifa, SecadoExcesoImporte = @SecadoExcesoImporte, ZarandeoTarifa = @ZarandeoTarifa, ZarandeoImporte = @ZarandeoImporte, FumigadoTarifa = @FumigadoTarifa, FumigadoImporte = @FumigadoImporte, MezclaTarifa = @MezclaTarifa, MezclaImporte = @MezclaImporte, ImporteTotal = @ImporteTotal
					WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal 

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
-- Created: 24/06/2014 23:34:54
-- Updated: 
-- Description: Elimina un Movimiento_Cereal_Calculo
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Calculo_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Calculo_Delete
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Calculo_Delete 
	@IDMovimiento_Cereal int
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Movimiento_Cereal_Calculo
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal 

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
-- Created: 15/06/2017 15:43
-- Updated: 
-- Description: Obtiene los datos del Movimiento_Cereal_Analisis
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Analisis_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Analisis_Get
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Analisis_Get
	@IDMovimiento_Cereal int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDMovimiento_Cereal, Fecha, MuestraNumero, ResultadoIPRO
		FROM Movimiento_Cereal_Analisis
		WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal 

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 15/06/2017 15:43
-- Updated: 
-- Description: Agrega un Movimiento_Cereal_Analisis
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Analisis_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Analisis_Add
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Analisis_Add
	@IDMovimiento_Cereal int, 
	@Fecha date,
	@MuestraNumero int,
	@ResultadoIPRO bit
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			INSERT INTO Movimiento_Cereal_Analisis
				(IDMovimiento_Cereal, Fecha, MuestraNumero, ResultadoIPRO)
				VALUES (@IDMovimiento_Cereal, @Fecha, @MuestraNumero, @ResultadoIPRO)
	
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
-- Created: 15/06/2017 15:43
-- Updated: 
-- Description: Actualiza los datos del Movimiento_Cereal_Analisis
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Analisis_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Analisis_Update
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Analisis_Update
	@IDMovimiento_Cereal int,
	@Fecha date,
	@MuestraNumero int,
	@ResultadoIPRO bit
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

			UPDATE Movimiento_Cereal_Analisis
				SET Fecha = @Fecha, MuestraNumero = @MuestraNumero, ResultadoIPRO = @ResultadoIPRO
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal 

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
-- Created: 15/06/2017 15:43
-- Updated: 
-- Description: Elimina un Movimiento_Cereal_Analisis
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_Analisis_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_Analisis_Delete
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_Analisis_Delete 
	@IDMovimiento_Cereal int
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Movimiento_Cereal_Analisis
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal 

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
-- Create date: 2013-09-03
-- Description:	Lista los Partidos disponibles para un Formularios 1116A
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_ListPartido') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_ListPartido
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Entrada_SinCertificar_ListPartido
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha smallint,
	@IDCereal tinyint,
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT DISTINCT Partido.IDPartido, Partido.Nombre
		FROM ((Movimiento_Cereal INNER JOIN Entidad_OrigenDestino ON Movimiento_Cereal.IDEntidad_Titular = Entidad_OrigenDestino.IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = Entidad_OrigenDestino.IDOrigenDestino)
			INNER JOIN Localidad ON Entidad_OrigenDestino.IDLocalidad = Localidad.IDLocalidad)
			INNER JOIN Partido ON Localidad.IDPartido = Partido.IDPartido
		WHERE Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND Movimiento_Cereal.Certificado = 0
			AND Movimiento_Cereal.Humedad IS NOT NULL AND Movimiento_Cereal.Zaranda IS NOT NULL
			AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad_Depositario AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND Movimiento_Cereal.IDCosecha = @IDCosecha AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Movimiento_Cereal.FechaHoraDescarga BETWEEN @FechaDesde AND DATEADD(minute, -1, DATEADD(day, 1, CAST(@FechaHasta AS datetime)))
		ORDER BY Partido.Nombre
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-25
-- Description:	Lista las Cartas de Porte de Entrada pendientes de Certificar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Entrada_SinCertificar_List
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Entrada_SinCertificar_List
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha smallint,
	@IDCereal tinyint,
	@IDPartido smallint,
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT Movimiento_Cereal.IDMovimiento_Cereal, 0 AS Selected, Movimiento_Cereal.CTGNumero, Movimiento_Cereal.ComprobanteNumeroConFormato AS ComprobanteNumero, Movimiento_Cereal.FechaHoraArribo, Movimiento_Cereal.PesoNeto, Movimiento_Cereal.MermaZarandaKilogramo, Movimiento_Cereal.Humedad, Movimiento_Cereal.MermaHumedadKilogramo, Movimiento_Cereal.MermaVolatilKilogramo, Movimiento_Cereal.PesoFinal
		FROM ((Movimiento_Cereal INNER JOIN Entidad AS Entidad_Transportista ON Movimiento_Cereal.IDEntidad_Transportista = Entidad_Transportista.IDEntidad) INNER JOIN Entidad_OrigenDestino AS Origen ON Movimiento_Cereal.IDEntidad_Titular = Origen.IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = Origen.IDOrigenDestino) INNER JOIN Localidad AS Localidad_Origen ON Origen.IDLocalidad = Localidad_Origen.IDLocalidad
		WHERE Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL AND Movimiento_Cereal.Certificado = 0
			AND Movimiento_Cereal.Humedad IS NOT NULL AND Movimiento_Cereal.Zaranda IS NOT NULL
			AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad_Depositario AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND Movimiento_Cereal.IDCosecha = @IDCosecha AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Localidad_Origen.IDPartido = @IDPartido
			AND Movimiento_Cereal.FechaHoraDescarga BETWEEN @FechaDesde AND DATEADD(minute, -1, DATEADD(day, 1, CAST(@FechaHasta AS datetime)))
		ORDER BY Movimiento_Cereal.CTGNumero
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-04
-- Updates: 2022-06-03 - Se agregó el campo CTGNumero
-- Description:	Lista las Cartas de Porte de Salida pendientes de RT o B
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_Salida_SinAplicar_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_Salida_SinAplicar_List
GO

CREATE PROCEDURE usp_Movimiento_Cereal_Salida_SinAplicar_List
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha smallint,
	@IDCereal tinyint,
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT Movimiento_Cereal.IDMovimiento_Cereal, Movimiento_Cereal.ComprobanteNumero, Movimiento_Cereal.CTGNumero, Movimiento_Cereal.FechaCarga, Movimiento_Cereal.PesoNeto, (Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) AS KilogramoPendiente, 0 AS KilogramoAsignar
		FROM Movimiento_Cereal
		WHERE Movimiento_Cereal.Tipo = 'S' AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND (Movimiento_Cereal.PesoNeto - Movimiento_Cereal.KilogramoAplicado) > 0
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad_Depositario AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta AND dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND Movimiento_Cereal.IDCosecha = @IDCosecha AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Movimiento_Cereal.FechaHoraDescarga BETWEEN @FechaDesde AND DATEADD(minute, -1, DATEADD(day, 1, CAST(@FechaHasta AS datetime)))

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:		2013-10-28
-- Updated:
--		2013-11-01 - Modificado para utilizar la tabla de detalle
-- Description:	Agrega una Conversión a SubProductos (Varios Movimientos de SubProductos)
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_A_SubProducto') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_A_SubProducto
GO

CREATE PROCEDURE usp_Movimiento_Cereal_A_SubProducto
	@IDMovimiento_Cereal int,
	@IDUsuario tinyint,
	@StringListOfIDSubProductoPorcentajeAndKilogramo varchar(1000)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @SeparatorPos int = 0
	DECLARE @DelimiterPosStart int = 0
	DECLARE @DelimiterPosEnd int = 0
	DECLARE @ValuePairLen int
	DECLARE @ValuePair varchar(25)
	
	DECLARE @Fecha date
	DECLARE @IDEntidad_Titular int
	DECLARE @IDOrigenDestino_Origen smallint
	
	DECLARE @IDMovimiento_SubProducto int
	DECLARE @ComprobanteNumero varchar(13)
	
	DECLARE @Linea tinyint
	DECLARE @IDSubProducto tinyint = 0
	DECLARE @Porcentaje decimal(5,2)
	DECLARE @Kilogramo int
	
	BEGIN TRY
	
		BEGIN TRANSACTION
			--OBTENGO LOS DATOS DEL MOVIMIENTO CEREAL
			SELECT @Fecha = FechaCarga, @IDEntidad_Titular = IDEntidad_Titular, @IDOrigenDestino_Origen = IDOrigenDestino_Origen
				FROM Movimiento_Cereal
				WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal

			--OBTENGO EL NUEVO ID DEL MOVIMIENTO DE SUBPRODUCTO
			SET @IDMovimiento_SubProducto = (SELECT ISNULL(MAX(IDMovimiento_SubProducto), 0) + 1 FROM Movimiento_SubProducto)

			--OBTENGO EL PROXIMO NÚMERO DE COMPROBANTE DE ENTRADA
			SET @ComprobanteNumero = (SELECT ISNULL(CAST(MAX(ComprobanteNumero) as int), 0) + 1 FROM Movimiento_SubProducto WHERE Tipo = 'E')
			SET @ComprobanteNumero = REPLICATE('0', 12 - DATALENGTH(@ComprobanteNumero)) + @ComprobanteNumero

			--INSERTO EL MOVIMIENTO
			INSERT INTO Movimiento_SubProducto
				(IDMovimiento_SubProducto, Tipo, ComprobanteNumero, Fecha, IDEntidad_Titular, IDOrigenDestino_Origen, IDMovimiento_Cereal, EsCanje, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion)
				VALUES (@IDMovimiento_SubProducto, 'E', @ComprobanteNumero, @Fecha, @IDEntidad_Titular, @IDOrigenDestino_Origen, @IDMovimiento_Cereal, 0, @IDUsuario, GETDATE(), @IDUsuario, GETDATE())
		
			--PARSEO LOS ITEMS Y LOS AGREGO A LA TABLA DE DETALLE DE SUBPRODUCTOS
			WHILE CHARINDEX('|', @StringListOfIDSubProductoPorcentajeAndKilogramo, @SeparatorPos + 1) > 0
				BEGIN				
					SET @ValuePairLen = CHARINDEX('|', @StringListOfIDSubProductoPorcentajeAndKilogramo, @SeparatorPos + 1) - @SeparatorPos
					SET @ValuePair = SUBSTRING(@StringListOfIDSubProductoPorcentajeAndKilogramo, @SeparatorPos, @ValuePairLen)
					
					--LÍNEA
					SET @Linea = (SELECT ISNULL(MAX(Linea), 0) + 1 FROM Movimiento_SubProducto_Detalle WHERE IDMovimiento_SubProducto = @IDMovimiento_SubProducto)
					
					--ID SUB PRODUCTO
					SET @DelimiterPosStart = CHARINDEX('¬', @ValuePair, 1)
					IF @DelimiterPosStart > 0
						SET @IDSubProducto = CAST(SUBSTRING(@ValuePair, 1, @DelimiterPosStart - 1) AS tinyint)
					
					--PORCENTAJE
					SET @DelimiterPosEnd = CHARINDEX('¬', @ValuePair, @DelimiterPosStart + 1)
					SET @Porcentaje = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, (@DelimiterPosEnd - @DelimiterPosStart - 1)) AS decimal(5,2))
					
					--KILOGRAMO
					SET @DelimiterPosStart = @DelimiterPosEnd
					SET @Kilogramo = CAST(SUBSTRING(@ValuePair, @DelimiterPosStart + 1, 10) AS int)
					
					--INSERTO EL DETALLE DEL MOVIMIENTO
					INSERT INTO Movimiento_SubProducto_Detalle
						(IDMovimiento_SubProducto, Linea, IDSubProducto, Porcentaje, Kilogramo)
						VALUES (@IDMovimiento_SubProducto, @Linea, @IDSubProducto, @Porcentaje, @Kilogramo)
					
					SET @SeparatorPos = CHARINDEX('|', @StringListOfIDSubProductoPorcentajeAndKilogramo, @SeparatorPos + @ValuePairLen) + 1
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
-- Created:		2014-01-20
-- Updated:
--		
-- Description:	Devuelve el Formulario A (si es una CP de entrada) o los Formularios RT (si es una CP de salida) a los que está aplicada la CP
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Movimiento_Cereal_FormulariosAplicados') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Movimiento_Cereal_FormulariosAplicados
GO

CREATE PROCEDURE usp_Movimiento_Cereal_FormulariosAplicados
	@IDMovimiento_Cereal int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Tipo char(1)
	
	SET @Tipo = (SELECT Tipo FROM Movimiento_Cereal WHERE IDMovimiento_Cereal = @IDMovimiento_Cereal)
	IF @Tipo = 'E'
		BEGIN
		SELECT Formulario1116A_Cabecera.FormularioNumero + ' - ' + CONVERT(varchar(10), Formulario1116A_Cabecera.Fecha, 103) AS Formulario
			FROM Formulario1116A_Cabecera INNER JOIN Formulario1116A_Detalle ON Formulario1116A_Cabecera.IDFormulario1116A = Formulario1116A_Detalle.IDFormulario1116A
			WHERE Formulario1116A_Detalle.IDMovimiento_Cereal = @IDMovimiento_Cereal
		END
	IF @Tipo = 'S'
		BEGIN
		SELECT Formulario1116RT_Cabecera.FormularioNumero + ' - ' + CONVERT(varchar(10), Formulario1116RT_Cabecera.Fecha, 103) AS Formulario
			FROM Formulario1116RT_Cabecera INNER JOIN Formulario1116RT_Detalle ON Formulario1116RT_Cabecera.IDFormulario1116RT = Formulario1116RT_Detalle.IDFormulario1116RT
			WHERE Formulario1116RT_Detalle.IDMovimiento_Cereal = @IDMovimiento_Cereal
		END
	
END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	05/07/2015 17:22
-- Updated:	
-- Description: Obtiene los datos para el Libro de existencias MC14
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_MC14') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_MC14
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_MC14 
	@IDEntidad int,
	@IDPlanta smallint,
	@Anio smallint,
	@Mes tinyint AS

BEGIN
	(SELECT Cereal.ONCCA_EspecieCodigo AS Especie, Cosecha.ONCCA_Codigo AS Cosecha, CAST(ROUND(CAST(SUM(ABS(Movimiento_Cereal.PesoFinal)) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Entradas, CAST(0 AS decimal(7,2)) AS Salidas
		FROM (Movimiento_Cereal INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha
		WHERE Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND ((Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad) OR (Movimiento_Cereal.Tipo IN ('U', 'T') AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad))
			AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND YEAR(Movimiento_Cereal.FechaHoraDescarga) = @Anio
			AND MONTH(Movimiento_Cereal.FechaHoraDescarga) = @Mes
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cosecha.ONCCA_Codigo)
	UNION
	(SELECT Cereal.ONCCA_EspecieCodigo AS Especie, Cosecha.ONCCA_Codigo AS Cosecha, CAST(0 AS decimal(7,2)) AS Entradas, CAST(ROUND(CAST(SUM(ABS(Movimiento_Cereal.PesoFinal)) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS Salidas
		FROM (Movimiento_Cereal INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha
		WHERE Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND Movimiento_Cereal.Tipo IN ('S', 'B', 'T')
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad
			AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND YEAR(Movimiento_Cereal.FechaCarga) = @Anio
			AND MONTH(Movimiento_Cereal.FechaCarga) = @Mes
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cosecha.ONCCA_Codigo)
END
GO





-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	06/07/2015 00:08
-- Updated:	
-- Description: Obtiene los datos para la Planilla MC17
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Movimiento_Cereal_MC17') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Movimiento_Cereal_MC17
GO

CREATE PROCEDURE dbo.usp_Movimiento_Cereal_MC17
	@IDEntidad int,
	@IDPlanta smallint,
	@Anio smallint,
	@Semana tinyint AS

BEGIN

	SET DATEFIRST 4

	SELECT Cereal.ONCCA_EspecieCodigo AS Especie, Cosecha.ONCCA_Codigo AS Cosecha, CAST(ROUND(CAST(SUM(ABS(Movimiento_Cereal.PesoFinal)) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS ComprasAFijar
		FROM (Movimiento_Cereal INNER JOIN Cereal ON Movimiento_Cereal.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Movimiento_Cereal.IDCosecha = Cosecha.IDCosecha
		WHERE Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL
			AND ((Movimiento_Cereal.Tipo = 'E' AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad) OR (Movimiento_Cereal.Tipo IN ('U', 'T') AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad))
			--CORRECCIÓN 28/10/2015 - SE DEBE TOMAR EL DESTINATARIO PARA CONTROLAR
			--AND (dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) NOT IN (371, 198, 297))
			AND Movimiento_Cereal.IDEntidad_Destinatario = 1
			AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND ((YEAR(Movimiento_Cereal.FechaHoraDescarga) = @Anio AND DATEPART(week, Movimiento_Cereal.FechaHoraDescarga) = @Semana)
					OR (YEAR(Movimiento_Cereal.FechaHoraDescarga) = @Anio - 1 AND DATEPART(week, Movimiento_Cereal.FechaHoraDescarga) = 53 AND @Semana = 1))
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cosecha.ONCCA_Codigo


	SELECT Cereal.ONCCA_EspecieCodigo AS Especie, Cosecha.ONCCA_Codigo AS Cosecha, CAST(ROUND(CAST(SUM(ABS(Formulario1116B_Cabecera.OperacionCantidad)) AS decimal(10,2)) / 1000, 2) AS decimal(7,2)) AS FijadoEnLaSemana
		FROM (Formulario1116B_Cabecera INNER JOIN Cereal ON Formulario1116B_Cabecera.IDCereal = Cereal.IDCereal) INNER JOIN Cosecha ON Formulario1116B_Cabecera.IDCosecha = Cosecha.IDCosecha
		WHERE Formulario1116B_Cabecera.DepositarioIDEntidad = @IDEntidad --AND Formulario1116B_Cabecera.DepositarioIDPlanta = @IDPlanta
			AND ((YEAR(Formulario1116B_Cabecera.CondicionOperacionFecha) = @Anio AND DATEPART(week, Formulario1116B_Cabecera.CondicionOperacionFecha) = @Semana)
					OR (YEAR(Formulario1116B_Cabecera.CondicionOperacionFecha) = @Anio - 1 AND DATEPART(week, Formulario1116B_Cabecera.CondicionOperacionFecha) = 53 AND @Semana = 1))
		GROUP BY Cereal.ONCCA_EspecieCodigo, Cosecha.ONCCA_Codigo

END
GO