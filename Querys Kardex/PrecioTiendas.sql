
WITH Datos AS
(
    SELECT 'Jockey' AS Sucursal, Referencia, AVG(CostProm) AS CostProm 
    FROM PERU_Frontrest.dbo.vw_JOCKEY_Costo
    GROUP BY Referencia
    
    UNION ALL
    SELECT 'Pardo' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_PARDO_Costo
    GROUP BY Referencia

    UNION ALL
    SELECT 'Rosedal' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_ROSEDAL_Costo
    GROUP BY Referencia

    UNION ALL
    SELECT 'Puruchuco' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Costo
    GROUP BY Referencia

    UNION ALL 
    SELECT 'Canada' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_CANADA_Costo
    GROUP BY Referencia

    UNION ALL
    SELECT 'P&A' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Costo
    GROUP BY Referencia

    UNION ALL
    SELECT 'PN' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Costo
    GROUP BY Referencia

    UNION ALL
    SELECT 'MDS' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.sw_MALLSUR_Costo
    GROUP BY Referencia

    UNION ALL
    SELECT 'CC' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Costo
    GROUP BY Referencia

    UNION ALL
    SELECT 'Salaverry' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_SALAVERRY_Costo
    GROUP BY Referencia
    
    UNION ALL
    SELECT 'Fontana' AS Sucursal, Referencia, AVG(CostProm) AS CostProm FROM PERU_Frontrest.dbo.vw_FONTANA_Costo
    GROUP BY Referencia
    
    UNION ALL
    SELECT 'Arequipa' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_AREQUIPA_Costo
    GROUP BY Referencia
    
    UNION ALL 
    SELECT 'Minka' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_MINKA_Costo
    GROUP BY Referencia
    
    UNION ALL
    SELECT 'Benavides' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_BENAVIDES_Costo
    GROUP BY Referencia
    
    UNION ALL
    SELECT 'Chilclayo' AS Sucursal, Referencia, AVG(CostProm) AS CostProm  FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Costo
    GROUP BY Referencia
    
    UNION ALL 
    SELECT 'SJL' AS Sucursal, Referencia, AVG(CostProm) AS CostProm FROM PERU_Frontrest.dbo.vw_SJL_Costo
    GROUP BY Referencia
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
FROM GERENCIAL.dbo.Peru_ArticulosKardex t0
LEFT JOIN (
    SELECT *
    FROM Datos
    PIVOT(
        MAX(CostProm)
        FOR Sucursal IN (
            [Jockey], [Pardo], [Rosedal], [Puruchuco], [Canada], [P&A],
            [PN], [MDS], [CC], [Salaverry], [Fontana], [Arequipa], [Minka],
            [Benavides], [Chilclayo], [SJL]
        )
    ) p
) x
    ON x.Referencia = t0.EquivalenciaFR
ORDER BY t0.Orden;