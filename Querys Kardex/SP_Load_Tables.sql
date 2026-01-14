

CREATE OR ALTER PROCEDURE SP_CONSOLIDADO_KARDEX
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        RAISERROR('Iniciando SP_Compras_Detalles_FR', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_Compras_Detalles_FR;
        RAISERROR('***** Finalizó SP_Compras_Detalles_FR (1/9)*****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_EntradasSinClasificar_FR', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_EntradasSinClasificar_FR;
        RAISERROR('***** Finalizó SP_EntradasSinClasificar_FR (2/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_FR_Compras', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_FR_Compras;
        RAISERROR('***** Finalizó SP_FR_Compras (3/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_FR_VentasPorProducto', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_FR_VentasPorProducto;
        RAISERROR('***** Finalizó SP_FR_VentasPorProducto (4/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_InventarioMes_FR;
        RAISERROR('***** Finalizó SP_InventarioMes_FR (5/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_PrecioTiendasCompras_FR', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_PrecioTiendasCompras_FR;
        RAISERROR('***** Finalizó SP_PrecioTiendasCompras_FR (6/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_SalidasSinClasificar_FR', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_SalidasSinClasificar_FR;
        RAISERROR('***** Finalizó SP_SalidasSinClasificar_FR (7/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_Traslados_Salidas_FR', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_Traslados_Salidas_FR;
        RAISERROR('***** Finalizó SP_Traslados_Salidas_FR (8/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_TrasladosEntrastes_FR', 0, 1) WITH NOWAIT;
        EXEC dbo.SP_TrasladosEntrastes_FR;
        RAISERROR('***** Finalizó SP_TrasladosEntrastes_FR (9/9) *****', 0, 1) WITH NOWAIT;

        RAISERROR('Proceso completo', 0, 1) WITH NOWAIT;

    END TRY
    BEGIN CATCH
        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@msg, 16, 1) WITH NOWAIT;
        THROW;
    END CATCH
END

EXEC SP_CONSOLIDADO_KARDEX