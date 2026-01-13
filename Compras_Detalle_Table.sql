USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[Compras_Detalle]    Script Date: 1/13/2026 11:40:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Compras_Detalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurante] [varchar](100) NULL,
	[Fecha] [date] NULL,
	[Factura] [varchar](50) NULL,
	[No.Entrada] [varchar](50) NULL,
	[Proveedor] [varchar](255) NULL,
	[CodigoArticuloFR] [int] NULL,
	[ArticuloFR] [varchar](255) NULL,
	[Unidades] [varchar](10) NULL,
	[Cantidad] [float] NULL,
	[PrecioCompras] [decimal](18, 2) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[IV] [decimal](18, 2) NULL,
	[Neto] [decimal](18, 2) NULL,
	[CODPROVEEDOR] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


