CREATE DATABASE [MyDieu]
USE [MyDieu]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone_Number] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Provincial] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address_User]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Address_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pro_Size_Color_Id] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[Date] [datetime] NULL,
	[User_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Cate_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Image] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Color_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Color_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Em_Id] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](150) NOT NULL,
	[Startday] [date] NOT NULL,
	[User_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Em_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactures]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[Manu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Manu_Name] [nvarchar](150) NOT NULL,
	[Info] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Manu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Order_Detail_Id] [int] IDENTITY(1,1) NOT NULL,
	[Quality] [int] NOT NULL,
	[Pro_Size_Color_Id] [int] NOT NULL,
	[Order_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Total_Amount] [float] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Em_Id] [int] NULL,
	[Address] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Image]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name_Img] [varchar](100) NOT NULL,
	[Product_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size_Color]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size_Color](
	[Pro_Size_Color_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[Quality] [int] NULL,
	[Price] [float] NOT NULL,
	[Size_Id] [int] NOT NULL,
	[Color_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pro_Size_Color_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](200) NOT NULL,
	[Origin] [nvarchar](50) NOT NULL,
	[Material] [nvarchar](200) NOT NULL,
	[Describe] [nvarchar](max) NOT NULL,
	[Manu_Id] [int] NOT NULL,
	[Cate_Id] [int] NOT NULL,
	[Ngay_Nhap] [date] NULL,
	[Image] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Size_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Size_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12-Jun-24 2:10:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](150) NOT NULL,
	[Username] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Role_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (1, N'0000', N'thanhvtps30707@fpt.edu.vn', N'Không biết', N'Không biết')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (2, N'0000', N'thanhhhps30777@ftp.edu.vn', N'Không biết', N'Không biết')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (3, N'0000', N'tamdmps36365@fpt.edu.vn', N'Không biết', N'Không biết')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (4, N'1111111', N'myntdps30740@fpt.edu.vn', N'khoonng bieets', N'KG')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (5, N'0374968107', N'dieumyamkg2504@gmail.com', N'khoonng bieets', N'KG')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (7, N'0999999999', N'ngovietanh121@gmail.com', N'vanh123', N'vanh123')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (9, N'0999999999', N'myntdps30740@fpt.edu.vn', N'không biết', N'không biết luôn')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (10, N'0999999999', N'myntdps30740@fpt.edu.vn', N'34-40', N'Đồng Nai')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (11, N'0999999999', N'myntdps30740@fpt.edu.vn', N'34-40', N'Đồng Nai')
INSERT [dbo].[Address] ([Address_Id], [Phone_Number], [Email], [Address], [Provincial]) VALUES (12, N'0909123415', N'myntdps30740@fpt.edu.vn', N'Ngọc Thành, Vân Khánh Đông, An Minh, Kiên Giang', N'KG')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Address_User] ON 

INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (4, 1, 1)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (3, 2, 2)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (2, 3, 3)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (1, 4, 4)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (5, 4, 5)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (7, 5, 4)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (8, 6, 5)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (10, 9, 9)
INSERT [dbo].[Address_User] ([Id], [User_Id], [Address_Id]) VALUES (12, 12, 12)
SET IDENTITY_INSERT [dbo].[Address_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (15, 126, 1, CAST(N'2024-06-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (27, 63, 2, CAST(N'2024-06-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (40, 122, 1, CAST(N'2024-06-10T10:47:02.000' AS DateTime), 3)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (41, 10, 1, CAST(N'2024-06-10T10:47:06.000' AS DateTime), 3)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (42, 21, 1, CAST(N'2024-06-10T10:47:11.000' AS DateTime), 3)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (43, 72, 1, CAST(N'2024-06-11T09:53:09.000' AS DateTime), 4)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (44, 122, 2, CAST(N'2024-06-11T10:11:54.000' AS DateTime), 4)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (45, 11, 1, CAST(N'2024-06-11T20:27:07.000' AS DateTime), 4)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (46, 116, 1, CAST(N'2024-06-11T23:07:50.000' AS DateTime), 6)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (47, 38, 1, CAST(N'2024-06-11T23:08:05.000' AS DateTime), 6)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (48, 58, 4, CAST(N'2024-06-11T23:08:26.000' AS DateTime), 6)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (49, 106, 2, CAST(N'2024-06-12T08:54:41.000' AS DateTime), 9)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (50, 70, 1, CAST(N'2024-06-12T08:59:38.000' AS DateTime), 9)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (51, 118, 1, CAST(N'2024-06-12T10:23:44.000' AS DateTime), 12)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (52, 44, 2, CAST(N'2024-06-12T10:23:54.000' AS DateTime), 12)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (53, 80, 1, CAST(N'2024-06-12T13:05:11.000' AS DateTime), 12)
INSERT [dbo].[Cart] ([Id], [Pro_Size_Color_Id], [Quality], [Date], [User_Id]) VALUES (55, 1, 2, CAST(N'2024-06-12T14:07:16.000' AS DateTime), 12)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (1, N'Boots Cao Gót', N'Pro_5.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (2, N'Giày Cao Gót Bít Mũi', N'Pro_1_1.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (3, N'Giày Đế Xuồng', N'Pro_3_1.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (4, N'Giày Gót Thấp', N'Pro_4_1.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (5, N'Giày Mules Cao Gót', N'Pro_8.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (6, N'Giày Sandals Cao Gót', N'Pro_11_green_2.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (7, N'Giày Sandals Đế Cao', N'Pro_15.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (8, N'Giày', N'Pro_22_red_1.webp')
INSERT [dbo].[Categories] ([Cate_Id], [Name], [Image]) VALUES (9, N'Dieu My', N'dieumy.png')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (1, N'Đen')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (2, N'Trắng')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (3, N'Đỏ')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (4, N'Bạc')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (5, N'Xanh lá')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (6, N'Xanh dương')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (7, N'Denim')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (8, N'Tím')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (9, N'Vàng')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (10, N'Hồng')
INSERT [dbo].[Colors] ([Color_Id], [Name]) VALUES (11, N'Nâu')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Em_Id], [Position], [Startday], [User_Id]) VALUES (1, N'Nhân viên bán hàng', CAST(N'2024-05-23' AS Date), 1)
INSERT [dbo].[Employees] ([Em_Id], [Position], [Startday], [User_Id]) VALUES (2, N'Nhân viên bán hàng', CAST(N'2024-05-23' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufactures] ON 

INSERT [dbo].[Manufactures] ([Manu_Id], [Manu_Name], [Info]) VALUES (1, N'COACH', N'Coach New York, thường được gọi là Coach, là một hãng thời trang cao cấp của Mỹ chuyên về túi xách, hành lý và phụ kiện bằng da cũng như đồ may sẵn. Coach cấp phép tên và thương hiệu cho Luxottica cho kính mắt và Interparfums có trụ sở tại Paris.')
INSERT [dbo].[Manufactures] ([Manu_Id], [Manu_Name], [Info]) VALUES (2, N'Le Silla', N'Thương hiệu Le Silla được thành lập vào năm 1994, là thương hiệu giày cao cấp dành riêng cho nữ đến từ nước Ý. Đi theo phong cách quyến rũ và lãng mạn, Le Silla mang đến những sản phẩm mang lại vẻ đẹp thanh lịch và quý phái thông qua các sản phẩm như: giày cao gót, giày boost, túi xách nữ,...')
INSERT [dbo].[Manufactures] ([Manu_Id], [Manu_Name], [Info]) VALUES (3, N'Nine West', N'Nine West là một thương hiệu thời trang túi xách và giày dép nữ, được thành lập tại New York vào năm 1978, là nơi khơi nguồn cảm hứng cho phong cách, tự tin và bản lĩnh của người phụ nữ hiện đại.  Mang trong mình bản chất của sự tự do và tinh tế, Nine West vượt lên trên mọi giới hạn thời trang, tạo nên những tác phẩm độc đáo với sự pha trộn hoàn hảo giữa nghệ thuật truyền thống và hơi thở của xu hướng mới. Qua sự kết hợp nghệ thuật này, Nine West đã viết nên một câu chuyện thời trang độc đáo, không chỉ chiếm lĩnh các con phố náo nhiệt mà còn chinh phục trái tim của hàng triệu tín đồ thời trang toàn cầu.')
INSERT [dbo].[Manufactures] ([Manu_Id], [Manu_Name], [Info]) VALUES (4, N'Pedro', N'Thương hiệu Pedro thuộc tập đoàn Charles & Keith, được ra mắt vào năm 2006. Với nhiều năm kinh nghiệm trong ngành công nghiệp thời trang, Pedro đã trở thành một thương hiệu đẳng cấp quốc tế với sự hiện diện mạnh mẽ trên thị trường toàn thế giới với các các sản phẩm giày và túi xách hàng hiệu.')
INSERT [dbo].[Manufactures] ([Manu_Id], [Manu_Name], [Info]) VALUES (5, N'Ted Baker', N'Ted Baker - thương hiệu thời trang Anh, kết hợp sự thanh lịch cổ điển và hiện đại trong giày cao gót. Sản phẩm đậm chất tinh tế, với đường nét mảnh mai, hình dáng tinh tế và sử dụng chất liệu cao cấp như da mềm mại và satin. Phong cách độc đáo và sang trọng của Ted Baker được thể hiện qua các chi tiết hoa văn phức tạp và logo đặc trưng.')
SET IDENTITY_INSERT [dbo].[Manufactures] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (1, 1, 59, 1)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (2, 1, 72, 6)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (3, 1, 102, 6)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (4, 2, 63, 6)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (5, 1, 72, 7)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (6, 1, 122, 8)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (7, 1, 72, 8)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (8, 4, 58, 10)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (9, 1, 38, 10)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (10, 1, 116, 10)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (11, 2, 106, 11)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (12, 1, 70, 12)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (13, 2, 106, 12)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (14, 2, 44, 13)
INSERT [dbo].[Order_Detail] ([Order_Detail_Id], [Quality], [Pro_Size_Color_Id], [Order_Id]) VALUES (15, 2, 1, 14)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (1, CAST(N'2024-04-25T00:00:00.000' AS DateTime), N'Đã giao hàng', 10500000, 4, 1, NULL)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (2, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'Đang chuẩn bị', 12000000, 5, NULL, NULL)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (3, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Đang chuẩn bị', 4389000, 3, NULL, 4)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (4, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Đang chuẩn bị', 4389000, 3, NULL, 4)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (5, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Chờ xác nhận', 132389000, 3, NULL, 4)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (6, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'Đang chuẩn bị', 132389000, 3, NULL, 4)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (7, CAST(N'2024-06-11T09:56:37.000' AS DateTime), N'Đang chuẩn bị', 2190000, 3, NULL, 4)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (8, CAST(N'2024-06-11T10:12:05.000' AS DateTime), N'Chờ xác nhận', 8994000, 4, NULL, 4)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (9, CAST(N'2024-06-12T01:41:26.000' AS DateTime), N'Chờ xác nhận', 83098000, 6, NULL, 5)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (10, CAST(N'2024-06-12T01:45:27.000' AS DateTime), N'Chờ xác nhận', 67799000, 6, NULL, 5)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (11, CAST(N'2024-06-12T08:54:48.000' AS DateTime), N'Đang chuẩn bị', 4398000, 9, NULL, 9)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (12, CAST(N'2024-06-12T08:59:45.000' AS DateTime), N'Chờ xác nhận', 6588000, 9, NULL, 9)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (13, CAST(N'2024-06-12T10:24:23.000' AS DateTime), N'Đang chuẩn bị', 49000000, 12, NULL, 12)
INSERT [dbo].[Orders] ([Order_Id], [Date], [Status], [Total_Amount], [User_Id], [Em_Id], [Address]) VALUES (14, CAST(N'2024-06-12T14:07:35.000' AS DateTime), N'Chờ xác nhận', 16400000, 12, NULL, 12)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Image] ON 

INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (1, N'Pro_1_1.webp', 1)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (2, N'Pro_1_2.webp', 1)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (3, N'Pro_3_1.webp', 3)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (4, N'Pro_3_2.webp', 3)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (5, N'Pro_4_1.webp', 4)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (6, N'Pro_4_2.webp', 4)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (7, N'Pro_4_3.webp', 4)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (8, N'Pro_5.webp', 5)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (9, N'Pro_6_pink_1.webp', 6)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (10, N'Pro_6_pink_2.webp', 6)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (11, N'Pro_6_yellow_1.webp', 6)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (12, N'Pro_6_yellow_2.webp', 6)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (13, N'Pro_7_1.webp', 7)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (14, N'Pro_7_2.webp', 7)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (15, N'Pro_7_3.webp', 7)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (30, N'Pro_12_2.webp', 12)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (31, N'Pro_14_1.webp', 14)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (32, N'Pro_14_2.webp', 14)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (33, N'Pro_15.webp', 15)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (34, N'Pro_16_black.webp', 16)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (36, N'Pro_16_brown.webp', 16)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (37, N'Pro_17.webp', 17)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (38, N'Pro_19.webp', 19)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (39, N'Pro_20_black_1.webp', 20)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (40, N'Pro_20_black_2.webp', 20)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (41, N'Pro_20_brown_1.webp', 20)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (42, N'Pro_20_brown_2.webp', 20)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (43, N'Pro_21_black.webp', 21)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (44, N'Pro_21_brown.webp', 21)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (45, N'Pro_22_black.webp', 22)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (46, N'Pro_22_red_1.webp', 22)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (47, N'Pro_22_red_2.webp', 22)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (48, N'Pro_22_white.webp', 22)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (49, N'Pro_23.webp', 23)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (50, N'Pro_24_1.webp', 24)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (51, N'Pro_24_2.webp', 24)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (52, N'Pro_24_3.webp', 24)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (53, N'Pro_25_1.webp', 25)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (54, N'Pro_25_2.webp', 25)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (55, N'Pro_26_1.webp', 26)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (56, N'Pro_26_2.webp', 26)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (57, N'ERD 2 24-5.png', 27)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (58, N'ERD 2.png', 27)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (59, N'ERD.png', 27)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (16, N'Pro_7_4.webp', 7)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (17, N'Pro_8.webp', 8)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (18, N'Pro_9_1.webp', 9)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (19, N'Pro_9_2.webp', 9)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (20, N'Pro_9_3.webp', 9)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (21, N'Pro_10_purple.webp', 10)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (22, N'Pro_10_white.webp', 10)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (23, N'Pro_11_green_1.webp', 11)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (24, N'Pro_11_green_2.webp', 11)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (25, N'Pro_11_green_3.webp', 11)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (26, N'Pro_11_white_1.webp', 11)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (27, N'Pro_11_white_2.webp', 11)
INSERT [dbo].[Product_Image] ([Id], [Name_Img], [Product_Id]) VALUES (29, N'Pro_12_1.webp', 12)
SET IDENTITY_INSERT [dbo].[Product_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Size_Color] ON 

INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (1, 1, 48, 8200000, 3, 1, 1)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (2, 1, 100, 8200000, 4, 1, 1)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (3, 1, 100, 8200000, 5, 1, 1)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (4, 1, 50, 6400000, 2, 1, 3)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (5, 1, 80, 6400000, 3, 1, 3)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (7, 1, 80, 6400000, 4, 1, 3)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (8, 1, 20, 13200000, 2, 8, 4)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (9, 1, 50, 13200000, 3, 8, 4)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (10, 1, 50, 13200000, 4, 8, 4)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (11, 1, 50, 13200000, 5, 8, 4)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (12, 1, 20, 13200000, 6, 8, 4)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (13, 1, 10, 24500000, 2, 4, 5)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (14, 1, 10, 24500000, 3, 4, 5)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (15, 1, 20, 24500000, 4, 4, 5)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (17, 1, 15, 24500000, 5, 4, 5)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (18, 1, 10, 24500000, 6, 4, 5)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (19, 1, 10, 10200000, 2, 9, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (20, 1, 10, 10200000, 3, 9, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (21, 1, 20, 10200000, 4, 9, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (22, 1, 15, 10200000, 5, 9, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (23, 1, 10, 10200000, 6, 9, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (24, 1, 10, 10200000, 2, 10, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (25, 1, 10, 10200000, 3, 10, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (26, 1, 20, 10200000, 4, 10, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (27, 1, 15, 10200000, 5, 10, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (28, 1, 10, 10200000, 6, 10, 6)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (29, 1, 5, 21900000, 2, 1, 7)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (30, 1, 5, 21900000, 3, 1, 7)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (31, 1, 15, 21900000, 4, 1, 7)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (32, 1, 10, 21900000, 5, 1, 7)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (33, 1, 5, 21900000, 6, 1, 7)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (34, 1, 15, 6400000, 3, 10, 8)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (35, 1, 20, 6400000, 4, 10, 8)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (36, 1, 15, 6400000, 5, 10, 8)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (37, 1, 2, 24400000, 2, 10, 9)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (38, 1, 3, 24400000, 3, 10, 9)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (39, 1, 5, 24400000, 4, 10, 9)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (40, 1, 5, 24400000, 5, 10, 9)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (41, 1, 3, 24400000, 6, 10, 9)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (42, 1, 2, 24500000, 2, 8, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (43, 1, 3, 24500000, 3, 8, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (44, 1, 3, 24500000, 4, 8, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (45, 1, 3, 24500000, 5, 8, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (47, 1, 2, 24500000, 6, 8, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (48, 1, 2, 24500000, 2, 2, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (49, 1, 3, 24500000, 3, 2, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (50, 1, 3, 24500000, 4, 2, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (51, 1, 3, 24500000, 5, 2, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (52, 1, 2, 24500000, 6, 2, 10)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (53, 1, 5, 10500000, 2, 2, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (54, 1, 5, 10500000, 3, 2, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (55, 1, 10, 10500000, 4, 2, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (56, 1, 10, 10500000, 5, 2, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (57, 1, 5, 10500000, 2, 5, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (58, 1, 5, 10500000, 3, 5, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (59, 1, 10, 10500000, 4, 5, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (60, 1, 10, 10500000, 5, 5, 11)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (61, 1, 1, 64000000, 2, 1, 12)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (62, 1, 1, 64000000, 3, 1, 12)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (63, 1, 3, 64000000, 4, 1, 12)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (64, 1, 2, 64000000, 5, 1, 12)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (65, 1, 1, 64000000, 6, 1, 12)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (66, 1, 10, 2290000, 2, 1, 14)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (67, 1, 15, 2290000, 3, 1, 14)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (68, 1, 20, 2290000, 4, 1, 14)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (69, 1, 20, 2290000, 5, 1, 14)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (70, 1, 10, 2190000, 2, 10, 15)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (71, 1, 15, 2190000, 3, 10, 15)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (72, 1, 20, 2190000, 4, 10, 15)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (73, 1, 20, 2190000, 5, 10, 15)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (74, 1, 10, 2290000, 2, 1, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (75, 1, 10, 2290000, 3, 1, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (76, 1, 15, 2290000, 4, 1, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (77, 1, 15, 2290000, 5, 1, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (78, 1, 10, 2290000, 2, 11, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (79, 1, 10, 2290000, 3, 11, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (80, 1, 15, 2290000, 4, 11, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (82, 1, 15, 2290000, 5, 11, 16)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (83, 1, 10, 1890000, 2, 6, 17)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (84, 1, 10, 1890000, 3, 6, 17)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (85, 1, 15, 1890000, 4, 6, 17)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (86, 1, 15, 1890000, 5, 6, 17)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (87, 1, 10, 2290000, 2, 6, 19)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (88, 1, 10, 2290000, 3, 6, 19)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (89, 1, 15, 2290000, 4, 6, 19)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (90, 1, 15, 2290000, 5, 6, 19)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (91, 1, 5, 2390000, 2, 1, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (92, 1, 5, 2390000, 3, 1, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (93, 1, 10, 2390000, 4, 1, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (94, 1, 10, 2390000, 5, 1, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (95, 1, 5, 2390000, 2, 11, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (96, 1, 5, 2390000, 3, 11, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (97, 1, 10, 2390000, 4, 11, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (98, 1, 10, 2390000, 5, 11, 20)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (99, 1, 2, 2199000, 1, 1, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (100, 1, 3, 2199000, 2, 1, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (101, 1, 3, 2199000, 3, 1, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (102, 1, 5, 2199000, 4, 1, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (103, 1, 5, 2199000, 5, 1, 21)
GO
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (105, 1, 1, 2199000, 1, 11, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (106, 1, 3, 2199000, 2, 11, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (107, 1, 3, 2199000, 3, 11, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (108, 1, 5, 2199000, 4, 11, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (109, 1, 3, 2199000, 5, 11, 21)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (110, 1, 2, 2199000, 2, 3, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (111, 1, 2, 2199000, 3, 3, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (112, 1, 5, 2199000, 4, 3, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (113, 1, 5, 2199000, 5, 3, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (114, 1, 3, 2199000, 6, 3, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (115, 1, 1, 1399000, 1, 8, 23)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (116, 1, 2, 1399000, 2, 8, 23)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (117, 1, 2, 1399000, 3, 8, 23)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (118, 1, 5, 1399000, 4, 8, 23)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (119, 1, 5, 1399000, 5, 8, 23)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (120, 1, 3, 1399000, 6, 8, 23)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (121, 1, 3, 3402000, 3, 2, 24)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (122, 1, 5, 3402000, 4, 2, 24)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (124, 1, 5, 3402000, 5, 2, 24)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (125, 1, 4, 3402000, 6, 2, 24)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (126, 1, 3, 3402000, 7, 2, 24)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (127, 1, 3, 4690000, 3, 1, 25)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (128, 1, 5, 4690000, 4, 1, 25)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (129, 1, 5, 4690000, 5, 1, 25)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (130, 1, 4, 4690000, 6, 1, 25)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (131, 1, 3, 4690000, 7, 1, 25)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (132, 1, 10, 5100000, 4, 4, 26)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (133, 1, 10, 5100000, 5, 4, 26)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (134, 1, 5, 5100000, 6, 4, 26)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (135, 1, 5, 5100000, 7, 4, 26)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (136, 1, 2, 2199000, 2, 1, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (137, 1, 2, 2190000, 3, 1, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (138, 1, 5, 2190000, 4, 1, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (139, 1, 5, 2190000, 5, 1, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (140, 1, 3, 2190000, 6, 1, 22)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (141, 1, 10, 1222222, 2, 2, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (142, 1, 10, 1222222, 4, 2, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (143, 1, 10, 1222222, 6, 2, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (144, 1, 10, 1222222, 2, 4, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (145, 1, 10, 1222222, 4, 4, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (146, 1, 10, 1222222, 6, 4, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (147, 1, 10, 1222222, 2, 6, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (148, 1, 10, 1222222, 4, 6, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (149, 1, 10, 1222222, 6, 6, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (150, 1, 10, 1222222, 2, 8, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (151, 1, 10, 1222222, 4, 8, 27)
INSERT [dbo].[Product_Size_Color] ([Pro_Size_Color_Id], [Status], [Quality], [Price], [Size_Id], [Color_Id], [Product_Id]) VALUES (152, 1, 10, 1222222, 6, 8, 27)
SET IDENTITY_INSERT [dbo].[Product_Size_Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (1, N'Giày cao gót nữ bít mũi phối mắc xích cá tính', N'New York', N'TBC', N'Từ kiểu dáng mũi nhọn sang trọng đến chi tiết trang trí làm bằng kim loại tông vàng sáng bóng, đôi giày cao gót này sẽ giúp nâng tầm cho vẻ ngoài của bạn. Nhờ quai đeo gót có thể điều chỉnh và độ cao vừa phải, đôi giày cao gót này sẽ giúp bạn luôn sành điệu mà không ảnh hưởng đến sự thoải mái khi mang. Kết hợp chúng với một bộ suit và trang sức bằng vàng phù hợp để có vẻ ngoài sang trọng và thanh lịch.', 1, 2, CAST(N'2024-01-23' AS Date), N'Pro_1_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (3, N'Giày cao gót mũi nhọn phối đá nhỏ Waverly', N'New York', N'Da', N'Đôi chân của bạn sẽ trở thành tâm điểm thu hút với đôi giày cao gót Waverly. Được thiết kế với kiểu dáng thời thượng từ chất liệu da mềm mại phối cùng mũi giày nhọn sắc sảo và đế cao su chắc chắn, Waverly sẽ là điểm nhấn lí tưởng giúp bạn tự tin sải bước cũng như chinh phục mọi ánh nhìn!', 1, 2, CAST(N'2024-01-23' AS Date), N'Pro_3_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (4, N'Giày cao gót nữ bít mũi Bella', N'Ý', N'Goat leather, Crystals. Lớp lót: Nappa leather. Đế: Leather', N'Kiểu dáng giày cao gót mũi nhọn thời trang. Thiết kế sang trọng, đẹp mắt, cộng hưởng cùng form ôm dáng chân. Gót nhọn đính đá lấp lánh, nổi bật. Gam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện', 2, 2, CAST(N'2024-01-23' AS Date), N'Pro_4_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (5, N'Giày boots cao gót nữ mũi nhọn Stivaletto Fedra', N'Ý', N'TBC', N'Lấp lánh như những viên kim cương trên nền satin, Stivaletto Fedra mang đến phiên bản lộng lẫy của một đôi boots cao gót. Được tạo ra với sự tự hào là biểu tượng của nghệ thuật thủ công Ý, Stivaletto Fedra kiêu hãnh sải bước trên phần gót nhọn thanh mảnh, tô điểm cho những bộ trang phục đơn giản nhất bằng sự lấp lánh đầy quyến rũ. Dù kết hợp cùng jeans hay một chiếc đầm dự tiệc, Stivaletto Fedra đều có khả năng biến hóa mọi phong cách trở nên độc đáo hơn.', 2, 1, CAST(N'2024-01-23' AS Date), N'Pro_5.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (6, N'Giày cao gót nữ bít mũi phối quai Bella', N'Ý', N'Goat leather and Crystals. Lớp lót: Nappa leather. Đế: Leather', N'Kiểu dáng giày cao gót mũi nhọn thời trang. Thiết kế sang trọng, đẹp mắt, cộng hưởng cùng phom ôm dáng chân. Gót nhọn hiện đại, phối quai co giãn thoải mái. Chất liệu da mềm mại. Gam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện. ', 2, 2, CAST(N'2024-01-23' AS Date), N'Pro_6_yellow_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (7, N'Giày cao gót nữ mũi nhọn Deco Bella Kabir', N'Ý', N'Patent Calf Leather', N'Hãy để đôi giày cao gót Deco Bella Kabir mang đậm tính biểu tượng của thương hiệu Le Silla trở thành điểm nhấn sáng giá cho mọi buổi hẹn đặc biệt của bạn. Với thiết kế độc đáo khi sở hữu phần gót nhọn cao 10cm kết hợp cùng chất liệu da sáng bóng, đôi cao gót Deco Bella Kabir vừa toát lên sự táo bạo một cách cuốn hút, vừa tạo nên sự uyển chuyển cho vóc dáng của bạn. Đặc biệt hơn, phần mũi giày nhọn tinh xảo cũng là một điểm nổi bật hứa hẹn giúp bạn ghi lại dấu ấn mạnh mẽ sau từng bước đi.', 2, 2, CAST(N'2024-02-01' AS Date), N'Pro_7_2.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (8, N'Giày mules cao gót mũi vuông Tillie', N'New York', N'Patent leather', N'Khám phá sự thoải mái vượt bậc và phong cách thanh lịch cùng đôi giày mules Tillie - người bạn đồng hành lý tưởng cho những ngày nắng ấm và những buổi tối sôi động. Với thiết kế phom dáng độc đáo cùng chất liệu da mềm mại trên phần gót cao vừa vặn, tất cả không chỉ góp phần tôn lên vóc dáng thanh lịch mà còn hứa hẹn sẽ trở thành món phụ kiện hoàn hảo cho mọi quý cô kiêu kỳ.', 1, 5, CAST(N'2024-02-01' AS Date), N'Pro_8.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (9, N'Giày mules cao gót nữ quai ngang phối lông Bella Fluffy', N'Ý', N'TBC', N'Lấy cảm hứng từ sự kết hợp giữa vẻ đẹp kiêu sa và sự mềm mại, Bella Fluffy của Le Silla ra đời như một biểu tượng cho sự sang trọng và tinh tế. Bên cạnh lớp lông mềm mượt ôm lấy bàn chân mang đến cảm giác êm ái, thoải mái, đồng thời tạo nên điểm nhấn độc đáo cho đôi giày, Bella Fluffy còn có kiểu dáng thanh lịch giúp tôn lên từng đường cong quyến rũ, mang đến sự thanh thoát và kiêu hãnh cho bạn.', 2, 5, CAST(N'2024-02-01' AS Date), N'Pro_9_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (10, N'Giày mules cao gót nữ mũi nhọn Sandalo Nicole', N'Ý', N'Leather, PVC', N'Những đôi giày mules của Le Silla đều như một ảo ảnh lộng lẫy, toát lên vẻ kiêu sa khó cưỡng. Được chế tác từ chất liệu óng ánh sở hữu điểm nhấn độc đáo là phần mũi giày bằng nhựa PVC trong suốt, nơi những viên pha lê lấp lánh như đang nhảy múa, Sandalo Nicole còn có phần mũi nhọn mang tính hiện đại đột phá cùng gót giày cao 80mm vừa phải, đảm bảo sự thoải mái cho bước đi tự tin, khiến bạn trở thành trung tâm thu hút mọi ánh nhìn.', 2, 5, CAST(N'2024-02-01' AS Date), N'Pro_10_purple.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (11, N'Giày sandals cao gót nữ Sandalo Bele', N'Ý', N'100% Satin', N'Với vẻ nữ tính và sự linh hoạt, đôi giày sandal cao gót Sandalo Bele sẽ trở thành lựa chọn hoàn hảo cho những buổi gặp gỡ cuối tuần đầy sang trọng. Được làm từ chất liệu cao cấp điểm xuyết thêm những chi tiết đính đá lấp lánh, Sandalo Bele sẽ giúp bạn tạo nên dấu ấn không thể quên với phong cách thời trang sành điệu và cuốn hút mỗi khi xuống phố.', 2, 6, CAST(N'2024-02-01' AS Date), N'Pro_11_green_2.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (12, N'Giày sandals cao gót nữ Sandalo Jewels', N'Ý', N'Certified sustainable satin, Crystals', N'Tạo nét cho đôi chân quyến rũ, ngọc ngà của bạn với giày sandals cao gót Sandalo Jewels. Vô cùng tinh xảo với thiết kế quai mảnh quấn nhiều vòng và được đính các dây đá pha lê bạc lấp lánh, Sandalo Jewels sẽ là một điểm cộng đầy tinh tế, giúp bạn tỏa hào quang ở khắp mọi nơi.', 2, 6, CAST(N'2024-02-11' AS Date), N'Pro_12_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (14, N'Giày cao gót nữ bít mũi quai mảnh Unda', N'Mỹ', N'Da tổng hợp', N'Đôi giày cao gót Unda thời thượng và êm ái là những gì một quý cô phong cách luôn khao khát trải nghiệm. Với phần mũi nhọn thanh lịch, dây đeo quyến rũ cùng gót hở vô cùng thoải mái là “bước chải chuốt” cuối cùng hoàn thành vẻ ngoài tinh tế, chuẩn bị cho một buổi hẹn hò cuối tuần', 3, 2, CAST(N'2024-02-12' AS Date), N'Pro_14_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (15, N'Giày cao gót nữ bít mũi Faiza', N'Mỹ', N'Synthetic', N'Đôi giày cao gót Faiza chính là tuyên ngôn cho sự quyến rũ vượt thời gian. Được nhấn nhá tinh tế bằng những họa tiết cánh hoa dịu dàng tôn lên vẻ đẹp kiêu hãnh của đôi bàn chân, kết hợp với mũi nhọn kinh điển cùng phần gót kiêu sa tạo nên dáng vẻ thanh thoát kiều diễm, đây hứa hẹn sẽ là item đưa bước chân của bạn qua mọi khoảnh khắc cuộc sống, từ nhịp điệu nhanh nhẹn ở nơi công sở đến không gian lấp lánh ánh đèn của những buổi tiệc tối.', 3, 2, CAST(N'2024-02-12' AS Date), N'Pro_15.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (16, N'Giày cao gót nữ bít mũi Fresh', N'Mỹ', N'TBC', N'Mang đến một định nghĩa mới về thanh lịch, đôi giày cao gót Fresh với thiết kế cổ điển và mũi nhọn mảnh mai không chỉ tôn lên vóc dáng của bạn, mà còn đảm bảo sự thoải mái tối ưu nhờ vào lớp lót cao cấp, khiến bạn dễ dàng trở thành tâm điểm của mọi ánh nhìn.', 3, 2, CAST(N'2024-02-12' AS Date), N'Pro_16_brown.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (17, N'Giày mules nữ cao gót đế vuông Griselda', N'Mỹ', N'PU', N'Đôi giày mules Griselda mang trong mình hơi thở hiện đại hòa quyện với nét đẹp thanh lịch nhờ vào phần đế vuông cùng thiết kế slip-on tiện lợi, hứa hẹn là sự lựa chọn hoàn hảo cho những quý cô yêu thích sự trẻ trung, năng động, sẵn sàng cùng bạn tỏa sáng rực rỡ trong từng bước đi.', 3, 5, CAST(N'2024-03-12' AS Date), N'Pro_17.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (19, N'Giày sandals cao gót nữ quai mảnh đính nơ Kensta', N'Mỹ', N'Vải', N'Sở hữu đôi giày cao gót Kensta đồng nghĩa với việc sở hữu một lối tắt đi đến vẻ đẹp sang trọng đích thực. Với gam màu nhẹ nhàng trên nền chất liệu độc đáo kết hợp cùng thiết kế hở ngón, Kensta sẽ mang đến cho bạn sự thoải mái tuyệt đối cùng vẻ ngoài chỉn chu, sắc sảo. Đặc biệt, với phần gót loe vững chắc, đôi giày sẽ giúp nâng cao phong cách và vóc dáng tuyệt đẹp của bạn.', 3, 6, CAST(N'2024-03-12' AS Date), N'Pro_19.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (20, N'Giày sandals cao gót nữ phối quai mảnh Reina', N'Mỹ', N'TBC', N'Nâng tầm phong cách với đôi giày cao gót Reina từ Nine West. Với thiết kế đơn giản nhưng lôi cuốn từ sự kết hợp của gót nhọn tinh tế và mũi nhọn thời thượng, đôi giày là sự lựa chọn hoàn hảo cho mọi dịp, từ những sự kiện trọng đại đến những chuyến dạo phố nhẹ nhàng. Chính vì vậy, Reina không chỉ là biểu tượng của sự tự tin và phong cách, mà còn dễ dàng kết hợp với nhiều loại trang phục khác nhau, giúp bạn tự tin và nổi bật mỗi khi xuất hiện.', 3, 6, CAST(N'2024-03-12' AS Date), N'Pro_20_brown_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (21, N'Giày cao gót bít mũi Mara Leather', N'Singapore', N'Calf Leather', N'Đôi giày cao gót Mara Leather độc đáo với thiết kế đế dày và phần gót vuông ấn tượng, chắc chắn sẽ đem đến cho bạn sự tự tin độc đáo cũng như giúp bạn thu hút mọi ánh nhìn một cách đầy lôi cuốn. Với chi tiết dây khóa ấn tượng được làm từ chất liệu da bò mềm mại, Mara Leather hứa hẹn sẽ giúp bạn làm bật lên mọi nét tinh tế và thời thượng của mình.', 4, 2, CAST(N'2024-03-12' AS Date), N'Pro_21_black.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (22, N'Giày cao gót bít mũi Mia Leather', N'Singapore', N'Kid Leather', N'Hãy bước đi thật tự tin với đôi giày cao gót Mia Leather sang trọng. Được hoàn thiện từ chất liệu da xa xỉ với phần gót vững chắc phối cùng mũi giày nhọn sắc sảo và chi tiết dây xích kim loại sáng bóng, tất cả đã tạo nên một sự quý phái đặc biệt cho cả tổng thể, chắc chắn sẽ là điểm nhấn duyên dáng cho mọi phong cách của bạn.', 4, 2, CAST(N'2024-03-12' AS Date), N'Pro_22_red_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (23, N'Giày mules cao gót nữ mũi vuông quai mảnh Savannah', N'Singapore', N'Faux Suede', N'Giày mules cao gót Savannah với thiết kế mũi vuông và gót loe đã tạo nên một vẻ ngoài vừa độc đáo vừa hiện đại. Kết hợp cùng phom dáng slip-on và phần dây đeo đính đá, đây chắc chắn sẽ là chiếc phụ kiện sang trọng, chỉ cần bạn mix-match đơn giản cùng chiếc một chiếc đầm maxi bồng bềnh là đã đủ sở hữu ngay cho mình một bản phối thời thượng.', 4, 5, CAST(N'2024-03-24' AS Date), N'Pro_23.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (24, N'Giày cao gót nữ bít mũi Krili', N'Anh', N'100% Polyester; Lớp lót: 100% Polyurethane; Đế: 100% Resin', N'Krili sẽ là item nổi bật trong bất kỳ bộ sưu tập giày nào của bạn. Thiết kế nổi bật này lấy điểm nhấn là chi tiết nơ vui tươi giúp làm tăng thêm nét nữ tính, cùng phần gót quai sau thoải mái mang lại sự vừa vặn, an toàn. Hoàn hảo để diện đồ, Krili rất lý tưởng cho các sự kiện đặc biệt và thêm chút xuân cho bước đi của bạn.', 5, 2, CAST(N'2024-03-24' AS Date), N'Pro_24_2.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (25, N'Giày cao gót bít mũi Orlas', N'Anh', N'Polyester', N'Đưa định nghĩa về sự sang trọng lên một tầm cao mới, giày cao gót Orlas chính là mảnh ghép hoàn hảo cho tủ đồ của bạn. Được chế tác với kiểu dáng thanh lịch cùng họa tiết hoa tinh tế trên nền chất liệu satin cao cấp, Orlas chắc chắn sẽ là người bạn đồng hành cùng bạn trong mọi khoảnh khắc, từ những cuộc họp khách hàng quan trọng đến những bữa tối sang trọng.', 5, 2, CAST(N'2024-03-24' AS Date), N'Pro_25_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (26, N'Giày sandals cao gót nữ đính đá Helenni', N'Anh', N'TBC', N'Với vẻ đẹp nữ tính và thời thượng, đôi giày cao gót Helenni sẽ là lựa chọn hoàn hảo cho những buổi tiệc gặp gỡ cuối tuần đầy sang trọng. Được chế tác từ chất liệu cao cấp điểm xuyến thêm những chi tiết đính pha lê lấp lánh, Helenni sẽ giúp bạn tạo nên dấu ấn không thể quên với phong cách thời trang sành điệu và cuốn hút mỗi khi xuống phố.', 5, 6, CAST(N'2024-03-24' AS Date), N'Pro_26_1.webp')
INSERT [dbo].[Products] ([Product_Id], [Product_Name], [Origin], [Material], [Describe], [Manu_Id], [Cate_Id], [Ngay_Nhap], [Image]) VALUES (27, N'mules', N'VN', N'khong bt', N'âs', 1, 3, CAST(N'2024-06-12' AS Date), N'ERD 2.png')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Role_Id], [Name]) VALUES (1, N'User')
INSERT [dbo].[Roles] ([Role_Id], [Name]) VALUES (2, N'Admin')
INSERT [dbo].[Roles] ([Role_Id], [Name]) VALUES (3, N'Employee')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Size_Id], [Name]) VALUES (1, N'34')
INSERT [dbo].[Sizes] ([Size_Id], [Name]) VALUES (2, N'35')
INSERT [dbo].[Sizes] ([Size_Id], [Name]) VALUES (3, N'36')
INSERT [dbo].[Sizes] ([Size_Id], [Name]) VALUES (4, N'37')
INSERT [dbo].[Sizes] ([Size_Id], [Name]) VALUES (5, N'38')
INSERT [dbo].[Sizes] ([Size_Id], [Name]) VALUES (6, N'39')
INSERT [dbo].[Sizes] ([Size_Id], [Name]) VALUES (7, N'40')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (1, N'Võ Tấn Thành', N'thanhvt', N'123456', 1, 3)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (2, N'Hoàng Hữu Thành', N'thanhhh', N'123456', 1, 3)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (3, N'Đỗ Minh Tâm', N'tamdm', N'123456', 1, 1)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (4, N'Nguyễn Thị Diệu Mỵ', N'myntd', N'd13b64656e153f92e111eac6726c9c785fcad18ca724233178d11f82d6ccccc3', 0, 2)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (5, N'Myj', N'myne', N'58c9442a2310887adde23591fb1119f2516372f1b0ceb510af1b5e9dde37ddf1', 0, 2)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (6, N'vanh123', N'vanh123', N'000108cc349f829c82ab3eb91357a531f1d017549ad6cebe9ad8724a5aa56670', 0, 1)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (9, N'Thầy Bình', N'binhtq', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 1, 1)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (10, N'Minh Tam', N'tam123', N'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 1, 1)
INSERT [dbo].[Users] ([User_Id], [Fullname], [Username], [Password], [Gender], [Role_Id]) VALUES (12, N'Thầy Bình', N'binh123', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ__Address___90564FCA78101179]    Script Date: 12-Jun-24 2:10:34 PM ******/
ALTER TABLE [dbo].[Address_User] ADD UNIQUE NONCLUSTERED 
(
	[User_Id] ASC,
	[Address_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Order_De__276652501E743551]    Script Date: 12-Jun-24 2:10:34 PM ******/
ALTER TABLE [dbo].[Order_Detail] ADD UNIQUE NONCLUSTERED 
(
	[Pro_Size_Color_Id] ASC,
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address_User]  WITH CHECK ADD FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Address_Id])
GO
ALTER TABLE [dbo].[Address_User]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Address_User]  WITH CHECK ADD  CONSTRAINT [FKfmtj9b1cg7vb54nrgjnm8hqdp] FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Address_Id])
GO
ALTER TABLE [dbo].[Address_User] CHECK CONSTRAINT [FKfmtj9b1cg7vb54nrgjnm8hqdp]
GO
ALTER TABLE [dbo].[Address_User]  WITH CHECK ADD  CONSTRAINT [FKjc2iub3ej4xslf10a0rkkt19l] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Address_User] CHECK CONSTRAINT [FKjc2iub3ej4xslf10a0rkkt19l]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([Pro_Size_Color_Id])
REFERENCES [dbo].[Product_Size_Color] ([Pro_Size_Color_Id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK4380fea91qk3r6rhteqqcmb7q] FOREIGN KEY([Pro_Size_Color_Id])
REFERENCES [dbo].[Product_Size_Color] ([Pro_Size_Color_Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK4380fea91qk3r6rhteqqcmb7q]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FKg5uhi8vpsuy0lgloxk2h4w5o6] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FKg5uhi8vpsuy0lgloxk2h4w5o6]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK69x3vjuy1t5p18a5llb8h2fjx] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK69x3vjuy1t5p18a5llb8h2fjx]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Order_Id])
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD FOREIGN KEY([Pro_Size_Color_Id])
REFERENCES [dbo].[Product_Size_Color] ([Pro_Size_Color_Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Address])
REFERENCES [dbo].[Address] ([Address_Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Em_Id])
REFERENCES [dbo].[Employees] ([Em_Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih]
GO
ALTER TABLE [dbo].[Product_Image]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Product_Id])
GO
ALTER TABLE [dbo].[Product_Size_Color]  WITH CHECK ADD FOREIGN KEY([Color_Id])
REFERENCES [dbo].[Colors] ([Color_Id])
GO
ALTER TABLE [dbo].[Product_Size_Color]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Product_Id])
GO
ALTER TABLE [dbo].[Product_Size_Color]  WITH CHECK ADD FOREIGN KEY([Size_Id])
REFERENCES [dbo].[Sizes] ([Size_Id])
GO
ALTER TABLE [dbo].[Product_Size_Color]  WITH CHECK ADD  CONSTRAINT [FK15u83yafnw1hroo8bpm5phhlb] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Product_Id])
GO
ALTER TABLE [dbo].[Product_Size_Color] CHECK CONSTRAINT [FK15u83yafnw1hroo8bpm5phhlb]
GO
ALTER TABLE [dbo].[Product_Size_Color]  WITH CHECK ADD  CONSTRAINT [FK4or3f6jnm6cidnxy92167nfyj] FOREIGN KEY([Size_Id])
REFERENCES [dbo].[Sizes] ([Size_Id])
GO
ALTER TABLE [dbo].[Product_Size_Color] CHECK CONSTRAINT [FK4or3f6jnm6cidnxy92167nfyj]
GO
ALTER TABLE [dbo].[Product_Size_Color]  WITH CHECK ADD  CONSTRAINT [FKlnb9f91at1no0amw25vgm6qkn] FOREIGN KEY([Color_Id])
REFERENCES [dbo].[Colors] ([Color_Id])
GO
ALTER TABLE [dbo].[Product_Size_Color] CHECK CONSTRAINT [FKlnb9f91at1no0amw25vgm6qkn]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Cate_Id])
REFERENCES [dbo].[Categories] ([Cate_Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Manu_Id])
REFERENCES [dbo].[Manufactures] ([Manu_Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FKmesyn8937lg2c3jndt0umqwqh] FOREIGN KEY([Manu_Id])
REFERENCES [dbo].[Manufactures] ([Manu_Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FKmesyn8937lg2c3jndt0umqwqh]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FKmj3byw2biiru52u2cok719rye] FOREIGN KEY([Cate_Id])
REFERENCES [dbo].[Categories] ([Cate_Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FKmj3byw2biiru52u2cok719rye]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Role_Id])
GO
