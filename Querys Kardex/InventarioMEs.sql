
TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.InventarioMEs;


DECLARE @fecha1 DATE,
        @fecha2 DATE,
        @fecha3 DATE;

SET @fecha1 = "FechaInicial";
SET @fecha2 = "FechaFinal";
SET @fecha3 = DATEADD(DAY, -1, @fecha1);


SELECT *
FROM PERU_Frontrest.dbo.vw_JOCKEY_Cantidad
WHERE fecha = @fecha3

SELECT  
    t0.CodigoArticulo,
    t0.CodigoGrupo,
    t0.GrupoArticulo,
    t0.Articulo,

    ISNULL(DT0.Cantidad, 0.00)  AS Jockey,
    ISNULL(DT2.Cantidad, 0.00)  AS Pardo,
    ISNULL(DT3.Cantidad, 0.00)  AS Rosedal,
    ISNULL(DT4.Cantidad, 0.00)  AS Puruchuco,
    ISNULL(DT5.Cantidad, 0.00)  AS Canada,
    ISNULL(DT6.Cantidad, 0.00)  AS [P&A],
    ISNULL(DT7.Cantidad, 0.00)  AS PN,
    ISNULL(DT8.Cantidad, 0.00)  AS MDS,
    ISNULL(DT9.Cantidad, 0.00)  AS CC,
    ISNULL(DT10.Cantidad, 0.00) AS Salaverry,
    ISNULL(DT11.Cantidad, 0.00) AS Fontana,
    ISNULL(DT12.Cantidad, 0.00) AS Arequipa,
    ISNULL(DT14.Cantidad, 0.00) AS Minka,
    ISNULL(DT16.Cantidad, 0.00) AS Benavides,
    ISNULL(DT17.Cantidad, 0.00) AS Chilclayo,
    ISNULL(DT19.Cantidad, 0.00) AS SJL
FROM GERENCIAL.dbo.Peru_ArticulosKardex t0

-- Jockey
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_JOCKEY_Cantidad
    WHERE fecha = @fecha3
) DT0 ON DT0.Referencia = t0.EquivalenciaFR

-- Pardo
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_PARDO_Cantidad
    WHERE fecha = @fecha3
) DT2 ON DT2.Referencia = t0.EquivalenciaFR

-- Rosedal
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_AREQUIPA_Cantidad
    WHERE fecha = @fecha3
) DT3 ON DT3.Referencia = t0.EquivalenciaFR

-- Puruchuco
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Cantidad
    WHERE fecha = @fecha3
) DT4 ON DT4.Referencia = t0.EquivalenciaFR

-- Canada
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_CANADA_Cantidad
    WHERE fecha = @fecha3
) DT5 ON DT5.Referencia = t0.EquivalenciaFR

-- P&A
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_PYA_Cantidad
    WHERE fecha = @fecha3
) DT6 ON DT6.Referencia = t0.EquivalenciaFR

-- Plaza Norte
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_PLAZANORTE_Cantidad
    WHERE fecha = @fecha3
) DT7 ON DT7.Referencia = t0.EquivalenciaFR

-- MDS
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_MDS_Cantidad
    WHERE fecha = @fecha3
) DT8 ON DT8.Referencia = t0.EquivalenciaFR

-- Centro Civico
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_CCIVICO_Cantidad
    WHERE fecha = @fecha3
) DT9 ON DT9.Referencia = t0.EquivalenciaFR

-- Salaverry
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_Salaverry_Cantidad
    WHERE fecha = @fecha3
) DT10 ON DT10.Referencia = t0.EquivalenciaFR

-- Fontana
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_FONTANA_Cantidad
    WHERE fecha = @fecha3
) DT11 ON DT11.Referencia = t0.EquivalenciaFR

-- Arequipa
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_AREQUIPA_Cantidad
    WHERE fecha = @fecha3
) DT12 ON DT12.Referencia = t0.EquivalenciaFR

-- Minka (usa @fecha1 según tu lógica original)
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_MINKA_Cantidad
    WHERE fecha = @fecha1
) DT14 ON DT14.Referencia = t0.EquivalenciaFR

-- Benavides
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_BENAVIDES_Cantidad
    WHERE fecha = @fecha3
) DT16 ON DT16.Referencia = t0.EquivalenciaFR

-- Chilclayo
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Cantidad
    WHERE fecha = @fecha3
) DT17 ON DT17.Referencia = t0.EquivalenciaFR

-- SJL (usa @fecha1 según tu lógica original)
LEFT JOIN (
    SELECT *
    FROM PERU_Frontrest.dbo.vw_SJL_Cantidad
    WHERE fecha = @fecha1
) DT19 ON DT19.Referencia = t0.EquivalenciaFR

ORDER BY t0.Orden;


