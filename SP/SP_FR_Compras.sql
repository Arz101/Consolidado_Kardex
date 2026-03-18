SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dbo].[SP_FR_Compras]
AS
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
-- Description:	Consolidado Kardex Peru
-- Update date: 2026-03-17
-- =============================================
BEGIN 
	SET NOCOUNT ON;
	SET XACT_ABORT OFF;

	DECLARE @IdLog INT;
	DECLARE @Inicio DATETIME2 = SYSDATETIME();
	DECLARE @Errores INT = 0;
	DECLARE @DetalleErrores NVARCHAR(MAX) = N'';

	BEGIN TRY
		INSERT INTO CONSOLIDADO_KARDEX.dbo.Logs (NombreSP,  Estado, FechaInicio)
		VALUES ('SP_FR_Compras', 'EN PROCESO', @Inicio)	
		
		SET @IdLog = SCOPE_IDENTITY();
		DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE);

		DELETE FROM CONSOLIDADO_KARDEX.[dbo].[Compras]
		WHERE Fecha = @FechaHoy;

		DECLARE @Sucursales TABLE (
			Restaurante NVARCHAR(100),
			Vista SYSNAME,
			EtiquetaError NVARCHAR(100)
		);

		INSERT INTO @Sucursales (Restaurante, Vista, EtiquetaError)
		VALUES
			('CANADA', 'vw_CANADA_Compras', 'CANADA'),
			('P&A', 'sw_PARDOYALIAGA_Compras', 'P&A'),
			('PLAZA NORTE', 'vw_PLAZA_NORTE_Compras', 'PZ'),
			('MDS', 'sw_MALLSUR_Compras', 'MDS'),
			('C. CIVICO', 'vw_CENTROCIVICO_Compras', 'C.CIVICO'),
			('SALAVERRY', 'vw_SALAVERRY_Compras', 'SALAVERRY'),
			('FONTANA', 'vw_FONTANA_Compras', 'FONTANA'),
			('AREQUIPA', 'vw_AREQUIPA_Compras', 'AREQUIPA'),
			('MINKA', 'vw_MINKA_Compras', 'MINKA'),
			('BENAVIDES', 'vw_BENAVIDES_Compras', 'BENAVIDES'),
			('CHILCLAYO', 'vw_CHILCLAYO_Compras', 'CHICLAYO'),
			('JOCKEY', 'vw_JOCKEY__Compras', 'JOCKEY'),
			('SJL', 'vw_SJL_Compras', 'SJL'),
			('PARDO', 'vw_PARDO_Compras', 'PARDO'),
			('ROSEDAL', 'vw_ROSEDAL_Compras', 'ROSEDAL'),
			('PURUCHUCO', 'vw_PURUCHUCO_Compras', 'PURUCHUCO');

		DECLARE @Restaurante NVARCHAR(100);
		DECLARE @Vista SYSNAME;
		DECLARE @EtiquetaError NVARCHAR(100);
		DECLARE @Sql NVARCHAR(MAX);

		DECLARE cur_sucursales CURSOR LOCAL FAST_FORWARD FOR
			SELECT Restaurante, Vista, EtiquetaError
			FROM @Sucursales;

		OPEN cur_sucursales;
		FETCH NEXT FROM cur_sucursales INTO @Restaurante, @Vista, @EtiquetaError;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			BEGIN TRY
				SET @Sql = N'
					INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)
					SELECT @Restaurante, t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
						SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
					FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
					WHERE t0.Fecha = @FechaHoy
					GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor';

				EXEC sys.sp_executesql
					@Sql,
					N'@FechaHoy DATE, @Restaurante NVARCHAR(100)',
					@FechaHoy = @FechaHoy,
					@Restaurante = @Restaurante;
			END TRY
			BEGIN CATCH
				RAISERROR('           * %s NO DISPONIBLE     SP_Compras', 0, 1, @EtiquetaError) WITH NOWAIT;
				SET @Errores += 1;
				SET @DetalleErrores += @EtiquetaError + ': ' + ERROR_MESSAGE() + '; ';
			END CATCH;

			FETCH NEXT FROM cur_sucursales INTO @Restaurante, @Vista, @EtiquetaError;
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
