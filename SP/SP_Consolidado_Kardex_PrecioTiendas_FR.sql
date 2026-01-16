

CREATE OR ALTER PROCEDURE [dbo].[SP_PrecioTiendas]
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

			DELETE FROM [CONSOLIDADO_KARDEX].[dbo].[PrecioTiendas]
			WHERE Fecha = @FechaHoy

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Jockey' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra
					FROM PERU_Frontrest.dbo.vw_JOCKEY_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * PARDO NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Pardo' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_PARDO_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * PARDO NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH
			
			BEGIN TRY
				WITH Datos AS (
					SELECT 'Rosedal' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra 
					FROM PERU_Frontrest.dbo.vw_ROSEDAL_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * ROSEDAL NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Puruchuco' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * PURUCHUCO NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Canada' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_CANADA_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * CANADA NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH		

			BEGIN TRY
				WITH Datos AS (
					SELECT 'P&A' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra 
					FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * P&A NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'PN' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * PN NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'MDS' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra 
					FROM PERU_Frontrest.dbo.sw_MALLSUR_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * MDS NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'CC' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * CC NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Salaverry' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_SALAVERRY_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * SALAVERRY NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Fontana' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra 
					FROM PERU_Frontrest.dbo.vw_FONTANA_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * FONTANA NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Arequipa' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_AREQUIPA_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * AREQUIPA NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Minka' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_MINKA_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * MINKA NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Benavides' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_BENAVIDES_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * BENAVIDES NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Chilclayo' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * CHILCLAYO NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'SJL' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra FROM PERU_Frontrest.dbo.vw_SJL_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra = @FechaHoy;
			END TRY
			BEGIN CATCH
				PRINT '           * SJL NO DISPONIBLE     SP_PrecioTiendas'
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
