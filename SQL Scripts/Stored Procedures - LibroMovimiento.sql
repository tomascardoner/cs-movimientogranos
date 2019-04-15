USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created:	2013-11-17
-- Description:	Lista los Libros de Movimientos
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_LibroMovimiento_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_LibroMovimiento_List
GO

CREATE PROCEDURE usp_LibroMovimiento_List
	@ListaNinguno bit,
	@IncluyeCereal bit,
	@Activo bit,
	@IDEntidad int,
	@IDPlanta smallint,
	@Rubrica int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS Rubrica, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT Rubrica, CAST(LibroMovimiento_Cabecera.Rubrica AS varchar) + (CASE @IncluyeCereal WHEN 1 THEN ' - ' + Cereal.Nombre ELSE '' END) AS Nombre, 2 AS Orden
			FROM LibroMovimiento_Cabecera INNER JOIN Cereal ON LibroMovimiento_Cabecera.IDCereal = Cereal.IDCereal
			WHERE (@IDEntidad IS NULL OR (LibroMovimiento_Cabecera.IDEntidad = @IDEntidad AND LibroMovimiento_Cabecera.IDPlanta = @IDPlanta))
				AND (@Activo IS NULL OR (LibroMovimiento_Cabecera.Activo = @Activo AND Cereal.Activo = @Activo) OR Rubrica = @Rubrica))
		ORDER BY Orden, Nombre ASC
		END
	ELSE
		BEGIN
		SELECT Rubrica, CAST(LibroMovimiento_Cabecera.Rubrica AS varchar) + (CASE @IncluyeCereal WHEN 1 THEN ' - ' + Cereal.Nombre ELSE '' END) AS Nombre
			FROM LibroMovimiento_Cabecera INNER JOIN Cereal ON LibroMovimiento_Cabecera.IDCereal = Cereal.IDCereal
			WHERE (@IDEntidad IS NULL OR (LibroMovimiento_Cabecera.IDEntidad = @IDEntidad AND LibroMovimiento_Cabecera.IDPlanta = @IDPlanta))
				AND (@Activo IS NULL OR (LibroMovimiento_Cabecera.Activo = @Activo AND Cereal.Activo = @Activo) OR Rubrica = @Rubrica)
			ORDER BY LibroMovimiento_Cabecera.Rubrica ASC
		END
END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 2013-11-18
-- Description:	
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_LibroMovimiento_ListMovimiento') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_LibroMovimiento_ListMovimiento
GO

CREATE PROCEDURE usp_LibroMovimiento_ListMovimiento
	@IDEntidad int,
	@IDPlanta smallint,
	@IDCereal tinyint,
	@Anio smallint,
	@Mes tinyint
