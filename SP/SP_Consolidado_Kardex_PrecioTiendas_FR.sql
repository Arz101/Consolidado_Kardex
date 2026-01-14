

CREATE PROCEDURE [dbo].[SP_PrecioTiendas]
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

			DELETE FROM [CONSOLIDADO_KARDEX].[dbo].[PrecioTiendas]
			WHERE Fecha = @FechaHoy

			SELECT @FilasEliminadas = @@ROWCOUNT;

			WITH Datos AS
			(
				SELECT 'Jockey' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra
				FROM PERU_Frontrest.dbo.vw_JOCKEY_Costo
				GROUP BY Referencia, FechaUltCompra
    
				UNION ALL
				SELECT 'Pardo' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_PARDO_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL
				SELECT 'Rosedal' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra FROM PERU_Frontrest.dbo.vw_ROSEDAL_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL
				SELECT 'Puruchuco' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL 
				SELECT 'Canada' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_CANADA_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL
				SELECT 'P&A' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL
				SELECT 'PN' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL
				SELECT 'MDS' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra FROM PERU_Frontrest.dbo.sw_MALLSUR_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL
				SELECT 'CC' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Costo
				GROUP BY Referencia, FechaUltCompra

				UNION ALL
				SELECT 'Salaverry' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_SALAVERRY_Costo
				GROUP BY Referencia, FechaUltCompra
    
				UNION ALL
				SELECT 'Fontana' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra FROM PERU_Frontrest.dbo.vw_FONTANA_Costo
				GROUP BY Referencia, FechaUltCompra
    
				UNION ALL
				SELECT 'Arequipa' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_AREQUIPA_Costo
				GROUP BY Referencia, FechaUltCompra
    
				UNION ALL 
				SELECT 'Minka' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_MINKA_Costo
				GROUP BY Referencia, FechaUltCompra
    
				UNION ALL
				SELECT 'Benavides' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_BENAVIDES_Costo
				GROUP BY Referencia, FechaUltCompra
    
				UNION ALL
				SELECT 'Chilclayo' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Costo
				GROUP BY Referencia, FechaUltCompra
    
				UNION ALL 
				SELECT 'SJL' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra FROM PERU_Frontrest.dbo.vw_SJL_Costo
				GROUP BY Referencia, FechaUltCompra
			)
			INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
			SELECT *
			FROM Datos
			WHERE FechaUltCompra = @FechaHoy;

			SET @FilasInsertadas = @@ROWCOUNT;
			PRINT ' ------> Filas Insertadas: ' + CAST(@FilasInsertadas - @FilasEliminadas AS VARCHAR(20));

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END

GO
