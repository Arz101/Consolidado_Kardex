GO
SET QUOTED_IDENTIFIER ON
GO

USE CONSOLIDADO_KARDEX

GO


CREATE OR ALTER PROCEDURE [dbo].[SP_SalidasSinClasificar_FR]
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	DECLARE @IdLog INT;
	DECLARE @Inicio DATETIME2 = SYSDATETIME()

	BEGIN TRY
		INSERT INTO CONSOLIDADO_KARDEX.dbo.Logs (NombreSP,  Estado, FechaInicio)
		VALUES ('SP_SalidasSinClasificar_FR', 'EN PROCESO', @Inicio)
		
		SET @IdLog = SCOPE_IDENTITY();		BEGIN TRANSACTION
			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE)
			DELETE FROM CONSOLIDADO_KARDEX.dbo.SalidaSinClasificar
			WHERE Fecha = @FechaHoy

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'ERROR en CANADA ' + ERROR_MESSAGE()
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'P&A' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en P&A ' + ERROR_MESSAGE()
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'PLAZA NORTE' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en PZ ' + ERROR_MESSAGE() 
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'MDS' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_MALLSUR_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en MDS ' + ERROR_MESSAGE()
			END CATCH

			--BEGIN TRY
			--	SELECT 'C. CIVICO' AS Restaurante, *
			--	FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_SalidasSinClasificar t0
			--	WHERE t0.Fecha = @FechaHoy
			--END TRY

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'SALAVERRY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH 
				PRINT 'Error en Salaverry ' + ERROR_MESSAGE()
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'FONTANA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_FONTANA_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en FONTANA' + ERROR_MESSAGE()
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'AREQUIPA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en Arequipa' + ERROR_MESSAGE()
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'MINKA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_MINKA_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en Minka' + ERROR_MESSAGE()
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'BENAVIDES' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en Benavides' + ERROR_MESSAGE()
			END CATCH		

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'CHILCLAYO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en Chiclayo' + ERROR_MESSAGE()
			END CATCH		

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'JOCKEY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_JOCKEY_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en Jockey' + ERROR_MESSAGE()
			END CATCH	

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'SJL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SJL_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en SJL' + ERROR_MESSAGE()
			END CATCH	

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'PARDO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PARDO_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en Pardo' + ERROR_MESSAGE()
			END CATCH	

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'ROSEDAL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en Rosedal' + ERROR_MESSAGE()
			END CATCH	

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
				SELECT 'PURUCHUCO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_SalidasSinClasificar t0
				WHERE t0.Fecha = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT 'Error en Puruchuco' + ERROR_MESSAGE()
			END CATCH	

		COMMIT TRANSACTION
		PRINT '';
        PRINT '============================================';
        PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        PRINT '============================================';

		UPDATE CONSOLIDADO_KARDEX.dbo.Logs
		SET
			FechaFin = SYSDATETIME(),
			Estado = 'OK'
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
