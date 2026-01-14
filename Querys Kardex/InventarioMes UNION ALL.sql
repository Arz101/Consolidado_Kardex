
CREATE TABLE CONSOLIDADO_KARDEX.dbo.InventarioMes(
    Id INT IDENTITY(1,1) PRIMARY KEY, 
    Restaurante VARCHAR(50),
    Referencia VARCHAR(50),
    Cantidad FLOAT,
    Fecha DATE
);

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
INSERT INTO [CONSOLIDADO_KARDEX].[dbo].InventarioMes ([Restaurante],[Referencia],[Cantidad],[Fecha])
SELECT *
FROM Datos
WHERE Fecha = '2025-12-31'


SELECT
    k.CodigoGrupo,
    k.CodigoArticulo,
    k.GrupoArticulo,
    k.Articulo,

    ISNULL([JOCKEY], 0)     AS Jockey,
    ISNULL([PARDO], 0)      AS Pardo,
    ISNULL([ROSEDAL], 0)    AS Rosedal,
    ISNULL([PURUCHUCO], 0)  AS Puruchuco

FROM GERENCIAL.dbo.Peru_ArticulosKardex k

LEFT JOIN (
    SELECT *
    FROM Datos
    PIVOT (
        SUM(Cantidad)
        FOR Restaurante IN ([JOCKEY],[PARDO],[ROSEDAL],[PURUCHUCO])
    ) p
) x
    ON x.Referencia = k.EquivalenciaFR COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE x.Fecha = '2025-12-31';