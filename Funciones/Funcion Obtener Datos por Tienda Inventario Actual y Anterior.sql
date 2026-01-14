SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   FUNCTION  [dbo].[vw_InventarioMesAnterior_PQ] (
    @FechaInicio DATE
)
--=============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-14
-- Description:	Consolidado Kardex Peru
-- =============================================
RETURNS TABLE
AS
RETURN (
    WITH Datos AS (
        SELECT Restaurante, Referencia, Cantidad, Fecha
        FROM CONSOLIDADO_KARDEX.dbo.InventarioMes
    )
    SELECT t0.CodigoGrupo, t0.CodigoArticulo, t0.GrupoArticulo, t0.Articulo,
        ISNULL([JOCKEY], 0) AS Jockey, ISNULL([PARDO], 0) AS Pardo, ISNULL([ROSEDAL], 0) AS Rosedal, ISNULL([PURUCHUCO], 0) AS Puruchuco,
        ISNULL([CANADA], 0) AS Canada, ISNULL([P&A], 0) AS [P&A], ISNULL([PN], 0) AS PN, ISNULL([MDS], 0) AS MDS, ISNULL([CC], 0) AS CC,
        ISNULL([SALAVERRY], 0) AS Salaverry, ISNULL([FONTANA], 0) AS Fontana, ISNULL([AREQUIPA], 0) AS Arequipa, ISNULL([MINKA], 0) AS Minka,
        ISNULL([BENAVIDES], 0) AS Benavides, ISNULL([CHILCLAYO], 0) AS Chilclayo, ISNULL([SJL], 0) AS SJL
    FROM GERENCIAL.dbo.Peru_ArticulosKardex t0
    LEFT JOIN ( 
        SELECT *
        FROM Datos
        PIVOT (
                SUM(Cantidad)
                FOR Restaurante IN ([JOCKEY],[PARDO],[ROSEDAL],[PURUCHUCO],[CANADA],[P&A],[PN],[MDS],[CC],[SALAVERRY],[FONTANA],[AREQUIPA],[MINKA],[BENAVIDES],[CHILCLAYO],[SJL])
            ) p
    ) x
    ON x.Referencia = t0.EquivalenciaFR COLLATE SQL_Latin1_General_CP1_CI_AS
    WHERE x.Fecha = DATEADD(DAY, -1, @FechaInicio)
);
GO
