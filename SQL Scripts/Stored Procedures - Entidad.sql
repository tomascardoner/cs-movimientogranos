USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:43:00
-- Updated: 
-- Description: Obtiene los datos de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Get') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Get
GO

CREATE PROCEDURE dbo.usp_Entidad_Get
	@IDEntidad int
AS

BEGIN
	SET NOCOUNT ON;

	SELECT Entidad.IDEntidad, Entidad.Nombre, Entidad.CUIT, Entidad.EsTitular, Entidad.EsIntermediario, Entidad.EsRemitenteComercial, Entidad.EsCorredor, Entidad.EsEntregador, Entidad.EsDestinatario, Entidad.EsDestino, Entidad.EsTransportista, Entidad.EsChofer, Entidad.EsClienteSubProducto, Entidad.Notas, Entidad.Activo, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion
		FROM Entidad
		WHERE Entidad.IDEntidad = @IDEntidad 

END
GO



-- =============================================
-- Author:	Tomás A. Cardoner
-- Created: 09/01/2022 18:38
-- Updated: 
-- Description: Obtiene una Entidad por número de CUIT
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_GetPorCuit') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_GetPorCuit
GO

CREATE PROCEDURE dbo.usp_Entidad_GetPorCuit
	@Cuit bigint
AS

BEGIN
	SET NOCOUNT ON;

	SELECT *
		FROM Entidad
		WHERE CUIT = @Cuit

END
GO



-- =============================================
-- Author:	  Tomás A. Cardoner
-- Created: 11/06/2014 22:43:00
-- Updated: 
-- Description: Agrega una Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Add') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Add
GO

CREATE PROCEDURE dbo.usp_Entidad_Add
	@IDEntidad int OUTPUT,
	@Nombre varchar(100),
	@CUIT char(11),
	@EsTitular bit,
	@EsIntermediario bit,
	@EsRemitenteComercial bit,
	@EsCorredor bit,
	@EsEntregador bit,
	@EsDestinatario bit,
	@EsDestino bit,
	@EsTransportista bit,
	@EsChofer bit,
	@EsClienteSubProducto bit,
	@Notas varchar(8000),
	@Activo bit,
    @IDUsuario tinyint
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION

			SET @IDEntidad = (SELECT ISNULL(MAX(Entidad.IDEntidad), 0) + 1 FROM Entidad)
		
			INSERT INTO Entidad
				(IDEntidad, Nombre, CUIT, EsTitular, EsIntermediario, EsRemitenteComercial, EsCorredor, EsEntregador,EsDestinatario, EsDestino, EsTransportista, EsChofer, EsClienteSubProducto, Notas, Activo, IDUsuarioCreacion, FechaHoraCreacion, IDUsuarioModificacion, FechaHoraModificacion)
				VALUES (@IDEntidad, @Nombre, @CUIT, @EsTitular, @EsIntermediario, @EsRemitenteComercial, @EsCorredor, @EsEntregador, @EsDestinatario, @EsDestino, @EsTransportista, @EsChofer, @EsClienteSubProducto, @Notas, @Activo, @IDUsuario, GETDATE(), @IDUsuario, GETDATE())
	
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
-- Created: 11/06/2014 22:43:00
-- Updated: 
-- Description: Actualiza los datos de la Entidad
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Update') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Update
GO

CREATE PROCEDURE dbo.usp_Entidad_Update
	@IDEntidad int,
	@Nombre varchar(100),
	@CUIT char(11),
	@EsTitular bit,
	@EsIntermediario bit,
	@EsRemitenteComercial bit,
	@EsCorredor bit,
	@EsEntregador bit,
	@EsDestinatario bit,
	@EsDestino bit,
	@EsTransportista bit,
	@EsChofer bit,
	@EsClienteSubProducto bit,
	@Notas varchar(8000),
	@Activo bit,
    @IDUsuario tinyint
AS

BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION	

				UPDATE Entidad
					SET Nombre = @Nombre, CUIT = @CUIT, EsTitular = @EsTitular, EsIntermediario = @EsIntermediario, EsRemitenteComercial = @EsRemitenteComercial, EsCorredor = @EsCorredor, EsEntregador = @EsEntregador, EsDestinatario = @EsDestinatario, EsDestino = @EsDestino, EsTransportista = @EsTransportista, EsChofer = @EsChofer, EsClienteSubProducto = @EsClienteSubProducto, Notas = @Notas, Activo = @Activo, IDUsuarioModificacion = @IDUsuario, FechaHoraModificacion = GETDATE()
					WHERE IDEntidad = @IDEntidad

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
-- Created: 11/06/2014 22:43:00
-- Updated: 
-- Description: Elimina una Entidad con sus dependencias
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Entidad_Delete') AND type in (N'P', N'PC'))
	 DROP PROCEDURE usp_Entidad_Delete
