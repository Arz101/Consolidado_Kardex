USE CONSOLIDADO_KARDEX
GO

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

        -- CANADA
        BEGIN TRY
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
            FROM PERU_Frontrest.dbo.vw_CANADA_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en CANADA: ' + ERROR_MESSAGE()
        END CATCH

        -- P&A
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'P&A', *
            FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en P&A: ' + ERROR_MESSAGE()
        END CATCH

        -- PLAZA NORTE
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'PLAZA NORTE', *
            FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en PLAZA NORTE: ' + ERROR_MESSAGE()
        END CATCH

        -- MDS
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'MDS', *
            FROM PERU_Frontrest.dbo.sw_MALLSUR_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en MDS: ' + ERROR_MESSAGE()
        END CATCH

        -- C. CIVICO
        /*BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'C. CIVICO', *
            FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH*/
        --    PRINT 'Error en C. CIVICO: ' + ERROR_MESSAGE()
        --END CATCH

        -- SALAVERRY
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'SALAVERRY', *
            FROM PERU_Frontrest.dbo.vw_SALAVERRY_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en SALAVERRY: ' + ERROR_MESSAGE()
        END CATCH

        -- FONTANA
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'FONTANA', *
            FROM PERU_Frontrest.dbo.vw_FONTANA_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en FONTANA: ' + ERROR_MESSAGE()
        END CATCH

        -- AREQUIPA
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'AREQUIPA', *
            FROM PERU_Frontrest.dbo.vw_AREQUIPA_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en AREQUIPA: ' + ERROR_MESSAGE()
        END CATCH

        -- MINKA
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'MINKA', *
            FROM PERU_Frontrest.dbo.vw_MINKA_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en MINKA: ' + ERROR_MESSAGE()
        END CATCH

        -- BENAVIDES
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'BENAVIDES', *
            FROM PERU_Frontrest.dbo.vw_BENAVIDES_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en BENAVIDES: ' + ERROR_MESSAGE()
        END CATCH

        -- CHILCLAYO
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'CHILCLAYO', *
            FROM PERU_Frontrest.dbo.vw_CHILCLAYO_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en CHILCLAYO: ' + ERROR_MESSAGE()
        END CATCH

        -- JOCKEY
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'JOCKEY', *
            FROM PERU_Frontrest.dbo.vw_JOCKEY_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en JOCKEY: ' + ERROR_MESSAGE()
        END CATCH

        -- SJL
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'SJL', *
            FROM PERU_Frontrest.dbo.vw_SJL_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en SJL: ' + ERROR_MESSAGE()
        END CATCH

        -- PARDO
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'PARDO', *
            FROM PERU_Frontrest.dbo.vw_PARDO_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en PARDO: ' + ERROR_MESSAGE()
        END CATCH

        -- ROSEDAL
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'ROSEDAL', *
            FROM PERU_Frontrest.dbo.vw_ROSEDAL_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en ROSEDAL: ' + ERROR_MESSAGE()
        END CATCH

        -- PURUCHUCO
        BEGIN TRY
            INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                (Restaurante,
                    GrupoProductoFR,
                    CodigoProductoFR,
                    ProductoFR,
                    Cantidad,
                    Total,
                    Fecha,
                    FechaAnulacion)
            SELECT 'PURUCHUCO', *
            FROM PERU_Frontrest.dbo.vw_PURUCHUCO_VentaPorProducto
            WHERE Fecha = @FechaHoy
        END TRY
        BEGIN CATCH
            PRINT 'Error en PURUCHUCO: ' + ERROR_MESSAGE()
        END CATCH

        COMMIT TRANSACTION;

        PRINT '';
        PRINT '============================================';
        PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        PRINT '============================================';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH
END
