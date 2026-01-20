
CREATE OR ALTER PROCEDURE SP_InventarioMes_FR
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13s
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @FilasInsertadas INT;
			DECLARE @FilasEliminadas INT;

			DELETE FROM CONSOLIDADO_KARDEX.dbo.InventarioMes
			WHERE Fecha = CAST(GETDATE() AS DATE);

			SELECT @FilasEliminadas = @@ROWCOUNT;

			BEGIN TRY
				WITH Datos AS (
					SELECT 'JOCKEY'     AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_JOCKEY_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * JOCKEY NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'PARDO'AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PARDO_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * PARDO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'PURUCHUCO' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PURUCHUCO_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * PURUCHUCO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'CANADA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_CANADA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * CANADA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'P&A' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PYA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * P&A NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'PLAZA NORTE' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_PLAZANORTE_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * PZ NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'MDS' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_MDS_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * MDS NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			--BEGIN TRY
			--	WITH Datos AS (
			--		SELECT 'C. CIVICO' AS Restaurante, Referencia, Cantidad, Fecha
			--		FROM PERU_Frontrest.dbo.vw_CCIVICO_Cantidad
			--	)
			--	INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
			--	SELECT *
			--	FROM Datos
			--	WHERE Fecha = CAST(GETDATE() AS DATE)
			--END TRY
			--BEGIN CATCH
				--RAISERROR('           * C. CIVICO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			--END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'SALAVERRY'AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_Salaverry_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * SALAVERRY NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'FONTANA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_FONTANA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * FONTANA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'AREQUIPA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_AREQUIPA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * AREQUIPA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'MINKA' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_MINKA_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * MINKA NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'BENAVIDES' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_BENAVIDES_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * BENAVIDES NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'CHILCLAYO' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_CHILCLAYO_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * CHICLAYO NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

			BEGIN TRY
				WITH Datos AS (
					SELECT 'SJL' AS Restaurante, Referencia, Cantidad, Fecha
					FROM PERU_Frontrest.dbo.vw_SJL_Cantidad
				)
				INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
				SELECT *
				FROM Datos
				WHERE Fecha = CAST(GETDATE() AS DATE)
			END TRY
			BEGIN CATCH
				RAISERROR('           * SJL NO DISPONIBLE     SP_InventarioMes_FR', 0, 1) WITH NOWAIT;
			END CATCH

		COMMIT TRANSACTION

		PRINT '';
        PRINT '============================================';
        PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        PRINT '============================================';
	END TRY
	BEGIN CATCH
	    ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END