GO

CREATE PROCEDURE dbo.usp_Entidad_Delete 
	@IDEntidad int
AS
	
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION
			--ELIMINO EL ORIGEN/DESTINO
			DELETE
				FROM Entidad_OrigenDestino
				WHERE IDEntidad = @IDEntidad
				
			--ELIMINO EL DOMICILIO
			DELETE
				FROM Entidad_Domicilio
				WHERE IDEntidad = @IDEntidad
			
			--ELIMINO LOS DATOS IMPOSITIVOS
			DELETE
				FROM Entidad_Impuesto
				WHERE IDEntidad = @IDEntidad
			
			--ELIMINO LOS DATOS DE CHOFER
			DELETE
				FROM Entidad_Chofer 
				WHERE IDEntidad = @IDEntidad
			
			--ELIMINO LA ENTIDAD
			DELETE
				FROM Entidad
				WHERE IDEntidad = @IDEntidad
	
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
-- Create date: 2013-08-29
-- Description:	Lista las Entidadades Titulares
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Titular_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Titular_List
GO

CREATE PROCEDURE usp_Entidad_Titular_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE EsTitular = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE EsTitular = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-02
-- Description:	Lista las Entidadades Titulares que controlan stock
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_ControlaStock_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_ControlaStock_List
GO

CREATE PROCEDURE usp_Entidad_ControlaStock_List
	@ListaNinguno bit,
	@Activo bit,
	@ConvierteEnSubProducto bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT DISTINCT Entidad.IDEntidad, Entidad.Nombre, 2 AS Orden
			FROM Entidad INNER JOIN Entidad_OrigenDestino ON Entidad.IDEntidad = Entidad_OrigenDestino.IDEntidad
			WHERE (@Activo IS NULL OR Entidad.Activo = @Activo OR Entidad.IDEntidad = @IDEntidad)
				AND Entidad_OrigenDestino.ControlaStock = 1
				AND (@ConvierteEnSubProducto IS NULL OR Entidad_OrigenDestino.ConvierteEnSubProducto = @ConvierteEnSubProducto))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT DISTINCT Entidad.IDEntidad, Entidad.Nombre
			FROM Entidad INNER JOIN Entidad_OrigenDestino ON Entidad.IDEntidad = Entidad_OrigenDestino.IDEntidad
			WHERE (@Activo IS NULL OR Entidad.Activo = @Activo OR Entidad.IDEntidad = @IDEntidad)
				AND Entidad_OrigenDestino.ControlaStock = 1
				AND (@ConvierteEnSubProducto IS NULL OR Entidad_OrigenDestino.ConvierteEnSubProducto = @ConvierteEnSubProducto)
			ORDER BY Entidad.Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-29
-- Description:	Lista las Entidadades Intermediarios
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Intermediario_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Intermediario_List
GO

CREATE PROCEDURE usp_Entidad_Intermediario_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE (EsTitular = 1 OR EsIntermediario = 1)
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE (EsTitular = 1 OR EsIntermediario = 1)
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-02-09
-- Description:	Lista las Entidadades Remitentes Comerciales
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_RemitenteComercial_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_RemitenteComercial_List
GO

CREATE PROCEDURE usp_Entidad_RemitenteComercial_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE (EsTitular = 1 OR EsRemitenteComercial = 1)
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE (EsTitular = 1 OR EsRemitenteComercial = 1)
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-02-09
-- Description:	Lista las Entidadades Corredores
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Corredor_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Corredor_List
GO

CREATE PROCEDURE usp_Entidad_Corredor_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE EsCorredor = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE EsCorredor = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-02-09
-- Description:	Lista las Entidadades Entregadores
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Entregador_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Entregador_List
GO

CREATE PROCEDURE usp_Entidad_Entregador_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE EsEntregador = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE EsEntregador = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-02
-- Description:	Lista las Entidadades Destinatarias
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Destinatario_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Destinatario_List
GO

