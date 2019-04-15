USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	05/11/2013 22:20:09
-- Updated:	
-- Description: Obtiene los datos del SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_SubProducto_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_SubProducto_Get
GO

CREATE PROCEDURE dbo.usp_SubProducto_Get
	@IDSubProducto tinyint 
AS

BEGIN
	SET NOCOUNT ON;

	SELECT SubProducto.IDSubProducto, SubProducto.Nombre, SubProducto.UtilizaPrecioDolar, SubProducto.ONCCA_Codigo, SubProducto.COT_Codigo, SubProducto.Activo
		FROM SubProducto
		WHERE SubProducto.IDSubProducto = @IDSubProducto 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	05/11/2013 22:20:09
-- Updated:	
-- Description: Agrega un SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_SubProducto_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_SubProducto_Add
GO

CREATE PROCEDURE dbo.usp_SubProducto_Add
	@IDSubProducto tinyint OUTPUT, 
	@Nombre varchar(50), 
	@UtilizaPrecioDolar bit, 
	@ONCCA_Codigo smallint, 
	@COT_Codigo int,
	@Activo bit 
AS

BEGIN
	SET NOCOUNT ON;

	SET @IDSubProducto = (SELECT ISNULL(MAX(SubProducto.IDSubProducto), 0) + 1 FROM SubProducto)

	INSERT INTO SubProducto
		(IDSubProducto, Nombre, UtilizaPrecioDolar, ONCCA_Codigo, COT_Codigo, Activo )
		VALUES (@IDSubProducto, @Nombre, @UtilizaPrecioDolar, @ONCCA_Codigo, @COT_Codigo, @Activo )

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	05/11/2013 22:20:09
-- Updated:	
-- Description: Actualiza los datos del SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_SubProducto_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_SubProducto_Update
GO

CREATE PROCEDURE dbo.usp_SubProducto_Update
	@IDSubProducto tinyint,
	@Nombre varchar(50),
	@UtilizaPrecioDolar bit,
	@ONCCA_Codigo smallint,
	@COT_Codigo int,
	@Activo bit
AS

BEGIN
	SET NOCOUNT ON;

	UPDATE SubProducto
		SET Nombre = @Nombre, UtilizaPrecioDolar = @UtilizaPrecioDolar, ONCCA_Codigo = @ONCCA_Codigo, COT_Codigo = @COT_Codigo, Activo = @Activo
		WHERE IDSubProducto = @IDSubProducto 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created:	05/11/2013 22:20:09
-- Updated:	
-- Description: Elimina un SubProducto
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_SubProducto_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_SubProducto_Delete
GO

CREATE PROCEDURE dbo.usp_SubProducto_Delete 
	@IDSubProducto tinyint AS
	
BEGIN
	SET NOCOUNT ON;

	DELETE
		FROM SubProducto
		WHERE IDSubProducto = @IDSubProducto 

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2014-03-23
-- Description:	Lista los SubProductos
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_SubProducto_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_SubProducto_List
GO

CREATE PROCEDURE usp_SubProducto_List
	@ListaNinguno bit,
	@MostrarONCCACodigo bit,
	@MostrarCOTCodigo bit,
	@Activo bit,
	@IDSubProducto tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDSubProducto, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDSubProducto, Nombre + (CASE @MostrarONCCACodigo WHEN 1 THEN ' (' + CAST(ONCCA_Codigo AS varchar) + ')' ELSE '' END) + (CASE @MostrarCOTCodigo WHEN 1 THEN ' (' + ISNULL(CAST(COT_Codigo AS varchar), '') + ')' ELSE '' END) AS Nombre, 2 AS Orden
			FROM SubProducto
			WHERE (@Activo IS NULL OR Activo = @Activo OR IDSubProducto = @IDSubProducto))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDSubProducto, Nombre + (CASE @MostrarONCCACodigo WHEN 1 THEN ' (' + CAST(ONCCA_Codigo AS varchar) + ')' ELSE '' END) + (CASE @MostrarCOTCodigo WHEN 1 THEN ' (' + ISNULL(CAST(COT_Codigo AS varchar), '') + ')' ELSE '' END) AS Nombre
			FROM SubProducto
			WHERE (@Activo IS NULL OR Activo = @Activo OR IDSubProducto = @IDSubProducto)
			ORDER BY Nombre
		END

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-10-24
-- Description:	Lista los Grupos de SubProductos
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_SubProducto_Grupo_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_SubProducto_Grupo_List
GO

CREATE PROCEDURE usp_SubProducto_Grupo_List
	@IDSubProducto_Grupo tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDSubProducto_Grupo, Nombre
		FROM SubProducto_Grupo
		WHERE Activo = 1
			OR IDSubProducto_Grupo = @IDSubProducto_Grupo

END
GO

-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-10-24
-- Description:	Lista el detalle del Grupo de SubProductos
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_SubProducto_Grupo_Detalle_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_SubProducto_Grupo_Detalle_List
GO

CREATE PROCEDURE usp_SubProducto_Grupo_Detalle_List
	@IDSubProducto_Grupo tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT SubProducto_Grupo_Detalle.IDSubProducto, SubProducto.Nombre AS SubProductoNombre, SubProducto_Grupo_Detalle.Porcentaje, NULL AS Kilogramo
		FROM SubProducto_Grupo_Detalle INNER JOIN SubProducto ON SubProducto_Grupo_Detalle.IDSubProducto = SubProducto.IDSubProducto
		WHERE IDSubProducto_Grupo = @IDSubProducto_Grupo

END
GO