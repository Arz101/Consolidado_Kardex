USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[SalidaSinClasificar]    Script Date: 1/13/2026 11:42:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SalidaSinClasificar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurante] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Origen] [varchar](50) NULL,
	[Destino] [varchar](50) NULL,
	[CodigoArticuloFR] [int] NULL,
	[ArticuloFR] [varchar](100) NULL,
	[Unidades] [varchar](10) NULL,
	[Cantidad] [float] NULL,
	[CostoProm] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[CODALMORIGIN] [varchar](10) NULL,
	[CODALMDESTINO] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