CREATE PROCEDURE usp_Entidad_Destinatario_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE (EsTitular = 1 OR EsDestinatario = 1)
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE (EsTitular = 1 OR EsDestinatario = 1)
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-02
-- Description:	Lista las Entidadades Destino
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Destino_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Destino_List
GO

CREATE PROCEDURE usp_Entidad_Destino_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE EsDestino = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE EsDestino = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-02-09
-- Description:	Lista las Entidadades Transportistas
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Transportista_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Transportista_List
GO

CREATE PROCEDURE usp_Entidad_Transportista_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE EsTransportista = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE EsTransportista = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-02-09
-- Description:	Lista las Entidadades Choferes
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_Chofer_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_Chofer_List
GO

CREATE PROCEDURE usp_Entidad_Chofer_List
	@ListaNinguno bit,
	@Activo bit,
	@IDTransportista int,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT Entidad.IDEntidad, Entidad.Nombre, 2 AS Orden
			FROM Entidad LEFT JOIN Entidad_Chofer ON Entidad.IDEntidad = Entidad_Chofer.IDEntidad
			WHERE Entidad.EsChofer = 1
				AND (@IDTransportista IS NULL OR Entidad_Chofer.IDEntidad_Transportista = @IDTransportista OR Entidad.IDEntidad = @IDEntidad)
				AND (@Activo IS NULL OR Entidad.Activo = @Activo OR Entidad.IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT Entidad.IDEntidad, Entidad.Nombre
			FROM Entidad LEFT JOIN Entidad_Chofer ON Entidad.IDEntidad = Entidad_Chofer.IDEntidad
			WHERE Entidad.EsChofer = 1
				AND (@IDTransportista IS NULL OR Entidad_Chofer.IDEntidad_Transportista = @IDTransportista OR Entidad.IDEntidad = @IDEntidad)
				AND (@Activo IS NULL OR Entidad.Activo = @Activo OR Entidad.IDEntidad = @IDEntidad)
			ORDER BY Entidad.Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Created: 2013-11-07
-- Description:	Lista las Entidadades clientes de SubProductos
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_ClienteSubProducto_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_ClienteSubProducto_List
GO

CREATE PROCEDURE usp_Entidad_ClienteSubProducto_List
	@ListaNinguno bit,
	@Activo bit,
	@IDEntidad int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ListaNinguno = 1
		BEGIN
		(SELECT 0 AS IDEntidad, '--------------------' AS Nombre, 1 AS Orden)
		UNION
		(SELECT IDEntidad, Nombre, 2 AS Orden
			FROM Entidad
			WHERE EsClienteSubProducto = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad))
		ORDER BY Orden, Nombre
		END
	ELSE
		BEGIN
		SELECT IDEntidad, Nombre
			FROM Entidad
			WHERE EsClienteSubProducto = 1
				AND (@Activo IS NULL OR Activo = @Activo OR IDEntidad = @IDEntidad)
			ORDER BY Nombre
		END
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-11
-- Description:	Muestra los saldos de Cereal de una Entidad
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_SaldoCereal') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_SaldoCereal
GO

