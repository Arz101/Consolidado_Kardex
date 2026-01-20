USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_Compras_Detalles_FR]    Script Date: 1/13/2026 2:47:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER     PROCEDURE [dbo].[SP_Compras_Detalles_FR] 
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
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
		VALUES ('SP_Compras_Detalles_FR', 'EN PROCESO', @Inicio)
		
		SET @IdLog = SCOPE_IDENTITY();
		BEGIN TRANSACTION 
			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE);

			DELETE FROM [CONSOLIDADO_KARDEX].[dbo].[Compras_Detalle]
			WHERE Fecha = @FechaHoy

			BEGIN TRY 
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * CANADA NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'P&A' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY 
			BEGIN CATCH
        		RAISERROR('           * P&A NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 


			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'PLAZA NORTE' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PZ NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'MDS' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_MALLSUR_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * MDS NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			--BEGIN TRY
			--	INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
			--		([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
			--		,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
			--	SELECT 'C. CIVICO' AS Restaurante, *
			--	FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Compras t0
			--	WHERE t0.Fecha = @FechaHoy
			--END TRY
			--BEGIN CATCH
        	--	RAISERROR('           * C.CIVICO NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			--END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])			
				SELECT 'SALAVERRY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * SALAVERRY NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])	
				SELECT 'FONTANA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_FONTANA_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * FONTANA NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])	
				SELECT 'AREQUIPA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * AREQUIPA NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])				
				SELECT 'MINKA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_MINKA_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * MINKA NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 


			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])		
				SELECT 'BENAVIDES' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * BENAVIDES NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'CHILCLAYO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * CHICLAYO NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'JOCKEY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_JOCKEY__Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * JOCKEY NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'SJL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SJL_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * SJL NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'PARDO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PARDO_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PARDO NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'ROSEDAL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * ROSEDAL NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'PURUCHUCO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Compras t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 

		COMMIT TRANSACTION;

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


