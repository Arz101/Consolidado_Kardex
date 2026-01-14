

CREATE PROCEDURE [dbo].[SP_ALL]
    @fecha1 DATE,
    @fecha2 DATE
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION

        RAISERROR('Iniciando SP_Compras_Detalle', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.Compras_Detalle
        	INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
                ([Restaurante]
                ,[Fecha]
                ,[Factura]
                ,[No.Entrada]
                ,[Proveedor]
                ,[CodigoArticuloFR]
                ,[ArticuloFR]
                ,[Unidades]
                ,[Cantidad]
                ,[PrecioCompras]
                ,[SubTotal]
                ,[IV]
                ,[Neto]
                ,[CODPROVEEDOR])
            SELECT 'CANADA' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_CANADA_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'P&A' AS Restaurante, *
            FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'PLAZA NORTE' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'MDS' AS Restaurante, *
            FROM PERU_Frontrest.dbo.sw_MALLSUR_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'C. CIVICO' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'SALAVERRY' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_SALAVERRY_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'FONTANA' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_FONTANA_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'AREQUIPA' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_AREQUIPA_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'MINKA' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_MINKA_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'BENAVIDES' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_BENAVIDES_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'CHILCLAYO' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'JOCKEY' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_JOCKEY__Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'SJL' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_SJL_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'PARDO' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_PARDO_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'ROSEDAL' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_ROSEDAL_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'PURUCHUCO' AS Restaurante, *
            FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Compras t0
            WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

        RAISERROR('***** SP_Compras_Detall Finalizado (1/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_EntradaSinClasificar', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]

			INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					   ([Restaurante]
					   ,[Fecha]
					   ,[Origen]
					   ,[Destino]
					   ,[CodigoArtculoFR]
					   ,[ArticuloFR]
					   ,[Unidades]
					   ,[Cantidad]
					   ,[CostoProm]
					   ,[Total]
					   ,[Precio])
			SELECT 'CANADA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CANADA_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'P&A' AS Restaurante, *
			FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PLAZA NORTE' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MDS' AS Restaurante, *
			FROM PERU_Frontrest.dbo.sw_MALLSUR_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'C. CIVICO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SALAVERRY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SALAVERRY_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'FONTANA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_FONTANA_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'AREQUIPA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_AREQUIPA_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MINKA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_MINKA_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'BENAVIDES' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_BENAVIDES_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'CHILCLAYO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CHILCLAYO_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'JOCKEY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_JOCKEY_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SJL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SJL_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PARDO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PARDO_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'ROSEDAL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_ROSEDAL_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PURUCHUCO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PURUCHUCO_EntradasSinCalificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2;

        RAISERROR('***** SP_EntradasSinCalificar Finalizado (2/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_Compras', 0, 1) WITH NOWAIT;

            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.Compras
        	INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(
				Restaurante,
				Fecha,
				Factura,
				[No.Entrada],
				Proveedor,
				SubTotal,
				IV,
				Neto
			)
			SELECT 'CANADA' AS Restaurante,t0.Fecha,t0.Factura,t0.[No.Entrada],t0.Proveedor,
				   SUM(t0.SubTotal) AS SubTotal,SUM(t0.IV) AS IV,SUM(t0.Neto)     AS Neto
			FROM [PERU_Frontrest].dbo.vw_CANADA_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'P&A', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'PLAZA NORTE', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'MDS', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.sw_MALLSUR_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'C. CIVICO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'SALAVERRY', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_SALAVERRY_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'FONTANA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_FONTANA_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'AREQUIPA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_AREQUIPA_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'MINKA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_MINKA_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'BENAVIDES', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_BENAVIDES_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'CHILCLAYO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'JOCKEY', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_JOCKEY__Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'SJL', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_SJL_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'PARDO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				   SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_PARDO_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'ROSEDAL' ,t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_ROSEDAL_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

			UNION ALL
			SELECT 'PURUCHUCO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
				SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
			FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Compras t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
			GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

        RAISERROR('***** SP_Compras Finalizado (3/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_VentasPorProducto', 0, 1) WITH NOWAIT;

            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.VentasPorProducto
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

            UNION ALL
            SELECT 'P&A', *
            FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'PLAZA NORTE', *
            FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'MDS', *
            FROM PERU_Frontrest.dbo.sw_MALLSUR_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'C. CIVICO', *
            FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'SALAVERRY', *
            FROM PERU_Frontrest.dbo.vw_SALAVERRY_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'FONTANA', *
            FROM PERU_Frontrest.dbo.vw_FONTANA_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'AREQUIPA', *
            FROM PERU_Frontrest.dbo.vw_AREQUIPA_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'MINKA', *
            FROM PERU_Frontrest.dbo.vw_MINKA_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'BENAVIDES', *
            FROM PERU_Frontrest.dbo.vw_BENAVIDES_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'CHILCLAYO', *
            FROM PERU_Frontrest.dbo.vw_CHILCLAYO_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'JOCKEY', *
            FROM PERU_Frontrest.dbo.vw_JOCKEY_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'SJL', *
            FROM PERU_Frontrest.dbo.vw_SJL_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'PARDO', *
            FROM PERU_Frontrest.dbo.vw_PARDO_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'ROSEDAL', *
            FROM PERU_Frontrest.dbo.vw_ROSEDAL_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2

            UNION ALL
            SELECT 'PURUCHUCO', *
            FROM PERU_Frontrest.dbo.vw_PURUCHUCO_VentaPorProducto
            WHERE Fecha BETWEEN @fecha1 AND @fecha2;
        
        RAISERROR('***** SP_VentasPorProducto Finalizado (4/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_InventarioMes', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.InventarioMes;
			
            WITH Datos AS (
				SELECT 'JOCKEY'     AS Restaurante, Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_JOCKEY_Cantidad

				UNION ALL
				SELECT 'PARDO', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_PARDO_Cantidad

				UNION ALL
				SELECT 'ROSEDAL', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_Cantidad

				UNION ALL
				SELECT 'PURUCHUCO', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Cantidad

				UNION ALL
				SELECT 'CANADA', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_CANADA_Cantidad

				UNION ALL
				SELECT 'P&A', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_PYA_Cantidad

				UNION ALL
				SELECT 'PLAZA NORTE', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_PLAZANORTE_Cantidad

				UNION ALL
				SELECT 'MDS', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_MDS_Cantidad

				UNION ALL
				SELECT 'C. CIVICO', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_CCIVICO_Cantidad

				UNION ALL
				SELECT 'SALAVERRY', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_Salaverry_Cantidad

				UNION ALL
				SELECT 'FONTANA', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_FONTANA_Cantidad

				UNION ALL
				SELECT 'AREQUIPA', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_Cantidad

				UNION ALL
				SELECT 'MINKA', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_MINKA_Cantidad

				UNION ALL
				SELECT 'BENAVIDES', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_Cantidad

				UNION ALL
				SELECT 'CHILCLAYO', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Cantidad

				UNION ALL
				SELECT 'SJL', Referencia, Cantidad, Fecha
				FROM PERU_Frontrest.dbo.vw_SJL_Cantidad
			)
			INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
			SELECT *
			FROM Datos
			WHERE Fecha BETWEEN @fecha1 AND @fecha2;

        RAISERROR('***** SP_InventarioMes Finalizado (5/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_PreciosTiendasCompras', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras
            
            INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
			SELECT 'JOCKEY' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE) AS Fecha
			FROM [PERU_Frontrest].dbo.vw_Jockey_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
			GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'SJL' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_SJL_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
			GROUP BY REFERENCIA, FECHAALBARAN


			UNION ALL
			SELECT 'PARDO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_PARDO_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2

			GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'ROSEDAL' AS Sucursal , REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_ROSEDAL_PrecioCompras
            WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
			GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'PURUCHUCO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_PURUCHUCO_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'CANADA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_CANADA_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'PYA' AS Sucursal , REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_PYA_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'CHILCLAYO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_CHILCLAYO_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'MDS' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_MDS_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'CC' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_CCIVICO_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'SALAVERRY' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_SALAVERRY_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'FONTANA' AS Sucursal , REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_FONTANA_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'AREQUIPA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_AREQUIPA_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

			UNION ALL
			SELECT 'MINKA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
			FROM [PERU_Frontrest].dbo.vw_MINKA_PrecioCompras
			WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
            GROUP BY REFERENCIA, FECHAALBARAN

        RAISERROR('***** SP_PrecioTiendasCompras Finalizado (6/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_SalidaSinClasificar', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
    		INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]
					   ([Restaurante]
					   ,[Fecha]
					   ,[Origen]
					   ,[Destino]
					   ,[CodigoArticuloFR]
					   ,[ArticuloFR]
					   ,[Unidades]
					   ,[Cantidad]
					   ,[CostoProm]
					   ,[Total]
					   ,[CODALMORIGIN]
					   ,[CODALMDESTINO])
			SELECT 'CANADA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CANADA_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'P&A' AS Restaurante, *
			FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PLAZA NORTE' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MDS' AS Restaurante, *
			FROM PERU_Frontrest.dbo.sw_MALLSUR_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'C. CIVICO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SALAVERRY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SALAVERRY_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'FONTANA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_FONTANA_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'AREQUIPA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_AREQUIPA_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MINKA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_MINKA_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'BENAVIDES' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_BENAVIDES_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'CHILCLAYO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CHILCLAYO_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'JOCKEY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_JOCKEY_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SJL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SJL_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PARDO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PARDO_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'ROSEDAL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_ROSEDAL_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PURUCHUCO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PURUCHUCO_SalidasSinClasificar t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2;

        RAISERROR('***** SP_SalidaSinClasificar Finalizado (7/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_TrasladosSalidas', 0, 1) WITH NOWAIT;
            TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
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

			UNION ALL
			SELECT 'P&A' AS Restaurante, *
			FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PLAZA NORTE' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MDS' AS Restaurante, *
			FROM PERU_Frontrest.dbo.sw_MALLSUR_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'C. CIVICO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SALAVERRY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'FONTANA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_FONTANA_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'AREQUIPA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MINKA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_MINKA_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'BENAVIDES' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'CHILCLAYO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'JOCKEY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_JOCKEY_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SJL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SJL_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PARDO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PARDO_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'ROSEDAL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PURUCHUCO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosSalientes t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
        
        RAISERROR('***** SP_TrasladosSalientes Finalizado (8/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR('Iniciando SP_TrasladosEntrantes', 0, 1) WITH NOWAIT;

            TRUNCATE TABLE [CONSOLIDADO_KARDEX].[dbo].[TrasladoEntrantes]
    	    INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[TrasladoEntrantes]
                ([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
                ,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
			SELECT 'CANADA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CANADA_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'P&A' AS Restaurante, *
			FROM  PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PLAZA NORTE' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MDS' AS Restaurante, *
			FROM PERU_Frontrest.dbo.sw_MALLSUR_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'C. CIVICO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SALAVERRY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'FONTANA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_FONTANA_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'AREQUIPA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'MINKA' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_MINKA_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'BENAVIDES' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'CHILCLAYO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'JOCKEY' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_JOCKEY_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'SJL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_SJL_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PARDO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PARDO_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'ROSEDAL' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

			UNION ALL
			SELECT 'PURUCHUCO' AS Restaurante, *
			FROM PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosEntradas t0
			WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

        RAISERROR('***** SP_TrasladosEntrantes Finalizado (9/10) *******', 0, 1) WITH NOWAIT;
	    RAISERROR('Iniciando SP_PrecioTiendas', 0, 1) WITH NOWAIT;

			TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.[PrecioTiendas];

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
			WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2;

        RAISERROR('***** SP_PrecioTiendas Finalizado (10/10) *******', 0, 1) WITH NOWAIT;
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