CREATE PROCEDURE usp_Entidad_SaldoCereal
	@IDEntidad_Depositario int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha tinyint,
	@IDCereal tinyint,
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @EntradaBruto int
	DECLARE @EntradaNeto int
	DECLARE @Salida int
	DECLARE @StockActual int
	DECLARE @Certificado int
	DECLARE @Retirado int
	DECLARE @TransferidoDeTercero int
	DECLARE @TransferidoATercero int
	DECLARE @Liquidado int
	DECLARE @Existencia int
	
	--ENTRADAS O AJUSTES (SUBE)
	SELECT @EntradaBruto = SUM(PesoNeto), @EntradaNeto = SUM(PesoFinal)
		FROM Movimiento_Cereal
		WHERE (@IDEntidad_Depositario IS NULL OR (IDEntidad_Destino = @IDEntidad_Depositario AND IDOrigenDestino_Destino = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND dbo.udf_GetRemitenteCereal(IDEntidad_Titular, IDEntidad_Intermediario, IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND (Tipo = 'E' OR Tipo = 'U')
			AND IDCartaPorte_MotivoAnulacion IS NULL
			AND (@FechaDesde IS NULL OR FechaHoraDescarga >= @FechaDesde)
			AND (@FechaHasta IS NULL OR FechaHoraDescarga <= @FechaHasta)

	--TRANSFERIDO DE
	SELECT @TransferidoDeTercero = SUM(TotalKilogramo)
		FROM Formulario1116RT_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND ReceptorIDEntidad = @IDEntidad_Depositante
			AND RetiroOTransferencia = 'T'
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--SALIDAS O AJUSTES (BAJA)
	SELECT @Salida = SUM(PesoNeto)
		FROM Movimiento_Cereal
		WHERE (@IDEntidad_Depositario IS NULL OR (IDEntidad_Titular = @IDEntidad_Depositario AND IDOrigenDestino_Origen = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND dbo.udf_GetRemitenteCereal(IDEntidad_Titular, IDEntidad_Intermediario, IDEntidad_RemitenteComercial) = @IDEntidad_Depositante
			AND (Tipo = 'S' OR Tipo = 'B')
			AND IDCartaPorte_MotivoAnulacion IS NULL
			AND (@FechaDesde IS NULL OR FechaCarga >= @FechaDesde)
			AND (@FechaHasta IS NULL OR FechaCarga <= @FechaHasta)
	
	--TRANSFERIDO A
	SELECT @TransferidoATercero = SUM(TotalKilogramo)
		FROM Formulario1116RT_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND DepositanteIDEntidad = @IDEntidad_Depositante
			AND RetiroOTransferencia = 'T'
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--STOCK ACTUAL
	SET @StockActual = ISNULL(@EntradaNeto, 0) + ISNULL(@TransferidoDeTercero, 0) - ISNULL(@Salida, 0) - ISNULL(@TransferidoATercero, 0) /*- ISNULL(@Liquidado, 0)*/
	
	--CERTIFICADOS
	SELECT @Certificado = SUM(PesoNeto)
		FROM Formulario1116A_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND DepositanteIDEntidad = @IDEntidad_Depositante
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--RETIRADOS
	SELECT @Retirado = SUM(TotalKilogramo)
		FROM Formulario1116RT_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND DepositanteIDEntidad = @IDEntidad_Depositante
			AND RetiroOTransferencia = 'R'
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--LIQUIDADO
	SELECT @Liquidado = SUM(OperacionCantidad)
		FROM Formulario1116B_Cabecera
		WHERE (@IDEntidad_Depositario IS NULL OR (DepositarioIDEntidad = @IDEntidad_Depositario AND DepositarioIDPlanta = @IDPlanta))
			AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal
			AND DepositanteIDEntidad = @IDEntidad_Depositante
			AND (@FechaDesde IS NULL OR Fecha >= @FechaDesde)
			AND (@FechaHasta IS NULL OR Fecha <= @FechaHasta)

	--EXISTENCIA
	SET @Existencia = ISNULL(@Certificado, 0) + ISNULL(@TransferidoDeTercero, 0) - ISNULL(@Retirado, 0) - ISNULL(@TransferidoATercero, 0) - ISNULL(@Liquidado, 0)
	
	--DEVUELVO LOS RESULTADOS
	SELECT ISNULL(@EntradaBruto, 0) AS EntradaBruto, ISNULL(@EntradaNeto, 0) AS EntradaNeto, ISNULL(@Salida, 0) AS Salida, @StockActual AS StockActual, ISNULL(@Certificado, 0) AS Certificado, ISNULL(@TransferidoDeTercero, 0) AS TransferidoDeTercero, ISNULL(@Retirado, 0) AS Retirado, ISNULL(@TransferidoATercero, 0) AS TransferidoATercero, ISNULL(@Liquidado, 0) AS Liquidado, @Existencia AS Existencia
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2015-09-23
-- Description:	Muestra la liquidación del Servicio de Fasón de una Entidad
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Entidad_LiquidacionServicioFason') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Entidad_LiquidacionServicioFason
GO

CREATE PROCEDURE usp_Entidad_LiquidacionServicioFason
	@IDEntidadTitular int,
	@IDOrigenDestino_Origen smallint,
	@IDEntidadDestinatario int,
	@Anio smallint,
	@Mes tinyint
AS
BEGIN	
	SET NOCOUNT ON;
	
	DECLARE @WorkTable TABLE(IDMovimiento_SubProducto int PRIMARY KEY NOT NULL, IDSubProducto_Grupo tinyint, Fecha date NOT NULL, KilogramoExpeller int NOT NULL, KilogramoSoja int NULL, TarifaFasonDolar money NULL, ServicioDolar money NULL, CotizacionDolar money NULL, ServicioPeso money NULL)
	DECLARE @IDSubProducto tinyint = 2
	DECLARE @SubProductoPorcentaje decimal(5,2)
	DECLARE @IDMoneda smallint = 3
	DECLARE @EntidadNombre varchar(100)

	--AGREGO LOS DATOS INICIALES A LA TABLA TEMPORARIA
	INSERT INTO @WorkTable
		(IDMovimiento_SubProducto, IDSubProducto_Grupo, Fecha, KilogramoExpeller)
		SELECT Movimiento_SubProducto.IDMovimiento_SubProducto, SubProducto_Grupo_Detalle.IDSubProducto_Grupo, Movimiento_SubProducto.Fecha, ABS(Movimiento_SubProducto_Detalle.Kilogramo)
			FROM (Movimiento_SubProducto INNER JOIN Movimiento_SubProducto_Detalle ON Movimiento_SubProducto.IDMovimiento_SubProducto = Movimiento_SubProducto_Detalle.IDMovimiento_SubProducto) INNER JOIN SubProducto_Grupo_Detalle ON Movimiento_SubProducto_Detalle.IDSubProducto = SubProducto_Grupo_Detalle.IDSubProducto
			WHERE Movimiento_SubProducto.IDEntidad_Titular = @IDEntidadTitular
				AND Movimiento_SubProducto.IDOrigenDestino_Origen = @IDOrigenDestino_Origen
				AND Movimiento_SubProducto.IDEntidad_Destinatario = @IDEntidadDestinatario
				AND Movimiento_SubProducto_Detalle.IDSubProducto = @IDSubProducto
				AND (YEAR(Movimiento_SubProducto.Fecha) = @Anio)
				AND (MONTH(Movimiento_SubProducto.Fecha) = @Mes)
	
	--CALCULO LOS KILOGRAMOS DE SOJA
	SET @SubProductoPorcentaje = (SELECT Porcentaje FROM SubProducto_Grupo_Detalle WHERE IDSubProducto = @IDSubProducto)
	UPDATE @WorkTable
		SET KilogramoSoja = ROUND(KilogramoExpeller / (@SubProductoPorcentaje / 100), 0)

	--OBTENGO EL COSTO DEL SERVICIO EN DOLARES POR TONELADA
	DECLARE @IDSubProducto_Grupo tinyint
	DECLARE @Fecha date
	DECLARE @TarifaFasonDolar money
	DECLARE WorkTableCursor CURSOR FOR
		SELECT IDSubProducto_Grupo, Fecha
			FROM @WorkTable
	OPEN WorkTableCursor
	FETCH FROM WorkTableCursor INTO @IDSubProducto_Grupo, @Fecha
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @TarifaFasonDolar = dbo.udf_Get_SubProducto_Grupo_Tarifa_TarifaFasonDolar(@IDSubProducto_Grupo, @IDEntidadDestinatario, @Fecha)
			UPDATE @WorkTable
				SET TarifaFasonDolar = @TarifaFasonDolar
				WHERE CURRENT OF WorkTableCursor
			FETCH NEXT FROM WorkTableCursor INTO @IDSubProducto_Grupo, @Fecha
		END
	CLOSE WorkTableCursor
	DEALLOCATE WorkTableCursor

	--CALCULO EL COSTO DEL SERVICIO EN DOLARES Y OBTENGO LAS COTIZACIONES DEL DOLAR
	UPDATE @WorkTable
		SET ServicioDolar = ROUND(KilogramoSoja * TarifaFasonDolar / 1000, 2), CotizacionDolar = dbo.udf_GetMonedaCotizacionVenta(@IDMoneda, Fecha)

	--CALCULO EL COSTO DEL SERVICIO EN PESOS
	UPDATE @WorkTable
		SET ServicioPeso = ROUND(ServicioDolar * CotizacionDolar, 2)

	--DEVUELVO EL RESULTADO
	SET @EntidadNombre = (SELECT Nombre FROM Entidad WHERE IDEntidad = @IDEntidadDestinatario)
	SELECT @EntidadNombre AS EntidadNombre, @SubProductoPorcentaje AS FasonPorcentajeExpeller, TarifaFasonDolar AS FasonTarifaDolar, Fecha, KilogramoExpeller, KilogramoSoja, ServicioDolar AS FasonServicioDolar, CotizacionDolar, ServicioPeso AS FasonServicioPeso
		FROM @WorkTable
		ORDER BY Fecha
END
GO