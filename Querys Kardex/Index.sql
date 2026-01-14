USE CONSOLIDADO_KARDEX

CREATE INDEX IX_Fecha_PrecioTiendasComprasPromedio ON [dbo].[PrecioTiendaComprasPromedio] (Fecha)
CREATE INDEX IX_Fecha_InventarioMes ON [dbo].InventarioMes (Fecha)
CREATE INDEX IX_Fecha_Compras ON [dbo].[Compras] (Fecha)
CREATE INDEX IX_Fecha_ComprasDetalles ON [dbo].[Compras_Detalle] (Fecha)
CREATE INDEX IX_Fecha_EntradasSinClasificar ON [dbo].[EntradaSinClasificar] (Fecha)
CREATE INDEX IX_FechaSalidaSinClasificar ON [dbo].[SalidaSinClasificar] (Fecha)
CREATE INDEX IX_FechaTrasladoEntrante ON [dbo].[TrasladoEntrantes] (Fecha)
CREATE INDEX IX_Fecha_TrasladoSaliente ON [dbo].[TrasladoSalientes] (Fecha)



