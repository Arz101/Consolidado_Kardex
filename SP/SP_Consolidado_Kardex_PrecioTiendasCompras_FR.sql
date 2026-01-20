USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_PrecioTiendasCompras_FR]    Script Date: 1/13/2026 11:22:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[SP_PrecioTiendasCompras_FR]
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE)

			DELETE FROM CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras
			WHERE Fecha = @FechaHoy

			-- JOCKEY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'JOCKEY' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE) AS Fecha
				FROM [PERU_Frontrest].dbo.vw_Jockey_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en JOCKEY: ' + ERROR_MESSAGE()
			END CATCH

			-- SJL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'SJL' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_SJL_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en SJL: ' + ERROR_MESSAGE()
			END CATCH

			-- PARDO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'PARDO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_PARDO_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en PARDO: ' + ERROR_MESSAGE()
			END CATCH

			-- ROSEDAL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'ROSEDAL' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_ROSEDAL_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en ROSEDAL: ' + ERROR_MESSAGE()
			END CATCH

			-- PURUCHUCO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'PURUCHUCO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_PURUCHUCO_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en PURUCHUCO: ' + ERROR_MESSAGE()
			END CATCH

			-- CANADA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'CANADA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_CANADA_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en CANADA: ' + ERROR_MESSAGE()
			END CATCH

			-- PYA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'PYA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_PYA_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en PYA: ' + ERROR_MESSAGE()
			END CATCH

			-- CHILCLAYO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'CHILCLAYO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_CHILCLAYO_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en CHILCLAYO: ' + ERROR_MESSAGE()
			END CATCH

			-- MDS
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'MDS' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_MDS_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en MDS: ' + ERROR_MESSAGE()
			END CATCH

			-- CC
			--BEGIN TRY
			--	INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
			--	SELECT 'CC' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			--	FROM [PERU_Frontrest].dbo.vw_CCIVICO_PrecioCompras
			--	WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
			--	GROUP BY REFERENCIA, FECHAALBARAN
			--END TRY
			--BEGIN CATCH
				--PRINT 'Error en CC: ' + ERROR_MESSAGE()
			--END CATCH

			-- SALAVERRY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'SALAVERRY' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_SALAVERRY_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en SALAVERRY: ' + ERROR_MESSAGE()
			END CATCH

			-- FONTANA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'FONTANA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_FONTANA_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en FONTANA: ' + ERROR_MESSAGE()
			END CATCH

			-- AREQUIPA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'AREQUIPA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_AREQUIPA_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en AREQUIPA: ' + ERROR_MESSAGE()
			END CATCH

			-- MINKA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'MINKA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
				FROM [PERU_Frontrest].dbo.vw_MINKA_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) = @FechaHoy
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en MINKA: ' + ERROR_MESSAGE()
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
