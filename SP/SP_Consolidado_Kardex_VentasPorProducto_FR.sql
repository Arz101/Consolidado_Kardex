

CREATE OR ALTER PROCEDURE dbo.SP_FR_VentasPorProducto 
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE);

    BEGIN TRY
        BEGIN TRAN;

		DECLARE @FilasInsertadas INT;
		DECLARE @FilasEliminadas INT;
        
		DELETE 
        FROM CONSOLIDADO_KARDEX.dbo.VentasPorProducto
        WHERE Fecha = @FechaHoy;

		SELECT @FilasEliminadas = @@ROWCOUNT;

        INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
               (Restaurante,
                GrupoProductoFR,
                CodigoProductoFR,
                ProductoFR,
                Cantidad,
                Total,
                Fecha,
                FechaAnulacion)

        SELECT 'CANADA', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'P&A', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'PLAZA NORTE', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'MDS', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'C. CIVICO', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'SALAVERRY', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'FONTANA', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'AREQUIPA', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'MINKA', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'BENAVIDES', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'CHILCLAYO', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'JOCKEY', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'SJL', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'PARDO', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'ROSEDAL', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_ROSEDAL_VentaPorProducto
        WHERE Fecha = @FechaHoy

        UNION ALL
        SELECT 'PURUCHUCO', *
        FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PURUCHUCO_VentaPorProducto
        WHERE Fecha = @FechaHoy;

		SET @FilasInsertadas = @@ROWCOUNT;
		PRINT ' ------> Filas Insertadas: ' + CAST(@FilasInsertadas - @FilasEliminadas AS VARCHAR(20));

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH
END
