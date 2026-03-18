SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dbo].[SP_PrecioTiendas]
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
-- Description:	Consolidado Kardex Peru
-- Update date: 2026-03-17
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT OFF;

	DECLARE @IdLog INT;
	DECLARE @Inicio DATETIME2 = SYSDATETIME();
	DECLARE @Errores INT = 0;
	DECLARE @DetalleErrores NVARCHAR(MAX) = N'';

	BEGIN TRY
		INSERT INTO CONSOLIDADO_KARDEX.dbo.Logs (NombreSP,  Estado, FechaInicio)
		VALUES ('SP_PrecioTiendas', 'EN PROCESO', @Inicio)

		SET @IdLog = SCOPE_IDENTITY();

		DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE);

		DELETE FROM [CONSOLIDADO_KARDEX].[dbo].[PrecioTiendas]
		WHERE Fecha = @FechaHoy;

		DECLARE @Sucursales TABLE (
			Sucursal NVARCHAR(100),
			Vista SYSNAME,
			EtiquetaError NVARCHAR(100)
		);

		INSERT INTO @Sucursales (Sucursal, Vista, EtiquetaError)
		VALUES
			('Jockey', 'vw_JOCKEY_Costo', 'JOCKEY'),
			('Pardo', 'vw_PARDO_Costo', 'PARDO'),
			('Rosedal', 'vw_ROSEDAL_Costo', 'ROSEDAL'),
			('Puruchuco', 'vw_PURUCHUCO_Costo', 'PURUCHUCO'),
			('Canada', 'vw_CANADA_Costo', 'CANADA'),
			('P&A', 'sw_PARDOYALIAGA_Costo', 'P&A'),
			('PN', 'vw_PLAZA_NORTE_Costo', 'PN'),
			('MDS', 'sw_MALLSUR_Costo', 'MDS'),
			('CC', 'vw_CENTROCIVICO_Costo', 'CC'),
			('Salaverry', 'vw_SALAVERRY_Costo', 'SALAVERRY'),
			('Fontana', 'vw_FONTANA_Costo', 'FONTANA'),
			('Arequipa', 'vw_AREQUIPA_Costo', 'AREQUIPA'),
			('Minka', 'vw_MINKA_Costo', 'MINKA'),
			('Benavides', 'vw_BENAVIDES_Costo', 'BENAVIDES'),
			('Chilclayo', 'vw_CHILCLAYO_Costo', 'CHILCLAYO'),
			('SJL', 'vw_SJL_Costo', 'SJL');

		DECLARE @Sucursal NVARCHAR(100);
		DECLARE @Vista SYSNAME;
		DECLARE @EtiquetaError NVARCHAR(100);
		DECLARE @Sql NVARCHAR(MAX);

		DECLARE cur_sucursales CURSOR LOCAL FAST_FORWARD FOR
			SELECT Sucursal, Vista, EtiquetaError
			FROM @Sucursales;

		OPEN cur_sucursales;
		FETCH NEXT FROM cur_sucursales INTO @Sucursal, @Vista, @EtiquetaError;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			BEGIN TRY
				SET @Sql = N'
					INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha)
					SELECT @Sucursal AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra
					FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N'
					WHERE FechaUltCompra = @FechaHoy
					GROUP BY Referencia, FechaUltCompra';

				EXEC sys.sp_executesql
					@Sql,
					N'@FechaHoy DATE, @Sucursal NVARCHAR(100)',
					@FechaHoy = @FechaHoy,
					@Sucursal = @Sucursal;
			END TRY
			BEGIN CATCH
				PRINT '           * ' + @EtiquetaError + ' NO DISPONIBLE     SP_PrecioTiendas';
				SET @Errores += 1;
				SET @DetalleErrores += @EtiquetaError + ': ' + ERROR_MESSAGE() + '; ';
			END CATCH;

			FETCH NEXT FROM cur_sucursales INTO @Sucursal, @Vista, @EtiquetaError;
		END

		CLOSE cur_sucursales;
		DEALLOCATE cur_sucursales;

		PRINT '';
        PRINT '============================================';
		IF @Errores = 0
		BEGIN
			PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
		END
		ELSE
		BEGIN
			PRINT 'PROCESO COMPLETADO CON CARGA PARCIAL';
			PRINT 'TOTAL ERRORES: ' + CAST(@Errores AS VARCHAR(20));
			PRINT LEFT(@DetalleErrores, 4000);
		END
        PRINT '============================================';
		UPDATE CONSOLIDADO_KARDEX.dbo.Logs
		SET
			FechaFin = SYSDATETIME(),
			Estado = 'OK',
			MensajeError = CASE
				WHEN @Errores > 0 THEN LEFT('Carga parcial. Total errores: ' + CAST(@Errores AS VARCHAR(20)) + '. ' + @DetalleErrores, 4000)
				ELSE NULL
			END,
			NumeroError = NULL,
			LineaError = NULL
		WHERE id = @IdLog 

	END TRY

	BEGIN CATCH
		UPDATE CONSOLIDADO_KARDEX.dbo.Logs
		SET
			FechaFin = SYSDATETIME(),
			Estado = 'Error',
			MensajeError = ERROR_MESSAGE(),
			NumeroError = ERROR_NUMBER(),
			LineaError = ERROR_LINE()
		WHERE id = @IdLog
		
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH
END

GO
