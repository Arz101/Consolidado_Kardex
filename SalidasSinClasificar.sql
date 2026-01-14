
DECLARE @fecha1 DATE,
        @fecha2 DATE;

SET @fecha1 = '2026-01-01';  --"FechaInicial"   
SET @fecha2 = '2026-12-31';  --"FechaFinal"

--TRUNCATE TABLE [CONSOLIDADO_KARDEX].[dbo].[SalidaSinClasificar]

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
