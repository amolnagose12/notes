/*
1.	TRY.... CATCH
2.	TRY.... CATCH ... THROW

3.	CLONE A TABLE

4.	USER DEFINED DATA TYPE

5.	TABLE VALUED PARAMETERS (TVP)
6.	READONLY PARAMETERS
7.	OUTPUT PARAMETERS
*/

-- TRY		: THIS STATEMENT IS USED TO DETECT THE ERROR, IF ANY.
-- CATCH	: THIS STATEMENT IS USED TO HANDLE THE ERROR FROM THE ABOVE "TRY" BLOCK.
-- THROW	: THIS STATEMENT IS USED TO REPORT THE ACTUAL ERROR FROM THE "TRY" BLOCK.


-- EXAMPLE 1:				REPORTS ERROR						
DECLARE @VAR1 INT
SET @VAR1 = 'ABC'
SELECT @VAR1 

-- EXAMPLE 2:				REPORTS MESSAGE
BEGIN TRY					-- IF THERE IS ANY ERROR INSIDE THE TRY BLOCK THEN CATCH BLOCK IS AUTO EXECUTED. 
DECLARE @VAR1 INT
SET @VAR1 = 'ABC'
SELECT @VAR1 
END TRY
BEGIN CATCH
PRINT 'ERROR DURING SQL BATCH EXECUTION'
END CATCH

-- EXAMPLE 3:				REPORTS ERROR  + REPORTS MESSAGE
BEGIN TRY
DECLARE @VAR1 INT
SET @VAR1 = 'ABC'
SELECT @VAR1 
END TRY
BEGIN CATCH
PRINT 'ERROR DURING SQL BATCH EXECUTION'
;THROW
END CATCH






create database DB_BANK
GO
use DB_BANK
go

