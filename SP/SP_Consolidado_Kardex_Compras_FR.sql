USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_FR_Compras]    Script Date: 1/13/2026 11:13:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[SP_FR_Compras]
AS
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
-- Description:	Consolidado Kardex Peru
-- =============================================
BEGIN 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRANSACTION

			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE)
			DECLARE @FilasInsertadas INT;
			DECLARE @FilasEliminadas INT;

			DELETE FROM CONSOLIDADO_KARDEX.[dbo].[Compras]
			WHERE Fecha = @FechaHoy

			SELECT @FilasEliminadas = @@ROWCOUNT;
			
			BEGIN TRY 
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)
				SELECT 'CANADA' AS Restaurante,t0.Fecha,t0.Factura,t0.[No.Entrada],t0.Proveedor,
					SUM(t0.SubTotal) AS SubTotal,SUM(t0.IV) AS IV,SUM(t0.Neto)     AS Neto
				FROM	[PERU_Frontrest].dbo.vw_CANADA_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * CANADA NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)
				SELECT 'P&A', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
					SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * P&A NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'PLAZA NORTE', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PZ NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'MDS', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.sw_MALLSUR_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * MDS NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH
			
			--BEGIN TRY
			--	INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

			--	SELECT 'C. CIVICO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
			--	   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			--	FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Compras t0
			--	WHERE t0.Fecha = @FechaHoy
			--	GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			--END TRY
			--BEGIN CATCH
        		---RAISERROR('           * C.CIVICO NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			--END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'SALAVERRY', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * SALAVERRY NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'FONTANA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_FONTANA_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * FONTANA NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)
				
				SELECT 'AREQUIPA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * AREQUIPA NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'MINKA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_MINKA_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * MINKA NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'BENAVIDES', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * BENAVIDES NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'CHILCLAYO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * CHICLAYO NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'JOCKEY', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
					   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_JOCKEY__Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * JOCKEY NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'SJL', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_SJL_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * SJL NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'PARDO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_PARDO_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PARDO NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH				

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'ROSEDAL' ,t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
					SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * ROSEDAL NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH	

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)

				SELECT 'PURUCHUCO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
					SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Compras t0
				WHERE t0.Fecha = @FechaHoy
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH	
			
		COMMIT TRANSACTION;

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


