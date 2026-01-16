USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_EntradasSinClasificar_FR]    Script Date: 1/13/2026 11:23:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[SP_EntradasSinClasificar_FR]
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
			
			DELETE FROM CONSOLIDADO_KARDEX.dbo.EntradaSinClasificar
			WHERE Fecha = @FechaHoy

			SELECT @FilasEliminadas = @@ROWCOUNT;

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * CANADA NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])	
				SELECT 'P&A' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * P&A NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH
			
			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'PZ' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * PZ NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'MDS' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_MALLSUR_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * MDS NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'C. CIVICO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * C.CIVICO NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH				

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'SALAVERRY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * SALVAERRY NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH		

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'FONTANA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_FONTANA_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * FONTANA NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH	

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'AREQUIPA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * AREQUIPA NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH	

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'MINKA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_MINKA_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * MINKA NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'BENAVIDES' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * BENAVIDES NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'CHILCLAYO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * CHICLAYO NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH


			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'JOCKEY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_JOCKEY_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * JOCKEY NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'SJL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SJL_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * SJL NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH


			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'PARDO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PARDO_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * PARDO NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'ROSEDAL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				RAISERROR('           * ROSEDAL NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'PURUCHUCO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_EntradasSinCalificar t0
				WHERE t0.Fecha = @FechaHoy;
			END TRY
			BEGIN CATCH
				RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

		COMMIT TRANSACTION
		PRINT '';
        PRINT '============================================';
        PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        PRINT '============================================';
	END TRY

	BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH
END
GO