CREATE TABLE [dbo].[Product](
	[ProductKey] [int]  PRIMARY KEY,
	[ProductLabel] [nvarchar](255) NULL,
	[ProductName] [nvarchar](500) NULL,
	[ProductDescription] [nvarchar](400) NULL,
	[ProductSubcategoryKey] [int] NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[BrandName] [nvarchar](50) NULL,
	[ClassID] [nvarchar](10) NULL,
	[ClassName] [nvarchar](20) NULL,
	[StyleID] [nvarchar](10) NULL,
	[StyleName] [nvarchar](20) NULL,
	[ColorID] [nvarchar](10) NULL,
	[ColorName] [nvarchar](20) NOT NULL,
	[Size] [nvarchar](50) NULL,
	[SizeRange] [nvarchar](50) NULL,
	[SizeUnitMeasureID] [nvarchar](20) NULL,
	[Weight] [float] NULL,
	[WeightUnitMeasureID] [nvarchar](20) NULL,
	[UnitOfMeasureID] [nvarchar](10) NULL,
	[UnitOfMeasureName] [nvarchar](40) NULL,
	[StockTypeID] [nvarchar](10) NULL,
	[StockTypeName] [nvarchar](40) NULL,
	[UnitCost] [money] NULL,
	[UnitPrice] [money] NULL,
	[AvailableForSaleDate] [datetime] NULL,
	[StopSaleDate] [datetime] NULL,
	[Status] [nvarchar](7) NULL,
	[ImageURL] [nvarchar](150) NULL,
	[ProductURL] [nvarchar](150) NULL,
	[ETLLoadID] [int] NULL,
	[LoadDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
)


INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (1, N'0101001', N'Contoso 512MB MP3 Player E51 Silver', N'512MB USB driver plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101001', N'7', N'Silver', N'2.2 x 1.8 x 4 ', N' ', N' ', 4.8, N'ounces', N'1', N'inches', N'1', N'High', 6.6200, 12.9900, CAST(N'2005-05-03 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-05-25 08:01:12.000' AS DateTime), CAST(N'2008-05-25 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (2, N'0101002', N'Contoso 512MB MP3 Player E51 Blue', N'512MB USB driver plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'5', N'Product0101002', N'3', N'Blue', N'2.2 x 1.8 x 4 ', N' ', N' ', 4.1, N'ounces', N'1', N'inches', N'1', N'High', 6.6200, 12.9900, CAST(N'2005-05-03 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-05-26 08:01:12.000' AS DateTime), CAST(N'2008-05-26 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (3, N'0101003', N'Contoso 1G MP3 Player E100 White', N'1GB flash memory and USB driver plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101003', N'8', N'White', N'2.2  x 2.2  x 4 ', N' ', N' ', 4.5, N'ounces', N'1', N'inches', N'2', N'Mid', 7.4000, 14.5200, CAST(N'2006-05-13 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-05-27 08:01:12.000' AS DateTime), CAST(N'2008-05-27 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (4, N'0101004', N'Contoso 2G MP3 Player E200 Silver', N'2GB flash memory, LCD display, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101004', N'7', N'Silver', N'2.2  x 2.2  x 4 ', N' ', N' ', 4.5, N'ounces', N'1', N'inches', N'2', N'Mid', 11.0000, 21.5700, CAST(N'2006-12-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-05-28 08:01:12.000' AS DateTime), CAST(N'2008-05-28 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (5, N'0101005', N'Contoso 2G MP3 Player E200 Red', N'2GB flash memory, LCD display, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101005', N'6', N'Red', N'3.7 x 0.6 x 2.2', N' ', N' ', 2.4, N'ounces', N'1', N'inches', N'2', N'Mid', 11.0000, 21.5700, CAST(N'2006-12-17 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-05-29 08:01:12.000' AS DateTime), CAST(N'2008-05-29 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (6, N'0101006', N'Contoso 2G MP3 Player E200 Black', N'2GB flash memory, LCD display, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'2', N'Product0101006', N'2', N'Black', N'1.6 x 0.4 x 3.7', N' ', N' ', 8.8, N'ounces', N'1', N'inches', N'2', N'Mid', 11.0000, 21.5700, CAST(N'2006-12-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-05-30 08:01:12.000' AS DateTime), CAST(N'2008-05-30 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (7, N'0101007', N'Contoso 2G MP3 Player E200 Blue', N'2GB flash memory, LCD display, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101007', N'3', N'Blue', N'2.2 x 1.5 x 0.6 ', N' ', N' ', 2.1, N'ounces', N'1', N'inches', N'2', N'Mid', 11.0000, 21.5700, CAST(N'2006-12-19 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-05-31 08:01:12.000' AS DateTime), CAST(N'2008-05-31 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (8, N'0101008', N'Contoso 4G MP3 Player E400 Silver', N'4GB flash memory and FM Radio, LCD Display with 7-Color Backlight, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'2', N'Product0101008', N'7', N'Silver', N'0.8 x 3.6 x 1.1', N' ', N' ', 5.6, N'ounces', N'1', N'inches', N'2', N'Mid', 30.5800, 59.9900, CAST(N'2007-04-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-01 08:01:12.000' AS DateTime), CAST(N'2008-06-01 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (9, N'0101009', N'Contoso 4G MP3 Player E400 Black', N'4GB flash memory and FM Radio, LCD Display with 7-Color Backlight, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101009', N'2', N'Black', N'3.1 x 1.9 x 0.3', N' ', N' ', 2.1, N'ounces', N'1', N'inches', N'2', N'Mid', 30.5800, 59.9900, CAST(N'2007-04-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-02 08:01:12.000' AS DateTime), CAST(N'2008-06-02 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (10, N'0101010', N'Contoso 4G MP3 Player E400 Green', N'4GB flash memory and FM Radio, LCD Display with 7-Color Backlight, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101010', N'14', N'Green', N'2.3 x 0.3 x 4', N' ', N' ', 11, N'ounces', N'1', N'inches', N'2', N'Mid', 30.5800, 59.9900, CAST(N'2007-04-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-03 08:01:12.000' AS DateTime), CAST(N'2008-06-03 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (11, N'0101011', N'Contoso 4G MP3 Player E400 Orange', N'4GB flash memory and FM Radio, LCD Display with 7-Color Backlight, plays MP3 and WMA', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101011', N'9', N'Orange', N'2.2 x 0.6 x 1.4', N' ', N' ', 14.1, N'ounces', N'1', N'inches', N'2', N'Mid', 30.5800, 59.9900, CAST(N'2007-04-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-04 08:01:12.000' AS DateTime), CAST(N'2008-06-04 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (12, N'0101012', N'Contoso 4GB Flash MP3 Player E401 Blue', N'1.8'''' color LCD, play MP3, WMA and Video MTV, and share JPG', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'3', N'Product0101012', N'3', N'Blue', N'0.8 x 3.6 x 1.1', N' ', N' ', 7.4, N'ounces', N'1', N'inches', N'2', N'Mid', 35.7200, 77.6800, CAST(N'2007-06-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-05 08:01:12.000' AS DateTime), CAST(N'2008-06-05 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (13, N'0101013', N'Contoso 4GB Flash MP3 Player E401 Black', N'1.8'''' color LCD, play MP3, WMA and Video MTV, and share JPG', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'4', N'Product0101013', N'2', N'Black', N'1.7 x 3.5 x 0.5', N' ', N' ', 2.6, N'ounces', N'1', N'inches', N'2', N'Mid', 35.7200, 77.6800, CAST(N'2007-06-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-06 08:01:12.000' AS DateTime), CAST(N'2008-06-06 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (14, N'0101014', N'Contoso 4GB Flash MP3 Player E401 Silver', N'1.8'''' color LCD, play MP3, WMA and Video MTV, and share JPG', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'1', N'Product0101014', N'7', N'Silver', N'0.4 x 1.6 x 3.6', N' ', N' ', 8, N'ounces', N'1', N'inches', N'2', N'Mid', 35.7200, 77.6800, CAST(N'2007-06-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-07 08:01:12.000' AS DateTime), CAST(N'2008-06-07 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (15, N'0101015', N'Contoso 4GB Flash MP3 Player E401 White', N'1.8'''' color LCD, play MP3, WMA and Video MTV, and share JPG', 1, N'Contoso, Ltd', N'Contoso', N'1', N'Economy', N'4', N'Product0101015', N'8', N'White', N'3.26 x 2.16 x .44', N' ', N' ', 2.1, N'ounces', N'1', N'inches', N'2', N'Mid', 35.7200, 77.6800, CAST(N'2007-06-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-08 08:01:12.000' AS DateTime), CAST(N'2008-06-08 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (16, N'0101016', N'Contoso 8GB Super-Slim MP3/Video Player M800 White', N'2" color LCD, Touchpad, Plays music, video, photos and text', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'3', N'Product0101016', N'8', N'White', N'3.8 x 0.6 x 2.2', N' ', N' ', 11, N'ounces', N'1', N'inches', N'2', N'Mid', 50.5600, 109.9500, CAST(N'2008-01-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-09 08:01:12.000' AS DateTime), CAST(N'2008-06-09 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (17, N'0101017', N'Contoso 8GB Super-Slim MP3/Video Player M800 Red', N'2" color LCD, Touchpad, Plays music, video, photos and text', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'1', N'Product0101017', N'6', N'Red', N'3.8 x 0.6 x 2.2', N' ', N' ', 11, N'ounces', N'1', N'inches', N'2', N'Mid', 50.5600, 109.9500, CAST(N'2008-01-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-10 08:01:12.000' AS DateTime), CAST(N'2008-06-10 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (18, N'0101018', N'Contoso 8GB Super-Slim MP3/Video Player M800 Green', N'2" color LCD, Touchpad, Plays music, video, photos and text', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'3', N'Product0101018', N'14', N'Green', N'3.1 x 1.9 x 0.3', N' ', N' ', 2.1, N'ounces', N'1', N'inches', N'2', N'Mid', 50.5600, 109.9500, CAST(N'2008-01-16 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-06-11 08:01:12.000' AS DateTime), CAST(N'2008-06-11 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (41, N'0101041', N'Contoso 16GB New Generation MP5 Player M1650 Silver', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'1', N'Product0101041', N'7', N'Silver', N'2.4 x 0.3 x 4.1', N' ', N' ', 8, N'ounces', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-04 08:01:12.000' AS DateTime), CAST(N'2008-07-04 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (42, N'0101042', N'Contoso 16GB New Generation MP5 Player M1650 White', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'1', N'Product0101042', N'8', N'White', N'12.9 x 61.1 x 108.2', N' ', N' ', 12, N'ounces', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-05 08:01:12.000' AS DateTime), CAST(N'2008-07-05 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (43, N'0101043', N'Contoso 16GB New Generation MP5 Player M1650 Black', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'1', N'Product0101043', N'2', N'Black', N'2.2 x 0.6 x 1.4', N' ', N' ', 14.1, N'ounces', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-06 08:01:12.000' AS DateTime), CAST(N'2008-07-06 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (44, N'0101044', N'Contoso 16GB New Generation MP5 Player M1650 blue', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'1', N'Product0101044', N'3', N'blue', N'2.2 x 1.8 x 4', N' ', N' ', 1, N'pounds', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-07 08:01:12.000' AS DateTime), CAST(N'2008-07-07 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (45, N'0101045', N'Contoso 16GB New Generation MP5 Player M1650 Pink', N'2.4'''' LCD Touch screen, 8GB flash memory, plays music, video, photos and text, share JPEG, BMP, GIF, TIFF', 1, N'Contoso, Ltd', N'Contoso', N'2', N'Regular', N'4', N'Product0101045', N'10', N'Pink', N'4.1 x 2.4 x 0.4', N' ', N' ', 5, N'ounces', N'1', N'inches', N'2', N'Mid', 106.6900, 232.0000, CAST(N'2009-04-18 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-07-08 08:01:12.000' AS DateTime), CAST(N'2008-07-08 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (46, N'0104001', N'WWI 1GB Pulse Smart pen E50 White', N'Record and link audio to be written, listen to recordings, share notes and recording with computer', 4, N'Wide World Importers', N'Wide World Importers', N'1', N'Economy', N'1', N'Product0104001', N'8', N'White', N'6 x 0.5 x 0.5', N' ', N' ', 1.3, N'ounces', N'1', N'inches', N'1', N'High', 76.4500, 149.9500, CAST(N'2006-05-12 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-09-06 08:01:12.000' AS DateTime), CAST(N'2008-09-06 08:01:12.000' AS DateTime))
INSERT [dbo].[Product] ([ProductKey], [ProductLabel], [ProductName], [ProductDescription], [ProductSubcategoryKey], [Manufacturer], [BrandName], [ClassID], [ClassName], [StyleID], [StyleName], [ColorID], [ColorName], [Size], [SizeRange], [SizeUnitMeasureID], [Weight], [WeightUnitMeasureID], [UnitOfMeasureID], [UnitOfMeasureName], [StockTypeID], [StockTypeName], [UnitCost], [UnitPrice], [AvailableForSaleDate], [StopSaleDate], [Status], [ImageURL], [ProductURL], [ETLLoadID], [LoadDate], [UpdateDate]) VALUES (47, N'0104002', N'WWI 1GBPulse Smart pen E50 Black', N'Record and link audio to be written, listen to recordings, share notes and recording with computer', 4, N'Wide World Importers', N'Wide World Importers', N'1', N'Economy', N'5', N'Product0104002', N'2', N'Black', N'6 x 0.5 x 0.5', N' ', N' ', 2.2, N'ounces', N'1', N'inches', N'1', N'High', 76.4500, 149.9500, CAST(N'2006-05-12 00:00:00.000' AS DateTime), NULL, N'On', NULL, NULL, 1, CAST(N'2008-09-07 08:01:12.000' AS DateTime), CAST(N'2008-09-07 08:01:12.000' AS DateTime))
GO


SELECT * FROM Product

SELECT ProductKey, ClassName, ColorName, UnitPrice FROM Product ;

		
-- HOW TO COPY THE STRUCTURE OF ONE TABLE TO ANOTHER?
-- CLONING IS A MECHANISM TO COPY TABLE STRUCTURE & PROPERTIES FROM ONE TABLE TO ANOTHER
SELECT * FROM tblProduct_Clone		-- ERROR 

SELECT TOP 0 ProductKey, ProductName, ClassName, UnitPrice INTO tblProduct_Clone FROM Product  -- table is auto created. 

select * from tblProduct_Clone		-- NO ERROR



-- HOW TO CREATE NEW, USER DEFINED DATA TYPES IN A DATABASE?
-- FOR EASE OF USE. REUSABILITY OF STRUCTURE.

CREATE TYPE	MyTableValueType 
AS TABLE
( 
	ProductKey int,
	ProductName varchar(90),
	ClassName VARCHAR(50),
	UnitPrice INT 
); 

GO

CREATE PROC uspPopulateTabDat (@TableValueParam MyTableValueType READONLY) -- THIS PARAMETER VALUE CANNOT BE MODIFIED WITHIN THE SP
AS
BEGIN
BEGIN TRY
	INSERT INTO tblProduct_Clone SELECT *  FROM @TableValueParam
END TRY
BEGIN CATCH
	PRINT 'ERROR DURING TVP EXECUTION'
	;THROW				-- this statement is used to report the error, if any. 
END CATCH
END


-- HOW TO EXECUTE ABOVE STORED PROCEDURE?
DECLARE @varForProcCall MyTableValueType			-- THIS IS A TABLE VARIABLE. TO EXTRACT DATA FROM THE SOURCE TABLE.
INSERT INTO @varForProcCall	SELECT ProductKey,  ProductName, ClassName,UnitPrice FROM Product  
EXEC uspPopulateTabDat @varForProcCall

select * from tblProduct_Clone

-- WORKFLOW :	SOURCE TABLE >  TABLE VARIABLE   > PARAMETER FOR THE STORED PROCEDURE  > INSERT DATA INTO THE CLONE TABLE


SELECT * FROM tblProduct_Clone







-- OUTPUT PARAMETERS  : SUCH PARAMETERS IN STORED PROCEDURES TO RETURN ONE OR MORE VALUES. 

CREATE PROCEDURE usp_rCount (@price int, @rcount int OUT)
AS
	BEGIN
	SELECT * FROM Product WHERE UNITPRICE  > @price
	SELECT @rcount = COUNT(*)  FROM Product WHERE UNITPRICE  > @price
	END


-- HOW TO EXECUTE ABOVE SP?
DECLARE @OUTPUT_VARIABLE INT
EXEC usp_rCount 10, @OUTPUT_VARIABLE OUT
SELECT @OUTPUT_VARIABLE AS rCount









