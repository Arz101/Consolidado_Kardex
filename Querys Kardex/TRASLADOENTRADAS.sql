


DECLARE @fecha1 DATE, 
        @fecha2 DATE;

SET @fecha1 = '2026-01-01';  --"FechaInicio"
SET @fecha2 = '2026-12-31';  --"FechaFinal"

--TRUNCATE TABLE [CONSOLIDADO_KARDEX].[dbo].[TrasladoEntrantes]


INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[TrasladoEntrantes]
           ([Restaurante]
           ,[Fecha]
           ,[No.Entrada]
           ,[Proveedor]
           ,[CodigoArticuloFR]
           ,[ArticuloFR]
           ,[Unidades]
           ,[Cantidad]
           ,[Precio]
           ,[SubTotal]
           ,[IV]
           ,[Neto])

SELECT 'CANADA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'P&A' AS Restaurante, *
FROM  [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PLAZA NORTE' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'MDS' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'C. CIVICO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'SALAVERRY' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'FONTANA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'AREQUIPA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'MINKA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'BENAVIDES' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'CHILCLAYO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'JOCKEY' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'SJL' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PARDO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'ROSEDAL' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PURUCHUCO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosEntradas t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2;

--SELECT * FROM CONSOLIDADO_KARDEX.dbo.TrasladoEntrantes
--WHERE Fecha BETWEEN '2026-01-01' AND '2026-01-31';