AS
BEGIN
	SET NOCOUNT ON;

	--CP ENTRADAS
	(SELECT 1 AS TipoOrden, CAST(CONVERT(char(10), Movimiento_Cereal.FechaHoraDescarga, 111) AS date) AS Fecha, '01' AS ComprobanteTipo, Movimiento_Cereal.ComprobanteNumero, Entidad.CUIT, Entidad.Nombre AS RemitenteODestinatario, Movimiento_Cereal.PesoNeto AS IngresosKilosBrutos, Movimiento_Cereal.PesoFinal AS IngresosKilosNetos, 0 AS EgresosKilosNetos, '' AS Observaciones
		FROM Movimiento_Cereal, Entidad
		WHERE dbo.udf_GetRemitenteCereal(Movimiento_Cereal.IDEntidad_Titular, Movimiento_Cereal.IDEntidad_Intermediario, Movimiento_Cereal.IDEntidad_RemitenteComercial) = Entidad.IDEntidad
			AND Movimiento_Cereal.Tipo = 'E'
			AND Movimiento_Cereal.IDEntidad_Destino = @IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Year(Movimiento_Cereal.FechaHoraDescarga) = @Anio And Month(Movimiento_Cereal.FechaHoraDescarga) = @Mes
			AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL)
	--CP SALIDAS
	UNION
	(SELECT 4 AS TipoOrden, Movimiento_Cereal.FechaCarga AS Fecha, '01' AS ComprobanteTipo, Movimiento_Cereal.ComprobanteNumero, Entidad.CUIT, Entidad.Nombre AS RemitenteODestinatario, 0 AS IngresosKilosBrutos, 0 AS IngresosKilosNetos, ABS(Movimiento_Cereal.PesoFinal) AS EgresosKilosNetos, '' AS Observaciones
		FROM Movimiento_Cereal INNER JOIN Entidad ON Movimiento_Cereal.IDEntidad_Destinatario = Entidad.IDEntidad
		WHERE Movimiento_Cereal.Tipo = 'S'
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Year(Movimiento_Cereal.FechaCarga) = @Anio And Month(Movimiento_Cereal.FechaCarga) = @Mes
			AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL)
	--TRANSFERENCIAS INTERNAS (ENTRANTES)
	UNION
	(SELECT 2 AS TipoOrden, Movimiento_Cereal.FechaCarga AS Fecha, '03' AS ComprobanteTipo, Movimiento_Cereal.ComprobanteNumero, Entidad.CUIT, Entidad.Nombre AS RemitenteODestinatario, Movimiento_Cereal.PesoNeto AS IngresosKilosBrutos, ABS(Movimiento_Cereal.PesoFinal) AS IngresosKilosNetos, 0 AS EgresosKilosNetos, 'Transferencia Interna' AS Observaciones
		FROM Movimiento_Cereal INNER JOIN Entidad ON Movimiento_Cereal.IDEntidad_Titular = Entidad.IDEntidad
		WHERE Movimiento_Cereal.Tipo = 'T'
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Destino = @IDPlanta
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Year(Movimiento_Cereal.FechaCarga) = @Anio And Month(Movimiento_Cereal.FechaCarga) = @Mes
			AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL)
	--TRANSFERENCIAS INTERNAS (SALIENTES)
	UNION
	(SELECT 5 AS TipoOrden, Movimiento_Cereal.FechaCarga AS Fecha, '03' AS ComprobanteTipo, Movimiento_Cereal.ComprobanteNumero, Entidad.CUIT, Entidad.Nombre AS RemitenteODestinatario, 0 AS IngresosKilosBrutos, 0 AS IngresosKilosNetos, ABS(Movimiento_Cereal.PesoFinal) AS EgresosKilosNetos, 'Transferencia Interna' AS Observaciones
		FROM Movimiento_Cereal INNER JOIN Entidad ON Movimiento_Cereal.IDEntidad_Titular = Entidad.IDEntidad
		WHERE Movimiento_Cereal.Tipo = 'T'
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Year(Movimiento_Cereal.FechaCarga) = @Anio And Month(Movimiento_Cereal.FechaCarga) = @Mes
			AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL)
	--SALIDAS A PRODUCCION
	UNION
	(SELECT 6 AS TipoOrden, Movimiento_Cereal.FechaCarga AS Fecha, '03' AS ComprobanteTipo, Movimiento_Cereal.ComprobanteNumero, Entidad.CUIT, Entidad.Nombre AS RemitenteODestinatario, 0 AS IngresosKilosBrutos, 0 AS IngresosKilosNetos, ABS(Movimiento_Cereal.PesoFinal) AS EgresosKilosNetos, 'Salida a Producción' AS Observaciones
		FROM Movimiento_Cereal INNER JOIN Entidad ON Movimiento_Cereal.IDEntidad_Titular = Entidad.IDEntidad
		WHERE Movimiento_Cereal.Tipo = 'P'
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Year(Movimiento_Cereal.FechaCarga) = @Anio And Month(Movimiento_Cereal.FechaCarga) = @Mes
			AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL)
	--AJUSTES (BAJAS)
	UNION
	(SELECT 7 AS TipoOrden, Movimiento_Cereal.FechaCarga AS Fecha, '03' AS ComprobanteTipo, Movimiento_Cereal.ComprobanteNumero, Entidad.CUIT, Entidad.Nombre AS RemitenteODestinatario, 0 AS IngresosKilosBrutos, 0 AS IngresosKilosNetos, ABS(Movimiento_Cereal.PesoFinal) AS EgresosKilosNetos, 'Ajuste' AS Observaciones
		FROM Movimiento_Cereal INNER JOIN Entidad ON Movimiento_Cereal.IDEntidad_Titular = Entidad.IDEntidad
		WHERE Movimiento_Cereal.Tipo = 'B'
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Year(Movimiento_Cereal.FechaCarga) = @Anio And Month(Movimiento_Cereal.FechaCarga) = @Mes
			AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL)
	--AJUSTES (SUBAS)
	UNION
	(SELECT 3 AS TipoOrden, Movimiento_Cereal.FechaCarga AS Fecha, '03' AS ComprobanteTipo, Movimiento_Cereal.ComprobanteNumero, Entidad.CUIT, Entidad.Nombre AS RemitenteODestinatario, Movimiento_Cereal.PesoNeto AS IngresosKilosBrutos, Movimiento_Cereal.PesoFinal AS IngresosKilosNetos, 0 AS EgresosKilosNetos, 'Ajuste' AS Observaciones
		FROM Movimiento_Cereal INNER JOIN Entidad ON Movimiento_Cereal.IDEntidad_Titular = Entidad.IDEntidad
		WHERE Movimiento_Cereal.Tipo = 'U'
			AND Movimiento_Cereal.IDEntidad_Titular = @IDEntidad AND Movimiento_Cereal.IDOrigenDestino_Origen = @IDPlanta
			AND Movimiento_Cereal.IDCereal = @IDCereal
			AND Year(Movimiento_Cereal.FechaCarga) = @Anio And Month(Movimiento_Cereal.FechaCarga) = @Mes
			AND Movimiento_Cereal.IDCartaPorte_MotivoAnulacion IS NULL)
	ORDER BY Fecha, TipoOrden, ComprobanteNumero

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 2014-01-29
-- Description:	Obtiene el saldo en kgs. del folio anterior
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_LibroMovimiento_Detalle_UltimoFolio') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_LibroMovimiento_Detalle_UltimoFolio
GO

