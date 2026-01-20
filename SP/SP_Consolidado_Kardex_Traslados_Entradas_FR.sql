USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_TrasladosEntrastes_FR]    Script Date: 1/13/2026 11:50:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER   PROCEDURE [dbo].[SP_TrasladosEntrastes_FR]
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE)
			DECLARE @FilasInsertadas INT;
			DECLARE @FilasEliminadas INT;


			DELETE FROM CONSOLIDADO_KARDEX.dbo.TrasladoEntrantes
			WHERE Fecha = @FechaHoy
			
			-- CANADA
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en CANADA: ' + ERROR_MESSAGE()
			END CATCH

			-- P&A
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'P&A' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en P&A: ' + ERROR_MESSAGE()
			END CATCH

			-- PLAZA NORTE
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'PLAZA NORTE' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en PLAZA NORTE: ' + ERROR_MESSAGE()
			END CATCH

			-- MDS
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'MDS' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_MALLSUR_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en MDS: ' + ERROR_MESSAGE()
			END CATCH

			-- C. CIVICO
			--BEGIN TRY
			--	INSERT INTO [dbo].[TrasladoEntrantes]
			--		([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
			--		,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
			--	SELECT 'C. CIVICO' AS Restaurante, *
			--	FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosEntradas t0
			--	WHERE t0.Fecha = @FechaHoy
			--END TRY
			--BEGIN CATCH
				--PRINT 'Error en C. CIVICO: ' + ERROR_MESSAGE()
			--END CATCH

			-- SALAVERRY
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'SALAVERRY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en SALAVERRY: ' + ERROR_MESSAGE()
			END CATCH

			-- FONTANA
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'FONTANA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_FONTANA_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en FONTANA: ' + ERROR_MESSAGE()
			END CATCH

			-- AREQUIPA
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'AREQUIPA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en AREQUIPA: ' + ERROR_MESSAGE()
			END CATCH

			-- MINKA
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'MINKA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_MINKA_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en MINKA: ' + ERROR_MESSAGE()
			END CATCH

			-- BENAVIDES
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'BENAVIDES' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en BENAVIDES: ' + ERROR_MESSAGE()
			END CATCH

			-- CHILCLAYO
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'CHILCLAYO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en CHILCLAYO: ' + ERROR_MESSAGE()
			END CATCH

			-- JOCKEY
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'JOCKEY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_JOCKEY_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en JOCKEY: ' + ERROR_MESSAGE()
			END CATCH

			-- SJL
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'SJL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SJL_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en SJL: ' + ERROR_MESSAGE()
			END CATCH

			-- PARDO
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'PARDO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PARDO_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en PARDO: ' + ERROR_MESSAGE()
			END CATCH

			-- ROSEDAL
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'ROSEDAL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en ROSEDAL: ' + ERROR_MESSAGE()
			END CATCH

			-- PURUCHUCO
			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'PURUCHUCO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosEntradas t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en PURUCHUCO: ' + ERROR_MESSAGE()
			END CATCH

		COMMIT TRANSACTION;

		PRINT '';
        PRINT '============================================';
        PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        PRINT '============================================';
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END
GO


