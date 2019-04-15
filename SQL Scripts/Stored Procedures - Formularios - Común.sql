USE CSMovimientoGranos
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-08-23
-- Description:	Lista los talonarios de Formularios 1116A
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116_Talonario_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116_Talonario_List
GO

CREATE PROCEDURE usp_Formulario1116_Talonario_List
	@FormularioTipo char(1),	
	@IDFormulario1116_Talonario int,
	@MostrarTodos bit
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDFormulario1116_Talonario, CAC + ISNULL(' - ' + CONVERT(char(10), FechaVencimiento, 103), '') AS Nombre
		FROM Formulario1116_Talonario
		WHERE FormularioTipo = @FormularioTipo
			AND ((ISNULL(NumeroUltimo, '') < NumeroFin AND (DATEDIFF(day, FechaVencimiento, GETDATE()) <= 0))
				OR IDFormulario1116_Talonario = @IDFormulario1116_Talonario
				OR @MostrarTodos = 1)
			
		ORDER BY Nombre DESC
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-04
-- Modification date: 2013-09-18
-- Description:	Lista los Formularios 1116A y 1116RT (Transferencia) con kgs. pendientes de asignar a un Formulario RT o B
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario1116_PendienteAsignar_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario1116_PendienteAsignar_List
GO

CREATE PROCEDURE usp_Formulario1116_PendienteAsignar_List
	@IDEntidad_Destino int,
	@IDPlanta smallint,
	@IDEntidad_Depositante int,
	@IDCosecha smallint,
	@IDCereal tinyint
AS
BEGIN
	SET NOCOUNT ON;
	
	(SELECT IDFormulario1116A AS IDFormulario1116, Origen_IDPartido, 'A'  AS FormularioTipo, FormularioNumero, Fecha, PesoNeto AS KilogramoTotal, (PesoNeto - KilogramoAplicado) AS KilogramoPendiente, 0 AS KilogramoAsignar
		FROM Formulario1116A_Cabecera
		WHERE DepositarioIDEntidad = @IDEntidad_Destino AND DepositarioIDPlanta = @IDPlanta AND DepositanteIDEntidad = @IDEntidad_Depositante AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND KilogramoAplicado < PesoNeto)
	UNION
	(SELECT IDFormulario1116RT AS IDFormulario1116, Origen_IDPartido, 'RT' AS FormularioTipo, FormularioNumero, Fecha, TotalKilogramo AS KilogramoTotal, (TotalKilogramo - KilogramoAplicado) AS KilogramoPendiente, 0 AS KilogramoAsignar
		FROM Formulario1116RT_Cabecera
		WHERE DepositarioIDEntidad = @IDEntidad_Destino AND DepositarioIDPlanta = @IDPlanta AND ReceptorIDEntidad = @IDEntidad_Depositante AND IDCosecha = @IDCosecha AND IDCereal = @IDCereal AND RetiroOTransferencia = 'T' AND KilogramoAplicado < TotalKilogramo)

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-18
-- Description:	Lisdta los datos de los Formulario Anulado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario_Anulado_List') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario_Anulado_List
GO

CREATE PROCEDURE usp_Formulario_Anulado_List
	@FormularioCodigo tinyint,
	@AnulacionMotivo tinyint,
	@Fecha date
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDFormulario_Anulado, FormularioCodigo, FormularioNumero, AnulacionMotivo, Fecha
		FROM Formulario_Anulado
		WHERE (@FormularioCodigo IS NULL OR @FormularioCodigo = FormularioCodigo)
			AND (@AnulacionMotivo IS NULL OR @AnulacionMotivo = AnulacionMotivo)
			AND (@Fecha IS NULL OR @Fecha = Fecha)
	
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-18
-- Description:	Obtiene los datos de un Formulario Anulado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario_Anulado_Get') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario_Anulado_Get
GO

CREATE PROCEDURE usp_Formulario_Anulado_Get
	@IDFormulario_Anulado int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT IDFormulario_Anulado, FormularioCodigo, FormularioNumero, AnulacionMotivo, Fecha
		FROM Formulario_Anulado
		WHERE IDFormulario_Anulado = @IDFormulario_Anulado
END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-18
-- Description:	Agrega un Formulario Anulado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario_Anulado_Add') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario_Anulado_Add
GO

CREATE PROCEDURE usp_Formulario_Anulado_Add
	@IDFormulario_Anulado int OUTPUT,
	@FormularioCodigo tinyint,
	@FormularioNumero varchar(13),
	@AnulacionMotivo tinyint,
	@Fecha date
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
	
		BEGIN TRANSACTION
		
			--OBTENGO EL NUEVO ID DEL FORMULARIO
			SET @IDFormulario_Anulado = (SELECT ISNULL(MAX(IDFormulario_Anulado), 0) + 1 FROM Formulario_Anulado)
			
			--AGREGO EL FORMULARIO A CON LOS TOTALES OBTENIDOS DE LOS MOVIMIENTOS	
			INSERT INTO Formulario_Anulado
				(IDFormulario_Anulado, FormularioCodigo, FormularioNumero, AnulacionMotivo, Fecha)
				VALUES (@IDFormulario_Anulado, @FormularioCodigo, @FormularioNumero, @AnulacionMotivo, @Fecha)

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
-- Create date: 2013-09-18
-- Description:	Modifica un Formulario Anulado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario_Anulado_Update') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario_Anulado_Update
GO

CREATE PROCEDURE usp_Formulario_Anulado_Update
	@IDFormulario_Anulado int,
	@FormularioCodigo tinyint,	
	@FormularioNumero varchar(13),
	@AnulacionMotivo tinyint,
	@Fecha date
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE Formulario_Anulado
		SET FormularioCodigo = @FormularioCodigo, FormularioNumero = @FormularioNumero, AnulacionMotivo = @AnulacionMotivo, Fecha = @Fecha
		WHERE IDFormulario_Anulado = @IDFormulario_Anulado

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Create date: 2013-09-18
-- Description:	Elimina un Formulario Anulado
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario_Anulado_Delete') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario_Anulado_Delete
GO

CREATE PROCEDURE usp_Formulario_Anulado_Delete
	@IDFormulario_Anulado int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE
		FROM Formulario_Anulado
		WHERE IDFormulario_Anulado = @IDFormulario_Anulado

END
GO



-- =============================================
-- Author:		Tomás A. Cardoner
-- Creation:	2014-01-16
-- Description:	Obtiene los datos de los Formularios Anulados para exportar
-- =============================================
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.usp_Formulario_Anulado_ListForExport') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.usp_Formulario_Anulado_ListForExport
GO

CREATE PROCEDURE usp_Formulario_Anulado_ListForExport
	@FechaDesde date,
	@FechaHasta date
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Formulario_Anulado.FormularioCodigo AS CodigoFormulario, Formulario_Anulado.FormularioNumero AS NumeroCertificadoAnular, Formulario_Anulado.AnulacionMotivo AS Motivo
		FROM Formulario_Anulado
		WHERE Formulario_Anulado.Fecha >= @FechaDesde AND Formulario_Anulado.Fecha <= @FechaHasta
		ORDER BY Formulario_Anulado.Fecha, Formulario_Anulado.FormularioNumero
END
GO