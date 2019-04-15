USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 30/08/2015 16:49
-- Updated: 
-- Description: Obtiene los datos del Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Contrato_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Contrato_Get
GO

CREATE PROCEDURE dbo.usp_Contrato_Get
	@IDContrato int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Contrato.IDContrato, Contrato.Numero, Contrato.NumeroComprador, Contrato.Fecha, Contrato.IDCosecha, Contrato.IDCereal, Contrato.IDEntidad_Comprador, Contrato.IDEntidad_Corredor, Contrato.IDEntidad_Destino, Contrato.IDOrigenDestino_Destino, Contrato.Kilogramo, Contrato.PrecioTipo, Contrato.Precio, Contrato.EntregaDesde, Contrato.EntregaHasta, Contrato.Cerrado, Contrato.Notas
		FROM Contrato
		WHERE Contrato.IDContrato = @IDContrato 

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 30/08/2015 16:49
-- Updated: 
-- Description: Agrega un Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Contrato_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Contrato_Add
GO

CREATE PROCEDURE dbo.usp_Contrato_Add
	@IDContrato int OUTPUT, 
	@Numero varchar(20),
	@NumeroComprador varchar(20),
	@Fecha date,
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@IDEntidad_Comprador int,
	@IDEntidad_Corredor int,
	@IDEntidad_Destino int,
	@IDOrigenDestino_Destino smallint,
	@Kilogramo int,
	@PrecioTipo char(1),
	@Precio money,
	@EntregaDesde date,
	@EntregaHasta date,
	@Cerrado bit,
	@Notas varchar(8000)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDContrato = (SELECT ISNULL(MAX(Contrato.IDContrato), 0) + 1 FROM Contrato)
		
			INSERT INTO Contrato
				(IDContrato, Numero, NumeroComprador, Fecha, IDCosecha, IDCereal, IDEntidad_Comprador, IDEntidad_Corredor, IDEntidad_Destino, IDOrigenDestino_Destino, Kilogramo, PrecioTipo, Precio, EntregaDesde, EntregaHasta, Cerrado, Notas)
				VALUES (@IDContrato, @Numero, @NumeroComprador, @Fecha, @IDCosecha, @IDCereal, @IDEntidad_Comprador, @IDEntidad_Corredor, @IDEntidad_Destino, @IDOrigenDestino_Destino, @Kilogramo, @PrecioTipo, @Precio, @EntregaDesde, @EntregaHasta, @Cerrado, @Notas)
	
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
-- Created: 30/08/2015 16:49
-- Updated: 
-- Description: Actualiza los datos del Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Contrato_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Contrato_Update
GO

CREATE PROCEDURE dbo.usp_Contrato_Update
	@IDContrato int,
	@Numero varchar(20),
	@NumeroComprador varchar(20),
	@Fecha date,
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@IDEntidad_Comprador int,
	@IDEntidad_Corredor int,
	@IDEntidad_Destino int,
	@IDOrigenDestino_Destino smallint,
	@Kilogramo int,
	@PrecioTipo char(1),
	@Precio money,
	@EntregaDesde date,
	@EntregaHasta date,
	@Cerrado bit,
	@Notas varchar(8000)
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Contrato
					SET Numero = @Numero, NumeroComprador = @NumeroComprador, Fecha = @Fecha, IDCosecha = @IDCosecha, IDCereal = @IDCereal, IDEntidad_Comprador = @IDEntidad_Comprador, IDEntidad_Corredor = @IDEntidad_Corredor, IDEntidad_Destino = @IDEntidad_Destino, IDOrigenDestino_Destino = @IDOrigenDestino_Destino, Kilogramo = @Kilogramo, PrecioTipo = @PrecioTipo, Precio = @Precio, EntregaDesde = @EntregaDesde, EntregaHasta = @EntregaHasta, Cerrado = @Cerrado, Notas = @Notas
					WHERE IDContrato = @IDContrato

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
-- Created: 30/08/2015 16:49
-- Updated: 
-- Description: Elimina un Contrato
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Contrato_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Contrato_Delete
GO

CREATE PROCEDURE dbo.usp_Contrato_Delete 
	@IDContrato int
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			DELETE
				FROM Contrato
				WHERE IDContrato = @IDContrato 

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
-- Created: 31/08/2015 00:30
-- Description:	Lista los Contratos de la Entidad Destinataria
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Contrato_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Contrato_List
GO

CREATE PROCEDURE usp_Contrato_List
	@ListaNinguno bit,
	@MostrarNumeroComprador bit,
	@Cerrado bit,
	@IDEntidad_Comprador int,
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@IDContrato tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT '0' AS IDContrato, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT Contrato.IDContrato, Contrato.Numero + (CASE @MostrarNumeroComprador WHEN 1 THEN (CASE ISNULL(Contrato.NumeroComprador, '') WHEN '' THEN '' ELSE ' - (' + Contrato.NumeroComprador + ')' END) END) AS Nombre, 2 AS Orden
			FROM Contrato
			WHERE (@Cerrado IS NULL OR Contrato.Cerrado = @Cerrado
						OR (@Cerrado = 0 AND Contrato.IDContrato = @IDContrato))
					AND (@IDEntidad_Comprador IS NULL OR Contrato.IDEntidad_Comprador = @IDEntidad_Comprador)
					AND (@IDCosecha IS NULL OR Contrato.IDCosecha = @IDCosecha)
					AND (@IDCereal IS NULL OR Contrato.IDCereal = @IDCereal)
					)
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		(SELECT Contrato.IDContrato, Contrato.Numero + (CASE @MostrarNumeroComprador WHEN 1 THEN (CASE ISNULL(Contrato.NumeroComprador, '') WHEN '' THEN '' ELSE ' - (' + Contrato.NumeroComprador + ')' END) END) AS Nombre, 2 AS Orden
			FROM Contrato
			WHERE (@Cerrado IS NULL OR Contrato.Cerrado = @Cerrado
						OR (@Cerrado = 0 AND Contrato.IDContrato = @IDContrato))
					AND (@IDEntidad_Comprador IS NULL OR Contrato.IDEntidad_Comprador = @IDEntidad_Comprador)
					AND (@IDCosecha IS NULL OR Contrato.IDCosecha = @IDCosecha)
					AND (@IDCereal IS NULL OR Contrato.IDCereal = @IDCereal)
					)
			ORDER BY Nombre
		END
END
GO