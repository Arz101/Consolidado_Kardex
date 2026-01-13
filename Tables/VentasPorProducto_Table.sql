USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[VentasPorProducto]    Script Date: 1/13/2026 11:42:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VentasPorProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurante] [varchar](100) NULL,
	[GrupoProductoFR] [varchar](100) NULL,
	[CodigoProductoFR] [varchar](50) NULL,
	[ProductoFR] [varchar](100) NULL,
	[Cantidad] [float] NULL,
	[Total] [decimal](18, 2) NULL,
	[Fecha] [date] NULL,
	[FechaAnulacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


