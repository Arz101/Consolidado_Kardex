--- Query PreciosTiendasCompras Promedio por Sucursal Diciembre 2025 ---


--WITH Precios AS (
CREATE TABLE CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (
    Sucursal NVARCHAR(50),
    Referencia NVARCHAR(50),
    CostProm DECIMAL(18,4),
    Fecha DATE
);

CREATE TABLE CONSOLIDADO_KARDEX.dbo.PrecioTiendaComprasPromedio (
    Sucursal NVARCHAR(50),
    CodigoArticulo NVARCHAR(50),
    CodigoGrupo NVARCHAR(50),
    GrupoArticulo NVARCHAR(255),
    Articulo NVARCHAR(255),
    CostProm DECIMAL(18,4),
    Fecha DATE
);

TRUNCATE TABLE  CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras

SELECT * FROM CONSOLIDADO_KARDEX.dbo.PrecioTiendas

INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
    SELECT 'JOCKEY' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE) AS Fecha
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_Jockey_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'SJL' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_SJL_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN


    UNION ALL
    SELECT 'PARDO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_PARDO_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'ROSEDAL' AS Sucursal , REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_ROSEDAL_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'PURUCHUCO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_PURUCHUCO_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'CANADA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_CANADA_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'PYA' AS Sucursal , REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_PYA_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'CHILCLAYO' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_CHILCLAYO_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'MDS' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_MDS_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'CC' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_CCIVICO_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'SALAVERRY' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_SALAVERRY_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'FONTANA' AS Sucursal , REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_FONTANA_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'AREQUIPA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_AREQUIPA_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

    UNION ALL
    SELECT 'MINKA' AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
    FROM [172.16.17.250].[PERU_Frontrest].dbo.vw_MINKA_PrecioCompras
    GROUP BY REFERENCIA, FECHAALBARAN

TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.PrecioTiendaComprasPromedio;

INSERT INTO CONSOLIDADO_KARDEX.dbo.PrecioTiendaComprasPromedio (Sucursal, CodigoArticulo, CodigoGrupo, GrupoArticulo, Articulo, CostProm, Fecha)
SELECT
    t1.Sucursal,
    t0.CodigoArticulo,
    t0.CodigoGrupo,
    t0.GrupoArticulo,
    t0.Articulo,
    t1.CostProm,
    t1.Fecha
FROM [172.16.17.250].GERENCIAL.dbo.Peru_ArticulosKardex t0
JOIN CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras t1
    ON t0.EquivalenciaFR = t1.Referencia COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE t1.Fecha >= '2026-01-01'
    AND t1.Fecha <  '2026-12-31'
ORDER BY t0.Articulo;


SELECT * FROM CONSOLIDADO_KARDEX.dbo.PrecioTiendaComprasPromedio
WHERE Fecha >= '2026-01-01'
ORDER BY Sucursal, Articulo, Fecha;

WITH Datos AS (
    SELECT
        Referencia,
        Sucursal,
        CostProm
    FROM CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras
    WHERE Fecha >= '2026-01-01'
    --GROUP BY Referencia, Sucursal,
)
SELECT      
    t0.CodigoArticulo,
    t0.CodigoGrupo,
    t0.GrupoArticulo,
    t0.Articulo,
    ISNULL([JOCKEY], 0) AS Jockey, ISNULL([PARDO], 0) AS Pardo, ISNULL([ROSEDAL], 0) AS Rosedal, ISNULL([PURUCHUCO], 0) AS Puruchuco,
    ISNULL([CANADA], 0) AS Canada, ISNULL([P&A], 0) AS [P&A], ISNULL([PN], 0) AS PN, ISNULL([MDS], 0) AS MDS, ISNULL([CC], 0) AS CC,
    ISNULL([SALAVERRY], 0) AS Salaverry, ISNULL([FONTANA], 0) AS Fontana, ISNULL([AREQUIPA], 0) AS Arequipa, ISNULL([MINKA], 0) AS Minka,
    ISNULL([BENAVIDES], 0) AS Benavides, ISNULL([CHILCLAYO], 0) AS Chilclayo, ISNULL([SJL], 0) AS SJL
FROM [172.16.17.250].GERENCIAL.dbo.Peru_ArticulosKardex t0
LEFT JOIN(
    SELECT *
    FROM Datos
    PIVOT (
        MAX(CostProm)
        FOR Sucursal IN ([JOCKEY],[PARDO],[ROSEDAL],[PURUCHUCO],[CANADA],[P&A],[PN],[MDS],[CC],[SALAVERRY],[FONTANA],[AREQUIPA],[MINKA],[BENAVIDES],[CHILCLAYO],[SJL])
    ) p
) x
    ON x.Referencia = t0.EquivalenciaFR COLLATE SQL_Latin1_General_CP1_CI_AS
ORDER BY t0.Orden