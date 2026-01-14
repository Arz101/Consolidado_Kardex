-- PRECIOTIENDAS ORIGINAL QUERY



SELECT * FROM CONSOLIDADO_KARDEX.dbo.PrecioTiendas

SELECT  
    t0.CodigoArticulo,
    t0.CodigoGrupo,
    t0.GrupoArticulo,
    t0.Articulo,

    DT0.CostProm  AS Jockey,
    DT2.CostProm  AS Pardo,
    DT3.CostProm  AS Rosedal,
    DT4.CostProm  AS Puruchuco,
    DT5.CostProm  AS Canada,
    DT6.CostProm  AS [P&A],
    DT7.CostProm  AS PN,
    DT8.CostProm  AS MDS,
    DT9.CostProm  AS CC,
    DT10.CostProm AS Salaverry,
    DT11.CostProm AS Fontana,
    DT12.CostProm AS Arequipa,
    DT14.CostProm AS Minka,
    DT16.CostProm AS Benavides,
    DT17.CostProm AS Chilclayo,
    DT19.CostProm AS SJL
FROM GERENCIAL.dbo.Peru_ArticulosKardex t0

-- Jockey
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_JOCKEY_Costo
) DT0 ON DT0.Referencia = t0.EquivalenciaFR

-- Pardo
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_PARDO_Costo
) DT2 ON DT2.Referencia = t0.EquivalenciaFR

-- Rosedal
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_ROSEDAL_Costo
) DT3 ON DT3.Referencia = t0.EquivalenciaFR

-- Puruchuco
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Costo
) DT4 ON DT4.Referencia = t0.EquivalenciaFR

-- Canada
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_CANADA_Costo
) DT5 ON DT5.Referencia = t0.EquivalenciaFR

-- P&A
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_Costo
) DT6 ON DT6.Referencia = t0.EquivalenciaFR

-- Plaza Norte
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_Costo
) DT7 ON DT7.Referencia = t0.EquivalenciaFR

-- Mall del Sur
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.sw_MALLSUR_Costo
) DT8 ON DT8.Referencia = t0.EquivalenciaFR

-- Centro Cívico
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_Costo
) DT9 ON DT9.Referencia = t0.EquivalenciaFR

-- Salaverry
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_SALAVERRY_Costo
) DT10 ON DT10.Referencia = t0.EquivalenciaFR

-- La Fontana
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_FONTANA_Costo
) DT11 ON DT11.Referencia = t0.EquivalenciaFR

-- Arequipa
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_AREQUIPA_Costo
) DT12 ON DT12.Referencia = t0.EquivalenciaFR

-- Minka
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_MINKA_Costo
) DT14 ON DT14.Referencia = t0.EquivalenciaFR

-- Benavides
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_BENAVIDES_Costo
) DT16 ON DT16.Referencia = t0.EquivalenciaFR

-- Chilclayo
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Costo
) DT17 ON DT17.Referencia = t0.EquivalenciaFR

-- SJL
LEFT JOIN (
    SELECT Referencia, CostProm
    FROM PERU_Frontrest.dbo.vw_SJL_Costo
) DT19 ON DT19.Referencia = t0.EquivalenciaFR

ORDER BY t0.Orden;
