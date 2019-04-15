USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-25
-- Description:	Devuelve el ID del Remitente de la Mercadería
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_GetRemitenteCereal') AND type = N'FN')
	DROP FUNCTION dbo.udf_GetRemitenteCereal
GO

CREATE FUNCTION udf_GetRemitenteCereal 
(	
	@IDEntitad_Titular int, 
	@IDEntidad_Intermediario int,
	@IDEntidad_RemitenteComercial int
) RETURNS int AS
BEGIN
	DECLARE @ReturnValue int

	IF @IDEntidad_Intermediario IS NULL
		BEGIN
		IF @IDEntidad_RemitenteComercial IS NULL
			BEGIN
			SET @ReturnValue = @IDEntitad_Titular
			END
		ELSE
			BEGIN
			SET @ReturnValue = @IDEntidad_RemitenteComercial
			END
		END
	ELSE
		BEGIN
		SET @ReturnValue = @IDEntidad_Intermediario
		END
		
	RETURN @ReturnValue
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-23
-- Description:	Devuelve el Nombre del Remitente de la Mercadería
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_GetRemitenteCerealNombre') AND type = N'FN')
	DROP FUNCTION dbo.udf_GetRemitenteCerealNombre
GO

CREATE FUNCTION udf_GetRemitenteCerealNombre 
(	
	@IDEntitad_Titular int, 
	@IDEntidad_Intermediario int,
	@IDEntidad_RemitenteComercial int
) RETURNS varchar(100) AS
BEGIN
	DECLARE @IDRemitenteCereal int
	DECLARE @ReturnValue varchar(100)

	SET @IDRemitenteCereal = dbo.udf_GetRemitenteCereal(@IDEntitad_Titular, @IDEntidad_Intermediario, @IDEntidad_RemitenteComercial)
	
	SET @ReturnValue = (SELECT Nombre FROM Entidad WHERE IDEntidad = @IDRemitenteCereal)
	
	RETURN @ReturnValue
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-25
-- Description:	Devuelve el Domicilio completo
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_GetDomicilioCompleto') AND type = N'FN')
	DROP FUNCTION dbo.udf_GetDomicilioCompleto
GO

CREATE FUNCTION udf_GetDomicilioCompleto 
(	
	@Calle varchar(50), 
	@Numero varchar(10),
	@Piso varchar(10),
	@Oficina varchar(10)
) RETURNS varchar(80) AS
BEGIN
	DECLARE @ReturnValue varchar(80)

	IF @Calle IS NOT NULL
		BEGIN
		SET @ReturnValue = @Calle
		IF @Numero IS NOT NULL
			BEGIN
			IF UPPER(SUBSTRING(@Calle, 1, 5)) = 'RUTA '
				BEGIN
				SET @ReturnValue = @ReturnValue + ' KM. ' + @Numero
				END
			ELSE
				BEGIN
				IF UPPER(SUBSTRING(@Calle, 1, 6)) = 'CALLE '
					BEGIN
					IF ISNUMERIC(SUBSTRING(@Calle, 7, 50)) = 1
						BEGIN
						SET @ReturnValue = @ReturnValue + ' Nº ' + @Numero
						END
					ELSE
						BEGIN
						SET @ReturnValue = @ReturnValue + ' ' + @Numero
						END
					END
				ELSE
					BEGIN
					SET @ReturnValue = @ReturnValue + ' ' + @Numero
					END
				END
			IF @Piso IS NOT NULL
				BEGIN
				if ISNUMERIC(@Piso) = 1
					BEGIN
					SET @ReturnValue = @ReturnValue + ' P.' + @Piso + '°'
					END
				ELSE
					BEGIN
					SET @ReturnValue = @ReturnValue + ' ' + @Piso
					END
				IF @Oficina IS NOT NULL
					BEGIN
					SET @ReturnValue = @ReturnValue + ' "' + @Oficina + '"'
					END
				END
			END
		END
	ELSE
		BEGIN
		SET @ReturnValue = ''
		END
	
	RETURN @ReturnValue
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-25
-- Description:	Devuelve el Código Postal y la Localidad formateados
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_GetCodigoPostalLocalidad') AND type = N'FN')
	DROP FUNCTION dbo.udf_GetCodigoPostalLocalidad
GO

CREATE FUNCTION udf_GetCodigoPostalLocalidad 
(	
	@CodigoPostal varchar(8),
	@Localidad varchar(50)
) RETURNS varchar(58) AS
BEGIN
	DECLARE @ReturnValue varchar(58)

	IF @Localidad IS NOT NULL
		BEGIN
		SET @ReturnValue = @Localidad
		IF @CodigoPostal IS NOT NULL
			BEGIN
			SET @ReturnValue = '(' + @CodigoPostal + ') ' + @ReturnValue
			END
		END
	ELSE
		BEGIN
		SET @ReturnValue = ''
		END
	
	RETURN @ReturnValue
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-18
-- Description:	Devuelve el Tipo y Número de Formulario 1116
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_GetFormulario1116TipoNumero') AND type = N'FN')
	DROP FUNCTION dbo.udf_GetFormulario1116TipoNumero
