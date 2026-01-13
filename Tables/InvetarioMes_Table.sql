USE [CONSOLIDADO_KARDEX]
GO

/****** Object:  Table [dbo].[InventarioMes]    Script Date: 1/13/2026 11:40:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InventarioMes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Restaurante] [varchar](50) NULL,
	[Referencia] [varchar](50) NULL,
	[Cantidad] [float] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