WITH Jockey AS (
    SELECT Restaurante, Referencia, Fecha, Cantidad
    FROM CONSOLIDADO_KARDEX.dbo.InventarioMes 
    WHERE Restaurante = 'JOCKEY' AND Fecha = '2025-12-31'
), Pardo AS (
    SELECT Restaurante, Referencia, Fecha, Cantidad
    FROM CONSOLIDADO_KARDEX.dbo.InventarioMes 
    WHERE Restaurante = 'PARDO' AND Fecha = '2025-12-31'
), Roselda AS (
    SELECT Restaurante, Referencia, Fecha, Cantidad
    FROM CONSOLIDADO_KARDEX.dbo.InventarioMes 
    WHERE Restaurante = 'ROSEDAL' AND Fecha = '2025-12-31'
), Puruchuco AS (
    SELECT Restaurante, Referencia, Fecha, Cantidad
    FROM CONSOLIDADO_KARDEX.dbo.InventarioMes 
    WHERE Restaurante = 'PURUCHUCO' AND Fecha = '2025-12-31'
)
SELECT t0.CodigoGrupo, t0.CodigoArticulo, t0.GrupoArticulo, t0.Articulo, 
       SUM(ISNULL(t1.Cantidad, 0)) AS Jockey,
       SUM(ISNULL(t2.Cantidad, 0)) AS Pardo,
       SUM(ISNULL(t3.Cantidad, 0)) AS Rosedal,
       SUM(ISNULL(t4.Cantidad, 0)) AS Puruchuco
FROM [172.16.17.250].GERENCIAL.dbo.Peru_ArticulosKardex t0
LEFT JOIN Jockey t1 
    ON t0.EquivalenciaFR = t1.Referencia COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT JOIN Pardo t2 
    ON t0.EquivalenciaFR = t2.Referencia COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT JOIN Roselda t3 
    ON t0.EquivalenciaFR = t3.Referencia COLLATE SQL_Latin1_General_CP1_CI_AS
LEFT JOIN Puruchuco t4 
    ON t0.EquivalenciaFR = t4.Referencia COLLATE SQL_Latin1_General_CP1_CI_AS
GROUP BY t0.CodigoGrupo, t0.CodigoArticulo, t0.GrupoArticulo, t0.Articulo



SELECT t1.Restaurante, t0.CodigoGrupo, t0.CodigoArticulo, t0.GrupoArticulo, t0.Articulo, t1.Cantidad
FROM [172.16.17.250].GERENCIAL.dbo.Peru_ArticulosKardex t0
LEFT JOIN CONSOLIDADO_KARDEX.dbo.InventarioMes t1 
    ON t0.EquivalenciaFR = t1.Referencia COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE t1.Restaurante = 'PURUCHUCO' AND t1.Fecha = '2025-12-31'
GROUP BY t1.Restaurante, t0.CodigoGrupo, t0.CodigoArticulo, t0.GrupoArticulo, t0.Articulo, t1.Cantidad


SELECT t0.CodigoGrupo, t0.CodigoArticulo, t0.GrupoArticulo, t0.Articulo,
    ISNULL([JOCKEY], 0) AS Jockey,
    ISNULL([PARDO], 0) AS Pardo,
    ISNULL([ROSEDAL], 0) AS Rosedal,
    ISNULL([PURUCHUCO], 0) AS Puruchuco
FROM [172.16.17.250].GERENCIAL.dbo.Peru_ArticulosKardex t0
LEFT JOIN ( 
    SELECT *
    FROM CONSOLIDADO_KARDEX.dbo.InventarioMes
    PIVOT (
        SUM(Cantidad)
        FOR Restaurante IN ([JOCKEY],[PARDO],[ROSEDAL],[PURUCHUCO])
    ) p
) x
    ON x.Referencia = t0.EquivalenciaFR COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE x.Fecha = '2025-12-31';


--================================
-- Inventario Mes.sql
--================================
WITH Datos AS (
    SELECT Restaurante, Referencia, Cantidad, Fecha
    FROM CONSOLIDADO_KARDEX.dbo.InventarioMes
)
SELECT t0.CodigoGrupo, t0.CodigoArticulo, t0.GrupoArticulo, t0.Articulo,
    ISNULL([JOCKEY], 0) AS Jockey, ISNULL([PARDO], 0) AS Pardo, ISNULL([ROSEDAL], 0) AS Rosedal, ISNULL([PURUCHUCO], 0) AS Puruchuco,
    ISNULL([CANADA], 0) AS Canada, ISNULL([P&A], 0) AS [P&A], ISNULL([PN], 0) AS PN, ISNULL([MDS], 0) AS MDS, ISNULL([CC], 0) AS CC,
    ISNULL([SALAVERRY], 0) AS Salaverry, ISNULL([FONTANA], 0) AS Fontana, ISNULL([AREQUIPA], 0) AS Arequipa, ISNULL([MINKA], 0) AS Minka,
    ISNULL([BENAVIDES], 0) AS Benavides, ISNULL([CHILCLAYO], 0) AS Chilclayo, ISNULL([SJL], 0) AS SJL
FROM [172.16.17.250].GERENCIAL.dbo.Peru_ArticulosKardex t0
LEFT JOIN ( 
    SELECT *
    FROM Datos
    PIVOT (
        SUM(Cantidad)
        FOR Restaurante IN ([JOCKEY],[PARDO],[ROSEDAL],[PURUCHUCO],[CANADA],[P&A],[PN],[MDS],[CC],[SALAVERRY],[FONTANA],[AREQUIPA],[MINKA],[BENAVIDES],[CHILCLAYO],[SJL])
    ) p
) x
    ON x.Referencia = t0.EquivalenciaFR COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE x.Fecha = '2026-01-31'
ORDER BY t0.Orden;