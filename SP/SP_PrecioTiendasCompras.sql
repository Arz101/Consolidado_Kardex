SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dbo].[SP_PrecioTiendasCompras_FR]
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13
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
		VALUES ('SP_PrecioTiendasCompras_FR', 'EN PROCESO', @Inicio)
		
		SET @IdLog = SCOPE_IDENTITY();

		DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE);

		DELETE FROM CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras
		WHERE Fecha = @FechaHoy;

		DECLARE @Sucursales TABLE (
			Sucursal NVARCHAR(100),
			Vista SYSNAME,
			EtiquetaError NVARCHAR(100)
		);

		INSERT INTO @Sucursales (Sucursal, Vista, EtiquetaError)
		VALUES
			('JOCKEY', 'vw_Jockey_PrecioCompras', 'JOCKEY'),
			('SJL', 'vw_SJL_PrecioCompras', 'SJL'),
			('PARDO', 'vw_PARDO_PrecioCompras', 'PARDO'),
			('ROSEDAL', 'vw_ROSEDAL_PrecioCompras', 'ROSEDAL'),
			('PURUCHUCO', 'vw_PURUCHUCO_PrecioCompras', 'PURUCHUCO'),
			('CANADA', 'vw_CANADA_PrecioCompras', 'CANADA'),
			('PYA', 'vw_PYA_PrecioCompras', 'PYA'),
			('CHILCLAYO', 'vw_CHILCLAYO_PrecioCompras', 'CHILCLAYO'),
			('MDS', 'vw_MDS_PrecioCompras', 'MDS'),
			('CC', 'vw_CCIVICO_PrecioCompras', 'CC'),
			('SALAVERRY', 'vw_SALAVERRY_PrecioCompras', 'SALAVERRY'),
			('FONTANA', 'vw_FONTANA_PrecioCompras', 'FONTANA'),
			('AREQUIPA', 'vw_AREQUIPA_PrecioCompras', 'AREQUIPA'),
			('MINKA', 'vw_MINKA_PrecioCompras', 'MINKA');

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
					INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
					SELECT @Sucursal AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
					FROM [PERU_Frontrest].dbo.' + QUOTENAME(@Vista) + N'
					WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
					GROUP BY REFERENCIA, FECHAALBARAN';

				EXEC sys.sp_executesql
					@Sql,
					N'@FechaHoy DATE, @Sucursal NVARCHAR(100)',
					@FechaHoy = @FechaHoy,
					@Sucursal = @Sucursal;
			END TRY
			BEGIN CATCH
				PRINT 'Error en ' + @EtiquetaError + ': ' + ERROR_MESSAGE();
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
