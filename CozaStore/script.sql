USE [master]
GO
/****** Object:  Database [SE1206_Project]    Script Date: 10/7/2018 10:45:45 PM ******/
CREATE DATABASE [SE1206_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SE1206_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SE1206_Project.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SE1206_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SE1206_Project_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SE1206_Project] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SE1206_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SE1206_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SE1206_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SE1206_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SE1206_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SE1206_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [SE1206_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SE1206_Project] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SE1206_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SE1206_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SE1206_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SE1206_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SE1206_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SE1206_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SE1206_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SE1206_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SE1206_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SE1206_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SE1206_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SE1206_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SE1206_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SE1206_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SE1206_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SE1206_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SE1206_Project] SET RECOVERY FULL 
GO
ALTER DATABASE [SE1206_Project] SET  MULTI_USER 
GO
ALTER DATABASE [SE1206_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SE1206_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SE1206_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SE1206_Project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SE1206_Project', N'ON'
GO
USE [SE1206_Project]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 10/7/2018 10:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/7/2018 10:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[total] [float] NOT NULL,
	[payment] [varchar](150) NOT NULL,
	[address] [varchar](150) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 10/7/2018 10:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/7/2018 10:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/7/2018 10:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/7/2018 10:45:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](150) NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Color] [varchar](150) NOT NULL,
	[Url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id], [username], [password]) VALUES (1, N'admin', N'12345')
SET IDENTITY_INSERT [dbo].[Admin] OFF
INSERT [dbo].[Bill] ([id], [customerID], [total], [payment], [address], [date]) VALUES (-806075815, 1, 25.5, N'COD', N'Ha Noi', CAST(0x833E0B00 AS Date))
INSERT [dbo].[Bill] ([id], [customerID], [total], [payment], [address], [date]) VALUES (-802802724, 2, 129.79000854492188, N'COD', N'Thai Binh', CAST(0x833E0B00 AS Date))
INSERT [dbo].[Bill] ([id], [customerID], [total], [payment], [address], [date]) VALUES (-797351661, 1, 51.700000762939453, N'COD', N'Ha Noi', CAST(0x833E0B00 AS Date))
INSERT [dbo].[Bill] ([id], [customerID], [total], [payment], [address], [date]) VALUES (-797184962, 1, 35.310001373291016, N'', N'', CAST(0x833E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([id], [idBill], [productID], [price], [quantity]) VALUES (4, -806075815, 6, 25.5, 1)
INSERT [dbo].[BillDetail] ([id], [idBill], [productID], [price], [quantity]) VALUES (5, -802802724, 8, 75, 1)
INSERT [dbo].[BillDetail] ([id], [idBill], [productID], [price], [quantity]) VALUES (6, -802802724, 25, 54.790000915527344, 1)
INSERT [dbo].[BillDetail] ([id], [idBill], [productID], [price], [quantity]) VALUES (7, -797351661, 18, 25.850000381469727, 2)
INSERT [dbo].[BillDetail] ([id], [idBill], [productID], [price], [quantity]) VALUES (8, -797184962, 3, 35.310001373291016, 1)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Women')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Man')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Bag')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Shoes')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Watches')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Belt')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Username], [Password]) VALUES (1, N'hoakhuat', N'13')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password]) VALUES (2, N'nhatle', N'123')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (1, N'Esprit Ruffle Shirt', 16.64, 1, N'white', N'images/product-01.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (3, N'Herschel supply', 35.31, 1, N'white', N'images/product-02.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (6, N'Short Sleeved Shirt', 25.5, 2, N'blue', N'images/product-03.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (8, N'Classic Trench Coat', 75, 1, N'brown', N'images/product-04.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (10, N'Front Pocket Jumper', 34.75, 1, N'grey ', N'images/product-05.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (11, N'Vintage Inspired Classic', 93.2, 5, N'black', N'images/product-06.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (13, N'Shirt In Stretch Cotton', 52.66, 1, N'white', N'images/product-07.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (16, N'Pieces in Metallic Printed', 18.96, 1, N'white', N'images/product-08.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (17, N'Converse All Star ', 75, 4, N'black', N'images/product-09.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (18, N'Femme T-Shirt In Stripe', 25.85, 1, N'white', N'images/product-10.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (19, N'Herschel supply', 63.16, 2, N'blue', N'images/product-11.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (21, N'Herschel supply', 63.15, 6, N'brown', N'images/product-12.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (24, N'T-Shirt with Sleeve', 18.49, 1, N'white', N'images/product-13.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (25, N'Pretty Little Thing', 54.79, 1, N'black', N'images/product-14.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (26, N'Mini Silver Mesh Watch', 86.85, 5, N'black', N'images/product-15.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [CategoryID], [Color], [Url]) VALUES (27, N'Square Neck Back', 29.64, 1, N'black', N'images/product-16.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Bill] FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Bill]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [SE1206_Project] SET  READ_WRITE 
GO
