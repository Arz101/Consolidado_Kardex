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

	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE)
			DELETE FROM CONSOLIDADO_KARDEX.dbo.TrasladoSalientes
			WHERE Fecha =@FechaHoy

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
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'P&A' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'PLAZA NORTE' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'MDS' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'C. CIVICO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'SALAVERRY' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'FONTANA' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'AREQUIPA' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'MINKA' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'BENAVIDES' AS Restaurante, *
			FROM[172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'CHILCLAYO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'JOCKEY' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'SJL' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'PARDO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'ROSEDAL' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_ROSEDAL_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy

			UNION ALL
			SELECT 'PURUCHUCO' AS Restaurante, *
			FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PURUCHUCO_TrasladosSalientes t0
			WHERE t0.Fecha =@FechaHoy
		COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
	    ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END
GO