CREATE PROCEDURE usp_LibroMovimiento_Detalle_UltimoFolio
	@Rubrica int,
	@Folio smallint OUTPUT,
	@SaldoKilogramoNeto int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @UltimaLinea smallint
	
	SET @Folio = (SELECT ISNULL(MAX(Folio), 0) FROM LibroMovimiento_Detalle WHERE Rubrica = @Rubrica)
	
	IF @Folio > 0
		BEGIN
		SET @UltimaLinea = (SELECT MAX(Linea) FROM LibroMovimiento_Detalle WHERE Rubrica = @Rubrica AND Folio = @Folio)
		SET @SaldoKilogramoNeto = (SELECT SaldoKilogramoNeto FROM LibroMovimiento_Detalle WHERE Rubrica = @Rubrica AND Folio = @Folio AND Linea = @UltimaLinea)
		END
	ELSE
		SET @SaldoKilogramoNeto = 0

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 2014-01-29
-- Description:	Agrega un movimiento al Libro de Movimientos
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_LibroMovimiento_Detalle_Add') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_LibroMovimiento_Detalle_Add
GO

CREATE PROCEDURE usp_LibroMovimiento_Detalle_Add
	@Rubrica int,
	@Folio smallint,
	@Linea tinyint,
	@MovimientoTipo char(1),
	@Fecha date,
	@ComprobanteTipo tinyint,
	@ComprobanteNumero varchar(13),
	@CUIT char(13),
	@RemitenteDestinatario varchar(100),
	@IngresoKilogramoBruto int,
	@IngresoKilogramoNeto int,
	@EgresoKilogramoNeto int,
	@SaldoKilogramoNeto int,
	@Observacion varchar(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO LibroMovimiento_Detalle
		(Rubrica, Folio, Linea, MovimientoTipo, Fecha, ComprobanteTipo, ComprobanteNumero, CUIT, RemitenteDestinatario, IngresoKilogramoBruto, IngresoKilogramoNeto, EgresoKilogramoNeto, SaldoKilogramoNeto, Observacion)
		VALUES (@Rubrica, @Folio, @Linea, @MovimientoTipo, @Fecha, @ComprobanteTipo, @ComprobanteNumero, @CUIT, @RemitenteDestinatario, @IngresoKilogramoBruto, @IngresoKilogramoNeto, @EgresoKilogramoNeto, @SaldoKilogramoNeto, @Observacion)
		
END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 2014-03-22
-- Description:	Elimina todos los Movimientos del período especificado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_LibroMovimiento_DeletePeriodo') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_LibroMovimiento_DeletePeriodo
GO

CREATE PROCEDURE usp_LibroMovimiento_DeletePeriodo
	@Rubrica int,
	@Anio smallint,
	@Mes tinyint
AS
BEGIN
	DELETE
		FROM LibroMovimiento_Detalle		
		WHERE Rubrica = @Rubrica AND YEAR(Fecha) = @Anio AND MONTH(Fecha) = @Mes
	
END
GO