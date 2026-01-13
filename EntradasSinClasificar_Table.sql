USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[EntradaSinClasificar]    Script Date: 1/13/2026 11:40:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EntradaSinClasificar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurante] [nvarchar](100) NULL,
	[Fecha] [date] NULL,
	[Origen] [nvarchar](100) NULL,
	[Destino] [nvarchar](100) NULL,
	[CodigoArtculoFR] [int] NULL,
	[ArticuloFR] [nvarchar](100) NULL,
	[Unidades] [nvarchar](10) NULL,
	[Cantidad] [decimal](18, 2) NULL,
	[CostoProm] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Precio] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


