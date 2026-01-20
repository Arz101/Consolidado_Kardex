USE CONSOLIDADO_KARDEX

GO

CREATE OR ALTER PROCEDURE [dbo].[SP_ALL]
    @fecha1 DATE,
    @fecha2 DATE
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		BEGIN TRANSACTION 

        RAISERROR('Iniciando SP_Compras_Detalle', 0, 1) WITH NOWAIT;
		RAISERROR(' ', 0,1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.Compras_Detalle
			BEGIN TRY 
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
					([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
					,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_Compras t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
			--	WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
			END CATCH 


        RAISERROR('***** SP_Compras_Detall Finalizado (1/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0,1) WITH NOWAIT;
		RAISERROR('Iniciando SP_Compras', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE [CONSOLIDADO_KARDEX].[dbo].[Compras]

			BEGIN TRY 
				INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)
				SELECT 'CANADA' AS Restaurante,t0.Fecha,t0.Factura,t0.[No.Entrada],t0.Proveedor,
					SUM(t0.SubTotal) AS SubTotal,SUM(t0.IV) AS IV,SUM(t0.Neto)     AS Neto
				FROM	[PERU_Frontrest].dbo.vw_CANADA_Compras t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
			--	WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
				GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor
			END TRY
			BEGIN CATCH
        		RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_Compras', 0, 1) WITH NOWAIT;
			END CATCH	

        RAISERROR('***** SP_Compras Finalizado (2/10) *******', 0, 1) WITH NOWAIT;
		RAISERROR(' ', 0,1) WITH NOWAIT;
        RAISERROR('Iniciando SP_EntradaSinClasifcar', 0, 1) WITH NOWAIT;
			TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.EntradaSinClasificar
 			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_EntradasSinCalificar t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * MDS NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

			--BEGIN TRY
			--	INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
			--		([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
			--			,[Cantidad],[CostoProm],[Total],[Precio])
			--	SELECT 'C. CIVICO' AS Restaurante, *
			--	FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_EntradasSinCalificar t0
			--	WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			--END TRY
			--BEGIN CATCH
				--RAISERROR('           * C.CIVICO NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			--END CATCH				

			BEGIN TRY
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
						,[Cantidad],[CostoProm],[Total],[Precio])
				SELECT 'SALAVERRY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_EntradasSinCalificar t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2;
			END TRY
			BEGIN CATCH
				RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
			END CATCH

        RAISERROR('***** SP_EntradaSinClasificar Finalizado (3/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0,1) WITH NOWAIT;
		RAISERROR('Iniciando SP_InventarioMes', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.InventarioMes
            BEGIN TRY
				WITH Datos AS (
					SELECT 'JOCKEY'     AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_JOCKEY_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * JOCKEY NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'PARDO'AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PARDO_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * PARDO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'PURUCHUCO' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'CANADA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_CANADA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * CANADA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'P&A' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PYA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * P&A NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'PLAZA NORTE' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PLAZANORTE_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * PZ NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'MDS' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_MDS_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * MDS NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			--BEGIN TRY
			--	WITH Datos AS (
			--		SELECT 'C. CIVICO' AS Restaurante, Referencia, Cantidad, Fecha
			--		FROM PERU_Frontrest.dbo.vw_CCIVICO_Cantidad
			--	)
			--	INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
			--	SELECT *
			--	FROM Datos
			--	WHERE Fecha BETWEEN @fecha1 AND @fecha2
			--END TRY
			--BEGIN CATCH
				--RAISERROR('           * C. CIVICO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			--END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'SALAVERRY'AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_Salaverry_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * SALAVERRY NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'FONTANA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_FONTANA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * FONTANA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'AREQUIPA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_AREQUIPA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * AREQUIPA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'MINKA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_MINKA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * MINKA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'BENAVIDES' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_BENAVIDES_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * BENAVIDES NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'CHILCLAYO' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * CHICLAYO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'SJL' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_SJL_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				RAISERROR('           * SJL NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH
        RAISERROR('***** SP_InventarioMes_FR Finalizado (4/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0,1) WITH NOWAIT;
		RAISERROR('Iniciando SP_PrecioTiendas', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.PrecioTiendas;
			BEGIN TRY
				WITH Datos AS (
					SELECT 'Jockey' AS Sucursal, Referencia, AVG(CostProm) AS CostProm , FechaUltCompra
					FROM PERU_Frontrest.dbo.vw_JOCKEY_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT '           * MDS NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

			--BEGIN TRY
			--	WITH Datos AS (
			--		SELECT 'CC' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
			--		FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Costo
			--		GROUP BY Referencia, FechaUltCompra
			--	)
			--	INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
			--	SELECT *
			--	FROM Datos
			--	WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
			--END TRY
			--BEGIN CATCH
				--PRINT '           * CC NO DISPONIBLE     SP_PrecioTiendas'
			--END CATCH	

			BEGIN TRY
				WITH Datos AS (
					SELECT 'Salaverry' AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra  
					FROM PERU_Frontrest.dbo.vw_SALAVERRY_Costo
					GROUP BY Referencia, FechaUltCompra
				)
				INSERT INTO [CONSOLIDADO_KARDEX].[dbo].PrecioTiendas (Sucursal, Referencia, CostProm, Fecha) 
				SELECT *
				FROM Datos
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
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
				WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT '           * SJL NO DISPONIBLE     SP_PrecioTiendas'
			END CATCH	

        RAISERROR('***** SP_PrecioTiendas Finalizado (5/10) *******', 0, 1) WITH NOWAIT;        
		RAISERROR(' ', 0,1) WITH NOWAIT;
		RAISERROR('Iniciando SP_PreciosTiendasCompras', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras
            
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
				SELECT 'JOCKEY' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE) AS Fecha
				FROM [PERU_Frontrest].dbo.vw_Jockey_PrecioCompras
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
			--	WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
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
				WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
				GROUP BY REFERENCIA, FECHAALBARAN
			END TRY
			BEGIN CATCH
				PRINT 'Error en MINKA: ' + ERROR_MESSAGE()
			END CATCH

        RAISERROR('***** SP_PrecioTiendasCompras Finalizado (6/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0,1) WITH NOWAIT;
		RAISERROR('Iniciando SP_TrasladoEntrantes', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE [CONSOLIDADO_KARDEX].[dbo].[TrasladoEntrantes]
   			BEGIN TRY
				INSERT INTO [dbo].[TrasladoEntrantes]
					([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
					,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_TrasladosEntradas t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
			--	WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
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
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en PURUCHUCO: ' + ERROR_MESSAGE()
			END CATCH

        RAISERROR('***** SP_TraladoEntrantes Finalizado (7/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0,1) WITH NOWAIT;
		RAISERROR('Iniciando SP_TrasladosSalidas', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]

			-- CANADA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en CANADA: ' + ERROR_MESSAGE()
			END CATCH

			-- P&A
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'P&A' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en P&A: ' + ERROR_MESSAGE()
			END CATCH

			-- PLAZA NORTE
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'PLAZA NORTE' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en PLAZA NORTE: ' + ERROR_MESSAGE()
			END CATCH

			-- MDS
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'MDS' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_MALLSUR_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en MDS: ' + ERROR_MESSAGE()
			END CATCH

			-- C. CIVICO
			/*
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'C. CIVICO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH*/
				--PRINT 'Error en C. CIVICO: ' + ERROR_MESSAGE()
			--END CATCH

			-- SALAVERRY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'SALAVERRY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en SALAVERRY: ' + ERROR_MESSAGE()
			END CATCH

			-- FONTANA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'FONTANA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_FONTANA_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en FONTANA: ' + ERROR_MESSAGE()
			END CATCH

			-- AREQUIPA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'AREQUIPA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en AREQUIPA: ' + ERROR_MESSAGE()
			END CATCH

			-- MINKA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'MINKA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_MINKA_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en MINKA: ' + ERROR_MESSAGE()
			END CATCH

			-- BENAVIDES
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'BENAVIDES' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en BENAVIDES: ' + ERROR_MESSAGE()
			END CATCH

			-- CHILCLAYO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'CHILCLAYO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en CHILCLAYO: ' + ERROR_MESSAGE()
			END CATCH

			-- JOCKEY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'JOCKEY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_JOCKEY_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en JOCKEY: ' + ERROR_MESSAGE()
			END CATCH

			-- SJL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'SJL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SJL_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en SJL: ' + ERROR_MESSAGE()
			END CATCH

			-- PARDO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'PARDO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PARDO_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en PARDO: ' + ERROR_MESSAGE()
			END CATCH

			-- ROSEDAL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'ROSEDAL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en ROSEDAL: ' + ERROR_MESSAGE()
			END CATCH

			-- PURUCHUCO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'PURUCHUCO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosSalientes t0
				WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en PURUCHUCO: ' + ERROR_MESSAGE()
			END CATCH
        
        RAISERROR('***** SP_TrasladosSalientes Finalizado (8/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0,1) WITH NOWAIT;
		RAISERROR('Iniciando SP_VentasPorProducto', 0, 1) WITH NOWAIT;
			TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.VentasPorProducto
			-- CANADA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'CANADA', *
				FROM PERU_Frontrest.dbo.vw_CANADA_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en CANADA: ' + ERROR_MESSAGE()
			END CATCH

			-- P&A
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'P&A', *
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en P&A: ' + ERROR_MESSAGE()
			END CATCH

			-- PLAZA NORTE
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'PLAZA NORTE', *
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en PLAZA NORTE: ' + ERROR_MESSAGE()
			END CATCH

			-- MDS
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'MDS', *
				FROM PERU_Frontrest.dbo.sw_MALLSUR_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en MDS: ' + ERROR_MESSAGE()
			END CATCH

			-- C. CIVICO
			/*BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'C. CIVICO', *
				FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH*/
			--    PRINT 'Error en C. CIVICO: ' + ERROR_MESSAGE()
			--END CATCH

			-- SALAVERRY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'SALAVERRY', *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en SALAVERRY: ' + ERROR_MESSAGE()
			END CATCH

			-- FONTANA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'FONTANA', *
				FROM PERU_Frontrest.dbo.vw_FONTANA_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en FONTANA: ' + ERROR_MESSAGE()
			END CATCH

			-- AREQUIPA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'AREQUIPA', *
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en AREQUIPA: ' + ERROR_MESSAGE()
			END CATCH

			-- MINKA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'MINKA', *
				FROM PERU_Frontrest.dbo.vw_MINKA_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en MINKA: ' + ERROR_MESSAGE()
			END CATCH

			-- BENAVIDES
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'BENAVIDES', *
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en BENAVIDES: ' + ERROR_MESSAGE()
			END CATCH

			-- CHILCLAYO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'CHILCLAYO', *
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en CHILCLAYO: ' + ERROR_MESSAGE()
			END CATCH

			-- JOCKEY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'JOCKEY', *
				FROM PERU_Frontrest.dbo.vw_JOCKEY_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en JOCKEY: ' + ERROR_MESSAGE()
			END CATCH

			-- SJL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'SJL', *
				FROM PERU_Frontrest.dbo.vw_SJL_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en SJL: ' + ERROR_MESSAGE()
			END CATCH

			-- PARDO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'PARDO', *
				FROM PERU_Frontrest.dbo.vw_PARDO_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en PARDO: ' + ERROR_MESSAGE()
			END CATCH

			-- ROSEDAL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'ROSEDAL', *
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en ROSEDAL: ' + ERROR_MESSAGE()
			END CATCH

			-- PURUCHUCO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
					(Restaurante,
						GrupoProductoFR,
						CodigoProductoFR,
						ProductoFR,
						Cantidad,
						Total,
						Fecha,
						FechaAnulacion)
				SELECT 'PURUCHUCO', *
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_VentaPorProducto
				WHERE Fecha BETWEEN @fecha1 AND @fecha2
			END TRY
			BEGIN CATCH
				PRINT 'Error en PURUCHUCO: ' + ERROR_MESSAGE()
			END CATCH

        RAISERROR('***** SP_VentasPorProducto Finalizado (9/10) *******', 0, 1) WITH NOWAIT;
		RAISERROR(' ', 0,1) WITH NOWAIT;


		PRINT '';
        PRINT '============================================';
        PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        PRINT '============================================';
		PRINT 'Commands completed successfully.';
        COMMIT TRANSACTION;
    END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END
GO
