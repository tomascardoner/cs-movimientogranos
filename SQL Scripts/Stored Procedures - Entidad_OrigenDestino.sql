USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:47:30
-- Updated: 03/07/2020 - se agregó el campo RealizaAnalisisIPRO
-- Description: Obtiene los datos del Origen/Destino de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_OrigenDestino_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_OrigenDestino_Get
GO

CREATE PROCEDURE dbo.usp_Entidad_OrigenDestino_Get
	@IDEntidad int,
	@IDOrigenDestino smallint
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDEntidad, IDOrigenDestino, Nombre, Direccion, IDLocalidad, Kilometro, ONCCA_Codigo, ControlaStock, ConvierteEnSubProducto, RealizaAnalisis, RealizaAnalisisIPRO, Activo
		FROM Entidad_OrigenDestino
		WHERE Entidad_OrigenDestino.IDEntidad = @IDEntidad AND Entidad_OrigenDestino.IDOrigenDestino = @IDOrigenDestino 

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 11/01/2022 15:21
-- Description: Obtiene los datos del Origen/Destino de la Entidad por medio del Código ONCCA
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_OrigenDestino_GetByCodigoOncca') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_OrigenDestino_GetByCodigoOncca
GO

CREATE PROCEDURE dbo.usp_Entidad_OrigenDestino_GetByCodigoOncca
	@IDEntidad int,
	@ONCCA_Codigo int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT IDEntidad, IDOrigenDestino, Nombre, Direccion, IDLocalidad, Kilometro, ONCCA_Codigo, ControlaStock, ConvierteEnSubProducto, RealizaAnalisis, RealizaAnalisisIPRO, Activo
		FROM Entidad_OrigenDestino
		WHERE Entidad_OrigenDestino.IDEntidad = @IDEntidad AND Entidad_OrigenDestino.ONCCA_Codigo = @ONCCA_Codigo 

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 17/04/2022 19:20
-- Description: Obtiene los datos del primer Origen/Destino disponible de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_OrigenDestino_GetFirst') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_OrigenDestino_GetFirst
GO

CREATE PROCEDURE dbo.usp_Entidad_OrigenDestino_GetFirst
	@IDEntidad int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1 IDEntidad, IDOrigenDestino, Nombre, Direccion, IDLocalidad, Kilometro, ONCCA_Codigo, ControlaStock, ConvierteEnSubProducto, RealizaAnalisis, RealizaAnalisisIPRO, Activo
		FROM Entidad_OrigenDestino
		WHERE IDEntidad = @IDEntidad AND ONCCA_Codigo IS NULL
		ORDER BY IDOrigenDestino

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:47:30
-- Updated: 03/07/2020 - se agregó el campo RealizaAnalisisIPRO
-- Description: Agrega un Origen/Destino a la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_OrigenDestino_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_OrigenDestino_Add
GO

CREATE PROCEDURE dbo.usp_Entidad_OrigenDestino_Add
	@IDEntidad int,
	@IDOrigenDestino smallint OUTPUT, 
	@Nombre varchar(50),
	@Direccion varchar(250),
	@IDLocalidad int,
	@Kilometro smallint,
	@ONCCA_Codigo int,
	@ControlaStock bit,
	@ConvierteEnSubProducto bit,
	@RealizaAnalisis bit,
	@RealizaAnalisisIPRO bit,
	@Activo bit
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDOrigenDestino = (SELECT ISNULL(MAX(Entidad_OrigenDestino.IDOrigenDestino), 0) + 1 FROM Entidad_OrigenDestino WHERE IDEntidad = @IDEntidad)
		
			INSERT INTO Entidad_OrigenDestino
				(IDEntidad, IDOrigenDestino, Nombre, Direccion, IDLocalidad, Kilometro, ONCCA_Codigo, ControlaStock, ConvierteEnSubProducto, RealizaAnalisis, RealizaAnalisisIPRO, Activo)
				VALUES (@IDEntidad, @IDOrigenDestino, @Nombre, @Direccion, @IDLocalidad, @Kilometro, @ONCCA_Codigo, @ControlaStock, @ConvierteEnSubProducto, @RealizaAnalisis, @RealizaAnalisisIPRO, @Activo)
	
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
-- Created: 11/06/2014 22:47:30
-- Updated: 03/07/2020 - se agregó el campo RealizaAnalisisIPRO
-- Description: Actualiza los datos del Origen/Destino de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_OrigenDestino_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_OrigenDestino_Update
GO

