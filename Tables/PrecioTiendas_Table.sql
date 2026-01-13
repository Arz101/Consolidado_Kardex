USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[PrecioTiendas]    Script Date: 1/13/2026 11:41:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PrecioTiendas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodigoArticulo] [varchar](50) NULL,
	[CodigoGrupo] [int] NULL,
	[GrupoArticulo] [varchar](100) NULL,
	[Articulo] [varchar](255) NULL,
	[Jockey] [decimal](18, 2) NULL,
	[Pardo] [decimal](18, 2) NULL,
	[Rosedal] [decimal](18, 2) NULL,
	[Puruchuco] [decimal](18, 2) NULL,
	[Canada] [decimal](18, 2) NULL,
	[P&A] [decimal](18, 2) NULL,
	[PN] [decimal](18, 2) NULL,
	[MDS] [decimal](18, 2) NULL,
	[CC] [decimal](18, 2) NULL,
	[Salaverry] [decimal](18, 2) NULL,
	[Fontana] [decimal](18, 2) NULL,
	[Arequipa] [decimal](18, 2) NULL,
	[Minka] [decimal](18, 2) NULL,
	[Benavides] [decimal](18, 2) NULL,
	[Chilclayo] [decimal](18, 2) NULL,
	[SJL] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