GO

CREATE FUNCTION udf_GetFormulario1116TipoNumero
(	
	@FormularioTipo char(1),
	@FormularioNumero varchar(13)
) RETURNS varchar(18) AS
BEGIN
	DECLARE @Tipo varchar(2)
	
	SET @Tipo = (CASE @FormularioTipo
					WHEN 'A' THEN 'A'
					WHEN 'B' THEN 'B'
					WHEN 'R' THEN 'RT'
				END)
	RETURN @Tipo + ' - ' + @FormularioNumero
	
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2015-09-23
-- Description:	Devuelve la cotización de la Moneda y Fecha especificada o hasta 5 días antes
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_GetMonedaCotizacionVenta') AND type = N'FN')
	DROP FUNCTION dbo.udf_GetMonedaCotizacionVenta
GO

CREATE FUNCTION udf_GetMonedaCotizacionVenta
(
	@IDMoneda smallint,
	@Fecha date
) RETURNS money AS
BEGIN
	DECLARE @Result money

	SET @Result = (SELECT MonedaCotizacion.CotizacionVenta FROM MonedaCotizacion WHERE MonedaCotizacion.IDMoneda = @IDMoneda AND MonedaCotizacion.Fecha = @Fecha)
	IF @Result IS NULL
		SET @Result = (SELECT TOP 1 MonedaCotizacion.CotizacionVenta FROM MonedaCotizacion WHERE MonedaCotizacion.IDMoneda = @IDMoneda AND MonedaCotizacion.Fecha BETWEEN DATEADD(day, -4, @Fecha) AND @Fecha ORDER BY MonedaCotizacion.Fecha DESC)

	RETURN @Result
	
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2016-05-13
-- Description:	Devuelve el Indice de la Tarifa de fasón para un movimiento dado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_Get_SubProducto_Grupo_Tarifa_Indice') AND type = N'FN')
	DROP FUNCTION dbo.udf_Get_SubProducto_Grupo_Tarifa_Indice
GO

CREATE FUNCTION udf_Get_SubProducto_Grupo_Tarifa_Indice
(
	@IDSubProducto_Grupo tinyint,
	@IDEntidadDestinatario int,
	@Fecha date
) RETURNS smallint AS
BEGIN
	DECLARE @Result smallint

	SELECT TOP 1 @Result = SubProducto_Grupo_Tarifa.Indice
		FROM SubProducto_Grupo_Tarifa
		WHERE SubProducto_Grupo_Tarifa.IDSubProducto_Grupo = @IDSubProducto_Grupo
			AND (SubProducto_Grupo_Tarifa.IDEntidad = @IDEntidadDestinatario OR SubProducto_Grupo_Tarifa.IDEntidad IS NULL)
			AND (SubProducto_Grupo_Tarifa.FechaDesde <= @Fecha OR SubProducto_Grupo_Tarifa.FechaDesde IS NULL)
			AND (DATEADD(second, -1, DATEADD(day, 1, CAST(SubProducto_Grupo_Tarifa.FechaHasta AS smalldatetime))) >= @Fecha OR SubProducto_Grupo_Tarifa.FechaHasta IS NULL)
			AND SubProducto_Grupo_Tarifa.IDSubProducto_Grupo = @IDSubProducto_Grupo
		ORDER BY IDEntidad DESC, Indice

	RETURN @Result
	
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2016-05-13
-- Description:	Devuelve la Tarifa de fasón para un movimiento dado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.udf_Get_SubProducto_Grupo_Tarifa_TarifaFasonDolar') AND type = N'FN')
	DROP FUNCTION dbo.udf_Get_SubProducto_Grupo_Tarifa_TarifaFasonDolar
GO

CREATE FUNCTION udf_Get_SubProducto_Grupo_Tarifa_TarifaFasonDolar
(
	@IDSubProducto_Grupo tinyint,
	@IDEntidadDestinatario int,
	@Fecha date
) RETURNS money AS
BEGIN
	DECLARE @Result money

	SELECT TOP 1 @Result = SubProducto_Grupo_Tarifa.TarifaFasonDolar
		FROM SubProducto_Grupo_Tarifa
		WHERE SubProducto_Grupo_Tarifa.IDSubProducto_Grupo = @IDSubProducto_Grupo
			AND (SubProducto_Grupo_Tarifa.IDEntidad = @IDEntidadDestinatario OR SubProducto_Grupo_Tarifa.IDEntidad IS NULL)
			AND (SubProducto_Grupo_Tarifa.FechaDesde <= @Fecha OR SubProducto_Grupo_Tarifa.FechaDesde IS NULL)
			AND (DATEADD(second, -1, DATEADD(day, 1, CAST(SubProducto_Grupo_Tarifa.FechaHasta AS datetime))) >= @Fecha OR SubProducto_Grupo_Tarifa.FechaHasta IS NULL)
		ORDER BY IDEntidad DESC, Indice

	RETURN @Result
	
END
GO