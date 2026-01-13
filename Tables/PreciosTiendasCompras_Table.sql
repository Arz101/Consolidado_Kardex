USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[PreciosTiendasCompras]    Script Date: 1/13/2026 11:41:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PreciosTiendasCompras](
	[Sucursal] [nvarchar](50) NULL,
	[Referencia] [nvarchar](50) NULL,
	[CostProm] [decimal](18, 4) NULL,
	[Fecha] [date] NULL
) ON [PRIMARY]
GO


