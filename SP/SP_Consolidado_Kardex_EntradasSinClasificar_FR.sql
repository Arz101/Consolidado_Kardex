USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_EntradasSinClasificar_FR]    Script Date: 1/13/2026 11:23:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[SP_EntradasSinClasificar_FR]
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-01
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE)
			DECLARE @FilasInsertadas INT;
			DECLARE @FilasEliminadas INT;
			
			DELETE FROM CONSOLIDADO_KARDEX.dbo.EntradaSinClasificar
			WHERE Fecha = @FechaHoy

			SELECT @FilasEliminadas = @@ROWCOUNT;

			INSERT INTO [CONSOLIDADO_KARDEX].[dbo].[EntradaSinClasificar]
					   ([Restaurante]
					   ,[Fecha]
					   ,[Origen]
					   ,[Destino]
					   ,[CodigoArtculoFR]
					   ,[ArticuloFR]
					   ,[Unidades]
					   ,[Cantidad]
					   ,[CostoProm]
					   ,[Total]
					   ,[Precio])
			SELECT 'CANADA' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'P&A' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'PLAZA NORTE' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'MDS' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'C. CIVICO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'SALAVERRY' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'FONTANA' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'AREQUIPA' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'MINKA' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'BENAVIDES' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'CHILCLAYO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'JOCKEY' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'SJL' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'PARDO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'ROSEDAL' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_ROSEDAL_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy

			UNION ALL
			SELECT 'PURUCHUCO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PURUCHUCO_EntradasSinCalificar t0
			WHERE t0.Fecha = @FechaHoy;

			SET @FilasInsertadas = @@ROWCOUNT;
			PRINT ' ------> Filas Insertadas: ' + CAST(@FilasInsertadas - @FilasEliminadas AS VARCHAR(20));
		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
	    ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END
GO


