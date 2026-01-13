USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  StoredProcedure [dbo].[SP_Compras_Detalles_FR]    Script Date: 1/13/2026 11:05:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[SP_Compras_Detalles_FR] 
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
		DECLARE @FechaHoy DATE = CAST(GETDATE() AS DATE);

		DELETE FROM [CONSOLIDADO_KARDEX].[dbo].[Compras_Detalle]
		WHERE Fecha = @FechaHoy

		INSERT INTO CONSOLIDADO_KARDEX.dbo.Compras_Detalle
           ([Restaurante]
           ,[Fecha]
           ,[Factura]
           ,[No.Entrada]
           ,[Proveedor]
           ,[CodigoArticuloFR]
           ,[ArticuloFR]
           ,[Unidades]
           ,[Cantidad]
           ,[PrecioCompras]
           ,[SubTotal]
           ,[IV]
           ,[Neto]
           ,[CODPROVEEDOR])
		SELECT 'CANADA' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'P&A' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.sw_PARDOYALIAGA_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'PLAZA NORTE' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZA_NORTE_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'MDS' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.sw_MALLSUR_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'C. CIVICO' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CENTROCIVICO_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'SALAVERRY' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SALAVERRY_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'FONTANA' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'AREQUIPA' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'MINKA' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'BENAVIDES' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'CHILCLAYO' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'JOCKEY' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY__Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'SJL' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_Compras t0
		WHERE t0.Fecha = @FechaHoy

		UNION ALL
		SELECT 'PARDO' AS Restaurante, *
		FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_Compras t0
		WHERE t0.Fecha = @FechaHoy

		COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
	    ROLLBACK TRANSACTION
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH
END



