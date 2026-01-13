
DECLARE @fecha1 DATE,
        @fecha2 DATE

SET @fecha1 = '2026-01-01'  --"FechaInicio"
SET @fecha2 = '2026-12-31'  --"FechaFinal"

--TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.Compras

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
SELECT 'CANADA' AS Restaurante,
       t0.Fecha,
       t0.Factura,
       t0.[No.Entrada],
       t0.Proveedor,
       SUM(t0.SubTotal) AS SubTotal,
       SUM(t0.IV)       AS IV,
       SUM(t0.Neto)     AS Neto
FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_CANADA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'P&A', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'PLAZA NORTE', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'MDS', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'C. CIVICO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'SALAVERRY', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'FONTANA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'AREQUIPA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'MINKA', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'BENAVIDES', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'CHILCLAYO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'JOCKEY', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY__Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'SJL', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'PARDO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
       SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

UNION ALL
SELECT 'ROSEDAL' ,t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
    SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_ROSEDAL_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor


UNION ALL
SELECT 'PURUCHUCO', t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
    SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PURUCHUCO_Compras t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor

SELECT * FROM CONSOLIDADO_KARDEX.dbo.Compras
WHERE Fecha BETWEEN '2026-01-01' AND '2026-01-31';