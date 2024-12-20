USE [pizza_sales]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 24-11-2024 19:05:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_details_id] [int] NOT NULL,
	[order_id] [smallint] NOT NULL,
	[pizza_id] [nvarchar](50) NOT NULL,
	[quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 24-11-2024 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [smallint] NOT NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pizza_types]    Script Date: 24-11-2024 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizza_types](
	[pizza_type_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[category] [nvarchar](50) NOT NULL,
	[ingredients] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pizzas]    Script Date: 24-11-2024 19:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pizzas](
	[pizza_id] [nvarchar](50) NOT NULL,
	[pizza_type_id] [nvarchar](50) NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
