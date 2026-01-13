USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[PrecioTiendaComprasPromedio]    Script Date: 1/13/2026 11:41:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PrecioTiendaComprasPromedio](
	[Sucursal] [nvarchar](50) NULL,
	[CodigoArticulo] [nvarchar](50) NULL,
	[CodigoGrupo] [nvarchar](50) NULL,
	[GrupoArticulo] [nvarchar](255) NULL,
	[Articulo] [nvarchar](255) NULL,
	[CostProm] [decimal](18, 4) NULL,
	[Fecha] [date] NULL
) ON [PRIMARY]
GO


