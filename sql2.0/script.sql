USE [Kur2]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28.10.2022 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdProdukt] [int] NOT NULL,
	[DataOrder] [date] NOT NULL,
	[QuantityOrder] [int] NOT NULL,
	[IdProvider] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkts]    Script Date: 28.10.2022 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkts](
	[IdProdukt] [int] IDENTITY(1,1) NOT NULL,
	[NameProdukt] [nvarchar](55) NOT NULL,
	[IdProvider] [int] NOT NULL,
	[Remains] [int] NOT NULL,
 CONSTRAINT [PK_Produkts] PRIMARY KEY CLUSTERED 
(
	[IdProdukt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 28.10.2022 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[IdProvider] [int] IDENTITY(1,1) NOT NULL,
	[NameProvider] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[IdProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28.10.2022 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[NameRole] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.10.2022 1:10:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[LoginUser] [nvarchar](55) NOT NULL,
	[Password] [nvarchar](55) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IdOrder], [IdProdukt], [DataOrder], [QuantityOrder], [IdProvider]) VALUES (1, 1, CAST(N'2022-12-20' AS Date), 24, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Produkts] ON 

INSERT [dbo].[Produkts] ([IdProdukt], [NameProdukt], [IdProvider], [Remains]) VALUES (1, N'Пиво', 1, 200)
SET IDENTITY_INSERT [dbo].[Produkts] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([IdProvider], [NameProvider]) VALUES (1, N'PivoVoz')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [LoginUser], [Password], [IdRole]) VALUES (1, N'lol', N'lol', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Produkts] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Produkts] ([IdProdukt])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Produkts]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Provider] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Provider] ([IdProvider])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Provider]
GO
ALTER TABLE [dbo].[Produkts]  WITH CHECK ADD  CONSTRAINT [FK_Produkts_Provider] FOREIGN KEY([IdProvider])
REFERENCES [dbo].[Provider] ([IdProvider])
GO
ALTER TABLE [dbo].[Produkts] CHECK CONSTRAINT [FK_Produkts_Provider]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
