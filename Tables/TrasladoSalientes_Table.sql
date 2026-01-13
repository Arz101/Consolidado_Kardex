USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[TrasladoSalientes]    Script Date: 1/13/2026 11:42:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TrasladoSalientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurante] [varchar](100) NULL,
	[Fecha] [date] NULL,
	[No.Entrada] [varchar](50) NULL,
	[Destino] [varchar](100) NULL,
	[CodigoArticuloFR] [int] NULL,
	[ArticuloFR] [varchar](255) NULL,
	[Unidades] [varchar](10) NULL,
	[Cantidad] [float] NULL,
	[Costo] [decimal](18, 2) NULL,
	[CODALMDEST] [varchar](2) NULL,
	[CODALMORIG] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


