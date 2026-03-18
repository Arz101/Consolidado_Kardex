SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER    PROCEDURE [dbo].[SP_CONSOLIDADO_KARDEX]
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13
-- Description:	Consolidado Kardex Peru
-- Update date: 2026-03-17
-- =============================================
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM sys.dm_exec_sessions s
        JOIN sys.dm_exec_requests r ON s.session_id = r.session_id
        CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t
        WHERE t.text LIKE '%SP_CONSOLIDADO_KARDEX%'
          AND s.session_id <> @@SPID
    )
    BEGIN
        RAISERROR('SP_CONSOLIDADO_KARDEX ya está en ejecución. Cancelando.', 0, 1) WITH NOWAIT;
        RETURN;
    END;

	DECLARE @IdLog INT;
        DECLARE @Inicio DATETIME2 = SYSDATETIME();
        DECLARE @Errores INT = 0;
        DECLARE @DetalleErrores NVARCHAR(MAX) = N'';
        DECLARE @Orden INT;
        DECLARE @TotalPasos INT;
        DECLARE @NombreSP SYSNAME;
        DECLARE @PasoInicio DATETIME2;
        DECLARE @MensajePaso NVARCHAR(4000);
        DECLARE @Sql NVARCHAR(MAX);
        DECLARE @ErrorPaso NVARCHAR(4000);
        DECLARE @ErrorGeneral NVARCHAR(4000);

        DECLARE @Pasos TABLE (
                Orden INT PRIMARY KEY,
                NombreSP SYSNAME,
                MensajeInicio NVARCHAR(200)
        );

        INSERT INTO @Pasos (Orden, NombreSP, MensajeInicio)
        VALUES
                (1, 'SP_Compras_Detalles_FR', 'Iniciando SP_Compras_Detalles_FR'),
                (2, 'SP_EntradasSinClasificar_FR', 'Iniciando SP_EntradasSinClasificar_FR'),
                (3, 'SP_FR_Compras', 'Iniciando SP_FR_Compras'),
                (4, 'SP_FR_VentasPorProducto', 'Iniciando SP_FR_VentasPorProducto'),
                (5, 'SP_InventarioMes_FR', 'Iniciando SP_InventarioMes_FR'),
                (6, 'SP_PrecioTiendasCompras_FR', 'Iniciando SP_PrecioTiendasCompras_FR'),
                (7, 'SP_SalidasSinClasificar_FR', 'Iniciando SP_SalidasSinClasificar_FR'),
                (8, 'SP_Traslados_Salidas_FR', 'Iniciando SP_Traslados_Salidas_FR'),
                (9, 'SP_TrasladosEntrastes_FR', 'Iniciando SP_TrasladosEntrastes_FR'),
                (10, 'SP_PrecioTiendas', 'Iniciando SP_PrecioTiendas');

        SET @TotalPasos = (SELECT COUNT(*) FROM @Pasos);

	BEGIN TRY
		INSERT INTO CONSOLIDADO_KARDEX.dbo.Logs (NombreSP,  Estado, FechaInicio)
		VALUES ('SP_CONSOLIDADO_KARDEX', 'EN PROCESO', @Inicio)
		
		SET @IdLog = SCOPE_IDENTITY();

                SET @Orden = 1;
                WHILE @Orden <= @TotalPasos
                BEGIN
                        SELECT
                                @NombreSP = NombreSP,
                                @MensajePaso = MensajeInicio
                        FROM @Pasos
                        WHERE Orden = @Orden;

                        RAISERROR(@MensajePaso, 0, 1) WITH NOWAIT;
                        RAISERROR(' ', 0, 1) WITH NOWAIT;
                        SET @PasoInicio = SYSDATETIME();

                        BEGIN TRY
                                SET @Sql = N'EXEC dbo.' + QUOTENAME(@NombreSP) + N';';
                                EXEC sys.sp_executesql @Sql;

                                SET @MensajePaso = NULL;
                                SELECT TOP (1)
                                        @MensajePaso = MensajeError
                                FROM CONSOLIDADO_KARDEX.dbo.Logs
                                WHERE NombreSP = @NombreSP
                                  AND FechaInicio >= @PasoInicio
                                ORDER BY id DESC;

                                RAISERROR(' ', 0, 1) WITH NOWAIT;
                                IF @MensajePaso IS NULL OR LTRIM(RTRIM(@MensajePaso)) = ''
                                BEGIN
                                        RAISERROR('***** Finalizó %s (%d/%d) *****', 0, 1, @NombreSP, @Orden, @TotalPasos) WITH NOWAIT;
                                END
                                ELSE
                                BEGIN
                                        SET @Errores += 1;
                                        SET @DetalleErrores += @NombreSP + ': ' + @MensajePaso + '; ';
                                        RAISERROR('***** Finalizó %s (%d/%d) con carga parcial *****', 0, 1, @NombreSP, @Orden, @TotalPasos) WITH NOWAIT;
                                END
                        END TRY
                        BEGIN CATCH
                                SET @ErrorPaso = ERROR_MESSAGE();
                                SET @Errores += 1;
                                SET @DetalleErrores += @NombreSP + ': ' + @ErrorPaso + '; ';
                                RAISERROR('***** Error en %s (%d/%d): %s *****', 0, 1, @NombreSP, @Orden, @TotalPasos, @ErrorPaso) WITH NOWAIT;
                        END CATCH;

                        SET @Orden += 1;
                END

        RAISERROR(' ',0, 1) WITH NOWAIT;
        RAISERROR('Proceso completo', 0, 1) WITH NOWAIT;

		UPDATE CONSOLIDADO_KARDEX.dbo.Logs
		SET
			FechaFin = SYSDATETIME(),
                        Estado = 'OK',
                        MensajeError = CASE
                                WHEN @Errores > 0 THEN LEFT('Carga parcial. Total errores: ' + CAST(@Errores AS VARCHAR(20)) + '. ' + @DetalleErrores, 4000)
                                ELSE NULL
                        END,
                        NumeroError = NULL,
                        LineaError = NULL
		WHERE id = @IdLog 

	END TRY

	BEGIN CATCH
                SET @ErrorGeneral = ERROR_MESSAGE();
		UPDATE CONSOLIDADO_KARDEX.dbo.Logs
		SET
			FechaFin = SYSDATETIME(),
			Estado = 'Error',
                        MensajeError = @ErrorGeneral,
			NumeroError = ERROR_NUMBER(),
			LineaError = ERROR_LINE()
                WHERE id = @IdLog;

                THROW;
    END CATCH
END

GO
