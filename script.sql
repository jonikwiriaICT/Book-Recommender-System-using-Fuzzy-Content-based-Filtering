USE [RestuarantDB]
GO
/****** Object:  UserDefinedFunction [dbo].[FuzzyMatchString]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[FuzzyMatchString] (@s1 varchar(100), @s2 varchar(100))
RETURNS int
AS
BEGIN

    DECLARE @i int, @j int;
    SET @i = 1;
    SET @j = 0;
    WHILE @i < LEN(@s1)
    BEGIN
        IF CHARINDEX(SUBSTRING(@s1,@i,2), @s2) > 0 SET @j=@j+1;
        SET @i=@i+1;
    END
    RETURN @j;
END
GO
/****** Object:  Table [dbo].[tbl_user_log]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_log](
	[user_name] [varchar](50) NOT NULL,
	[log_url] [varchar](250) NOT NULL,
	[log_date] [date] NULL,
	[log_time] [time](7) NULL,
	[log_sql] [varchar](max) NULL,
	[log_desc] [varchar](max) NULL,
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [pk_RecID] PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_AuditLog]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_AuditLog] as select row_number() over
(order by rec_id) as RowNumber, user_name as UserName,
log_url as [LogUrl], log_sql as [LogSQL],
log_date as [LogDate], log_time as 
[LogTime]
from tbl_user_log
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[roleID] [bigint] NULL,
	[userID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('USER/'+right('0000000000'+CONVERT([varchar](10),[userID]),(10))),
	[fullname] [varchar](400) NULL,
	[username] [varchar](200) NULL,
	[userpassword] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[telephone] [varchar](20) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerUsers]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerUsers](
	[roleID] [bigint] NULL,
	[userID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('CUSTOMER/'+right('0000000000'+CONVERT([varchar](10),[userID]),(10))),
	[fullname] [varchar](400) NULL,
	[username] [varchar](200) NULL,
	[userpassword] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[telephone] [varchar](20) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionStock]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionStock](
	[stock_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('STOCK/'+right('0000000000'+CONVERT([varchar](10),[stock_id]),(10))),
	[RetailerID] [bigint] NULL,
	[CustomerID] [bigint] NULL,
	[product_id] [bigint] NULL,
	[quantity] [int] NULL,
	[price] [decimal](18, 2) NULL,
	[date_sold] [varchar](200) NULL,
	[time_sold] [varchar](200) NULL,
	[flag_on] [int] NULL,
	[stock_description] [varchar](max) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
	[orderID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('PROD/'+right('0000000000'+CONVERT([varchar](10),[product_id]),(10))),
	[category_id] [bigint] NULL,
	[product_name] [varchar](200) NULL,
	[Quantity] [float] NULL,
	[price] [decimal](18, 2) NULL,
	[img_profile] [varchar](200) NULL,
	[product_description] [varchar](max) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
	[UserID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_transaction]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qry_transaction] as SELECT        row_number() OVER (ORDER BY t .stock_id) AS RowNumber, t .flag_on AS Remark, t .rec_id AS RecID, u.userID AS RetailerID, u.fullname AS [RetailerName], u.email AS RetailerEmail, u.telephone AS RetailerTelephone, 
c.userID AS ConsumerID, U.fullname AS ConsumerName, c.email AS ConsumerEmail, c.telephone AS ConsumerTelephone,p.rec_id as ProductRecID,  p.product_name as ProductName, t .quantity AS Quantity, t .price AS PriceSold, t .date_sold AS DateSold, t .time_sold AS TimeSold, 
t .updated_date AS UpdatedDate, t .updated_time AS UpdatedTime
FROM            TransactionStock t JOIN
                         Users u ON u.userID = t .RetailerID JOIN
                         CustomerUsers c ON c.userID = t .CustomerID
						 join Product p on p.product_id=t.product_id



			
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([image_id]),
	[product_id] [bigint] NULL,
	[img_profile] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_Image]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qry_Image] as 
SELECT        ROW_NUMBER() OVER (ORDER BY i.image_id) AS RowNumber, i.rec_id AS RecID, p.UserID AS [UserID], p.product_id AS [ProductID], p.rec_id as [ProductRecID], P.product_name AS ProductName, i.img_profile AS [ImagProfile], 
i.updated_date AS UpdatedDate, i.updated_time AS UpdatedTime
FROM            ProductImage i JOIN
                         Product p ON p.product_id = i.product_id
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[SizeID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('Size/'+right('0000000000'+CONVERT([varchar](10),[SizeID]),(10))),
	[product_id] [bigint] NULL,
	[size_name] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_size]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_size] as SELECT        row_number() OVER (ORDER BY s.SizeID) AS RowNumber, s.rec_id AS RecID, s.product_id AS ProductID, p.UserID as UserID, p.product_name AS ProductName, s.size_name AS [Size], s.updated_date AS UpdatedDate, 
s.updated_time AS UpdatedTime
FROM            ProductSize s JOIN
                         Product p ON p.product_id = s.product_id
GO
/****** Object:  Table [dbo].[category]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('CAT/'+right('0000000000'+CONVERT([varchar](10),[category_id]),(10))),
	[category_name] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_category]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_category] as select ROW_NUMBER() over (order by category_id) as RowNumber, rec_id as RecID, category_name as 
CategoryName, updated_date as UpdatedDate,updated_time as UpdatedTime  from category
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[colorID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('COL/'+right('0000000000'+CONVERT([varchar](10),[colorID]),(10))),
	[product_id] [bigint] NULL,
	[color_name] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[colorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_Color]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_Color] as SELECT        row_number() OVER (ORDER BY c.colorID) AS RowNumber, c.rec_id AS RecID, p.userID AS [UserID], p.product_id AS ProductID, p.product_name AS [ProductName], c.color_name AS Color, p.updated_date AS UpdatedDate, 
p.updated_time AS UpdatedTime
FROM            ProductColor c JOIN
                         Product p ON p.product_id = c.product_id
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[roleID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('USER/'+right('0000000000'+CONVERT([varchar](10),[roleID]),(10))),
	[role_name] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_Role]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qry_Role] as select ROW_NUMBER() over (order by roleID) as RowNumber, rec_id as RecID, 
role_name as RoleName, updated_date as UpdatedDate, updated_time as UpdatedTime
from UserRole
GO
/****** Object:  View [dbo].[qry_User]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_User] as SELECT        row_number() OVER (ORDER BY u.userID) AS 
RowNumber, U.userID as [UserID], u.rec_id AS RecID, r.role_name AS RoleName,
u.fullname AS [FullNames], u.username AS [UserName],
u.userpassword AS [User Password], 
u.email AS [Email Address], 
u.telephone AS [Telephone Number], 
u.updated_date AS UpdatedDate,
u.updated_time AS UpdatedTime
FROM Users u JOIN
UserRole r ON r.roleID = u.roleID
GO
/****** Object:  View [dbo].[qry_CustomerUser]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qry_CustomerUser] as SELECT        row_number() OVER (ORDER BY u.userID) AS RowNumber, u.rec_id AS RecID, u.userID as UserID, r.role_name AS RoleName, u.fullname AS [FullNames], u.username AS [UserName], u.userpassword AS [User Password], 
u.email AS [Email Address], u.telephone AS [Telephone Number], u.updated_date AS UpdatedDate, u.updated_time AS UpdatedTime
FROM            CustomerUsers u JOIN
                         UserRole r ON r.roleID = u.roleID
GO
/****** Object:  Table [dbo].[Store]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[store_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ('ST/'+right('0000000000'+CONVERT([varchar](10),[store_id]),(10))),
	[store_name] [varchar](200) NULL,
	[branch_name] [varchar](200) NULL,
	[store_address] [varchar](max) NULL,
	[store_description] [varchar](max) NULL,
	[userID] [bigint] NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_Store]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qry_Store] as SELECT        row_number() OVER (ORDER BY s.store_id) AS RowNumber, s.rec_id AS RecID, u.userID as UserID, u.fullname AS FullName, u.email AS Email, u.telephone AS TelephoneNo, s.store_name AS StoreName, s.branch_name AS BranchName, 
s.store_address AS StoreAddress, s.store_description AS StoreDescription, s.updated_date AS UpdatedDate, s.updated_time AS UpdatedTime
FROM            Store s JOIN
                         Users u ON u.userID = s.userID
GO
/****** Object:  View [dbo].[qry_Product]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qry_Product] as SELECT        ROW_NUMBER() OVER (ORDER BY p.product_id) AS RowNumber, P.PRODUCT_ID AS ProductID, u.userID AS UserID, p.rec_id AS RecID, u.fullname AS RetailerName, c.category_id AS CategoryID, c.category_name AS CategoryName, 
p.product_name AS ProductName, p.Quantity AS Quantity, p.price AS Price, p.product_description AS ProductDescription, img_profile AS ImgProfile, p.updated_date AS UpdatedDate, p.updated_time AS UpdatedTime
FROM            Product p JOIN
                         Category c ON c.category_id = p.category_id JOIN
                         Users u ON u.userID = p.UserID
GO
/****** Object:  Table [dbo].[tbl_dict_tables]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dict_tables](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[panel_id] [varchar](50) NOT NULL,
	[table_name] [varchar](50) NOT NULL,
	[key_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_dict_tables] PRIMARY KEY CLUSTERED 
(
	[panel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name], [updated_date], [updated_time]) VALUES (1, N'African Food', CAST(N'2021-07-24' AS Date), CAST(N'05:00:07.3266667' AS Time))
INSERT [dbo].[category] ([category_id], [category_name], [updated_date], [updated_time]) VALUES (2, N'Intercontinental Food', CAST(N'2021-07-24' AS Date), CAST(N'05:00:18.4866667' AS Time))
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerUsers] ON 

INSERT [dbo].[CustomerUsers] ([roleID], [userID], [fullname], [username], [userpassword], [email], [telephone], [updated_date], [updated_time]) VALUES (2, 1, N'NWAUKWA CHINEDU JOHNWENDY', N'USER', N'mmPnx9f3lWlheMlx2D13dw==', N'JOHNWENDY@GMAIL.COM', N'08034534634', CAST(N'2021-07-22' AS Date), CAST(N'10:47:18.1066667' AS Time))
INSERT [dbo].[CustomerUsers] ([roleID], [userID], [fullname], [username], [userpassword], [email], [telephone], [updated_date], [updated_time]) VALUES (2, 2, N'PETER NWONSU', N'PETER', N'mmPnx9f3lWlheMlx2D13dw==', N'PETER@GMAIL.COM', N'08034534633', CAST(N'2021-07-23' AS Date), CAST(N'13:06:03.5433333' AS Time))
INSERT [dbo].[CustomerUsers] ([roleID], [userID], [fullname], [username], [userpassword], [email], [telephone], [updated_date], [updated_time]) VALUES (2, 3, N'NWAUKWA CHINEDU CHIDI', N'CHIDI', N'mmPnx9f3lWlheMlx2D13dw==', N'CHIDI@EDU.NG', N'08033925178', CAST(N'2021-07-26' AS Date), CAST(N'04:44:12.1366667' AS Time))
INSERT [dbo].[CustomerUsers] ([roleID], [userID], [fullname], [username], [userpassword], [email], [telephone], [updated_date], [updated_time]) VALUES (2, 4, N'NWAUKWA CHINEDU JOHNWENDY', N'john', N'mmPnx9f3lWlheMlx2D13dw==', N'JOHNWENDY@GMAIL.COM', N'08034534634', CAST(N'2021-07-26' AS Date), CAST(N'09:16:24.6700000' AS Time))
INSERT [dbo].[CustomerUsers] ([roleID], [userID], [fullname], [username], [userpassword], [email], [telephone], [updated_date], [updated_time]) VALUES (2, 10004, N'joh', N'joh', N'mmPnx9f3lWlheMlx2D13dw==', N'joh@gmail.com', N'08022222222', CAST(N'2021-08-17' AS Date), CAST(N'16:40:07.1233333' AS Time))
SET IDENTITY_INSERT [dbo].[CustomerUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (1, 1, N'Eba and Egwusi Soup', 1, CAST(350.00 AS Decimal(18, 2)), N'dist/202172457ebaandegwusi.jpg', N'<h1>
	<u><strong>DESCRIPTION</strong></u></h1>
<p>
	Eba and Egwusi Soup for Afternoon Meal</p>
', CAST(N'2021-07-24' AS Date), CAST(N'05:07:33' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (2, 1, N'Fufu and Egwusi Soup', 1, CAST(400.00 AS Decimal(18, 2)), N'dist/2021724527Egusi.jpeg', N'', CAST(N'2021-07-24' AS Date), CAST(N'05:25:32.7866667' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (3, 1, N'Semovita and Egwusi Soup', 1, CAST(450.00 AS Decimal(18, 2)), N'dist/2021724531semo.jpg', N'', CAST(N'2021-07-24' AS Date), CAST(N'05:29:05.4600000' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (4, 1, N'Semo and Ogbono Soup', 1, CAST(350.00 AS Decimal(18, 2)), N'dist/2021724534egbolo.jpg', N'', CAST(N'2021-07-24' AS Date), CAST(N'05:34:07.8966667' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (5, 1, N'Eba and Ogbono Soup', 1, CAST(250.00 AS Decimal(18, 2)), N'dist/2021724548egbolo.jpg', N'', CAST(N'2021-07-24' AS Date), CAST(N'05:35:05.9966667' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (6, 1, N'Alloco', 1, CAST(500.00 AS Decimal(18, 2)), N'dist/2021724552Alloco.jpg', N'<p>
	Alloco African Dish</p>
', CAST(N'2021-07-24' AS Date), CAST(N'05:52:39.9600000' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (7, 1, N'Rice Meal', 1, CAST(340.00 AS Decimal(18, 2)), N'dist/2021724553Rice-meal.jpg', N'<p>
	Rice Meal Delicious African Meal</p>
', CAST(N'2021-07-24' AS Date), CAST(N'05:53:36.4633333' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (8, 1, N'Nshima Soup', 1, CAST(400.00 AS Decimal(18, 2)), N'dist/2021724554Nshima.jpg', N'<p>
	Nshima Delicious African Meal</p>
', CAST(N'2021-07-24' AS Date), CAST(N'05:54:36.6866667' AS Time), 1)
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [Quantity], [price], [img_profile], [product_description], [updated_date], [updated_time], [UserID]) VALUES (9, 1, N'Briouat', 1, CAST(100.00 AS Decimal(18, 2)), N'dist/2021724555Briouat.jpg', N'<p>
	Briouat Delious pie</p>
', CAST(N'2021-07-24' AS Date), CAST(N'05:55:28.3766667' AS Time), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([store_id], [store_name], [branch_name], [store_address], [store_description], [userID], [updated_date], [updated_time]) VALUES (1, N'MENDELIN SHOP', N'ABUJA', N'VERITAS UNIVERSITY', N'', 1, CAST(N'2021-07-21' AS Date), CAST(N'20:03:16.1833333' AS Time))
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] ON 

INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (1, N'PnlCategory', N'category', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (3, N'PnlCustomerUser', N'CustomerUsers', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (4, N'PnlProduct', N'Product', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (9, N'PnlProductColor', N'productcolor', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (8, N'PnlProductImage', N'ProductImage', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (7, N'PnlProductSize', N'ProductSize', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (6, N'PnlStore', N'Store', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (2, N'PnlUser', N'Users', N'rec_id')
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name]) VALUES (5, N'PnlUserRole', N'UserRole', N'rec_id')
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user_log] ON 

INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/User-Role', CAST(N'2021-07-21' AS Date), CAST(N'19:56:26.1800000' AS Time), N'C OPERATION: REC_ID = ; ROLE_NAME = COURIER; STATEMENTTYPE = INSERT; ', N'', 1)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/User-Role', CAST(N'2021-07-21' AS Date), CAST(N'19:57:55.5300000' AS Time), N'C OPERATION: REC_ID = USER/0000000001; ROLE_NAME = Administrator; STATEMENTTYPE = UPDATE; ', N'', 2)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/User-Role', CAST(N'2021-07-21' AS Date), CAST(N'19:57:56.6733333' AS Time), N'C OPERATION: REC_ID = ; ROLE_NAME = ; STATEMENTTYPE = INSERT; ', N'', 3)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/User-Role', CAST(N'2021-07-21' AS Date), CAST(N'19:58:05.7200000' AS Time), N'DELETE OPERATION: REC_ID = USER/0000000004; ', N'', 4)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Admin-User-Registration', CAST(N'2021-07-21' AS Date), CAST(N'19:58:48.7466667' AS Time), N'C OPERATION: REC_ID = ; ROLEID = 2; FULLNAME = BERLIN; USERNAME = user; USERPASSWORD = mmPnx9f3lWlheMlx2D13dw==; EMAIL = user@gmail.com; TELEPHONE = 08033925178; STATEMENTTYPE = INSERT; ', N'', 5)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Admin-User-Registration', CAST(N'2021-07-21' AS Date), CAST(N'19:59:53.2266667' AS Time), N'C OPERATION: REC_ID = USER/0000000001; ROLEID = 1; FULLNAME = JOHNWNDY NEDDY; USERNAME = admin; USERPASSWORD = mmPnx9f3lWlheMlx2D13dw==; EMAIL = admin@gmail.com; TELEPHONE = 07031268439; STATEMENTTYPE = UPDATE; ', N'', 6)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Category', CAST(N'2021-07-21' AS Date), CAST(N'20:02:04.0766667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_NAME = Men Shirt; STATEMENTTYPE = INSERT; ', N'', 7)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Category', CAST(N'2021-07-21' AS Date), CAST(N'20:02:18.6866667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_NAME = Female Shirt; STATEMENTTYPE = INSERT; ', N'', 8)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Category', CAST(N'2021-07-21' AS Date), CAST(N'20:02:23.5133333' AS Time), N'C OPERATION: REC_ID = CAT/0000000001; CATEGORY_NAME = Men Shirt; STATEMENTTYPE = UPDATE; ', N'', 9)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Store', CAST(N'2021-07-21' AS Date), CAST(N'20:03:16.2100000' AS Time), N'C OPERATION: REC_ID = ; STORE_NAME = MENDELIN SHOP; BRANCH_NAME = ABUJA; STORE_ADDRESS = VERITAS UNIVERSITY; STORE_DESCRIPTION = <p>
	My store is located at Veritas University</p>
; USERID = 1; STATEMENTTYPE = INSERT; ', N'', 10)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Store', CAST(N'2021-07-21' AS Date), CAST(N'20:07:55.0933333' AS Time), N'C OPERATION: REC_ID = ST/0000000001; STORE_NAME = MENDELIN SHOP; BRANCH_NAME = ABUJA; STORE_ADDRESS = VERITAS UNIVERSITY; STORE_DESCRIPTION = <p>
	My store is located at Veritas University</p>
; USERID = 1; STATEMENTTYPE = UPDATE; ', N'', 11)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Store', CAST(N'2021-07-21' AS Date), CAST(N'20:08:02.8366667' AS Time), N'C OPERATION: REC_ID = ST/0000000001; STORE_NAME = MENDELIN SHOP; BRANCH_NAME = ABUJA; STORE_ADDRESS = VERITAS UNIVERSITY; STORE_DESCRIPTION = <p>
	My store is located at Veritas University</p>
; USERID = 1; STATEMENTTYPE = UPDATE; ', N'', 12)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:12:13.5366667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = <p>
	Elastic waist dress suitable for beautiful women. We have the waist dresses for different colors and design.</p>
; STATEMENTTYPE = INSERT; ', N'', 13)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:17:16.7633333' AS Time), N'C OPERATION: REC_ID = PROD/0000000001; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000.00; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 14)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:17:37.5466667' AS Time), N'C OPERATION: REC_ID = PROD/0000000001; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000.00; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 15)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:18:02.2633333' AS Time), N'C OPERATION: REC_ID = PROD/0000000001; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000.00; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = <p>
	Elastic Waist dress is good for women</p>
; STATEMENTTYPE = UPDATE; ', N'', 16)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Color', CAST(N'2021-07-21' AS Date), CAST(N'20:18:25.7466667' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; COLOR_NAME = Blue; STATEMENTTYPE = INSERT; ', N'', 17)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Image', CAST(N'2021-07-21' AS Date), CAST(N'20:18:41.8466667' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; IMG_PROFILE = ; STATEMENTTYPE = INSERT; ', N'', 18)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Size', CAST(N'2021-07-21' AS Date), CAST(N'20:19:05.7833333' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; SIZE_NAME = XXS; STATEMENTTYPE = INSERT; ', N'', 19)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Size', CAST(N'2021-07-21' AS Date), CAST(N'20:19:09.6166667' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; SIZE_NAME = XS; STATEMENTTYPE = INSERT; ', N'', 20)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Size', CAST(N'2021-07-21' AS Date), CAST(N'20:19:11.8233333' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; SIZE_NAME = S; STATEMENTTYPE = INSERT; ', N'', 21)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Size', CAST(N'2021-07-21' AS Date), CAST(N'20:19:13.9133333' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; SIZE_NAME = M; STATEMENTTYPE = INSERT; ', N'', 22)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Size', CAST(N'2021-07-21' AS Date), CAST(N'20:19:16.1766667' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; SIZE_NAME = L; STATEMENTTYPE = INSERT; ', N'', 23)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Size', CAST(N'2021-07-21' AS Date), CAST(N'20:19:18.0900000' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; SIZE_NAME = XL; STATEMENTTYPE = INSERT; ', N'', 24)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Size', CAST(N'2021-07-21' AS Date), CAST(N'20:19:20.5466667' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; SIZE_NAME = XXL; STATEMENTTYPE = INSERT; ', N'', 25)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/User-Role', CAST(N'2021-07-21' AS Date), CAST(N'20:21:00.2633333' AS Time), N'C OPERATION: REC_ID = USER/0000000001; ROLE_NAME = Administrator; STATEMENTTYPE = UPDATE; ', N'', 26)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:24:17.5933333' AS Time), N'C OPERATION: REC_ID = PROD/0000000001; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000.00; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 27)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:32:20.8966667' AS Time), N'C OPERATION: REC_ID = PROD/0000000001; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000.00; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 28)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:32:25.9700000' AS Time), N'C OPERATION: REC_ID = PROD/0000000001; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000.00; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 29)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-21' AS Date), CAST(N'20:32:30.4600000' AS Time), N'C OPERATION: REC_ID = PROD/0000000001; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Elastic Waist Dress; QUANTITY = 4; PRICE = 12000.00; IMG_PROFILE = dist/20217212012product-image2-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 30)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-22' AS Date), CAST(N'09:00:26.6066667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Edna Dress; QUANTITY = 4; PRICE = 100000; IMG_PROFILE = dist/202172290product-image1-1.jpg; PRODUCT_DESCRIPTION = <h1>
	<strong>Description</strong></h1>
<p>
	<strong>Edna dress is good for the winter season. Get yours at affordable price. We sell one for 25000 Naira only</strong></p>
; STATEMENTTYPE = INSERT; ', N'', 31)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-22' AS Date), CAST(N'09:01:55.3366667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = 3/4 Sleeve Kimono Dress; QUANTITY = 5; PRICE = 50000; IMG_PROFILE = dist/202172291product-image3-1.jpg; PRODUCT_DESCRIPTION = <h1>
	<strong>Description</strong></h1>
<p>
	<strong>Simple and Elegant wear for the single ladies and the pregnant women.&nbsp;</strong>3/4 Sleeve Kimono Dress is simple and cheap. It is just 10000 naira for one only</p>
; STATEMENTTYPE = INSERT; ', N'', 32)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-22' AS Date), CAST(N'09:08:01.9666667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Cape Dress; QUANTITY = 2; PRICE = 5000; IMG_PROFILE = dist/202172298product-image4-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'', 33)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-22' AS Date), CAST(N'09:08:41.0466667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Buttercup Dress; QUANTITY = 2; PRICE = 20000; IMG_PROFILE = dist/202172298product-image4-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'', 34)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product', CAST(N'2021-07-22' AS Date), CAST(N'09:09:29.0266667' AS Time), N'C OPERATION: REC_ID = PROD/0000000005; CATEGORY_ID = 2; USERID = 1; PRODUCT_NAME = Buttercup Dress; QUANTITY = 2; PRICE = 20000.00; IMG_PROFILE = dist/202172299product-image17-1.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 35)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Image', CAST(N'2021-07-22' AS Date), CAST(N'10:09:55.6266667' AS Time), N'C OPERATION: REC_ID = 1; PRODUCT_ID = 1; IMG_PROFILE = ; STATEMENTTYPE = UPDATE; ', N'', 36)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Image', CAST(N'2021-07-22' AS Date), CAST(N'10:19:29.5000000' AS Time), N'C OPERATION: REC_ID = 1; PRODUCT_ID = 1; IMG_PROFILE = ; STATEMENTTYPE = UPDATE; ', N'', 37)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Image', CAST(N'2021-07-22' AS Date), CAST(N'10:20:15.8966667' AS Time), N'C OPERATION: REC_ID = 1; PRODUCT_ID = 1; IMG_PROFILE = dist/20217221020product-image2-1.jpg; STATEMENTTYPE = UPDATE; ', N'', 38)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost:50057/Product-Image', CAST(N'2021-07-22' AS Date), CAST(N'10:20:59.3100000' AS Time), N'C OPERATION: REC_ID = ; PRODUCT_ID = 1; IMG_PROFILE = dist/20217221020product-image4-1.jpg; STATEMENTTYPE = INSERT; ', N'', 39)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Category', CAST(N'2021-07-24' AS Date), CAST(N'05:00:07.7000000' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_NAME = African Food; STATEMENTTYPE = INSERT; ', N'', 40)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Category', CAST(N'2021-07-24' AS Date), CAST(N'05:00:18.7100000' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_NAME = Intercontinental Food; STATEMENTTYPE = INSERT; ', N'', 41)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Store', CAST(N'2021-07-24' AS Date), CAST(N'05:02:14.3766667' AS Time), N'C OPERATION: REC_ID = ST/0000000001; STORE_NAME = MENDELIN SHOP; BRANCH_NAME = ABUJA; STORE_ADDRESS = VERITAS UNIVERSITY; STORE_DESCRIPTION = ; USERID = 1; STATEMENTTYPE = UPDATE; ', N'', 42)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:07:33.0266667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Eba and Egwusi Soup; QUANTITY = 1; PRICE = 350; IMG_PROFILE = dist/202172457ebaandegwusi.jpg; PRODUCT_DESCRIPTION = <h1>
	<u><strong>DESCRIPTION</strong></u></h1>
<p>
	Eba and Egwusi Soup for Afternoon Meal</p>
; STATEMENTTYPE = INSERT; ', N'', 43)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:25:32.9033333' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Fufu and Egwusi Soup; QUANTITY = 1; PRICE = 400; IMG_PROFILE = dist/2021724525fufu and egwusi.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'', 44)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:27:45.5766667' AS Time), N'C OPERATION: REC_ID = PROD/0000000002; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Fufu and Egwusi Soup; QUANTITY = 1; PRICE = 400.00; IMG_PROFILE = dist/2021724527Egusi.jpeg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 45)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:29:05.5500000' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Semovita and Egwusi Soup; QUANTITY = 1; PRICE = 450; IMG_PROFILE = dist/2021724529semo.jpeg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'', 46)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:31:48.7100000' AS Time), N'C OPERATION: REC_ID = PROD/0000000003; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Semovita and Egwusi Soup; QUANTITY = 1; PRICE = 450.00; IMG_PROFILE = dist/2021724531semo.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 47)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:34:07.9266667' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Semo and Ogbolo Soup; QUANTITY = 1; PRICE = 350; IMG_PROFILE = dist/2021724534egbolo.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'', 48)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:35:06.0500000' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Eba and Ogbolo Soup; QUANTITY = 1; PRICE = 250; IMG_PROFILE = dist/2021724535ogbolo2.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = INSERT; ', N'', 49)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:48:34.4533333' AS Time), N'C OPERATION: REC_ID = PROD/0000000005; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Eba and Ogbolo Soup; QUANTITY = 1; PRICE = 250.00; IMG_PROFILE = dist/2021724548egbolo.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 50)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:49:42.1900000' AS Time), N'C OPERATION: REC_ID = PROD/0000000004; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Semo and Ogbono Soup; QUANTITY = 1; PRICE = 350.00; IMG_PROFILE = dist/2021724534egbolo.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 51)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:49:58.0933333' AS Time), N'C OPERATION: REC_ID = PROD/0000000005; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Eba and Ogbono Soup; QUANTITY = 1; PRICE = 250.00; IMG_PROFILE = dist/2021724548egbolo.jpg; PRODUCT_DESCRIPTION = ; STATEMENTTYPE = UPDATE; ', N'', 52)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:52:39.9700000' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Alloco; QUANTITY = 1; PRICE = 500; IMG_PROFILE = dist/2021724552Alloco.jpg; PRODUCT_DESCRIPTION = <p>
	Alloco African Dish</p>
; STATEMENTTYPE = INSERT; ', N'', 53)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:53:36.5033333' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Rice Meal; QUANTITY = 1; PRICE = 340; IMG_PROFILE = dist/2021724553Rice-meal.jpg; PRODUCT_DESCRIPTION = <p>
	Rice Meal Delicious African Meal</p>
; STATEMENTTYPE = INSERT; ', N'', 54)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:54:36.7633333' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Nshima Soup; QUANTITY = 1; PRICE = 400; IMG_PROFILE = dist/2021724554Nshima.jpg; PRODUCT_DESCRIPTION = <p>
	Nshima Delicious African Meal</p>
; STATEMENTTYPE = INSERT; ', N'', 55)
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_date], [log_time], [log_sql], [log_desc], [rec_id]) VALUES (N'admin', N'http://localhost/Restuarant/Product', CAST(N'2021-07-24' AS Date), CAST(N'05:55:28.5100000' AS Time), N'C OPERATION: REC_ID = ; CATEGORY_ID = 1; USERID = 1; PRODUCT_NAME = Briouat; QUANTITY = 1; PRICE = 100; IMG_PROFILE = dist/2021724555Briouat.jpg; PRODUCT_DESCRIPTION = <p>
	Briouat Delious pie</p>
; STATEMENTTYPE = INSERT; ', N'', 56)
SET IDENTITY_INSERT [dbo].[tbl_user_log] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionStock] ON 

INSERT [dbo].[TransactionStock] ([stock_id], [RetailerID], [CustomerID], [product_id], [quantity], [price], [date_sold], [time_sold], [flag_on], [stock_description], [updated_date], [updated_time], [orderID]) VALUES (1, 1, 1, 1, 1, CAST(350.00 AS Decimal(18, 2)), N'7/24/2021', N'4:09 AM', 1, N'Eba and Egwusi Soup', CAST(N'2021-07-24' AS Date), CAST(N'05:09:17.9233333' AS Time), 1)
INSERT [dbo].[TransactionStock] ([stock_id], [RetailerID], [CustomerID], [product_id], [quantity], [price], [date_sold], [time_sold], [flag_on], [stock_description], [updated_date], [updated_time], [orderID]) VALUES (2, 1, 3, 9, 1, CAST(100.00 AS Decimal(18, 2)), N'7/26/2021', N'3:46 AM', 1, N'Briouat', CAST(N'2021-07-26' AS Date), CAST(N'04:46:57.7533333' AS Time), 2)
INSERT [dbo].[TransactionStock] ([stock_id], [RetailerID], [CustomerID], [product_id], [quantity], [price], [date_sold], [time_sold], [flag_on], [stock_description], [updated_date], [updated_time], [orderID]) VALUES (3, 1, 3, 5, 1, CAST(250.00 AS Decimal(18, 2)), N'7/26/2021', N'3:46 AM', 1, N'Eba and Ogbono Soup', CAST(N'2021-07-26' AS Date), CAST(N'04:46:57.7533333' AS Time), 2)
SET IDENTITY_INSERT [dbo].[TransactionStock] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([roleID], [role_name], [updated_date], [updated_time]) VALUES (1, N'Administrator', CAST(N'2021-07-21' AS Date), CAST(N'19:53:35.9600000' AS Time))
INSERT [dbo].[UserRole] ([roleID], [role_name], [updated_date], [updated_time]) VALUES (2, N'User', CAST(N'2021-07-21' AS Date), CAST(N'19:54:04.8766667' AS Time))
INSERT [dbo].[UserRole] ([roleID], [role_name], [updated_date], [updated_time]) VALUES (3, N'COURIER', CAST(N'2021-07-21' AS Date), CAST(N'19:56:26.0466667' AS Time))
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([roleID], [userID], [fullname], [username], [userpassword], [email], [telephone], [updated_date], [updated_time]) VALUES (1, 1, N'JOHNWNDY NEDDY', N'admin', N'mmPnx9f3lWlheMlx2D13dw==', N'admin@gmail.com', N'07031268439', CAST(N'2021-07-21' AS Date), CAST(N'19:55:16.5233333' AS Time))
INSERT [dbo].[Users] ([roleID], [userID], [fullname], [username], [userpassword], [email], [telephone], [updated_date], [updated_time]) VALUES (2, 2, N'BERLIN', N'user', N'mmPnx9f3lWlheMlx2D13dw==', N'user@gmail.com', N'08033925178', CAST(N'2021-07-21' AS Date), CAST(N'19:58:48.7400000' AS Time))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[CustomerUsers] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[CustomerUsers] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[ProductColor] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[ProductColor] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[ProductSize] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[ProductSize] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[Store] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Store] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_date]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_time]
GO
ALTER TABLE [dbo].[TransactionStock] ADD  DEFAULT ((0)) FOR [flag_on]
GO
ALTER TABLE [dbo].[TransactionStock] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[TransactionStock] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[UserRole] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[UserRole] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[CustomerUsers]  WITH CHECK ADD  CONSTRAINT [fksRoleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[UserRole] ([roleID])
GO
ALTER TABLE [dbo].[CustomerUsers] CHECK CONSTRAINT [fksRoleID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fkProductCategoryID] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fkProductCategoryID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fkUserIDProduct] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fkUserIDProduct]
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [fkProductColor] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [fkProductColor]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [fkProductImageProductID] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [fkProductImageProductID]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [fkSizeID] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [fkSizeID]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [fkUserIDStore] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [fkUserIDStore]
GO
ALTER TABLE [dbo].[TransactionStock]  WITH CHECK ADD  CONSTRAINT [fkCustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerUsers] ([userID])
GO
ALTER TABLE [dbo].[TransactionStock] CHECK CONSTRAINT [fkCustomerID]
GO
ALTER TABLE [dbo].[TransactionStock]  WITH CHECK ADD  CONSTRAINT [fkProductStockID] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[TransactionStock] CHECK CONSTRAINT [fkProductStockID]
GO
ALTER TABLE [dbo].[TransactionStock]  WITH CHECK ADD  CONSTRAINT [fkRetailerID] FOREIGN KEY([RetailerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[TransactionStock] CHECK CONSTRAINT [fkRetailerID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fkRoleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[UserRole] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fkRoleID]
GO
/****** Object:  StoredProcedure [dbo].[CRUDCategory]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDCategory](@rec_id varchar(200), @category_name varchar(200),@StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
insert into category(category_name) values(@category_name)
IF @StatementType='UPDATE'
UPDATE category SET category_name=@category_name where rec_id=@rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDCustomerUsers]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDCustomerUsers](@rec_id varchar(200), @roleID varchar(200), @fullname varchar(400), @username varchar(200), @userpassword varchar(200),
@email varchar(200), @telephone varchar(20), @StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
insert into CustomerUsers(roleID, fullname, username,userpassword , email, telephone) values (@roleID, @fullname, @username,@userpassword , @email, @telephone)
IF @StatementType='UPDATE'
UPDATE CustomerUsers set roleID=@roleID, fullname=@fullname, username=@username,userpassword=@userpassword , 
email=@email, telephone=@telephone where rec_id=@rec_id

END
GO
/****** Object:  StoredProcedure [dbo].[CRUDProduct]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CRUDProduct](@rec_id varchar(200), @category_id varchar(200), @UserID varchar(200),
@product_name varchar(200), @Quantity varchar(200), @price varchar(200),
@img_profile varchar(200), @product_description varchar(max), @StatementType varchar(200)) as
BEGIN
if @StatementType='INSERT'
insert into Product( category_id, UserID, product_name,Quantity,price,img_profile,product_description) values (@category_id,@UserID, @product_name,@Quantity,@price,@img_profile,@product_description)
if @StatementType='UPDATE'
UPDATE Product SET category_id= @category_id, UserID=@UserID,
product_name=@product_name,Quantity=@Quantity,price=@price,img_profile=@img_profile,product_description=@product_description
WHERE rec_id=@rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDProductColor]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDProductColor](@rec_id varchar(200), @product_id varchar(200),@color_name varchar(200),
@StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
INSERT INTO ProductColor(product_id,color_name) values (@product_id,@color_name)
if @StatementType='UPDATE'
update ProductColor set product_id=@product_id,color_name=@color_name where rec_id=@rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDProductImage]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDProductImage](@rec_id varchar(200), @product_id varchar(200), 
@img_profile varchar(200), @StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
insert into ProductImage(product_id, img_profile) values (@product_id, @img_profile)
if @StatementType='UPDATE'
UPDATE ProductImage set product_id=@product_id, img_profile=@img_profile WHERE rec_id=@rec_id

END
GO
/****** Object:  StoredProcedure [dbo].[CRUDProductSize]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDProductSize](@rec_id varchar(200), @product_id varchar(200),@size_name varchar(200),
@StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
INSERT INTO ProductSize(product_id,size_name) values (@product_id,@size_name)
if @StatementType='UPDATE'
update ProductSize set product_id=@product_id,size_name=@size_name where rec_id=@rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDStore]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDStore](@rec_id varchar(200), @store_name varchar(200),
@branch_name varchar(200), @store_address varchar(max), @store_description varchar(max),
@userID varchar(200), @StatementType varchaR(200)) AS 
begin
if @StatementType='INSERT'
INSERT INTO Store(store_name,branch_name, store_address, store_description, userID)
VALUES (@store_name,@branch_name, @store_address, @store_description, @userID)
IF @StatementType='UPDATE'
update Store set store_name=@store_name,branch_name=@branch_name, store_address=@store_address, store_description=@store_description,
userID=@userID where rec_id=@rec_id

end
GO
/****** Object:  StoredProcedure [dbo].[CRUDTransactionStock]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDTransactionStock](@rec_id VARCHAR(200),@RetailerID varchar(200), @CustomerID varchar(200),
@product_id varchar(200), @quantity varchar(200),@price varchar(200), @date_sold varchar(200),@time_sold varchar(200),
@flag_on varchar(200), @stock_description VARCHAR(MAX), @StatementType varchar(200)
) as 
BEGIN
if @StatementType='INSERT'
INSERT INTO TransactionStock(RetailerID,CustomerID, product_id, quantity, price, date_sold, time_sold, flag_on, stock_description)
VALUES (@RetailerID,@CustomerID, @product_id, @quantity, @price, @date_sold, @time_sold, @flag_on, @stock_description)
if @StatementType='UPDATE'
UPDATE TransactionStock SET RetailerID=@RetailerID,CustomerID=@CustomerID, product_id=@product_id, 
quantity=@quantity, price=@price, date_sold=@date_sold, time_sold=@time_sold,
flag_on=@flag_on, stock_description=@stock_description where rec_id=@rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDUserRole]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDUserRole](@rec_id varchar(200), @role_name varchar(200), @StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
insert into UserRole(role_name) values(@role_name)
if @StatementType='UPDATE'
update UserRole set role_name=@role_name where rec_id=@rec_id
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDUsers]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDUsers](@rec_id varchar(200), @roleID varchar(200), @fullname varchar(400), @username varchar(200), @userpassword varchar(200),
@email varchar(200), @telephone varchar(20), @StatementType varchar(200)) as 
BEGIN
IF @StatementType='INSERT'
insert into Users(roleID, fullname, username,userpassword , email, telephone) values (@roleID, @fullname, @username,@userpassword , @email, @telephone)
IF @StatementType='UPDATE'
UPDATE Users set roleID=@roleID, fullname=@fullname, username=@username,userpassword=@userpassword , 
email=@email, telephone=@telephone where rec_id=@rec_id

END
GO
/****** Object:  StoredProcedure [dbo].[GetAudit]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAudit](@StartIndex int, @PageSize int,
@TotalCount int output) as 
BEGIN
SELECT @TotalCount=count(1) from qry_AuditLog;
WITH CTE AS 
(
select top(@StartIndex  + @PageSize -1)RowNumber, UserName as [User Name],
LogUrl as [Log Url], LogSQL as [Log SQL], LogDate as [Log Date],
LogTime as [Log Time]
from qry_AuditLog 
)
select * from CTE where RowNumber between @StartIndex 

AND  (@StartIndex  + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCategory] (@StartIndex int, @PageSize int, @TotalCount int output) as 
BEGIN
SELECT @TotalCount=count(1) from qry_category;
WITH CTE AS 
(
SELECT TOP (@StartIndex  + @PageSize -1) RowNumber, RecID, 
CategoryName as [Category Name], UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time]
FROM qry_category
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
GO
/****** Object:  StoredProcedure [dbo].[GetColor]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetColor](@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN
select @TotalCount=count(1) from qry_Color;
WITH CTE AS
(
SELECT top(@StartIndex + @PageSize -1) RowNumber, RecID, ProductID, ProductName as [Product Name], Color,
UpdatedDate as [Updated Date], UpdatedTime as [Updated Time]
from qry_Color where UserID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerUser]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCustomerUser](@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN
SELECT @TotalCount=COUNT(1) from qry_CustomerUser;
WITH CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber,	RecID, RoleName, FullNames, UserName, [User Password], [Email Address], [Telephone Number],
UpdatedDate as [Updated Date], UpdatedTime as [Updated Time]
from qry_CustomerUser where UserID=@Search
)
select * from CTE where RowNumber between @StartIndex AND  (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetImage]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetImage](@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN
SELECT @TotalCount=COUNT(1) from qry_Image;
with CTE AS 
(
select top(@StartIndex  + @PageSize -1) RowNumber, RecID, ProductID, ProductName as [Product Name],
ImagProfile as [Image Profile],  UpdatedDate as [Updated Date], UpdatedTime as [Updated Time] 
from qry_Image where UserID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
END
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetProduct](@StartIndex int, @PageSize int, @TotalCount int output,@Search int) as 
begin
SELECT @TotalCount=count(1) from qry_Product;
WITH CTE AS
(
select top(@StartIndex  + @PageSize -1)RowNumber,  RecID, ProductID, RetailerName,
CategoryName as [Category Name], ProductName as [Product Name]
, Quantity, Price, ProductDescription as [Product Description], ImgProfile as [Img Profile],
UpdatedDate as [Updated Date], UpdatedTime as 
[Updated Time] from qry_Product where Quantity >0  AND UserID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetProductByCategory]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetProductByCategory](@StartIndex int, @PageSize int, @TotalCount int output, @Search varchar(max)) as 
BEGIN

SELECT @TotalCount=count(1) from qry_Product;
WITH CTE AS
(
select top(@StartIndex  + @PageSize -1)RowNumber,fms.score,  RecID, ProductID,
CategoryName as [Category Name], ProductName as [Product Name]
, Quantity, Price, ProductDescription as [Product Description],ImgProfile as [Img Profile], UpdatedDate as [Updated Date], UpdatedTime as 
[Updated Time], SOUNDEX(ProductName + CategoryName) AS SoundexCode from qry_Product CROSS APPLY(select dbo.FuzzyMatchString(@Search, ProductName + CategoryName) AS score) AS fms ORDER by fms.score desc  

)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetProductForCustomer]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetProductForCustomer](@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
SELECT @TotalCount=count(1) from qry_Product;
WITH CTE AS
(
select top(@StartIndex  + @PageSize -1)RowNumber,  RecID,ProductID, RetailerName,
CategoryName as [Category Name], ProductName as [Product Name]
, Quantity, Price, ProductDescription as [Product Description], ImgProfile as [Img Profile],
UpdatedDate as [Updated Date], UpdatedTime as 
[Updated Time] from qry_Product where Quantity >0  
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetSize]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetSize] (@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN
select @TotalCount=count(1) from qry_size;
WITH CTE AS 
(
SELECT top(@StartIndex + @PageSize -1) RowNumber, RecID, ProductID, ProductName as [Product Name], Size, UpdatedDate as 
[Updated Date], UpdatedTime as [Updated Time] from qry_size where UserID=@Search
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetStore]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetStore] (@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN
select @TotalCount=count(1) from qry_Store;
WITH CTE AS 
(
select top(@StartIndex  + @PageSize -1)RowNumber, RecID, FullName as [Full Names],
Email as [Email Address], TelephoneNo as [Telephone Number], StoreName as [Store Name],
BranchName as [Branch Name], StoreAddress as [Store Address], StoreDescription as [Store Description], 
UpdatedDate as [Updated Date], UpdatedTime as [Updated Time] from qry_Store where UserID=@Search
)
select * from CTE WHERE RowNumber between @StartIndex AND  (@StartIndex + @PageSize -1)
END
GO
/****** Object:  StoredProcedure [dbo].[GetTopProduct]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTopProduct] as 
begin
SELECT TOP 100 * from qry_product

end
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionStockForCustomer]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTransactionStockForCustomer](@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN 
SELECT @TotalCount=count(1) from qry_transaction;
WITH CTE AS 
(
SELECT TOP(@StartIndex + @PageSize -1)RowNumber,
RecID, case when Remark=1 THEN 'Payment Complete' when Remark=0
then 'Payment Pending' else 'Payment Complete' end as Remark, 
RetailerName as [Retailer Name], RetailerEmail as [Retailer Email],
RetailerTelephone as [Retailer Telephone], ConsumerName as [Consumer Name],
ConsumerEmail as [Consumer Email], ConsumerTelephone as [Consumer Telephone], ProductRecID, ProductName, Quantity as Quantity, PriceSold as [Price Sold], DateSold as
[Date Sold], TimeSold as [Time Sold], UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time]
FROM qry_transaction WHERE ConsumerID=@Search

)
select * from CTE where RowNumber between @StartIndex AND 
(@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionStockForRetailer]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTransactionStockForRetailer](@StartIndex int, @PageSize int, @TotalCount int output, @Search int) as 
BEGIN 
SELECT @TotalCount=count(1) from qry_transaction;
WITH CTE AS 
(
SELECT TOP(@StartIndex + @PageSize -1)RowNumber,
RecID, case when Remark=1 THEN 'Payment Complete' when Remark=0
then 'Payment Pending' else 'Payment Complete' end as Remark, 
RetailerName as [Retailer Name], RetailerEmail as [Retailer Email],
RetailerTelephone as [Retailer Telephone], ConsumerName as [Consumer Name],
ConsumerEmail as [Consumer Email], ConsumerTelephone as [Consumer Telephone],ProductRecID, ProductName,
Quantity as Quantity, PriceSold as [Price Sold], DateSold as
[Date Sold], TimeSold as [Time Sold], UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time]
FROM qry_transaction WHERE RetailerID=@Search

)
select * from CTE where RowNumber between @StartIndex AND 
(@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUser](@StartIndex int, @PageSize int, @TotalCount int output) as 
BEGIN
SELECT @TotalCount=COUNT(1) from qry_User;
WITH CTE AS 
(
select top (@StartIndex + @PageSize -1) RowNumber,	RecID, RoleName, FullNames, UserName, [User Password], [Email Address], [Telephone Number],
UpdatedDate as [Updated Date], UpdatedTime as [Updated Time]
from qry_User
)
select * from CTE where RowNumber between @StartIndex AND  (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetUserRole]    Script Date: 02/09/2021 4:15:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserRole](@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from qry_Role;
with CTE AS 
(
select top(@StartIndex  + @PageSize -1)RowNumber, RecID, RoleName, UpdatedDate AS [Updated Date], UpdatedTime as [Updated Time] from qry_Role

)
select * from CTE WHERE RowNumber between @StartIndex AND (@StartIndex  + @PageSize - 1)

end
GO
