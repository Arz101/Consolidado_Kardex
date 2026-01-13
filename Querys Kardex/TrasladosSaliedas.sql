

DECLARE @fecha1 DATE,
        @fecha2 DATE;

SET @fecha1 = '2026-01-01';
SET @fecha2 = '2026-01-31';

--TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]

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
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'P&A' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PLAZA NORTE' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'MDS' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'C. CIVICO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'SALAVERRY' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'FONTANA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'AREQUIPA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'MINKA' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'BENAVIDES' AS Restaurante, *
FROM[172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'CHILCLAYO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'JOCKEY' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'SJL' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PARDO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'ROSEDAL' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2

UNION ALL
SELECT 'PURUCHUCO' AS Restaurante, *
FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosSalientes t0
WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2;
