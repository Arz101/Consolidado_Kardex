

DECLARE @fecha1 DATE,
        @fecha2 DATE;

SET @fecha1 = '2026-01-01';
SET @fecha2 = '2026-12-31';

--TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.Compras_Detalle

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
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'P&A' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PLAZA NORTE' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'MDS' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'C. CIVICO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'SALAVERRY' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'FONTANA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'AREQUIPA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'MINKA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'BENAVIDES' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'CHILCLAYO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'JOCKEY' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY__Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'SJL' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PARDO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2