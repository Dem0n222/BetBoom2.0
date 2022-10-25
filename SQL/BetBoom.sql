USE [Kur]
GO
/****** Object:  Table [dbo].[City]    Script Date: 25.10.2022 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[IdCity] [int] IDENTITY(1,1) NOT NULL,
	[NameCity] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[IdCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 25.10.2022 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[IdInvoce] [int] IDENTITY(1,1) NOT NULL,
	[IdProvider] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
	[IdStreet] [int] NOT NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[IdInvoce] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.10.2022 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] NOT NULL,
	[IdProdukt] [int] NOT NULL,
	[DataOrder] [date] NOT NULL,
	[IdProvider] [int] NULL,
	[QuantityOrder] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkts]    Script Date: 25.10.2022 23:06:33 ******/
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
/****** Object:  Table [dbo].[Provider]    Script Date: 25.10.2022 23:06:33 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 25.10.2022 23:06:33 ******/
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
/****** Object:  Table [dbo].[Street]    Script Date: 25.10.2022 23:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[IdStreet] [int] IDENTITY(1,1) NOT NULL,
	[NameStreet] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[IdStreet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.10.2022 23:06:33 ******/
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
SET IDENTITY_INSERT [dbo].[Produkts] ON 

INSERT [dbo].[Produkts] ([IdProdukt], [NameProdukt], [IdProvider], [Remains]) VALUES (2, N'Пиво', 1, 99)
INSERT [dbo].[Produkts] ([IdProdukt], [NameProdukt], [IdProvider], [Remains]) VALUES (3, N'Сок Яблочный', 2, 5)
INSERT [dbo].[Produkts] ([IdProdukt], [NameProdukt], [IdProvider], [Remains]) VALUES (4, N'Карты', 3, 400)
SET IDENTITY_INSERT [dbo].[Produkts] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([IdProvider], [NameProvider]) VALUES (1, N'PivoVoz')
INSERT [dbo].[Provider] ([IdProvider], [NameProvider]) VALUES (2, N'MyFamily')
INSERT [dbo].[Provider] ([IdProvider], [NameProvider]) VALUES (3, N'BBTeam')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (1, N'Админ')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [LoginUser], [Password], [IdRole]) VALUES (1, N'Lol', N'Lol', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_City] FOREIGN KEY([IdProvider])
REFERENCES [dbo].[City] ([IdCity])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_City]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_Provider] FOREIGN KEY([IdStreet])
REFERENCES [dbo].[Provider] ([IdProvider])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_Provider]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_Street] FOREIGN KEY([IdStreet])
REFERENCES [dbo].[Street] ([IdStreet])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_Street]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Produkts] FOREIGN KEY([IdProdukt])
REFERENCES [dbo].[Produkts] ([IdProdukt])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Produkts]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Provider] FOREIGN KEY([IdProvider])
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
