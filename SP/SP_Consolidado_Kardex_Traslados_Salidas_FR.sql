USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_Traslados_Salidas_FR]    Script Date: 1/13/2026 11:20:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[SP_Traslados_Salidas_FR]
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @IdLog INT;
	DECLARE @Inicio DATETIME2 = SYSDATETIME()

	BEGIN TRY
		INSERT INTO CONSOLIDADO_KARDEX.dbo.Logs (NombreSP,  Estado, FechaInicio)
		VALUES ('SP_Traslados_Salidas_FR', 'EN PROCESO', @Inicio)
		
		SET @IdLog = SCOPE_IDENTITY();		
		BEGIN TRANSACTION
			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE)

			DELETE FROM CONSOLIDADO_KARDEX.dbo.TrasladoSalientes
			WHERE Fecha =@FechaHoy
			
			-- CANADA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'CANADA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CANADA_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en CANADA: ' + ERROR_MESSAGE()
			END CATCH

			-- P&A
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'P&A' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en P&A: ' + ERROR_MESSAGE()
			END CATCH

			-- PLAZA NORTE
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'PLAZA NORTE' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en PLAZA NORTE: ' + ERROR_MESSAGE()
			END CATCH

			-- MDS
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'MDS' AS Restaurante, *
				FROM PERU_Frontrest.dbo.sw_MALLSUR_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en MDS: ' + ERROR_MESSAGE()
			END CATCH

			-- C. CIVICO
			/*
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'C. CIVICO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH*/
				--PRINT 'Error en C. CIVICO: ' + ERROR_MESSAGE()
			--END CATCH

			-- SALAVERRY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'SALAVERRY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en SALAVERRY: ' + ERROR_MESSAGE()
			END CATCH

			-- FONTANA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'FONTANA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_FONTANA_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en FONTANA: ' + ERROR_MESSAGE()
			END CATCH

			-- AREQUIPA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'AREQUIPA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en AREQUIPA: ' + ERROR_MESSAGE()
			END CATCH

			-- MINKA
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'MINKA' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_MINKA_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en MINKA: ' + ERROR_MESSAGE()
			END CATCH

			-- BENAVIDES
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'BENAVIDES' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en BENAVIDES: ' + ERROR_MESSAGE()
			END CATCH

			-- CHILCLAYO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'CHILCLAYO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en CHILCLAYO: ' + ERROR_MESSAGE()
			END CATCH

			-- JOCKEY
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'JOCKEY' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_JOCKEY_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en JOCKEY: ' + ERROR_MESSAGE()
			END CATCH

			-- SJL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'SJL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_SJL_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en SJL: ' + ERROR_MESSAGE()
			END CATCH

			-- PARDO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'PARDO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PARDO_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en PARDO: ' + ERROR_MESSAGE()
			END CATCH

			-- ROSEDAL
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'ROSEDAL' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en ROSEDAL: ' + ERROR_MESSAGE()
			END CATCH

			-- PURUCHUCO
			BEGIN TRY
				INSERT INTO CONSOLIDADO_KARDEX.dbo.[TrasladoSalientes]
				([Restaurante]
				,[Fecha]
				,[No.Entrada]
				,[Destino]
				,[CodigoArticuloFR]
				,[ArticuloFR]
				,[Unidades]
				,[Cantidad]
				,[Costo]
				,[CODALMDEST]
				,[CODALMORIG])
				SELECT 'PURUCHUCO' AS Restaurante, *
				FROM PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosSalientes t0
				WHERE t0.Fecha = @FechaHoy
			END TRY
			BEGIN CATCH
				PRINT 'Error en PURUCHUCO: ' + ERROR_MESSAGE()
			END CATCH

		COMMIT TRANSACTION;

		PRINT '';
        PRINT '============================================';
        PRINT 'PROCESO COMPLETADO EXITOSAMENTE SIN ERRORES';
        PRINT '============================================';

		UPDATE CONSOLIDADO_KARDEX.dbo.Logs
		SET
			FechaFin = SYSDATETIME(),
			Estado = 'OK'
		WHERE id = @IdLog 

	END TRY

	BEGIN CATCH
		UPDATE CONSOLIDADO_KARDEX.dbo.Logs
		SET
			FechaFin = SYSDATETIME(),
			Estado = 'Error',
			MensajeError = ERROR_MESSAGE(),
			NumeroError = ERROR_NUMBER(),
			LineaError = ERROR_LINE()
		WHERE id = @IdLog
		
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH
END
GO


