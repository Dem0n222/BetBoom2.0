USE [master]
GO
/****** Object:  Database [Bet]    Script Date: 17.11.2022 21:09:51 ******/
CREATE DATABASE [Bet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bet', FILENAME = N'E:\SQLServer2017Media\MSSQL14.SQLEXPRESS02\MSSQL\DATA\Bet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bet_log', FILENAME = N'E:\SQLServer2017Media\MSSQL14.SQLEXPRESS02\MSSQL\DATA\Bet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bet] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bet] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bet] SET  MULTI_USER 
GO
ALTER DATABASE [Bet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bet] SET QUERY_STORE = OFF
GO
USE [Bet]
GO
/****** Object:  Table [dbo].[Cantri]    Script Date: 17.11.2022 21:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cantri](
	[IdCantri] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Cantri] PRIMARY KEY CLUSTERED 
(
	[IdCantri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cite]    Script Date: 17.11.2022 21:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cite](
	[IdCite] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Cite] PRIMARY KEY CLUSTERED 
(
	[IdCite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.11.2022 21:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdProvader] [int] NOT NULL,
	[IdProdukt] [int] NOT NULL,
	[DatdOrder] [date] NOT NULL,
	[QuantityOrder] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkts]    Script Date: 17.11.2022 21:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkts](
	[IdProduk] [int] IDENTITY(1,1) NOT NULL,
	[NameProdukt] [nvarchar](55) NOT NULL,
	[Remains] [int] NOT NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[IdProvader] [int] NOT NULL,
 CONSTRAINT [PK_Produkts] PRIMARY KEY CLUSTERED 
(
	[IdProduk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provader]    Script Date: 17.11.2022 21:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provader](
	[IdProvader] [int] IDENTITY(1,1) NOT NULL,
	[NameProvader] [nvarchar](55) NOT NULL,
	[IdCantri] [int] NOT NULL,
	[IdCite] [int] NOT NULL,
	[IdStrit] [int] NOT NULL,
 CONSTRAINT [PK_Provader] PRIMARY KEY CLUSTERED 
(
	[IdProvader] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.11.2022 21:09:52 ******/
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
/****** Object:  Table [dbo].[Strit]    Script Date: 17.11.2022 21:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strit](
	[IdStrit] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](55) NOT NULL,
 CONSTRAINT [PK_Strit] PRIMARY KEY CLUSTERED 
(
	[IdStrit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.11.2022 21:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](55) NOT NULL,
	[Login] [nvarchar](55) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cantri] ON 

INSERT [dbo].[Cantri] ([IdCantri], [Name]) VALUES (1, N'Russia')
SET IDENTITY_INSERT [dbo].[Cantri] OFF
GO
SET IDENTITY_INSERT [dbo].[Cite] ON 

INSERT [dbo].[Cite] ([IdCite], [Name]) VALUES (1, N'Moscow')
SET IDENTITY_INSERT [dbo].[Cite] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([IdOrder], [IdProvader], [IdProdukt], [DatdOrder], [QuantityOrder]) VALUES (1, 3, 6, CAST(N'2022-11-17' AS Date), 22)
INSERT [dbo].[Order] ([IdOrder], [IdProvader], [IdProdukt], [DatdOrder], [QuantityOrder]) VALUES (2, 3, 7, CAST(N'2022-11-17' AS Date), 12)
INSERT [dbo].[Order] ([IdOrder], [IdProvader], [IdProdukt], [DatdOrder], [QuantityOrder]) VALUES (3, 3, 7, CAST(N'2022-11-17' AS Date), 43)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Produkts] ON 

INSERT [dbo].[Produkts] ([IdProduk], [NameProdukt], [Remains], [Price], [IdProvader]) VALUES (6, N'test', 33, CAST(33.00 AS Decimal(7, 2)), 3)
INSERT [dbo].[Produkts] ([IdProduk], [NameProdukt], [Remains], [Price], [IdProvader]) VALUES (7, N'Pivo', 32, CAST(12.00 AS Decimal(7, 2)), 3)
SET IDENTITY_INSERT [dbo].[Produkts] OFF
GO
SET IDENTITY_INSERT [dbo].[Provader] ON 

INSERT [dbo].[Provader] ([IdProvader], [NameProvader], [IdCantri], [IdCite], [IdStrit]) VALUES (3, N'Test', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Provader] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (1, N'Cotr')
INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (2, N'Admin')
INSERT [dbo].[Role] ([IdRole], [NameRole]) VALUES (3, N'Dir')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Strit] ON 

INSERT [dbo].[Strit] ([IdStrit], [Name]) VALUES (1, N'Chechersky')
SET IDENTITY_INSERT [dbo].[Strit] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [Password], [Login], [IdRole]) VALUES (1, N'Obi', N'Obi', 2)
INSERT [dbo].[User] ([IdUser], [Password], [Login], [IdRole]) VALUES (2, N'lol', N'lol', 1)
INSERT [dbo].[User] ([IdUser], [Password], [Login], [IdRole]) VALUES (3, N'lol', N'Dem0n', 3)
INSERT [dbo].[User] ([IdUser], [Password], [Login], [IdRole]) VALUES (4, N'ded', N'ded', 3)
INSERT [dbo].[User] ([IdUser], [Password], [Login], [IdRole]) VALUES (5, N'obi', N'obi', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Produkts] FOREIGN KEY([IdProdukt])
REFERENCES [dbo].[Produkts] ([IdProduk])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Produkts]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Provader] FOREIGN KEY([IdProvader])
REFERENCES [dbo].[Provader] ([IdProvader])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Provader]
GO
ALTER TABLE [dbo].[Produkts]  WITH CHECK ADD  CONSTRAINT [FK_Produkts_Provader] FOREIGN KEY([IdProvader])
REFERENCES [dbo].[Provader] ([IdProvader])
GO
ALTER TABLE [dbo].[Produkts] CHECK CONSTRAINT [FK_Produkts_Provader]
GO
ALTER TABLE [dbo].[Provader]  WITH CHECK ADD  CONSTRAINT [FK_Provader_Cantri] FOREIGN KEY([IdCantri])
REFERENCES [dbo].[Cantri] ([IdCantri])
GO
ALTER TABLE [dbo].[Provader] CHECK CONSTRAINT [FK_Provader_Cantri]
GO
ALTER TABLE [dbo].[Provader]  WITH CHECK ADD  CONSTRAINT [FK_Provader_Cite] FOREIGN KEY([IdCite])
REFERENCES [dbo].[Cite] ([IdCite])
GO
ALTER TABLE [dbo].[Provader] CHECK CONSTRAINT [FK_Provader_Cite]
GO
ALTER TABLE [dbo].[Provader]  WITH CHECK ADD  CONSTRAINT [FK_Provader_Strit] FOREIGN KEY([IdStrit])
REFERENCES [dbo].[Strit] ([IdStrit])
GO
ALTER TABLE [dbo].[Provader] CHECK CONSTRAINT [FK_Provader_Strit]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Bet] SET  READ_WRITE 
GO