CREATE PROCEDURE dbo.usp_Entidad_OrigenDestino_Update
	@IDEntidad int,
	@IDOrigenDestino smallint,
	@Nombre varchar(50),
	@Direccion varchar(250),
	@IDLocalidad int,
	@Kilometro smallint,
	@ONCCA_Codigo int,
	@ControlaStock bit,
	@ConvierteEnSubProducto bit,
	@RealizaAnalisis bit,
	@RealizaAnalisisIPRO bit,
	@Activo bit
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Entidad_OrigenDestino
					SET Nombre = @Nombre, Direccion = @Direccion, IDLocalidad = @IDLocalidad, Kilometro = @Kilometro, ONCCA_Codigo = @ONCCA_Codigo, ControlaStock = @ControlaStock, ConvierteEnSubProducto = @ConvierteEnSubProducto, RealizaAnalisis = @RealizaAnalisis, RealizaAnalisisIPRO = @RealizaAnalisisIPRO, Activo = @Activo
					WHERE IDEntidad = @IDEntidad AND IDOrigenDestino = @IDOrigenDestino 

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
-- Created: 11/06/2014 22:47:30
-- Updated: 
-- Description: Elimina un Origen/Destino de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_OrigenDestino_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_OrigenDestino_Delete
GO

CREATE PROCEDURE dbo.usp_Entidad_OrigenDestino_Delete 
	@IDEntidad int,
	@IDOrigenDestino smallint
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Entidad_OrigenDestino
				WHERE IDEntidad = @IDEntidad AND IDOrigenDestino = @IDOrigenDestino 

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
-- Created: 2013-11-08
-- Description:	Lista los Orígenes/Destinos de la Entidad
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_OrigenDestino_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_OrigenDestino_List
GO

CREATE PROCEDURE usp_Entidad_OrigenDestino_List
	@ListaNinguno bit,
	@MostrarNombreEmpresa bit,
	@Activo bit,
	@ControlaStock bit,
	@ConvierteEnSubProducto bit,
	@IDEntidad int,
	@IDOrigenDestino int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT '0' AS ID, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT (CASE ISNULL(@IDEntidad, 0) WHEN 0 THEN CONVERT(varchar(7), Entidad.IDEntidad) + RIGHT('00000' + CONVERT(varchar(5), Entidad_OrigenDestino.IDOrigenDestino), 5) ELSE CONVERT(varchar(5), Entidad_OrigenDestino.IDOrigenDestino) END) AS ID, (CASE ISNULL(@MostrarNombreEmpresa, 1) WHEN 1 THEN Entidad.Nombre + ' - ' + Entidad_OrigenDestino.Nombre + ISNULL(' - (' + CONVERT(varchar(7), ONCCA_Codigo, 1) + ')', '') ELSE Entidad_OrigenDestino.Nombre + ISNULL(' - (' + CONVERT(varchar(7), ONCCA_Codigo, 1) + ')', '') END) AS Nombre, 2 AS Orden
			FROM Entidad INNER JOIN Entidad_OrigenDestino ON Entidad.IDEntidad = Entidad_OrigenDestino.IDEntidad
			WHERE (@Activo IS NULL OR Entidad.Activo = @Activo
						OR (@Activo = 0 AND Entidad.IDEntidad = @IDEntidad AND Entidad_OrigenDestino.IDOrigenDestino = @IDOrigenDestino))
					AND (@ControlaStock IS NULL OR ControlaStock = @ControlaStock)
					AND (@ConvierteEnSubProducto IS NULL OR ConvierteEnSubProducto = @ConvierteEnSubProducto)
					AND (@IDEntidad IS NULL OR Entidad.IDEntidad = @IDEntidad)
					)
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT (CASE ISNULL(@IDEntidad, 0) WHEN 0 THEN CONVERT(varchar(7), Entidad.IDEntidad) + RIGHT('00000' + CONVERT(varchar(5), Entidad_OrigenDestino.IDOrigenDestino), 5) ELSE CONVERT(varchar(5), Entidad_OrigenDestino.IDOrigenDestino) END) AS ID, (CASE ISNULL(@MostrarNombreEmpresa, 1) WHEN 1 THEN Entidad.Nombre + ' - ' + Entidad_OrigenDestino.Nombre + ISNULL(' - (' + CONVERT(varchar(7), ONCCA_Codigo, 1) + ')', '') ELSE Entidad_OrigenDestino.Nombre + ISNULL(' - (' + CONVERT(varchar(7), ONCCA_Codigo, 1) + ')', '') END) AS Nombre
			FROM Entidad INNER JOIN Entidad_OrigenDestino ON Entidad.IDEntidad = Entidad_OrigenDestino.IDEntidad
			WHERE (@Activo IS NULL OR Entidad.Activo = @Activo
						OR (@Activo = 0 AND Entidad.IDEntidad = @IDEntidad AND Entidad_OrigenDestino.IDOrigenDestino = @IDOrigenDestino))
					AND (@ControlaStock IS NULL OR ControlaStock = @ControlaStock)
					AND (@ConvierteEnSubProducto IS NULL OR ConvierteEnSubProducto = @ConvierteEnSubProducto)
					AND (@IDEntidad IS NULL OR Entidad.IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO