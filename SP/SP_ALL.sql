SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_ALL]

    @fecha1 DATE,
    @fecha2 DATE
AS
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
-- Description:	Consolidado Kardex Peru
-- Update date: 2026-03-17
-- =============================================
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT OFF;

    DECLARE @Errores INT = 0;
    DECLARE @DetalleErrores NVARCHAR(MAX) = N'';

    DECLARE @Sucursales TABLE (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Nombre NVARCHAR(100),
        Vista SYSNAME,
        EtiquetaError NVARCHAR(100)
    );

    DECLARE @IdSucursal INT;
    DECLARE @Nombre NVARCHAR(100);
    DECLARE @Vista SYSNAME;
    DECLARE @EtiquetaError NVARCHAR(100);
    DECLARE @Sql NVARCHAR(MAX);

    BEGIN TRY
        RAISERROR('Iniciando SP_Compras_Detalle', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.Compras_Detalle;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('CANADA', 'vw_CANADA_Compras', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_Compras', 'P&A'),
            ('PLAZA NORTE', 'vw_PLAZA_NORTE_Compras', 'PZ'),
            ('MDS', 'sw_MALLSUR_Compras', 'MDS'),
            ('C. CIVICO', 'vw_CENTROCIVICO_Compras', 'C.CIVICO'),
            ('SALAVERRY', 'vw_SALAVERRY_Compras', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_Compras', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_Compras', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_Compras', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_Compras', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_Compras', 'CHICLAYO'),
            ('JOCKEY', 'vw_JOCKEY__Compras', 'JOCKEY'),
            ('SJL', 'vw_SJL_Compras', 'SJL'),
            ('PARDO', 'vw_PARDO_Compras', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_Compras', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_Compras', 'PURUCHUCO');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
                        ([Restaurante],[Fecha],[Factura],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR],[Unidades]
                        ,[Cantidad],[PrecioCompras],[SubTotal],[IV],[Neto],[CODPROVEEDOR])
                    SELECT @Nombre AS Restaurante, *
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
                    WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                RAISERROR('           * %s NO DISPONIBLE     SP_Compras_Detalles_FR', 0, 1, @EtiquetaError) WITH NOWAIT;
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_Compras_Detalle/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_Compras_Detalle Finalizado (1/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_Compras', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.Compras;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('CANADA', 'vw_CANADA_Compras', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_Compras', 'P&A'),
            ('PLAZA NORTE', 'vw_PLAZA_NORTE_Compras', 'PZ'),
            ('MDS', 'sw_MALLSUR_Compras', 'MDS'),
            ('C. CIVICO', 'vw_CENTROCIVICO_Compras', 'C.CIVICO'),
            ('SALAVERRY', 'vw_SALAVERRY_Compras', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_Compras', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_Compras', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_Compras', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_Compras', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_Compras', 'CHICLAYO'),
            ('JOCKEY', 'vw_JOCKEY__Compras', 'JOCKEY'),
            ('SJL', 'vw_SJL_Compras', 'SJL'),
            ('PARDO', 'vw_PARDO_Compras', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_Compras', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_Compras', 'PURUCHUCO');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras(Restaurante,Fecha,Factura,[No.Entrada],Proveedor,SubTotal,IV,Neto)
                    SELECT @Nombre AS Restaurante, t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor,
                        SUM(t0.SubTotal), SUM(t0.IV), SUM(t0.Neto)
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
                    WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2
                    GROUP BY t0.Fecha, t0.Factura, t0.[No.Entrada], t0.Proveedor';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                RAISERROR('           * %s NO DISPONIBLE     SP_Compras', 0, 1, @EtiquetaError) WITH NOWAIT;
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_Compras/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_Compras Finalizado (2/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_EntradaSinClasifcar', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.EntradaSinClasificar;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('CANADA', 'vw_CANADA_EntradasSinCalificar', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_EntradasSinCalificar', 'P&A'),
            ('PZ', 'vw_PLAZA_NORTE_EntradasSinCalificar', 'PZ'),
            ('MDS', 'sw_MALLSUR_EntradasSinCalificar', 'MDS'),
            ('C. CIVICO', 'vw_CENTROCIVICO_EntradasSinCalificar', 'C.CIVICO'),
            ('SALAVERRY', 'vw_SALAVERRY_EntradasSinCalificar', 'SALVAERRY'),
            ('FONTANA', 'vw_FONTANA_EntradasSinCalificar', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_EntradasSinCalificar', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_EntradasSinCalificar', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_EntradasSinCalificar', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_EntradasSinCalificar', 'CHICLAYO'),
            ('JOCKEY', 'vw_JOCKEY_EntradasSinCalificar', 'JOCKEY'),
            ('SJL', 'vw_SJL_EntradasSinCalificar', 'SJL'),
            ('PARDO', 'vw_PARDO_EntradasSinCalificar', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_EntradasSinCalificar', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_EntradasSinCalificar', 'PURUCHUCO');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.EntradaSinClasificar
                        ([Restaurante],[Fecha],[Origen],[Destino],[CodigoArtculoFR],[ArticuloFR],[Unidades]
                        ,[Cantidad],[CostoProm],[Total],[Precio])
                    SELECT @Nombre AS Restaurante, *
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
                    WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                RAISERROR('           * %s NO DISPONIBLE     SP_EntradasSinClasificar_FR', 0, 1, @EtiquetaError) WITH NOWAIT;
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_EntradaSinClasificar/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_EntradaSinClasifcar Finalizado (3/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_InventarioMes', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.InventarioMes;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('JOCKEY', 'vw_JOCKEY_Cantidad', 'JOCKEY'),
            ('PARDO', 'vw_PARDO_Cantidad', 'PARDO'),
            ('PURUCHUCO', 'vw_PURUCHUCO_Cantidad', 'PURUCHUCO'),
            ('CANADA', 'vw_CANADA_Cantidad', 'CANADA'),
            ('P&A', 'vw_PYA_Cantidad', 'P&A'),
            ('PLAZA NORTE', 'vw_PLAZANORTE_Cantidad', 'PZ'),
            ('MDS', 'vw_MDS_Cantidad', 'MDS'),
            ('C. CIVICO', 'vw_CCIVICO_Cantidad', 'C. CIVICO'),
            ('SALAVERRY', 'vw_Salaverry_Cantidad', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_Cantidad', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_Cantidad', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_Cantidad', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_Cantidad', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_Cantidad', 'CHICLAYO'),
            ('SJL', 'vw_SJL_Cantidad', 'SJL');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.InventarioMes ([Restaurante],[Referencia],[Cantidad],[Fecha])
                    SELECT @Nombre AS Restaurante, Referencia, Cantidad, Fecha
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
                    WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                RAISERROR('           * %s NO DISPONIBLE     SP_InventarioMes_FR', 0, 1, @EtiquetaError) WITH NOWAIT;
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_InventarioMes/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_InventarioMes Finalizado (4/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_PrecioTiendas', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.PrecioTiendas;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('Jockey', 'vw_JOCKEY_Costo', 'JOCKEY'),
            ('Pardo', 'vw_PARDO_Costo', 'PARDO'),
            ('Rosedal', 'vw_ROSEDAL_Costo', 'ROSEDAL'),
            ('Puruchuco', 'vw_PURUCHUCO_Costo', 'PURUCHUCO'),
            ('Canada', 'vw_CANADA_Costo', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_Costo', 'P&A'),
            ('PN', 'vw_PLAZA_NORTE_Costo', 'PN'),
            ('MDS', 'sw_MALLSUR_Costo', 'MDS'),
            ('CC', 'vw_CENTROCIVICO_Costo', 'CC'),
            ('Salaverry', 'vw_SALAVERRY_Costo', 'SALAVERRY'),
            ('Fontana', 'vw_FONTANA_Costo', 'FONTANA'),
            ('Arequipa', 'vw_AREQUIPA_Costo', 'AREQUIPA'),
            ('Minka', 'vw_MINKA_Costo', 'MINKA'),
            ('Benavides', 'vw_BENAVIDES_Costo', 'BENAVIDES'),
            ('Chilclayo', 'vw_CHILCLAYO_Costo', 'CHILCLAYO'),
            ('SJL', 'vw_SJL_Costo', 'SJL');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.PrecioTiendas (Sucursal, Referencia, CostProm, Fecha)
                    SELECT @Nombre AS Sucursal, Referencia, AVG(CostProm) AS CostProm, FechaUltCompra
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N'
                    WHERE FechaUltCompra BETWEEN @fecha1 AND @fecha2
                    GROUP BY Referencia, FechaUltCompra';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                PRINT '           * ' + @EtiquetaError + ' NO DISPONIBLE     SP_PrecioTiendas';
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_PrecioTiendas/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_PrecioTiendas Finalizado (5/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_PreciosTiendasCompras', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('JOCKEY', 'vw_Jockey_PrecioCompras', 'JOCKEY'),
            ('SJL', 'vw_SJL_PrecioCompras', 'SJL'),
            ('PARDO', 'vw_PARDO_PrecioCompras', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_PrecioCompras', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_PrecioCompras', 'PURUCHUCO'),
            ('CANADA', 'vw_CANADA_PrecioCompras', 'CANADA'),
            ('PYA', 'vw_PYA_PrecioCompras', 'PYA'),
            ('CHILCLAYO', 'vw_CHILCLAYO_PrecioCompras', 'CHILCLAYO'),
            ('MDS', 'vw_MDS_PrecioCompras', 'MDS'),
            ('CC', 'vw_CCIVICO_PrecioCompras', 'CC'),
            ('SALAVERRY', 'vw_SALAVERRY_PrecioCompras', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_PrecioCompras', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_PrecioCompras', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_PrecioCompras', 'MINKA');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.PreciosTiendasCompras (Sucursal, Referencia, CostProm, Fecha)
                    SELECT @Nombre AS Sucursal, REFERENCIA, AVG(CostProm), CAST(FECHAALBARAN AS DATE)
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N'
                    WHERE CAST(FECHAALBARAN AS DATE) BETWEEN @fecha1 AND @fecha2
                    GROUP BY REFERENCIA, FECHAALBARAN';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                PRINT 'Error en ' + @EtiquetaError + ': ' + ERROR_MESSAGE();
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_PreciosTiendasCompras/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_PreciosTiendasCompras Finalizado (6/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_TrasladoEntrantes', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.TrasladoEntrantes;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('CANADA', 'vw_CANADA_TrasladosEntradas', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_TrasladosEntradas', 'P&A'),
            ('PLAZA NORTE', 'vw_PLAZA_NORTE_TrasladosEntradas', 'PLAZA NORTE'),
            ('MDS', 'sw_MALLSUR_TrasladosEntradas', 'MDS'),
            ('C. CIVICO', 'vw_CENTROCIVICO_TrasladosEntradas', 'C. CIVICO'),
            ('SALAVERRY', 'vw_SALAVERRY_TrasladosEntradas', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_TrasladosEntradas', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_TrasladosEntradas', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_TrasladosEntradas', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_TrasladosEntradas', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_TrasladosEntradas', 'CHILCLAYO'),
            ('JOCKEY', 'vw_JOCKEY_TrasladosEntradas', 'JOCKEY'),
            ('SJL', 'vw_SJL_TrasladosEntradas', 'SJL'),
            ('PARDO', 'vw_PARDO_TrasladosEntradas', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_TrasladosEntradas', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_TrasladosEntradas', 'PURUCHUCO');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.TrasladoEntrantes
                        ([Restaurante],[Fecha],[No.Entrada],[Proveedor],[CodigoArticuloFR],[ArticuloFR]
                        ,[Unidades],[Cantidad],[Precio],[SubTotal],[IV],[Neto])
                    SELECT @Nombre AS Restaurante, *
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
                    WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                PRINT 'Error en ' + @EtiquetaError + ': ' + ERROR_MESSAGE();
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_TrasladoEntrantes/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_TrasladoEntrantes Finalizado (7/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_TrasladosSalidas', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.TrasladoSalientes;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('CANADA', 'vw_CANADA_TrasladosSalientes', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_TrasladosSalientes', 'P&A'),
            ('PLAZA NORTE', 'vw_PLAZA_NORTE_TrasladosSalientes', 'PLAZA NORTE'),
            ('MDS', 'sw_MALLSUR_TrasladosSalientes', 'MDS'),
            ('C. CIVICO', 'vw_CENTROCIVICO_TrasladosSalientes', 'C. CIVICO'),
            ('SALAVERRY', 'vw_SALAVERRY_TrasladosSalientes', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_TrasladosSalientes', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_TrasladosSalientes', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_TrasladosSalientes', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_TrasladosSalientes', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_TrasladosSalientes', 'CHILCLAYO'),
            ('JOCKEY', 'vw_JOCKEY_TrasladosSalientes', 'JOCKEY'),
            ('SJL', 'vw_SJL_TrasladosSalientes', 'SJL'),
            ('PARDO', 'vw_PARDO_TrasladosSalientes', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_TrasladosSalientes', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_TrasladosSalientes', 'PURUCHUCO');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.TrasladoSalientes
                        ([Restaurante],[Fecha],[No.Entrada],[Destino],[CodigoArticuloFR],[ArticuloFR]
                        ,[Unidades],[Cantidad],[Costo],[CODALMDEST],[CODALMORIG])
                    SELECT @Nombre AS Restaurante, *
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
                    WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                PRINT 'Error en ' + @EtiquetaError + ': ' + ERROR_MESSAGE();
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_TrasladosSalidas/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_TrasladosSalidas Finalizado (8/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_VentasPorProducto', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.VentasPorProducto;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('CANADA', 'vw_CANADA_VentaPorProducto', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_VentaPorProducto', 'P&A'),
            ('PLAZA NORTE', 'vw_PLAZA_NORTE_VentaPorProducto', 'PLAZA NORTE'),
            ('MDS', 'sw_MALLSUR_VentaPorProducto', 'MDS'),
            ('C. CIVICO', 'vw_CENTROCIVICO_VentaPorProducto', 'C. CIVICO'),
            ('SALAVERRY', 'vw_SALAVERRY_VentaPorProducto', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_VentaPorProducto', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_VentaPorProducto', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_VentaPorProducto', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_VentaPorProducto', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_VentaPorProducto', 'CHILCLAYO'),
            ('JOCKEY', 'vw_JOCKEY_VentaPorProducto', 'JOCKEY'),
            ('SJL', 'vw_SJL_VentaPorProducto', 'SJL'),
            ('PARDO', 'vw_PARDO_VentaPorProducto', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_VentaPorProducto', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_VentaPorProducto', 'PURUCHUCO');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.VentasPorProducto
                        (Restaurante,GrupoProductoFR,CodigoProductoFR,ProductoFR,Cantidad,Total,Fecha,FechaAnulacion)
                    SELECT @Nombre AS Restaurante, *
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N'
                    WHERE Fecha BETWEEN @fecha1 AND @fecha2';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                PRINT 'Error en ' + @EtiquetaError + ': ' + ERROR_MESSAGE();
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_VentasPorProducto/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_VentasPorProducto Finalizado (9/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        RAISERROR('Iniciando SP_SalidaSinClasificar', 0, 1) WITH NOWAIT;
        TRUNCATE TABLE CONSOLIDADO_KARDEX.dbo.SalidaSinClasificar;

        DELETE FROM @Sucursales;
        INSERT INTO @Sucursales (Nombre, Vista, EtiquetaError)
        VALUES
            ('CANADA', 'vw_CANADA_SalidasSinClasificar', 'CANADA'),
            ('P&A', 'sw_PARDOYALIAGA_SalidasSinClasificar', 'P&A'),
            ('PLAZA NORTE', 'vw_PLAZA_NORTE_SalidasSinClasificar', 'PLAZA NORTE'),
            ('MDS', 'sw_MALLSUR_SalidasSinClasificar', 'MDS'),
            ('C. CIVICO', 'vw_CENTROCIVICO_SalidasSinClasificar', 'C. CIVICO'),
            ('SALAVERRY', 'vw_SALAVERRY_SalidasSinClasificar', 'SALAVERRY'),
            ('FONTANA', 'vw_FONTANA_SalidasSinClasificar', 'FONTANA'),
            ('AREQUIPA', 'vw_AREQUIPA_SalidasSinClasificar', 'AREQUIPA'),
            ('MINKA', 'vw_MINKA_SalidasSinClasificar', 'MINKA'),
            ('BENAVIDES', 'vw_BENAVIDES_SalidasSinClasificar', 'BENAVIDES'),
            ('CHILCLAYO', 'vw_CHILCLAYO_SalidasSinClasificar', 'CHICLAYO'),
            ('JOCKEY', 'vw_JOCKEY_SalidasSinClasificar', 'JOCKEY'),
            ('SJL', 'vw_SJL_SalidasSinClasificar', 'SJL'),
            ('PARDO', 'vw_PARDO_SalidasSinClasificar', 'PARDO'),
            ('ROSEDAL', 'vw_ROSEDAL_SalidasSinClasificar', 'ROSEDAL'),
            ('PURUCHUCO', 'vw_PURUCHUCO_SalidasSinClasificar', 'PURUCHUCO');

        SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales);
        WHILE @IdSucursal IS NOT NULL
        BEGIN
            SELECT @Nombre = Nombre, @Vista = Vista, @EtiquetaError = EtiquetaError
            FROM @Sucursales
            WHERE Id = @IdSucursal;

            BEGIN TRY
                SET @Sql = N'
                    INSERT INTO CONSOLIDADO_KARDEX.dbo.SalidaSinClasificar
                        ([Restaurante],[Fecha],[Origen],[Destino],[CodigoArticuloFR],[ArticuloFR]
                        ,[Unidades],[Cantidad],[CostoProm],[Total],[CODALMORIGIN],[CODALMDESTINO])
                    SELECT @Nombre AS Restaurante, *
                    FROM PERU_Frontrest.dbo.' + QUOTENAME(@Vista) + N' t0
                    WHERE t0.Fecha BETWEEN @fecha1 AND @fecha2';

                EXEC sys.sp_executesql
                    @Sql,
                    N'@fecha1 DATE, @fecha2 DATE, @Nombre NVARCHAR(100)',
                    @fecha1 = @fecha1,
                    @fecha2 = @fecha2,
                    @Nombre = @Nombre;
            END TRY
            BEGIN CATCH
                PRINT 'Error en ' + @EtiquetaError + ': ' + ERROR_MESSAGE();
                SET @Errores += 1;
                SET @DetalleErrores += 'SP_SalidaSinClasificar/' + @EtiquetaError + ': ' + ERROR_MESSAGE() + CHAR(13) + CHAR(10);
            END CATCH;

            SET @IdSucursal = (SELECT MIN(Id) FROM @Sucursales WHERE Id > @IdSucursal);
        END;

        RAISERROR('***** SP_SalidasSinClasificar_SP Finalizado (10/10) *******', 0, 1) WITH NOWAIT;
        RAISERROR(' ', 0, 1) WITH NOWAIT;

        PRINT '';
        PRINT '============================================';
        IF @Errores = 0
        BEGIN
            PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        END
        ELSE
        BEGIN
            PRINT 'PROCESO COMPLETADO CON CARGA PARCIAL';
            PRINT 'TOTAL ERRORES: ' + CAST(@Errores AS VARCHAR(20));
            PRINT @DetalleErrores;
        END
        PRINT '============================================';
        PRINT 'Commands completed successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END
GO
