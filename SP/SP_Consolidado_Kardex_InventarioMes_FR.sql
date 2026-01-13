
CREATE PROCEDURE SP_InventarioMes_FR
-- =============================================
-- Author:		Adrian Rodriguez
-- Create date: 2026-01-13
-- Description:	Consolidado Kardex Peru
-- =============================================
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM CONSOLIDADO_KARDEX.dbo.InventarioMes
			WHERE Fecha = CAST(GETDATE() AS DATE);

			WITH Datos AS (
				SELECT 'JOCKEY'     AS Restaurante, Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_JOCKEY_Cantidad

				UNION ALL
				SELECT 'PARDO', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PARDO_Cantidad

				UNION ALL
				SELECT 'ROSEDAL', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_ROSEDAL_Cantidad

				UNION ALL
				SELECT 'PURUCHUCO', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PURUCHUCO_Cantidad

				UNION ALL
				SELECT 'CANADA', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CANADA_Cantidad

				UNION ALL
				SELECT 'P&A', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PYA_Cantidad

				UNION ALL
				SELECT 'PLAZA NORTE', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_PLAZANORTE_Cantidad

				UNION ALL
				SELECT 'MDS', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MDS_Cantidad

				UNION ALL
				SELECT 'C. CIVICO', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CCIVICO_Cantidad

				UNION ALL
				SELECT 'SALAVERRY', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_Salaverry_Cantidad

				UNION ALL
				SELECT 'FONTANA', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_FONTANA_Cantidad

				UNION ALL
				SELECT 'AREQUIPA', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_AREQUIPA_Cantidad

				UNION ALL
				SELECT 'MINKA', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_MINKA_Cantidad

				UNION ALL
				SELECT 'BENAVIDES', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_BENAVIDES_Cantidad

				UNION ALL
				SELECT 'CHILCLAYO', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_CHILCLAYO_Cantidad

				UNION ALL
				SELECT 'SJL', Referencia, Cantidad, Fecha
				FROM [172.16.17.250].PERU_Frontrest.dbo.vw_SJL_Cantidad
			)
			INSERT INTO [dbo].[InventarioMes] ([Restaurante],[Referencia],[Cantidad],[Fecha])
		   SELECT *
			FROM Datos
			WHERE Fecha = CAST(GETDATE() AS DATE)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	    ROLLBACK TRANSACTION
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END