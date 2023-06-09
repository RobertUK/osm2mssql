SET NOCOUNT ON
--IF EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Cities') drop table info.Cities 
--IF EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Roads') drop table info.Roads
--IF EXISTS(SELECT 1 FROM SYS.TABLES where name = 'AdminLevels') drop table info.AdminLevels

IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idxTagType')  CREATE NONCLUSTERED INDEX idxTagType ON [TagType] ([Name])
IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idxWayTagTyp') CREATE NONCLUSTERED INDEX idxWayTagTyp ON [WayTag] ([Typ]) INCLUDE ([WayId],[Info])
IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idxRelationTagTyp') CREATE NONCLUSTERED INDEX idxRelationTagTyp ON [RelationTag] ([Typ]) INCLUDE ([RelationId],[Info])
IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idxNodeTagTyp') CREATE NONCLUSTERED INDEX idxNodeTagTyp ON [dbo].[NodeTag] ([Typ]) INCLUDE ([NodeId],[Info])

IF NOT EXISTS(SELECT 1 FROM SYS.SCHEMAS where name = 'info')  exec('CREATE schema info');

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'AdminLevels') 
CREATE TABLE [info].[AdminLevels](
	[RelationId] [bigint] NOT NULL,
	[AdminLevel] [int] NULL,
	[Geo] [geography] NULL,
	[Name] [nvarchar](max) NULL,
	[Place] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[idx] [bigint] NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
 CONSTRAINT [PK_AdminLevels] PRIMARY KEY CLUSTERED 
(
	[RelationId] ASC
))

IF EXISTS(SELECT 1 FROM SYS.TABLES where name = 'UnitsConversion') 
DROP TABLE UnitsConversion
CREATE TABLE [dbo].[UnitsConversion](
	[UnitsConversionId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[FromUnit] [nvarchar](50) NOT NULL,
	[ToUnit] [nvarchar](50) NOT NULL,
	[ScaleFactor] [float] NOT NULL,
 CONSTRAINT [PK_UnitsConversion] PRIMARY KEY CLUSTERED 
(
	[UnitsConversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UnitsConversion] ON 
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1, N'Length', N'Kilometer', N'Meter', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (2, N'Length', N'Kilometer', N'Centimeter', 100000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (3, N'Length', N'Kilometer', N'Millimeter', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (4, N'Length', N'Kilometer', N'Mile', 0.62137097120285034)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (5, N'Length', N'Kilometer', N'Yard', 1093.6099853515625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (6, N'Length', N'Kilometer', N'Foot', 3280.840087890625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (7, N'Length', N'Kilometer', N'Inch', 39370.1015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (8, N'Length', N'Kilometer', N'Nautical mile', 0.53995698690414429)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (9, N'Length', N'Meter', N'Kilometer', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (10, N'Length', N'Meter', N'Centimeter', 100)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (11, N'Length', N'Meter', N'Millimeter', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (12, N'Length', N'Meter', N'Mile', 0.00062137097120285034)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (13, N'Length', N'Meter', N'Yard', 1.0936100482940674)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (14, N'Length', N'Meter', N'Foot', 3.2808399200439453)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (15, N'Length', N'Meter', N'Inch', 39.370098114013672)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (16, N'Length', N'Meter', N'Nautical mile', 0.00053995702182874084)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (17, N'Length', N'Centimeter', N'Kilometer', 9.9999997473787516E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (18, N'Length', N'Centimeter', N'Meter', 0.0099999997764825821)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (19, N'Length', N'Centimeter', N'Millimeter', 10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (20, N'Length', N'Centimeter', N'Mile', 6.2137000895745587E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (21, N'Length', N'Centimeter', N'Yard', 0.010936100035905838)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (22, N'Length', N'Centimeter', N'Foot', 0.032808400690555573)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (23, N'Length', N'Centimeter', N'Inch', 0.3937009871006012)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (24, N'Length', N'Centimeter', N'Nautical mile', 5.3996000133338384E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (25, N'Length', N'Millimeter', N'Kilometer', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (26, N'Length', N'Millimeter', N'Meter', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (27, N'Length', N'Millimeter', N'Centimeter', 0.10000000149011612)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (28, N'Length', N'Millimeter', N'Mile', 6.2137002032613964E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (29, N'Length', N'Millimeter', N'Yard', 0.0010936099570244551)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (30, N'Length', N'Millimeter', N'Foot', 0.003280840115621686)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (31, N'Length', N'Millimeter', N'Inch', 0.0393701009452343)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (32, N'Length', N'Millimeter', N'Nautical mile', 5.3996001270206762E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (33, N'Length', N'Mile', N'Kilometer', 1.6093399524688721)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (34, N'Length', N'Mile', N'Meter', 1609.3399658203125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (35, N'Length', N'Mile', N'Centimeter', 160934)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (36, N'Length', N'Mile', N'Millimeter', 1609000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (37, N'Length', N'Mile', N'Yard', 1760)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (38, N'Length', N'Mile', N'Foot', 5280)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (39, N'Length', N'Mile', N'Inch', 63360)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (40, N'Length', N'Mile', N'Nautical mile', 0.86897599697113037)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (41, N'Length', N'Yard', N'Kilometer', 0.000914399977773428)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (42, N'Length', N'Yard', N'Meter', 0.91439998149871826)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (43, N'Length', N'Yard', N'Centimeter', 91.44000244140625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (44, N'Length', N'Yard', N'Millimeter', 914.4000244140625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (45, N'Length', N'Yard', N'Mile', 0.00056818197481334209)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (46, N'Length', N'Yard', N'Foot', 3)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (47, N'Length', N'Yard', N'Inch', 36)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (48, N'Length', N'Yard', N'Nautical mile', 0.00049373699584975839)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (49, N'Length', N'Foot', N'Kilometer', 0.00030479999259114265)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (50, N'Length', N'Foot', N'Meter', 0.30480000376701355)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (51, N'Length', N'Foot', N'Centimeter', 30.479999542236328)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (52, N'Length', N'Foot', N'Millimeter', 304.79998779296875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (53, N'Length', N'Foot', N'Mile', 0.00018939400615636259)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (54, N'Length', N'Foot', N'Yard', 0.33333298563957214)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (55, N'Length', N'Foot', N'Inch', 12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (56, N'Length', N'Foot', N'Nautical mile', 0.00016457900346722454)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (57, N'Length', N'Inch', N'Kilometer', 2.5400000595254824E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (58, N'Length', N'Inch', N'Meter', 0.025399999693036079)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (59, N'Length', N'Inch', N'Centimeter', 2.5399999618530273)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (60, N'Length', N'Inch', N'Millimeter', 25.399999618530273)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (61, N'Length', N'Inch', N'Mile', 1.5782999980729073E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (62, N'Length', N'Inch', N'Yard', 0.027777800336480141)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (63, N'Length', N'Inch', N'Foot', 0.083333298563957214)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (64, N'Length', N'Inch', N'Nautical mile', 1.3715000022784807E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (65, N'Length', N'Nautical mile', N'Inch', 72913.3984375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (66, N'Length', N'Nautical mile', N'Meter', 1852)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (67, N'Length', N'Nautical mile', N'Centimeter', 185200)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (68, N'Length', N'Nautical mile', N'Millimeter', 1852000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (69, N'Length', N'Nautical mile', N'Mile', 1.1507799625396729)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (70, N'Length', N'Nautical mile', N'Yard', 2025.3699951171875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (71, N'Length', N'Nautical mile', N'Foot', 6076.1201171875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (72, N'Mass', N'Metric ton', N'Kilogram', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (73, N'Mass', N'Metric ton', N'Gram', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (74, N'Mass', N'Metric ton', N'Milligram', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (75, N'Mass', N'Metric ton', N'Mcg', 999999995904)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (76, N'Mass', N'Metric ton', N'Long ton', 0.98420697450637817)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (77, N'Mass', N'Metric ton', N'Short ton', 1.1023099422454834)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (78, N'Mass', N'Metric ton', N'Stone', 157.47300720214844)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (79, N'Mass', N'Metric ton', N'Pound', 2204.6201171875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (80, N'Mass', N'Metric ton', N'Ounce', 35274)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (81, N'Mass', N'Kilogram', N'Metric ton', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (82, N'Mass', N'Kilogram', N'Gram', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (83, N'Mass', N'Kilogram', N'Milligram', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (84, N'Mass', N'Kilogram', N'Mcg', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (85, N'Mass', N'Kilogram', N'Long ton', 0.0009842070285230875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (86, N'Mass', N'Kilogram', N'Short ton', 0.0011023100232705474)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (87, N'Mass', N'Kilogram', N'Stone', 0.15747299790382385)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (88, N'Mass', N'Kilogram', N'Pound', 2.2046198844909668)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (89, N'Mass', N'Kilogram', N'Ounce', 35.273998260498047)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (90, N'Mass', N'Gram', N'Metric ton', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (91, N'Mass', N'Gram', N'Kilogram', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (92, N'Mass', N'Gram', N'Milligram', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (93, N'Mass', N'Gram', N'Mcg', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (94, N'Mass', N'Gram', N'Long ton', 9.8421003258408746E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (95, N'Mass', N'Gram', N'Short ton', 1.1022999615306617E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (96, N'Mass', N'Gram', N'Stone', 0.00015747299767099321)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (97, N'Mass', N'Gram', N'Pound', 0.0022046200465410948)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (98, N'Mass', N'Gram', N'Ounce', 0.035273998975753784)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (99, N'Mass', N'Milligram', N'Metric ton', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (100, N'Mass', N'Milligram', N'Kilogram', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (101, N'Mass', N'Milligram', N'Gram', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (102, N'Mass', N'Milligram', N'Mcg', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (103, N'Mass', N'Milligram', N'Long ton', 9.8421004679494217E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (104, N'Mass', N'Milligram', N'Short ton', 1.1023000290322216E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (105, N'Mass', N'Milligram', N'Stone', 1.5746999793009309E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (106, N'Mass', N'Milligram', N'Pound', 2.2045999230613234E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (107, N'Mass', N'Milligram', N'Ounce', 3.5273998946649954E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (108, N'Mass', N'Mcg', N'Metric ton', 9.999999960041972E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (109, N'Mass', N'Mcg', N'Kilogram', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (110, N'Mass', N'Mcg', N'Gram', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (111, N'Mass', N'Mcg', N'Milligram', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (112, N'Mass', N'Mcg', N'Long ton', 9.8421000082477E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (113, N'Mass', N'Mcg', N'Short ton', 1.1023000004092842E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (114, N'Mass', N'Mcg', N'Stone', 1.5746999537658013E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (115, N'Mass', N'Mcg', N'Pound', 2.2046000580644431E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (116, N'Mass', N'Mcg', N'Ounce', 3.5273998832963116E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (117, N'Mass', N'Long ton', N'Metric ton', 1.0160499811172485)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (118, N'Mass', N'Long ton', N'Kilogram', 1016.0499877929688)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (119, N'Mass', N'Long ton', N'Gram', 1016000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (120, N'Mass', N'Long ton', N'Milligram', 1016000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (121, N'Mass', N'Long ton', N'Mcg', 1016000020480)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (122, N'Mass', N'Long ton', N'Short ton', 1.1200000047683716)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (123, N'Mass', N'Long ton', N'Stone', 160)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (124, N'Mass', N'Long ton', N'Pound', 2240)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (125, N'Mass', N'Long ton', N'Ounce', 35840)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (126, N'Mass', N'Short ton', N'Metric ton', 0.90718501806259155)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (127, N'Mass', N'Short ton', N'Kilogram', 907.18499755859375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (128, N'Mass', N'Short ton', N'Gram', 907185)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (129, N'Mass', N'Short ton', N'Milligram', 907200000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (130, N'Mass', N'Short ton', N'Mcg', 907199971328)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (131, N'Mass', N'Short ton', N'Long ton', 0.892857015132904)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (132, N'Mass', N'Short ton', N'Stone', 142.85699462890625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (133, N'Mass', N'Short ton', N'Pound', 2000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (134, N'Mass', N'Short ton', N'Ounce', 32000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (135, N'Mass', N'Stone', N'Metric ton', 0.0063502900302410126)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (136, N'Mass', N'Stone', N'Kilogram', 6.3502898216247559)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (137, N'Mass', N'Stone', N'Gram', 6350.2900390625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (138, N'Mass', N'Stone', N'Milligram', 6350000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (139, N'Mass', N'Stone', N'Mcg', 6350000128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (140, N'Mass', N'Stone', N'Long ton', 0.0062500000931322575)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (141, N'Mass', N'Stone', N'Short ton', 0.0070000002160668373)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (142, N'Mass', N'Stone', N'Pound', 14)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (143, N'Mass', N'Stone', N'Ounce', 224)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (144, N'Mass', N'Pound', N'Metric ton', 0.0004535919870249927)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (145, N'Mass', N'Pound', N'Kilogram', 0.45359200239181519)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (146, N'Mass', N'Pound', N'Gram', 453.59201049804688)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (147, N'Mass', N'Pound', N'Milligram', 453592)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (148, N'Mass', N'Pound', N'Mcg', 453600000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (149, N'Mass', N'Pound', N'Long ton', 0.00044642901048064232)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (150, N'Mass', N'Pound', N'Short ton', 0.00050000002374872565)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (151, N'Mass', N'Pound', N'Stone', 0.071428596973419189)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (152, N'Mass', N'Pound', N'Ounce', 16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (153, N'Mass', N'Ounce', N'Pound', 0.0625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (154, N'Mass', N'Ounce', N'Kilogram', 0.028349500149488449)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (155, N'Mass', N'Ounce', N'Gram', 28.34950065612793)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (156, N'Mass', N'Ounce', N'Milligram', 28349.5)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (157, N'Mass', N'Ounce', N'Mcg', 28350000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (158, N'Mass', N'Ounce', N'Long ton', 2.790200051094871E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (159, N'Mass', N'Ounce', N'Short ton', 3.1250001484295353E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (160, N'Mass', N'Ounce', N'Stone', 0.0044642901048064232)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (161, N'Speed', N'Miles/hour', N'Feet/sec', 1.466670036315918)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (162, N'Speed', N'Miles/hour', N'Meters/sec', 0.44703999161720276)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (163, N'Speed', N'Miles/hour', N'Km/hour', 1.6093399524688721)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (164, N'Speed', N'Miles/hour', N'Knot', 0.86897599697113037)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (165, N'Speed', N'Feet/sec', N'Miles/hour', 0.68181800842285156)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (166, N'Speed', N'Feet/sec', N'Meters/sec', 0.30480000376701355)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (167, N'Speed', N'Feet/sec', N'Km/hour', 1.0972800254821777)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (168, N'Speed', N'Feet/sec', N'Knot', 0.5924839973449707)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (169, N'Speed', N'Meters/sec', N'Miles/hour', 2.2369399070739746)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (170, N'Speed', N'Meters/sec', N'Feet/sec', 3.2808399200439453)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (171, N'Speed', N'Meters/sec', N'Km/hour', 3.5999999046325684)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (172, N'Speed', N'Meters/sec', N'Knot', 1.9438400268554688)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (173, N'Speed', N'Km/hour', N'Miles/hour', 0.62137097120285034)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (174, N'Speed', N'Km/hour', N'Feet/sec', 0.91134399175643921)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (175, N'Speed', N'Km/hour', N'Meters/sec', 0.27777799963951111)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (176, N'Speed', N'Km/hour', N'Knot', 0.53995698690414429)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (177, N'Speed', N'Knot', N'Feet/sec', 1.687809944152832)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (178, N'Speed', N'Knot', N'Meters/sec', 0.51444399356842041)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (179, N'Speed', N'Knot', N'Km/hour', 1.8519999980926514)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (180, N'Volume', N'US gal', N'US quart', 4)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (181, N'Volume', N'US gal', N'US pint', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (182, N'Volume', N'US gal', N'US cup', 16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (183, N'Volume', N'US gal', N'US oz', 128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (184, N'Volume', N'US gal', N'US tbsp.', 256)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (185, N'Volume', N'US gal', N'US tsp.', 768)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (186, N'Volume', N'US gal', N'Cubic meter', 0.003785409964621067)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (187, N'Volume', N'US gal', N'Liter', 3.7854099273681641)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (188, N'Volume', N'US gal', N'Milliliter', 3785.409912109375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (189, N'Volume', N'US gal', N'Imperial gal', 0.83267402648925781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (190, N'Volume', N'US gal', N'Imperial quart', 3.3306999206542969)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (191, N'Volume', N'US gal', N'Imperial pint', 6.6613898277282715)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (192, N'Volume', N'US gal', N'Imperial oz', 133.22799682617188)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (193, N'Volume', N'US gal', N'Imperial tbsp.', 213.16499328613281)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (194, N'Volume', N'US gal', N'Imperial tsp.', 639.4940185546875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (195, N'Volume', N'US gal', N'Cubic foot', 0.13368099927902222)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (196, N'Volume', N'US gal', N'Cubic inch', 231)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (197, N'Volume', N'US quart', N'US gal', 0.25)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (198, N'Volume', N'US quart', N'US pint', 2)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (199, N'Volume', N'US quart', N'US cup', 4)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (200, N'Volume', N'US quart', N'US oz', 32)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (201, N'Volume', N'US quart', N'US tbsp.', 64)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (202, N'Volume', N'US quart', N'US tsp.', 192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (203, N'Volume', N'US quart', N'Cubic meter', 0.000946353015024215)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (204, N'Volume', N'US quart', N'Liter', 0.946353018283844)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (205, N'Volume', N'US quart', N'Milliliter', 946.35302734375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (206, N'Volume', N'US quart', N'Imperial gal', 0.20816799998283386)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (207, N'Volume', N'US quart', N'Imperial quart', 0.83267402648925781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (208, N'Volume', N'US quart', N'Imperial pint', 1.6653499603271484)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (209, N'Volume', N'US quart', N'Imperial oz', 33.306999206542969)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (210, N'Volume', N'US quart', N'Imperial tbsp.', 53.291099548339844)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (211, N'Volume', N'US quart', N'Imperial tsp.', 159.87300109863281)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (212, N'Volume', N'US quart', N'Cubic foot', 0.033420100808143616)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (213, N'Volume', N'US quart', N'Cubic inch', 57.75)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (214, N'Volume', N'US pint', N'US gal', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (215, N'Volume', N'US pint', N'US quart', 0.5)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (216, N'Volume', N'US pint', N'US cup', 2)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (217, N'Volume', N'US pint', N'US oz', 16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (218, N'Volume', N'US pint', N'US tbsp.', 32)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (219, N'Volume', N'US pint', N'US tsp.', 96)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (220, N'Volume', N'US pint', N'Cubic meter', 0.00047317601274698973)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (221, N'Volume', N'US pint', N'Liter', 0.47317600250244141)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (222, N'Volume', N'US pint', N'Milliliter', 473.17599487304688)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (223, N'Volume', N'US pint', N'Imperial gal', 0.10408399999141693)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (224, N'Volume', N'US pint', N'Imperial quart', 0.41633701324462891)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (225, N'Volume', N'US pint', N'Imperial pint', 0.83267402648925781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (226, N'Volume', N'US pint', N'Imperial oz', 16.653499603271484)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (227, N'Volume', N'US pint', N'Imperial tbsp.', 26.645599365234375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (228, N'Volume', N'US pint', N'Imperial tsp.', 79.936698913574219)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (229, N'Volume', N'US pint', N'Cubic foot', 0.016710100695490837)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (230, N'Volume', N'US pint', N'Cubic inch', 28.875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (231, N'Volume', N'US cup', N'US gal', 0.0625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (232, N'Volume', N'US cup', N'US quart', 0.25)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (233, N'Volume', N'US cup', N'US pint', 0.5)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (234, N'Volume', N'US cup', N'US oz', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (235, N'Volume', N'US cup', N'US tbsp.', 16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (236, N'Volume', N'US cup', N'US tsp.', 48)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (237, N'Volume', N'US cup', N'Cubic meter', 0.00023658800637349486)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (238, N'Volume', N'US cup', N'Liter', 0.2365880012512207)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (239, N'Volume', N'US cup', N'Milliliter', 236.58799743652344)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (240, N'Volume', N'US cup', N'Imperial gal', 0.052042100578546524)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (241, N'Volume', N'US cup', N'Imperial quart', 0.20816799998283386)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (242, N'Volume', N'US cup', N'Imperial pint', 0.41633701324462891)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (243, N'Volume', N'US cup', N'Imperial oz', 8.3267402648925781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (244, N'Volume', N'US cup', N'Imperial tbsp.', 13.322799682617188)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (245, N'Volume', N'US cup', N'Imperial tsp.', 39.968299865722656)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (246, N'Volume', N'US cup', N'Cubic foot', 0.008355029858648777)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (247, N'Volume', N'US cup', N'Cubic inch', 14.4375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (248, N'Volume', N'US oz', N'US gal', 0.0078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (249, N'Volume', N'US oz', N'US quart', 0.03125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (250, N'Volume', N'US oz', N'US pint', 0.0625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (251, N'Volume', N'US oz', N'US cup', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (252, N'Volume', N'US oz', N'US tbsp.', 2)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (253, N'Volume', N'US oz', N'US tsp.', 6)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (254, N'Volume', N'US oz', N'Cubic meter', 2.957399919978343E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (255, N'Volume', N'US oz', N'Liter', 0.029573500156402588)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (256, N'Volume', N'US oz', N'Milliliter', 29.57349967956543)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (257, N'Volume', N'US oz', N'Imperial gal', 0.0065052597783505917)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (258, N'Volume', N'US oz', N'Imperial quart', 0.026021100580692291)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (259, N'Volume', N'US oz', N'Imperial pint', 0.052042100578546524)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (260, N'Volume', N'US oz', N'Imperial oz', 1.0408400297164917)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (261, N'Volume', N'US oz', N'Imperial tbsp.', 1.6653499603271484)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (262, N'Volume', N'US oz', N'Imperial tsp.', 4.996039867401123)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (263, N'Volume', N'US oz', N'Cubic foot', 0.0010443800128996372)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (264, N'Volume', N'US oz', N'Cubic inch', 1.8046900033950806)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (265, N'Volume', N'US tbsp.', N'US gal', 0.00390625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (266, N'Volume', N'US tbsp.', N'US quart', 0.015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (267, N'Volume', N'US tbsp.', N'US pint', 0.03125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (268, N'Volume', N'US tbsp.', N'US cup', 0.0625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (269, N'Volume', N'US tbsp.', N'US oz', 0.5)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (270, N'Volume', N'US tbsp.', N'US tsp.', 3)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (271, N'Volume', N'US tbsp.', N'Cubic meter', 1.4786999599891715E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (272, N'Volume', N'US tbsp.', N'Liter', 0.014786800369620323)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (273, N'Volume', N'US tbsp.', N'Milliliter', 14.786800384521484)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (274, N'Volume', N'US tbsp.', N'Imperial gal', 0.0032526298891752958)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (275, N'Volume', N'US tbsp.', N'Imperial quart', 0.013010499998927116)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (276, N'Volume', N'US tbsp.', N'Imperial pint', 0.026021100580692291)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (277, N'Volume', N'US tbsp.', N'Imperial oz', 0.520421028137207)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (278, N'Volume', N'US tbsp.', N'Imperial tbsp.', 0.83267402648925781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (279, N'Volume', N'US tbsp.', N'Imperial tsp.', 2.4980199337005615)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (280, N'Volume', N'US tbsp.', N'Cubic foot', 0.00052219000644981861)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (281, N'Volume', N'US tbsp.', N'Cubic inch', 0.9023439884185791)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (282, N'Volume', N'US tsp.', N'US gal', 0.0013020799960941076)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (283, N'Volume', N'US tsp.', N'US quart', 0.0052083302289247513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (284, N'Volume', N'US tsp.', N'US pint', 0.010416699573397636)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (285, N'Volume', N'US tsp.', N'US cup', 0.020833300426602364)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (286, N'Volume', N'US tsp.', N'US oz', 0.16666699945926666)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (287, N'Volume', N'US tsp.', N'US tbsp.', 0.33333298563957214)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (288, N'Volume', N'US tsp.', N'Cubic meter', 4.9289001253782772E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (289, N'Volume', N'US tsp.', N'Liter', 0.0049289199523627758)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (290, N'Volume', N'US tsp.', N'Milliliter', 4.928919792175293)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (291, N'Volume', N'US tsp.', N'Imperial gal', 0.0010842100018635392)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (292, N'Volume', N'US tsp.', N'Imperial quart', 0.0043368400074541569)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (293, N'Volume', N'US tsp.', N'Imperial pint', 0.0086736902594566345)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (294, N'Volume', N'US tsp.', N'Imperial oz', 0.17347399890422821)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (295, N'Volume', N'US tsp.', N'Imperial tbsp.', 0.27755799889564514)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (296, N'Volume', N'US tsp.', N'Imperial tsp.', 0.83267402648925781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (297, N'Volume', N'US tsp.', N'Cubic foot', 0.00017406299593858421)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (298, N'Volume', N'US tsp.', N'Cubic inch', 0.3007810115814209)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (299, N'Volume', N'Cubic meter', N'US gal', 264.1719970703125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (300, N'Volume', N'Cubic meter', N'US quart', 1056.68994140625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (301, N'Volume', N'Cubic meter', N'US pint', 2113.3798828125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (302, N'Volume', N'Cubic meter', N'US cup', 4226.75)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (303, N'Volume', N'Cubic meter', N'US oz', 33814)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (304, N'Volume', N'Cubic meter', N'US tbsp.', 67628)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (305, N'Volume', N'Cubic meter', N'US tsp.', 202884)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (306, N'Volume', N'Cubic meter', N'Liter', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (307, N'Volume', N'Cubic meter', N'Milliliter', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (308, N'Volume', N'Cubic meter', N'Imperial gal', 219.968994140625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (309, N'Volume', N'Cubic meter', N'Imperial quart', 879.87701416015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (310, N'Volume', N'Cubic meter', N'Imperial pint', 1759.75)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (311, N'Volume', N'Cubic meter', N'Imperial oz', 35195.1015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (312, N'Volume', N'Cubic meter', N'Imperial tbsp.', 56312.1015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (313, N'Volume', N'Cubic meter', N'Imperial tsp.', 168936)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (314, N'Volume', N'Cubic meter', N'Cubic foot', 35.314701080322266)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (315, N'Volume', N'Cubic meter', N'Cubic inch', 61023.69921875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (316, N'Volume', N'Liter', N'US gal', 0.26417198777198792)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (317, N'Volume', N'Liter', N'US quart', 1.056689977645874)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (318, N'Volume', N'Liter', N'US pint', 2.113379955291748)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (319, N'Volume', N'Liter', N'US cup', 4.2267498970031738)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (320, N'Volume', N'Liter', N'US oz', 33.813999176025391)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (321, N'Volume', N'Liter', N'US tbsp.', 67.627998352050781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (322, N'Volume', N'Liter', N'US tsp.', 202.88400268554688)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (323, N'Volume', N'Liter', N'Cubic meter', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (324, N'Volume', N'Liter', N'Milliliter', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (325, N'Volume', N'Liter', N'Imperial gal', 0.2199690043926239)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (326, N'Volume', N'Liter', N'Imperial quart', 0.879876971244812)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (327, N'Volume', N'Liter', N'Imperial pint', 1.7597500085830689)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (328, N'Volume', N'Liter', N'Imperial oz', 35.195098876953125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (329, N'Volume', N'Liter', N'Imperial tbsp.', 56.312099456787109)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (330, N'Volume', N'Liter', N'Imperial tsp.', 168.93600463867188)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (331, N'Volume', N'Liter', N'Cubic foot', 0.035314701497554779)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (332, N'Volume', N'Liter', N'Cubic inch', 61.023700714111328)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (333, N'Volume', N'Milliliter', N'US gal', 0.00026417200569994748)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (334, N'Volume', N'Milliliter', N'US quart', 0.001056690001860261)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (335, N'Volume', N'Milliliter', N'US pint', 0.0021133800037205219)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (336, N'Volume', N'Milliliter', N'US cup', 0.00422675022855401)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (337, N'Volume', N'Milliliter', N'US oz', 0.033814001828432083)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (338, N'Volume', N'Milliliter', N'US tbsp.', 0.067628003656864166)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (339, N'Volume', N'Milliliter', N'US tsp.', 0.2028840035200119)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (340, N'Volume', N'Milliliter', N'Cubic meter', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (341, N'Volume', N'Milliliter', N'Liter', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (342, N'Volume', N'Milliliter', N'Imperial gal', 0.00021996900613885373)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (343, N'Volume', N'Milliliter', N'Imperial quart', 0.00087987701408565044)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (344, N'Volume', N'Milliliter', N'Imperial pint', 0.001759749953635037)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (345, N'Volume', N'Milliliter', N'Imperial oz', 0.035195101052522659)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (346, N'Volume', N'Milliliter', N'Imperial tbsp.', 0.056312099099159241)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (347, N'Volume', N'Milliliter', N'Imperial tsp.', 0.16893599927425385)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (348, N'Volume', N'Milliliter', N'Cubic foot', 3.5314998967805877E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (349, N'Volume', N'Milliliter', N'Cubic inch', 0.06102370098233223)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (350, N'Volume', N'Imperial gal', N'US gal', 1.200950026512146)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (351, N'Volume', N'Imperial gal', N'US quart', 4.803800106048584)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (352, N'Volume', N'Imperial gal', N'US pint', 9.607600212097168)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (353, N'Volume', N'Imperial gal', N'US cup', 19.215200424194336)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (354, N'Volume', N'Imperial gal', N'US oz', 153.72200012207031)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (355, N'Volume', N'Imperial gal', N'US tbsp.', 307.4429931640625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (356, N'Volume', N'Imperial gal', N'US tsp.', 922.33001708984375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (357, N'Volume', N'Imperial gal', N'Cubic meter', 0.00454609002918005)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (358, N'Volume', N'Imperial gal', N'Liter', 4.5460901260375977)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (359, N'Volume', N'Imperial gal', N'Milliliter', 4546.08984375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (360, N'Volume', N'Imperial gal', N'Imperial quart', 4)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (361, N'Volume', N'Imperial gal', N'Imperial pint', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (362, N'Volume', N'Imperial gal', N'Imperial oz', 160)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (363, N'Volume', N'Imperial gal', N'Imperial tbsp.', 256)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (364, N'Volume', N'Imperial gal', N'Imperial tsp.', 768)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (365, N'Volume', N'Imperial gal', N'Cubic foot', 0.16054399311542511)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (366, N'Volume', N'Imperial gal', N'Cubic inch', 277.42001342773438)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (367, N'Volume', N'Imperial quart', N'US gal', 0.30023801326751709)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (368, N'Volume', N'Imperial quart', N'US quart', 1.200950026512146)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (369, N'Volume', N'Imperial quart', N'US pint', 2.401900053024292)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (370, N'Volume', N'Imperial quart', N'US cup', 4.803800106048584)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (371, N'Volume', N'Imperial quart', N'US oz', 38.430400848388672)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (372, N'Volume', N'Imperial quart', N'US tbsp.', 76.860801696777344)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (373, N'Volume', N'Imperial quart', N'US tsp.', 230.58200073242188)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (374, N'Volume', N'Imperial quart', N'Cubic meter', 0.0011365199461579323)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (375, N'Volume', N'Imperial quart', N'Liter', 1.1365200281143189)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (376, N'Volume', N'Imperial quart', N'Milliliter', 1136.52001953125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (377, N'Volume', N'Imperial quart', N'Imperial gal', 0.25)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (378, N'Volume', N'Imperial quart', N'Imperial pint', 2)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (379, N'Volume', N'Imperial quart', N'Imperial oz', 40)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (380, N'Volume', N'Imperial quart', N'Imperial tbsp.', 64)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (381, N'Volume', N'Imperial quart', N'Imperial tsp.', 192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (382, N'Volume', N'Imperial quart', N'Cubic foot', 0.040135901421308517)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (383, N'Volume', N'Imperial quart', N'Cubic inch', 69.354896545410156)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (384, N'Volume', N'Imperial pint', N'US gal', 0.15011900663375855)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (385, N'Volume', N'Imperial pint', N'US quart', 0.600475013256073)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (386, N'Volume', N'Imperial pint', N'US pint', 1.200950026512146)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (387, N'Volume', N'Imperial pint', N'US cup', 2.401900053024292)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (388, N'Volume', N'Imperial pint', N'US oz', 19.215200424194336)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (389, N'Volume', N'Imperial pint', N'US tbsp.', 38.430400848388672)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (390, N'Volume', N'Imperial pint', N'US tsp.', 115.29100036621094)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (391, N'Volume', N'Imperial pint', N'Cubic meter', 0.00056826102081686258)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (392, N'Volume', N'Imperial pint', N'Liter', 0.56826102733612061)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (393, N'Volume', N'Imperial pint', N'Milliliter', 568.260986328125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (394, N'Volume', N'Imperial pint', N'Imperial gal', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (395, N'Volume', N'Imperial pint', N'Imperial quart', 0.5)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (396, N'Volume', N'Imperial pint', N'Imperial oz', 20)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (397, N'Volume', N'Imperial pint', N'Imperial tbsp.', 32)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (398, N'Volume', N'Imperial pint', N'Imperial tsp.', 96)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (399, N'Volume', N'Imperial pint', N'Cubic foot', 0.020067999139428139)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (400, N'Volume', N'Imperial pint', N'Cubic inch', 34.677398681640625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (401, N'Volume', N'Imperial oz', N'US gal', 0.0075059398077428341)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (402, N'Volume', N'Imperial oz', N'US quart', 0.030023800209164619)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (403, N'Volume', N'Imperial oz', N'US pint', 0.06004749983549118)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (404, N'Volume', N'Imperial oz', N'US cup', 0.12009499967098236)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (405, N'Volume', N'Imperial oz', N'US oz', 0.96075999736785889)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (406, N'Volume', N'Imperial oz', N'US tbsp.', 1.9215199947357178)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (407, N'Volume', N'Imperial oz', N'US tsp.', 5.7645602226257324)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (408, N'Volume', N'Imperial oz', N'Cubic meter', 2.841300010913983E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (409, N'Volume', N'Imperial oz', N'Liter', 0.02841310016810894)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (410, N'Volume', N'Imperial oz', N'Milliliter', 28.41309928894043)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (411, N'Volume', N'Imperial oz', N'Imperial gal', 0.0062500000931322575)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (412, N'Volume', N'Imperial oz', N'Imperial quart', 0.02500000037252903)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (413, N'Volume', N'Imperial oz', N'Imperial pint', 0.05000000074505806)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (414, N'Volume', N'Imperial oz', N'Imperial tbsp.', 1.6000000238418579)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (415, N'Volume', N'Imperial oz', N'Imperial tsp.', 4.8000001907348633)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (416, N'Volume', N'Imperial oz', N'Cubic foot', 0.0010033999569714069)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (417, N'Volume', N'Imperial oz', N'Cubic inch', 1.7338700294494629)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (418, N'Volume', N'Imperial tbsp.', N'US gal', 0.0046912101097404957)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (419, N'Volume', N'Imperial tbsp.', N'US quart', 0.018764900043606758)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (420, N'Volume', N'Imperial tbsp.', N'US pint', 0.037529699504375458)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (421, N'Volume', N'Imperial tbsp.', N'US cup', 0.075059399008750916)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (422, N'Volume', N'Imperial tbsp.', N'US oz', 0.600475013256073)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (423, N'Volume', N'Imperial tbsp.', N'US tbsp.', 1.200950026512146)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (424, N'Volume', N'Imperial tbsp.', N'US tsp.', 3.6028499603271484)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (425, N'Volume', N'Imperial tbsp.', N'Cubic meter', 1.7758000467438251E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (426, N'Volume', N'Imperial tbsp.', N'Liter', 0.0177581999450922)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (427, N'Volume', N'Imperial tbsp.', N'Milliliter', 17.758199691772461)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (428, N'Volume', N'Imperial tbsp.', N'Imperial gal', 0.00390625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (429, N'Volume', N'Imperial tbsp.', N'Imperial quart', 0.015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (430, N'Volume', N'Imperial tbsp.', N'Imperial pint', 0.03125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (431, N'Volume', N'Imperial tbsp.', N'Imperial oz', 0.625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (432, N'Volume', N'Imperial tbsp.', N'Imperial tsp.', 3)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (433, N'Volume', N'Imperial tbsp.', N'Cubic foot', 0.00062712398357689381)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (434, N'Volume', N'Imperial tbsp.', N'Cubic inch', 1.0836700201034546)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (435, N'Volume', N'Imperial tsp.', N'US gal', 0.0015637399628758431)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (436, N'Volume', N'Imperial tsp.', N'US quart', 0.0062549500726163387)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (437, N'Volume', N'Imperial tsp.', N'US pint', 0.012509900145232678)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (438, N'Volume', N'Imperial tsp.', N'US cup', 0.025019800290465355)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (439, N'Volume', N'Imperial tsp.', N'US oz', 0.20015799999237061)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (440, N'Volume', N'Imperial tsp.', N'US tbsp.', 0.40031701326370239)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (441, N'Volume', N'Imperial tsp.', N'US tsp.', 1.200950026512146)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (442, N'Volume', N'Imperial tsp.', N'Cubic meter', 5.919399882259313E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (443, N'Volume', N'Imperial tsp.', N'Liter', 0.0059193898923695087)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (444, N'Volume', N'Imperial tsp.', N'Milliliter', 5.9193902015686035)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (445, N'Volume', N'Imperial tsp.', N'Imperial gal', 0.0013020799960941076)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (446, N'Volume', N'Imperial tsp.', N'Imperial quart', 0.0052083302289247513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (447, N'Volume', N'Imperial tsp.', N'Imperial pint', 0.010416699573397636)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (448, N'Volume', N'Imperial tsp.', N'Imperial oz', 0.20833300054073334)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (449, N'Volume', N'Imperial tsp.', N'Imperial tbsp.', 0.33333298563957214)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (450, N'Volume', N'Imperial tsp.', N'Cubic foot', 0.00020904099801555276)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (451, N'Volume', N'Imperial tsp.', N'Cubic inch', 0.3612230122089386)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (452, N'Volume', N'Cubic foot', N'US gal', 7.4805197715759277)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (453, N'Volume', N'Cubic foot', N'US quart', 29.922100067138672)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (454, N'Volume', N'Cubic foot', N'US pint', 59.844200134277344)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (455, N'Volume', N'Cubic foot', N'US cup', 119.68800354003906)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (456, N'Volume', N'Cubic foot', N'US oz', 957.5059814453125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (457, N'Volume', N'Cubic foot', N'US tbsp.', 1915.010009765625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (458, N'Volume', N'Cubic foot', N'US tsp.', 5745.0400390625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (459, N'Volume', N'Cubic foot', N'Cubic meter', 0.02831679955124855)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (460, N'Volume', N'Cubic foot', N'Liter', 28.316799163818359)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (461, N'Volume', N'Cubic foot', N'Milliliter', 28316.80078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (462, N'Volume', N'Cubic foot', N'Imperial gal', 6.2288298606872559)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (463, N'Volume', N'Cubic foot', N'Imperial quart', 24.915300369262695)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (464, N'Volume', N'Cubic foot', N'Imperial pint', 49.8306999206543)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (465, N'Volume', N'Cubic foot', N'Imperial oz', 996.61297607421875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (466, N'Volume', N'Cubic foot', N'Imperial tbsp.', 1594.5799560546875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (467, N'Volume', N'Cubic foot', N'Imperial tsp.', 4783.740234375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (468, N'Volume', N'Cubic foot', N'Cubic inch', 1728)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (469, N'Volume', N'Cubic inch', N'US quart', 0.017316000536084175)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (470, N'Volume', N'Cubic inch', N'US pint', 0.03463200107216835)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (471, N'Volume', N'Cubic inch', N'US cup', 0.06926409900188446)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (472, N'Volume', N'Cubic inch', N'US oz', 0.55411297082901)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (473, N'Volume', N'Cubic inch', N'US tbsp.', 1.1082299947738648)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (474, N'Volume', N'Cubic inch', N'US tsp.', 3.3246800899505615)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (475, N'Volume', N'Cubic inch', N'Cubic meter', 1.6387000869144686E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (476, N'Volume', N'Cubic inch', N'Liter', 0.016387099400162697)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (477, N'Volume', N'Cubic inch', N'Milliliter', 16.387100219726562)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (478, N'Volume', N'Cubic inch', N'Imperial gal', 0.0036046500317752361)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (479, N'Volume', N'Cubic inch', N'Imperial quart', 0.014418600127100945)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (480, N'Volume', N'Cubic inch', N'Imperial pint', 0.028837200254201889)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (481, N'Volume', N'Cubic inch', N'Imperial oz', 0.576744019985199)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (482, N'Volume', N'Cubic inch', N'Imperial tbsp.', 0.922789990901947)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (483, N'Volume', N'Cubic inch', N'Imperial tsp.', 2.7683699131011963)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (484, N'Volume', N'Cubic inch', N'Cubic foot', 0.00057870399905368686)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (485, N'Area', N'Square km', N'Hectare', 100)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (486, N'Area', N'Square km', N'Square meter', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (487, N'Area', N'Square km', N'Square mile', 0.38610199093818665)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (488, N'Area', N'Square km', N'Acre', 247.10499572753906)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (489, N'Area', N'Square km', N'Square yard', 1196000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (490, N'Area', N'Square km', N'Square foot', 10760000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (491, N'Area', N'Square km', N'Square inch', 1550000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (492, N'Area', N'Hectare', N'Square km', 0.0099999997764825821)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (493, N'Area', N'Hectare', N'Square meter', 10000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (494, N'Area', N'Hectare', N'Square mile', 0.0038610200863331556)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (495, N'Area', N'Hectare', N'Acre', 2.4710500240325928)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (496, N'Area', N'Hectare', N'Square yard', 11959.900390625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (497, N'Area', N'Hectare', N'Square foot', 107639)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (498, N'Area', N'Hectare', N'Square inch', 15500000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (499, N'Area', N'Square meter', N'Square km', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (500, N'Area', N'Square meter', N'Hectare', 9.9999997473787516E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (501, N'Area', N'Square meter', N'Square mile', 3.8609999819527729E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (502, N'Area', N'Square meter', N'Acre', 0.00024710499565117061)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (503, N'Area', N'Square meter', N'Square yard', 1.1959899663925171)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (504, N'Area', N'Square meter', N'Square foot', 10.763899803161621)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (505, N'Area', N'Square meter', N'Square inch', 1550)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (506, N'Area', N'Square mile', N'Square km', 2.5899899005889893)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (507, N'Area', N'Square mile', N'Hectare', 258.99899291992188)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (508, N'Area', N'Square mile', N'Square meter', 2590000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (509, N'Area', N'Square mile', N'Acre', 640)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (510, N'Area', N'Square mile', N'Square yard', 3098000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (511, N'Area', N'Square mile', N'Square foot', 27880000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (512, N'Area', N'Square mile', N'Square inch', 4014000128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (513, N'Area', N'Acre', N'Square km', 0.00404686015099287)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (514, N'Area', N'Acre', N'Hectare', 0.40468600392341614)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (515, N'Area', N'Acre', N'Square meter', 4046.860107421875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (516, N'Area', N'Acre', N'Square mile', 0.0015625000232830644)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (517, N'Area', N'Acre', N'Square yard', 4840)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (518, N'Area', N'Acre', N'Square foot', 43560)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (519, N'Area', N'Acre', N'Square inch', 6273000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (520, N'Area', N'Square yard', N'Square km', 8.3613002743732068E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (521, N'Area', N'Square yard', N'Hectare', 8.3612998423632234E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (522, N'Area', N'Square yard', N'Square meter', 0.836126983165741)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (523, N'Area', N'Square yard', N'Square mile', 3.2283000450661348E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (524, N'Area', N'Square yard', N'Acre', 0.000206612006877549)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (525, N'Area', N'Square yard', N'Square foot', 9)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (526, N'Area', N'Square yard', N'Square inch', 1296)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (527, N'Area', N'Square foot', N'Square km', 9.2903000847854855E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (528, N'Area', N'Square foot', N'Hectare', 9.290300113207195E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (529, N'Area', N'Square foot', N'Square meter', 0.0929030030965805)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (530, N'Area', N'Square foot', N'Square mile', 3.5869998527005009E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (531, N'Area', N'Square foot', N'Acre', 2.2956999600864947E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (532, N'Area', N'Square foot', N'Square yard', 0.11111100018024445)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (533, N'Area', N'Square foot', N'Square inch', 144)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (534, N'Area', N'Square inch', N'Square foot', 0.0069444398395717144)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (535, N'Area', N'Square inch', N'Hectare', 6.4516001430092729E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (536, N'Area', N'Square inch', N'Square meter', 0.00064515997655689716)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (537, N'Area', N'Square inch', N'Square mile', 2.4909999063460475E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (538, N'Area', N'Square inch', N'Acre', 1.5941999720325839E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (539, N'Area', N'Square inch', N'Square yard', 0.00077160500222817063)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (540, N'Fuel consumption', N'MPG (US)', N'MPG (imp.)', 1.200950026512146)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (541, N'Fuel consumption', N'MPG (US)', N'Km/liter', 0.42514398694038391)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (542, N'Fuel consumption', N'MPG (imp.)', N'MPG (US)', 0.83267402648925781)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (543, N'Fuel consumption', N'MPG (imp.)', N'Km/liter', 0.35400599241256714)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (544, N'Fuel consumption', N'Km/liter', N'MPG (US)', 2.3521499633789062)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (545, N'Fuel consumption', N'Km/liter', N'MPG (imp.)', 2.8248100280761719)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (546, N'Time', N'Nanosecond', N'Microsecond', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (547, N'Time', N'Nanosecond', N'Millisecond', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (548, N'Time', N'Nanosecond', N'Second', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (549, N'Time', N'Nanosecond', N'Minute', 1.6666999377856762E-11)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (550, N'Time', N'Nanosecond', N'Hour', 2.7777999627061345E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (551, N'Time', N'Nanosecond', N'Day', 1.1573999645784951E-14)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (552, N'Time', N'Nanosecond', N'Week', 1.6533999485900401E-15)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (553, N'Time', N'Nanosecond', N'Month', 3.8026998889522019E-16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (554, N'Time', N'Nanosecond', N'Year', 3.1689001408053322E-17)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (555, N'Time', N'Nanosecond', N'Decade', 3.1688999753692097E-18)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (556, N'Time', N'Nanosecond', N'Century', 3.1688999753692097E-19)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (557, N'Time', N'Microsecond', N'Nanosecond', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (558, N'Time', N'Microsecond', N'Millisecond', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (559, N'Time', N'Microsecond', N'Second', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (560, N'Time', N'Microsecond', N'Minute', 1.6667000224401818E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (561, N'Time', N'Microsecond', N'Hour', 2.777799934516878E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (562, N'Time', N'Microsecond', N'Day', 1.1573999571246052E-11)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (563, N'Time', N'Microsecond', N'Week', 1.6533999646836661E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (564, N'Time', N'Microsecond', N'Month', 3.8027000710642855E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (565, N'Time', N'Microsecond', N'Year', 3.1689000111034121E-14)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (566, N'Time', N'Microsecond', N'Decade', 3.1688999687517648E-15)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (567, N'Time', N'Microsecond', N'Century', 3.1689000746308832E-16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (568, N'Time', N'Millisecond', N'Nanosecond', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (569, N'Time', N'Millisecond', N'Microsecond', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (570, N'Time', N'Millisecond', N'Second', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (571, N'Time', N'Millisecond', N'Minute', 1.6666999727021903E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (572, N'Time', N'Millisecond', N'Hour', 2.77780003443695E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (573, N'Time', N'Millisecond', N'Day', 1.1574000424730002E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (574, N'Time', N'Millisecond', N'Week', 1.6533999724899218E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (575, N'Time', N'Millisecond', N'Month', 3.802700099253542E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (576, N'Time', N'Millisecond', N'Year', 3.1688998647361188E-11)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (577, N'Time', N'Millisecond', N'Decade', 3.1689000382084664E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (578, N'Time', N'Millisecond', N'Century', 3.1688998755781406E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (579, N'Time', N'Second', N'Nanosecond', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (580, N'Time', N'Second', N'Microsecond', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (581, N'Time', N'Second', N'Millisecond', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (582, N'Time', N'Second', N'Minute', 0.016666699200868607)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (583, N'Time', N'Second', N'Hour', 0.00027777798823080957)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (584, N'Time', N'Second', N'Day', 1.1574000382097438E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (585, N'Time', N'Second', N'Week', 1.6533999769308139E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (586, N'Time', N'Second', N'Month', 3.8026999504836567E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (587, N'Time', N'Second', N'Year', 3.1689001644963355E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (588, N'Time', N'Second', N'Decade', 3.1689000312695725E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (589, N'Time', N'Second', N'Century', 3.1688998647361188E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (590, N'Time', N'Minute', N'Nanosecond', 60000002048)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (591, N'Time', N'Minute', N'Microsecond', 60000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (592, N'Time', N'Minute', N'Millisecond', 60000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (593, N'Time', N'Minute', N'Second', 60)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (594, N'Time', N'Minute', N'Hour', 0.016666699200868607)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (595, N'Time', N'Minute', N'Day', 0.00069444399559870362)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (596, N'Time', N'Minute', N'Week', 9.9206001323182136E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (597, N'Time', N'Minute', N'Month', 2.281600063724909E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (598, N'Time', N'Minute', N'Year', 1.9013000382983591E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (599, N'Time', N'Minute', N'Decade', 1.9012999530332309E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (600, N'Time', N'Minute', N'Century', 1.9012999175060941E-08)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (601, N'Time', N'Hour', N'Nanosecond', 3599999959040)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (602, N'Time', N'Hour', N'Microsecond', 3600000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (603, N'Time', N'Hour', N'Millisecond', 3600000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (604, N'Time', N'Hour', N'Second', 3600)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (605, N'Time', N'Hour', N'Minute', 60)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (606, N'Time', N'Hour', N'Day', 0.041666701436042786)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (607, N'Time', N'Hour', N'Week', 0.0059523801319301128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (608, N'Time', N'Hour', N'Month', 0.0013689500046893954)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (609, N'Time', N'Hour', N'Year', 0.00011408000136725605)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (610, N'Time', N'Hour', N'Decade', 1.1408000318624545E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (611, N'Time', N'Hour', N'Century', 1.1408000091250869E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (612, N'Time', N'Day', N'Nanosecond', 86400003211264)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (613, N'Time', N'Day', N'Microsecond', 86400000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (614, N'Time', N'Day', N'Millisecond', 86400000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (615, N'Time', N'Day', N'Second', 86400)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (616, N'Time', N'Day', N'Minute', 1440)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (617, N'Time', N'Day', N'Hour', 24)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (618, N'Time', N'Day', N'Week', 0.14285700023174286)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (619, N'Time', N'Day', N'Month', 0.032854899764060974)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (620, N'Time', N'Day', N'Year', 0.002737910021096468)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (621, N'Time', N'Day', N'Decade', 0.00027379099628888071)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (622, N'Time', N'Day', N'Century', 2.7378999220672995E-05)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (623, N'Time', N'Week', N'Nanosecond', 604799980535808)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (624, N'Time', N'Week', N'Microsecond', 604800024576)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (625, N'Time', N'Week', N'Millisecond', 604800000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (626, N'Time', N'Week', N'Second', 604800)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (627, N'Time', N'Week', N'Minute', 10080)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (628, N'Time', N'Week', N'Hour', 168)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (629, N'Time', N'Week', N'Day', 7)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (630, N'Time', N'Week', N'Month', 0.22998400032520294)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (631, N'Time', N'Week', N'Year', 0.019165400415658951)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (632, N'Time', N'Week', N'Decade', 0.001916539971716702)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (633, N'Time', N'Week', N'Century', 0.00019165400590281934)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (634, N'Time', N'Month', N'Nanosecond', 2629999869820928)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (635, N'Time', N'Month', N'Microsecond', 2630000050176)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (636, N'Time', N'Month', N'Millisecond', 2630000128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (637, N'Time', N'Month', N'Second', 2630000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (638, N'Time', N'Month', N'Minute', 43829.1015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (639, N'Time', N'Month', N'Hour', 730.4840087890625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (640, N'Time', N'Month', N'Day', 30.436800003051758)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (641, N'Time', N'Month', N'Week', 4.3481202125549316)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (642, N'Time', N'Month', N'Year', 0.083333298563957214)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (643, N'Time', N'Month', N'Decade', 0.0083333300426602364)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (644, N'Time', N'Month', N'Century', 0.00083333300426602364)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (645, N'Time', N'Year', N'Nanosecond', 31559999511592960)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (646, N'Time', N'Year', N'Microsecond', 31560000602112)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (647, N'Time', N'Year', N'Millisecond', 31559999488)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (648, N'Time', N'Year', N'Second', 31560000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (649, N'Time', N'Year', N'Minute', 525949)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (650, N'Time', N'Year', N'Hour', 8765.8095703125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (651, N'Time', N'Year', N'Day', 365.24200439453125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (652, N'Time', N'Year', N'Week', 52.1775016784668)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (653, N'Time', N'Year', N'Month', 12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (654, N'Time', N'Year', N'Decade', 0.10000000149011612)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (655, N'Time', N'Year', N'Century', 0.0099999997764825821)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (656, N'Time', N'Decade', N'Nanosecond', 3.1560000370586419E+17)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (657, N'Time', N'Decade', N'Microsecond', 315600001826816)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (658, N'Time', N'Decade', N'Millisecond', 315600011264)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (659, N'Time', N'Decade', N'Second', 315600000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (660, N'Time', N'Decade', N'Minute', 5259000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (661, N'Time', N'Decade', N'Hour', 87658.1015625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (662, N'Time', N'Decade', N'Day', 3652.419921875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (663, N'Time', N'Decade', N'Week', 521.7750244140625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (664, N'Time', N'Decade', N'Month', 120)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (665, N'Time', N'Decade', N'Year', 10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (666, N'Time', N'Decade', N'Century', 0.10000000149011612)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (667, N'Time', N'Century', N'Decade', 10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (668, N'Time', N'Century', N'Microsecond', 3155999951159296)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (669, N'Time', N'Century', N'Millisecond', 3156000112640)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (670, N'Time', N'Century', N'Second', 3156000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (671, N'Time', N'Century', N'Minute', 52590000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (672, N'Time', N'Century', N'Hour', 876581)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (673, N'Time', N'Century', N'Day', 36524.19921875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (674, N'Time', N'Century', N'Week', 5217.75)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (675, N'Time', N'Century', N'Month', 1200)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (676, N'Time', N'Century', N'Year', 100)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (677, N'Digital Storage', N'Bit', N'Byte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (678, N'Digital Storage', N'Bit', N'Kilobit', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (679, N'Digital Storage', N'Bit', N'Kilobyte', 0.00012500000593718141)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (680, N'Digital Storage', N'Bit', N'Kibibit', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (681, N'Digital Storage', N'Bit', N'Kibibyte', 0.00012206999963382259)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (682, N'Digital Storage', N'Bit', N'Megabit', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (683, N'Digital Storage', N'Bit', N'Megabyte', 1.2499999968440534E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (684, N'Digital Storage', N'Bit', N'Mebibit', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (685, N'Digital Storage', N'Bit', N'Mebibyte', 1.19210000093517E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (686, N'Digital Storage', N'Bit', N'Gigabit', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (687, N'Digital Storage', N'Bit', N'Gigabyte', 1.2499999646475857E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (688, N'Digital Storage', N'Bit', N'Gibibit', 9.3132002110252188E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (689, N'Digital Storage', N'Bit', N'Gibibyte', 1.1641999864142605E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (690, N'Digital Storage', N'Bit', N'Terabit', 9.999999960041972E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (691, N'Digital Storage', N'Bit', N'Terabyte', 1.2499999950052465E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (692, N'Digital Storage', N'Bit', N'Tebibit', 9.0948998549347793E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (693, N'Digital Storage', N'Bit', N'Tebibyte', 1.1368999546044339E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (694, N'Digital Storage', N'Bit', N'Petabit', 1.0000000036274937E-15)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (695, N'Digital Storage', N'Bit', N'Petabyte', 1.2500000045343672E-16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (696, N'Digital Storage', N'Bit', N'Pebibit', 8.8818000788690133E-16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (697, N'Digital Storage', N'Bit', N'Pebibyte', 1.1101999959169031E-16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (698, N'Digital Storage', N'Byte', N'Bit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (699, N'Digital Storage', N'Byte', N'Kilobit', 0.00800000037997961)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (700, N'Digital Storage', N'Byte', N'Kilobyte', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (701, N'Digital Storage', N'Byte', N'Kibibit', 0.0078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (702, N'Digital Storage', N'Byte', N'Kibibyte', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (703, N'Digital Storage', N'Byte', N'Megabit', 7.9999999798019417E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (704, N'Digital Storage', N'Byte', N'Megabyte', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (705, N'Digital Storage', N'Byte', N'Mebibit', 7.62939998821821E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (706, N'Digital Storage', N'Byte', N'Mebibyte', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (707, N'Digital Storage', N'Byte', N'Gigabit', 7.9999997737445483E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (708, N'Digital Storage', N'Byte', N'Gigabyte', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (709, N'Digital Storage', N'Byte', N'Gibibit', 7.4506001368490615E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (710, N'Digital Storage', N'Byte', N'Gibibyte', 9.3132002110252188E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (711, N'Digital Storage', N'Byte', N'Terabit', 7.9999999680335776E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (712, N'Digital Storage', N'Byte', N'Terabyte', 9.999999960041972E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (713, N'Digital Storage', N'Byte', N'Tebibit', 7.2760001149085873E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (714, N'Digital Storage', N'Byte', N'Tebibyte', 9.0948998549347793E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (715, N'Digital Storage', N'Byte', N'Petabit', 8.00000002901995E-15)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (716, N'Digital Storage', N'Byte', N'Petabyte', 1.0000000036274937E-15)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (717, N'Digital Storage', N'Byte', N'Pebibit', 7.1053998290302161E-15)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (718, N'Digital Storage', N'Byte', N'Pebibyte', 8.8818000788690133E-16)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (719, N'Digital Storage', N'Kilobit', N'Bit', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (720, N'Digital Storage', N'Kilobit', N'Byte', 125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (721, N'Digital Storage', N'Kilobit', N'Kilobyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (722, N'Digital Storage', N'Kilobit', N'Kibibit', 0.9765629768371582)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (723, N'Digital Storage', N'Kilobit', N'Kibibyte', 0.12206999957561493)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (724, N'Digital Storage', N'Kilobit', N'Megabit', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (725, N'Digital Storage', N'Kilobit', N'Megabyte', 0.00012500000593718141)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (726, N'Digital Storage', N'Kilobit', N'Mebibit', 0.00095367402536794543)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (727, N'Digital Storage', N'Kilobit', N'Mebibyte', 0.00011920899851247668)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (728, N'Digital Storage', N'Kilobit', N'Gigabit', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (729, N'Digital Storage', N'Kilobit', N'Gigabyte', 1.2499999968440534E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (730, N'Digital Storage', N'Kilobit', N'Gibibit', 9.3132001666162978E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (731, N'Digital Storage', N'Kilobit', N'Gibibyte', 1.1641999719813612E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (732, N'Digital Storage', N'Kilobit', N'Terabit', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (733, N'Digital Storage', N'Kilobit', N'Terabyte', 1.2499999646475857E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (734, N'Digital Storage', N'Kilobit', N'Tebibit', 9.0948998332507358E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (735, N'Digital Storage', N'Kilobit', N'Tebibyte', 1.1369000185723621E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (736, N'Digital Storage', N'Kilobit', N'Petabit', 9.999999960041972E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (737, N'Digital Storage', N'Kilobit', N'Petabyte', 1.2499999950052465E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (738, N'Digital Storage', N'Kilobit', N'Pebibit', 8.8817999179327534E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (739, N'Digital Storage', N'Kilobit', N'Pebibyte', 1.1101999853289912E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (740, N'Digital Storage', N'Kilobyte', N'Bit', 8000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (741, N'Digital Storage', N'Kilobyte', N'Byte', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (742, N'Digital Storage', N'Kilobyte', N'Kilobit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (743, N'Digital Storage', N'Kilobyte', N'Kibibit', 7.8125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (744, N'Digital Storage', N'Kilobyte', N'Kibibyte', 0.9765629768371582)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (745, N'Digital Storage', N'Kilobyte', N'Megabit', 0.00800000037997961)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (746, N'Digital Storage', N'Kilobyte', N'Megabyte', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (747, N'Digital Storage', N'Kilobyte', N'Mebibit', 0.0076293898746371269)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (748, N'Digital Storage', N'Kilobyte', N'Mebibyte', 0.00095367402536794543)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (749, N'Digital Storage', N'Kilobyte', N'Gigabit', 7.9999999798019417E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (750, N'Digital Storage', N'Kilobyte', N'Gigabyte', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (751, N'Digital Storage', N'Kilobyte', N'Gibibit', 7.4506001510599162E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (752, N'Digital Storage', N'Kilobyte', N'Gibibyte', 9.3132001666162978E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (753, N'Digital Storage', N'Kilobyte', N'Terabit', 7.9999997737445483E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (754, N'Digital Storage', N'Kilobyte', N'Terabyte', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (755, N'Digital Storage', N'Kilobyte', N'Tebibit', 7.2759998026583617E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (756, N'Digital Storage', N'Kilobyte', N'Tebibyte', 9.0948998332507358E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (757, N'Digital Storage', N'Kilobyte', N'Petabit', 7.9999999680335776E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (758, N'Digital Storage', N'Kilobyte', N'Petabyte', 9.999999960041972E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (759, N'Digital Storage', N'Kilobyte', N'Pebibit', 7.1054000357062552E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (760, N'Digital Storage', N'Kilobyte', N'Pebibyte', 8.8817999179327534E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (761, N'Digital Storage', N'Kibibit', N'Bit', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (762, N'Digital Storage', N'Kibibit', N'Byte', 128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (763, N'Digital Storage', N'Kibibit', N'Kilobit', 1.0240000486373901)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (764, N'Digital Storage', N'Kibibit', N'Kilobyte', 0.12800000607967377)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (765, N'Digital Storage', N'Kibibit', N'Kibibyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (766, N'Digital Storage', N'Kibibit', N'Megabit', 0.0010239999974146485)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (767, N'Digital Storage', N'Kibibit', N'Megabyte', 0.00012799999967683107)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (768, N'Digital Storage', N'Kibibit', N'Mebibit', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (769, N'Digital Storage', N'Kibibit', N'Mebibyte', 0.00012206999963382259)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (770, N'Digital Storage', N'Kibibit', N'Gigabit', 1.0239999710393022E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (771, N'Digital Storage', N'Kibibit', N'Gigabyte', 1.2799999637991277E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (772, N'Digital Storage', N'Kibibit', N'Gibibit', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (773, N'Digital Storage', N'Kibibit', N'Gibibyte', 1.19210000093517E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (774, N'Digital Storage', N'Kibibit', N'Terabit', 1.0239999959082979E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (775, N'Digital Storage', N'Kibibit', N'Terabyte', 1.2799999948853724E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (776, N'Digital Storage', N'Kibibit', N'Tebibit', 9.3132002110252188E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (777, N'Digital Storage', N'Kibibit', N'Tebibyte', 1.1641999864142605E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (778, N'Digital Storage', N'Kibibit', N'Petabit', 1.0240000037145536E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (779, N'Digital Storage', N'Kibibit', N'Petabyte', 1.280000004643192E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (780, N'Digital Storage', N'Kibibit', N'Pebibit', 9.0948998549347793E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (781, N'Digital Storage', N'Kibibit', N'Pebibyte', 1.1368999546044339E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (782, N'Digital Storage', N'Kibibyte', N'Bit', 8192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (783, N'Digital Storage', N'Kibibyte', N'Byte', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (784, N'Digital Storage', N'Kibibyte', N'Kilobit', 8.1920003890991211)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (785, N'Digital Storage', N'Kibibyte', N'Kilobyte', 1.0240000486373901)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (786, N'Digital Storage', N'Kibibyte', N'Kibibit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (787, N'Digital Storage', N'Kibibyte', N'Megabit', 0.0081919999793171883)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (788, N'Digital Storage', N'Kibibyte', N'Megabyte', 0.0010239999974146485)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (789, N'Digital Storage', N'Kibibyte', N'Mebibit', 0.0078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (790, N'Digital Storage', N'Kibibyte', N'Mebibyte', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (791, N'Digital Storage', N'Kibibyte', N'Gigabit', 8.1919997683144175E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (792, N'Digital Storage', N'Kibibyte', N'Gigabyte', 1.0239999710393022E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (793, N'Digital Storage', N'Kibibyte', N'Gibibit', 7.62939998821821E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (794, N'Digital Storage', N'Kibibyte', N'Gibibyte', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (795, N'Digital Storage', N'Kibibyte', N'Terabit', 8.1919999672663835E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (796, N'Digital Storage', N'Kibibyte', N'Terabyte', 1.0239999959082979E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (797, N'Digital Storage', N'Kibibyte', N'Tebibit', 7.4506001368490615E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (798, N'Digital Storage', N'Kibibyte', N'Tebibyte', 9.3132002110252188E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (799, N'Digital Storage', N'Kibibyte', N'Petabit', 8.1920000297164286E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (800, N'Digital Storage', N'Kibibyte', N'Petabyte', 1.0240000037145536E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (801, N'Digital Storage', N'Kibibyte', N'Pebibit', 7.2760001149085873E-12)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (802, N'Digital Storage', N'Kibibyte', N'Pebibyte', 9.0948998549347793E-13)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (803, N'Digital Storage', N'Megabit', N'Bit', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (804, N'Digital Storage', N'Megabit', N'Byte', 125000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (805, N'Digital Storage', N'Megabit', N'Kilobit', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (806, N'Digital Storage', N'Megabit', N'Kilobyte', 125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (807, N'Digital Storage', N'Megabit', N'Kibibit', 976.56298828125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (808, N'Digital Storage', N'Megabit', N'Kibibyte', 122.06999969482422)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (809, N'Digital Storage', N'Megabit', N'Megabyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (810, N'Digital Storage', N'Megabit', N'Mebibit', 0.95367401838302612)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (811, N'Digital Storage', N'Megabit', N'Mebibyte', 0.11920899897813797)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (812, N'Digital Storage', N'Megabit', N'Gigabit', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (813, N'Digital Storage', N'Megabit', N'Gigabyte', 0.00012500000593718141)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (814, N'Digital Storage', N'Megabit', N'Gibibit', 0.00093132298206910491)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (815, N'Digital Storage', N'Megabit', N'Gibibyte', 0.00011641500168479979)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (816, N'Digital Storage', N'Megabit', N'Terabit', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (817, N'Digital Storage', N'Megabit', N'Terabyte', 1.2499999968440534E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (818, N'Digital Storage', N'Megabit', N'Tebibit', 9.0948998376916279E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (819, N'Digital Storage', N'Megabit', N'Tebibyte', 1.1368999963679016E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (820, N'Digital Storage', N'Megabit', N'Petabit', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (821, N'Digital Storage', N'Megabit', N'Petabyte', 1.2499999646475857E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (822, N'Digital Storage', N'Megabit', N'Pebibit', 8.8817997401235971E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (823, N'Digital Storage', N'Megabit', N'Pebibyte', 1.1101999874973956E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (824, N'Digital Storage', N'Megabyte', N'Bit', 8000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (825, N'Digital Storage', N'Megabyte', N'Byte', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (826, N'Digital Storage', N'Megabyte', N'Kilobit', 8000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (827, N'Digital Storage', N'Megabyte', N'Kilobyte', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (828, N'Digital Storage', N'Megabyte', N'Kibibit', 7812.5)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (829, N'Digital Storage', N'Megabyte', N'Kibibyte', 976.56298828125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (830, N'Digital Storage', N'Megabyte', N'Megabit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (831, N'Digital Storage', N'Megabyte', N'Mebibit', 7.629389762878418)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (832, N'Digital Storage', N'Megabyte', N'Mebibyte', 0.95367401838302612)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (833, N'Digital Storage', N'Megabyte', N'Gigabit', 0.00800000037997961)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (834, N'Digital Storage', N'Megabyte', N'Gigabyte', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (835, N'Digital Storage', N'Megabyte', N'Gibibit', 0.0074505801312625408)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (836, N'Digital Storage', N'Megabyte', N'Gibibyte', 0.00093132298206910491)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (837, N'Digital Storage', N'Megabyte', N'Terabit', 7.9999999798019417E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (838, N'Digital Storage', N'Megabyte', N'Terabyte', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (839, N'Digital Storage', N'Megabyte', N'Tebibit', 7.2759999056870583E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (840, N'Digital Storage', N'Megabyte', N'Tebibyte', 9.0948998376916279E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (841, N'Digital Storage', N'Megabyte', N'Petabit', 7.9999997737445483E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (842, N'Digital Storage', N'Megabyte', N'Petabyte', 9.9999997171806854E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (843, N'Digital Storage', N'Megabyte', N'Pebibit', 7.1053998240699912E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (844, N'Digital Storage', N'Megabyte', N'Pebibyte', 8.8817997401235971E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (845, N'Digital Storage', N'Mebibit', N'Bit', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (846, N'Digital Storage', N'Mebibit', N'Byte', 131072)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (847, N'Digital Storage', N'Mebibit', N'Kilobit', 1048.5799560546875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (848, N'Digital Storage', N'Mebibit', N'Kilobyte', 131.07200622558594)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (849, N'Digital Storage', N'Mebibit', N'Kibibit', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (850, N'Digital Storage', N'Mebibit', N'Kibibyte', 128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (851, N'Digital Storage', N'Mebibit', N'Megabit', 1.0485800504684448)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (852, N'Digital Storage', N'Mebibit', N'Megabyte', 0.131071999669075)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (853, N'Digital Storage', N'Mebibit', N'Mebibyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (854, N'Digital Storage', N'Mebibit', N'Gigabit', 0.0010485800448805094)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (855, N'Digital Storage', N'Mebibit', N'Gigabyte', 0.00013107199629303068)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (856, N'Digital Storage', N'Mebibit', N'Gibibit', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (857, N'Digital Storage', N'Mebibit', N'Gibibyte', 0.00012206999963382259)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (858, N'Digital Storage', N'Mebibit', N'Terabit', 1.0485999837328563E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (859, N'Digital Storage', N'Mebibit', N'Terabyte', 1.3106999574574729E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (860, N'Digital Storage', N'Mebibit', N'Tebibit', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (861, N'Digital Storage', N'Mebibit', N'Tebibyte', 1.19210000093517E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (862, N'Digital Storage', N'Mebibit', N'Petabit', 1.0485999846210348E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (863, N'Digital Storage', N'Mebibit', N'Petabyte', 1.3107000207401853E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (864, N'Digital Storage', N'Mebibit', N'Pebibit', 9.3132002110252188E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (865, N'Digital Storage', N'Mebibit', N'Pebibyte', 1.1641999864142605E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (866, N'Digital Storage', N'Mebibyte', N'Bit', 8389000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (867, N'Digital Storage', N'Mebibyte', N'Byte', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (868, N'Digital Storage', N'Mebibyte', N'Kilobit', 8388.6103515625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (869, N'Digital Storage', N'Mebibyte', N'Kilobyte', 1048.5799560546875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (870, N'Digital Storage', N'Mebibyte', N'Kibibit', 8192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (871, N'Digital Storage', N'Mebibyte', N'Kibibyte', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (872, N'Digital Storage', N'Mebibyte', N'Megabit', 8.3886098861694336)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (873, N'Digital Storage', N'Mebibyte', N'Megabyte', 1.0485800504684448)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (874, N'Digital Storage', N'Mebibyte', N'Mebibit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (875, N'Digital Storage', N'Mebibyte', N'Gigabit', 0.0083886096253991127)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (876, N'Digital Storage', N'Mebibyte', N'Gigabyte', 0.0010485800448805094)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (877, N'Digital Storage', N'Mebibyte', N'Gibibit', 0.0078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (878, N'Digital Storage', N'Mebibyte', N'Gibibyte', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (879, N'Digital Storage', N'Mebibyte', N'Terabit', 8.38859978102846E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (880, N'Digital Storage', N'Mebibyte', N'Terabyte', 1.0485999837328563E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (881, N'Digital Storage', N'Mebibyte', N'Tebibit', 7.62939998821821E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (882, N'Digital Storage', N'Mebibyte', N'Tebibyte', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (883, N'Digital Storage', N'Mebibyte', N'Petabit', 8.3886000368238456E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (884, N'Digital Storage', N'Mebibyte', N'Petabyte', 1.0485999846210348E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (885, N'Digital Storage', N'Mebibyte', N'Pebibit', 7.4506001368490615E-09)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (886, N'Digital Storage', N'Mebibyte', N'Pebibyte', 9.3132002110252188E-10)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (887, N'Digital Storage', N'Gigabit', N'Bit', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (888, N'Digital Storage', N'Gigabit', N'Byte', 125000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (889, N'Digital Storage', N'Gigabit', N'Kilobit', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (890, N'Digital Storage', N'Gigabit', N'Kilobyte', 125000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (891, N'Digital Storage', N'Gigabit', N'Kibibit', 976563)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (892, N'Digital Storage', N'Gigabit', N'Kibibyte', 122070)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (893, N'Digital Storage', N'Gigabit', N'Megabit', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (894, N'Digital Storage', N'Gigabit', N'Megabyte', 125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (895, N'Digital Storage', N'Gigabit', N'Mebibit', 953.67401123046875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (896, N'Digital Storage', N'Gigabit', N'Mebibyte', 119.20899963378906)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (897, N'Digital Storage', N'Gigabit', N'Gigabyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (898, N'Digital Storage', N'Gigabit', N'Gibibit', 0.93132299184799194)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (899, N'Digital Storage', N'Gigabit', N'Gibibyte', 0.11641500145196915)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (900, N'Digital Storage', N'Gigabit', N'Terabit', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (901, N'Digital Storage', N'Gigabit', N'Terabyte', 0.00012500000593718141)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (902, N'Digital Storage', N'Gigabit', N'Tebibit', 0.00090949499281123281)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (903, N'Digital Storage', N'Gigabit', N'Tebibyte', 0.00011368699779268354)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (904, N'Digital Storage', N'Gigabit', N'Petabit', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (905, N'Digital Storage', N'Gigabit', N'Petabyte', 1.2499999968440534E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (906, N'Digital Storage', N'Gigabit', N'Pebibit', 8.8818001131585334E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (907, N'Digital Storage', N'Gigabit', N'Pebibyte', 1.1102000030405179E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (908, N'Digital Storage', N'Gigabyte', N'Bit', 8000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (909, N'Digital Storage', N'Gigabyte', N'Byte', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (910, N'Digital Storage', N'Gigabyte', N'Kilobit', 8000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (911, N'Digital Storage', N'Gigabyte', N'Kilobyte', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (912, N'Digital Storage', N'Gigabyte', N'Kibibit', 7813000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (913, N'Digital Storage', N'Gigabyte', N'Kibibyte', 976563)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (914, N'Digital Storage', N'Gigabyte', N'Megabit', 8000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (915, N'Digital Storage', N'Gigabyte', N'Megabyte', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (916, N'Digital Storage', N'Gigabyte', N'Mebibit', 7629.39013671875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (917, N'Digital Storage', N'Gigabyte', N'Mebibyte', 953.67401123046875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (918, N'Digital Storage', N'Gigabyte', N'Gigabit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (919, N'Digital Storage', N'Gigabyte', N'Gibibit', 7.45058012008667)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (920, N'Digital Storage', N'Gigabyte', N'Gibibyte', 0.93132299184799194)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (921, N'Digital Storage', N'Gigabyte', N'Terabit', 0.00800000037997961)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (922, N'Digital Storage', N'Gigabyte', N'Terabyte', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (923, N'Digital Storage', N'Gigabyte', N'Tebibit', 0.0072759599424898624)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (924, N'Digital Storage', N'Gigabyte', N'Tebibyte', 0.00090949499281123281)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (925, N'Digital Storage', N'Gigabyte', N'Petabit', 7.9999999798019417E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (926, N'Digital Storage', N'Gigabyte', N'Petabyte', 9.9999999747524271E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (927, N'Digital Storage', N'Gigabyte', N'Pebibit', 7.1054000727599487E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (928, N'Digital Storage', N'Gigabyte', N'Pebibyte', 8.8818001131585334E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (929, N'Digital Storage', N'Gibibit', N'Bit', 1074000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (930, N'Digital Storage', N'Gibibit', N'Byte', 134200000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (931, N'Digital Storage', N'Gibibit', N'Kilobit', 1074000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (932, N'Digital Storage', N'Gibibit', N'Kilobyte', 134218)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (933, N'Digital Storage', N'Gibibit', N'Kibibit', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (934, N'Digital Storage', N'Gibibit', N'Kibibyte', 131072)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (935, N'Digital Storage', N'Gibibit', N'Megabit', 1073.739990234375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (936, N'Digital Storage', N'Gibibit', N'Megabyte', 134.21800231933594)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (937, N'Digital Storage', N'Gibibit', N'Mebibit', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (938, N'Digital Storage', N'Gibibit', N'Mebibyte', 128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (939, N'Digital Storage', N'Gibibit', N'Gigabit', 1.0737400054931641)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (940, N'Digital Storage', N'Gibibit', N'Gigabyte', 0.1342180073261261)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (941, N'Digital Storage', N'Gibibit', N'Gibibyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (942, N'Digital Storage', N'Gibibit', N'Terabit', 0.0010737399570643902)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (943, N'Digital Storage', N'Gibibit', N'Terabyte', 0.00013421800395008177)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (944, N'Digital Storage', N'Gibibit', N'Tebibit', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (945, N'Digital Storage', N'Gibibit', N'Tebibyte', 0.00012206999963382259)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (946, N'Digital Storage', N'Gibibit', N'Petabit', 1.0736999911387102E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (947, N'Digital Storage', N'Gibibit', N'Petabyte', 1.342200022236284E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (948, N'Digital Storage', N'Gibibit', N'Pebibit', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (949, N'Digital Storage', N'Gibibit', N'Pebibyte', 1.19210000093517E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (950, N'Digital Storage', N'Gibibyte', N'Bit', 8590000128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (951, N'Digital Storage', N'Gibibyte', N'Byte', 1074000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (952, N'Digital Storage', N'Gibibyte', N'Kilobit', 8590000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (953, N'Digital Storage', N'Gibibyte', N'Kilobyte', 1074000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (954, N'Digital Storage', N'Gibibyte', N'Kibibit', 8389000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (955, N'Digital Storage', N'Gibibyte', N'Kibibyte', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (956, N'Digital Storage', N'Gibibyte', N'Megabit', 8589.9296875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (957, N'Digital Storage', N'Gibibyte', N'Megabyte', 1073.739990234375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (958, N'Digital Storage', N'Gibibyte', N'Mebibit', 8192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (959, N'Digital Storage', N'Gibibyte', N'Mebibyte', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (960, N'Digital Storage', N'Gibibyte', N'Gigabit', 8.5899295806884766)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (961, N'Digital Storage', N'Gibibyte', N'Gigabyte', 1.0737400054931641)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (962, N'Digital Storage', N'Gibibyte', N'Gibibit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (963, N'Digital Storage', N'Gibibyte', N'Terabit', 0.0085899299010634422)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (964, N'Digital Storage', N'Gibibyte', N'Terabyte', 0.0010737399570643902)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (965, N'Digital Storage', N'Gibibyte', N'Tebibit', 0.0078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (966, N'Digital Storage', N'Gibibyte', N'Tebibyte', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (967, N'Digital Storage', N'Gibibyte', N'Petabit', 8.5899000623612665E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (968, N'Digital Storage', N'Gibibyte', N'Petabyte', 1.0736999911387102E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (969, N'Digital Storage', N'Gibibyte', N'Pebibit', 7.62939998821821E-06)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (970, N'Digital Storage', N'Gibibyte', N'Pebibyte', 9.5366999630641658E-07)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (971, N'Digital Storage', N'Terabit', N'Bit', 999999995904)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (972, N'Digital Storage', N'Terabit', N'Byte', 124999999488)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (973, N'Digital Storage', N'Terabit', N'Kilobit', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (974, N'Digital Storage', N'Terabit', N'Kilobyte', 125000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (975, N'Digital Storage', N'Terabit', N'Kibibit', 976600000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (976, N'Digital Storage', N'Terabit', N'Kibibyte', 122100000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (977, N'Digital Storage', N'Terabit', N'Megabit', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (978, N'Digital Storage', N'Terabit', N'Megabyte', 125000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (979, N'Digital Storage', N'Terabit', N'Mebibit', 953674)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (980, N'Digital Storage', N'Terabit', N'Mebibyte', 119209)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (981, N'Digital Storage', N'Terabit', N'Gigabit', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (982, N'Digital Storage', N'Terabit', N'Gigabyte', 125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (983, N'Digital Storage', N'Terabit', N'Gibibit', 931.322998046875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (984, N'Digital Storage', N'Terabit', N'Gibibyte', 116.41500091552734)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (985, N'Digital Storage', N'Terabit', N'Terabyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (986, N'Digital Storage', N'Terabit', N'Tebibit', 0.90949499607086182)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (987, N'Digital Storage', N'Terabit', N'Tebibyte', 0.11368700116872788)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (988, N'Digital Storage', N'Terabit', N'Petabit', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (989, N'Digital Storage', N'Terabit', N'Petabyte', 0.00012500000593718141)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (990, N'Digital Storage', N'Terabit', N'Pebibit', 0.00088817800860852)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (991, N'Digital Storage', N'Terabit', N'Pebibyte', 0.00011102199641754851)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (992, N'Digital Storage', N'Terabyte', N'Bit', 7999999967232)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (993, N'Digital Storage', N'Terabyte', N'Byte', 999999995904)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (994, N'Digital Storage', N'Terabyte', N'Kilobit', 8000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (995, N'Digital Storage', N'Terabyte', N'Kilobyte', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (996, N'Digital Storage', N'Terabyte', N'Kibibit', 7813000192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (997, N'Digital Storage', N'Terabyte', N'Kibibyte', 976600000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (998, N'Digital Storage', N'Terabyte', N'Megabit', 8000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (999, N'Digital Storage', N'Terabyte', N'Megabyte', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1000, N'Digital Storage', N'Terabyte', N'Mebibit', 7629000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1001, N'Digital Storage', N'Terabyte', N'Mebibyte', 953674)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1002, N'Digital Storage', N'Terabyte', N'Gigabit', 8000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1003, N'Digital Storage', N'Terabyte', N'Gigabyte', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1004, N'Digital Storage', N'Terabyte', N'Gibibit', 7450.580078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1005, N'Digital Storage', N'Terabyte', N'Gibibyte', 931.322998046875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1006, N'Digital Storage', N'Terabyte', N'Terabit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1007, N'Digital Storage', N'Terabyte', N'Tebibit', 7.2759599685668945)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1008, N'Digital Storage', N'Terabyte', N'Tebibyte', 0.90949499607086182)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1009, N'Digital Storage', N'Terabyte', N'Petabit', 0.00800000037997961)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1010, N'Digital Storage', N'Terabyte', N'Petabyte', 0.0010000000474974513)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1011, N'Digital Storage', N'Terabyte', N'Pebibit', 0.0071054301224648952)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1012, N'Digital Storage', N'Terabyte', N'Pebibyte', 0.00088817800860852)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1013, N'Digital Storage', N'Tebibit', N'Bit', 1100000002048)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1014, N'Digital Storage', N'Tebibit', N'Byte', 137400000512)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1015, N'Digital Storage', N'Tebibit', N'Kilobit', 1100000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1016, N'Digital Storage', N'Tebibit', N'Kilobyte', 137400000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1017, N'Digital Storage', N'Tebibit', N'Kibibit', 1074000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1018, N'Digital Storage', N'Tebibit', N'Kibibyte', 134200000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1019, N'Digital Storage', N'Tebibit', N'Megabit', 1100000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1020, N'Digital Storage', N'Tebibit', N'Megabyte', 137439)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1021, N'Digital Storage', N'Tebibit', N'Mebibit', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1022, N'Digital Storage', N'Tebibit', N'Mebibyte', 131072)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1023, N'Digital Storage', N'Tebibit', N'Gigabit', 1099.510009765625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1024, N'Digital Storage', N'Tebibit', N'Gigabyte', 137.43899536132813)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1025, N'Digital Storage', N'Tebibit', N'Gibibit', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1026, N'Digital Storage', N'Tebibit', N'Gibibyte', 128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1027, N'Digital Storage', N'Tebibit', N'Terabit', 1.0995099544525147)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1028, N'Digital Storage', N'Tebibit', N'Terabyte', 0.13743899762630463)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1029, N'Digital Storage', N'Tebibit', N'Tebibyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1030, N'Digital Storage', N'Tebibit', N'Petabit', 0.001099510001949966)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1031, N'Digital Storage', N'Tebibit', N'Petabyte', 0.00013743899762630463)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1032, N'Digital Storage', N'Tebibit', N'Pebibit', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1033, N'Digital Storage', N'Tebibit', N'Pebibyte', 0.00012206999963382259)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1034, N'Digital Storage', N'Tebibyte', N'Bit', 8796000223232)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1035, N'Digital Storage', N'Tebibyte', N'Byte', 1100000002048)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1036, N'Digital Storage', N'Tebibyte', N'Kilobit', 8796000256)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1037, N'Digital Storage', N'Tebibyte', N'Kilobyte', 1100000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1038, N'Digital Storage', N'Tebibyte', N'Kibibit', 8590000128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1039, N'Digital Storage', N'Tebibyte', N'Kibibyte', 1074000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1040, N'Digital Storage', N'Tebibyte', N'Megabit', 8796000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1041, N'Digital Storage', N'Tebibyte', N'Megabyte', 1100000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1042, N'Digital Storage', N'Tebibyte', N'Mebibit', 8389000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1043, N'Digital Storage', N'Tebibyte', N'Mebibyte', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1044, N'Digital Storage', N'Tebibyte', N'Gigabit', 8796.08984375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1045, N'Digital Storage', N'Tebibyte', N'Gigabyte', 1099.510009765625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1046, N'Digital Storage', N'Tebibyte', N'Gibibit', 8192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1047, N'Digital Storage', N'Tebibyte', N'Gibibyte', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1048, N'Digital Storage', N'Tebibyte', N'Terabit', 8.7960901260375977)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1049, N'Digital Storage', N'Tebibyte', N'Terabyte', 1.0995099544525147)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1050, N'Digital Storage', N'Tebibyte', N'Tebibit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1051, N'Digital Storage', N'Tebibyte', N'Petabit', 0.0087960902601480484)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1052, N'Digital Storage', N'Tebibyte', N'Petabyte', 0.001099510001949966)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1053, N'Digital Storage', N'Tebibyte', N'Pebibit', 0.0078125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1054, N'Digital Storage', N'Tebibyte', N'Pebibyte', 0.00097656296566128731)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1055, N'Digital Storage', N'Petabit', N'Bit', 999999986991104)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1056, N'Digital Storage', N'Petabit', N'Byte', 124999998373888)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1057, N'Digital Storage', N'Petabit', N'Kilobit', 999999995904)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1058, N'Digital Storage', N'Petabit', N'Kilobyte', 124999999488)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1059, N'Digital Storage', N'Petabit', N'Kibibit', 976599973888)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1060, N'Digital Storage', N'Petabit', N'Kibibyte', 122099998720)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1061, N'Digital Storage', N'Petabit', N'Megabit', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1062, N'Digital Storage', N'Petabit', N'Megabyte', 125000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1063, N'Digital Storage', N'Petabit', N'Mebibit', 953699968)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1064, N'Digital Storage', N'Petabit', N'Mebibyte', 119200000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1065, N'Digital Storage', N'Petabit', N'Gigabit', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1066, N'Digital Storage', N'Petabit', N'Gigabyte', 125000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1067, N'Digital Storage', N'Petabit', N'Gibibit', 931323)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1068, N'Digital Storage', N'Petabit', N'Gibibyte', 116415)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1069, N'Digital Storage', N'Petabit', N'Terabit', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1070, N'Digital Storage', N'Petabit', N'Terabyte', 125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1071, N'Digital Storage', N'Petabit', N'Tebibit', 909.4949951171875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1072, N'Digital Storage', N'Petabit', N'Tebibyte', 113.68699645996094)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1073, N'Digital Storage', N'Petabit', N'Petabyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1074, N'Digital Storage', N'Petabit', N'Pebibit', 0.88817799091339111)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1075, N'Digital Storage', N'Petabit', N'Pebibyte', 0.11102200299501419)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1076, N'Digital Storage', N'Petabyte', N'Bit', 7999999895928832)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1077, N'Digital Storage', N'Petabyte', N'Byte', 999999986991104)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1078, N'Digital Storage', N'Petabyte', N'Kilobit', 7999999967232)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1079, N'Digital Storage', N'Petabyte', N'Kilobyte', 999999995904)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1080, N'Digital Storage', N'Petabyte', N'Kibibit', 7813000069120)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1081, N'Digital Storage', N'Petabyte', N'Kibibyte', 976599973888)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1082, N'Digital Storage', N'Petabyte', N'Megabit', 8000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1083, N'Digital Storage', N'Petabyte', N'Megabyte', 1000000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1084, N'Digital Storage', N'Petabyte', N'Mebibit', 7629000192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1085, N'Digital Storage', N'Petabyte', N'Mebibyte', 953699968)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1086, N'Digital Storage', N'Petabyte', N'Gigabit', 8000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1087, N'Digital Storage', N'Petabyte', N'Gigabyte', 1000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1088, N'Digital Storage', N'Petabyte', N'Gibibit', 7451000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1089, N'Digital Storage', N'Petabyte', N'Gibibyte', 931323)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1090, N'Digital Storage', N'Petabyte', N'Terabit', 8000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1091, N'Digital Storage', N'Petabyte', N'Terabyte', 1000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1092, N'Digital Storage', N'Petabyte', N'Tebibit', 7275.9599609375)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1093, N'Digital Storage', N'Petabyte', N'Tebibyte', 909.4949951171875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1094, N'Digital Storage', N'Petabyte', N'Petabit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1095, N'Digital Storage', N'Petabyte', N'Pebibit', 7.1054301261901855)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1096, N'Digital Storage', N'Petabyte', N'Pebibyte', 0.88817799091339111)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1097, N'Digital Storage', N'Pebibit', N'Bit', 1126000033267712)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1098, N'Digital Storage', N'Pebibit', N'Byte', 140699999666176)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1099, N'Digital Storage', N'Pebibit', N'Kilobit', 1125999968256)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1100, N'Digital Storage', N'Pebibit', N'Kilobyte', 140699992064)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1101, N'Digital Storage', N'Pebibit', N'Kibibit', 1100000002048)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1102, N'Digital Storage', N'Pebibit', N'Kibibyte', 137400000512)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1103, N'Digital Storage', N'Pebibit', N'Megabit', 1126000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1104, N'Digital Storage', N'Pebibit', N'Megabyte', 140700000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1105, N'Digital Storage', N'Pebibit', N'Mebibit', 1074000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1106, N'Digital Storage', N'Pebibit', N'Mebibyte', 134200000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1107, N'Digital Storage', N'Pebibit', N'Gigabit', 1126000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1108, N'Digital Storage', N'Pebibit', N'Gigabyte', 140737)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1109, N'Digital Storage', N'Pebibit', N'Gibibit', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1110, N'Digital Storage', N'Pebibit', N'Gibibyte', 131072)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1111, N'Digital Storage', N'Pebibit', N'Terabit', 1125.9000244140625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1112, N'Digital Storage', N'Pebibit', N'Terabyte', 140.73699951171875)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1113, N'Digital Storage', N'Pebibit', N'Tebibit', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1114, N'Digital Storage', N'Pebibit', N'Tebibyte', 128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1115, N'Digital Storage', N'Pebibit', N'Petabit', 1.1259000301361084)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1116, N'Digital Storage', N'Pebibit', N'Petabyte', 0.14073699712753296)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1117, N'Digital Storage', N'Pebibit', N'Pebibyte', 0.125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1118, N'Digital Storage', N'Pebibyte', N'Pebibit', 8)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1119, N'Digital Storage', N'Pebibyte', N'Byte', 1126000033267712)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1120, N'Digital Storage', N'Pebibyte', N'Kilobit', 9007000453120)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1121, N'Digital Storage', N'Pebibyte', N'Kilobyte', 1125999968256)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1122, N'Digital Storage', N'Pebibyte', N'Kibibit', 8796000223232)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1123, N'Digital Storage', N'Pebibyte', N'Kibibyte', 1100000002048)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1124, N'Digital Storage', N'Pebibyte', N'Megabit', 9006999552)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1125, N'Digital Storage', N'Pebibyte', N'Megabyte', 1126000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1126, N'Digital Storage', N'Pebibyte', N'Mebibit', 8590000128)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1127, N'Digital Storage', N'Pebibyte', N'Mebibyte', 1074000000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1128, N'Digital Storage', N'Pebibyte', N'Gigabit', 9007000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1129, N'Digital Storage', N'Pebibyte', N'Gigabyte', 1126000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1130, N'Digital Storage', N'Pebibyte', N'Gibibit', 8389000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1131, N'Digital Storage', N'Pebibyte', N'Gibibyte', 1049000)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1132, N'Digital Storage', N'Pebibyte', N'Terabit', 9007.2001953125)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1133, N'Digital Storage', N'Pebibyte', N'Terabyte', 1125.9000244140625)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1134, N'Digital Storage', N'Pebibyte', N'Tebibit', 8192)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1135, N'Digital Storage', N'Pebibyte', N'Tebibyte', 1024)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1136, N'Digital Storage', N'Pebibyte', N'Petabit', 9.0072002410888672)
GO
INSERT [dbo].[UnitsConversion] ([UnitsConversionId], [Type], [FromUnit], [ToUnit], [ScaleFactor]) VALUES (1137, N'Digital Storage', N'Pebibyte', N'Petabyte', 1.1259000301361084)
GO
SET IDENTITY_INSERT [dbo].[UnitsConversion] OFF
GO

IF EXISTS ( SELECT  1
            FROM    Information_schema.Routines
            WHERE   specific_name = 'ConvertUnits' AND Routine_Type = 'FUNCTION' ) 
DROP FUNCTION dbo.ConvertUnits
GO
CREATE FUNCTION dbo.ConvertUnits(@Unit float, @FromUnit nvarchar(20), @ToUnit nvarchar(20))
RETURNS float
AS
BEGIN
    DECLARE @ConvUnit float;
    DECLARE @ScaleFactor float = (select ScaleFactor from dbo.UnitsConversion where FromUnit = @FromUnit and ToUnit = @ToUnit)

    SELECT @ConvUnit = @Unit * @ScaleFactor

    RETURN @ConvUnit

END
GO



IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Cities') 
CREATE TABLE [info].[Cities](
	[Id] [bigint] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[location] [geography] NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[Place] [nvarchar](1000) NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Roads') 
CREATE TABLE [info].[Roads](
	[Id] [bigint] NOT NULL,
	[Street] [geography] NULL,
	[HighWayType] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[MaxSpeed] float NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE(),
	[LastUpdated] [datetime] NULL
 CONSTRAINT [PK_Roads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))


;WITH src AS (

(
SELECT       Relation.id as RelationId, AdminLevel = CASE WHEN ISNUMERIC(RelationTag.Info) =1 THEN CAST(RelationTag.Info as int) ELSE -1 END, Relation.Geo, RelationTag1.Info as Name, RelationTag2.Info as Place, RelationTag3.Info as PostalCode
,ROW_NUMBER() OVER (PARTITION BY Relation.id ORDER BY  Relation.id) AS idx, getdate() as DateCreated
FROM            Relation LEFT JOIN
				RelationTag ON Relation.id = RelationTag.RelationId INNER JOIN
				TagType ON RelationTag.Typ = TagType.Typ and RelationTag.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'admin_level') LEFT JOIN
				RelationTag AS RelationTag1 ON Relation.Id = RelationTag1.RelationId and RelationTag1.Typ =  (SELECT TOP(1) Typ FROM TagType WHERE name like 'name') LEFT JOIN
				RelationTag AS RelationTag2 ON Relation.Id = RelationTag2.RelationId and RelationTag2.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'place')LEFT JOIN
				RelationTag AS RelationTag3 ON Relation.Id = RelationTag3.RelationId and RelationTag3.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'postal_code') LEFT JOIN
				info.AdminLevels al ON al.RelationId = Relation.id 
where Relation.geo is not null and al.RelationId is null

))

insert info.AdminLevels (RelationId, AdminLevel, Geo, Name, Place, PostalCode)
select RelationId, AdminLevel, Geo, Name, Place, PostalCode from
src WHERE idx = 1;
GO



IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idx_AdminLevelsSpatial') 
IF(@@VERSION like '%Server 2008%')
	CREATE SPATIAL INDEX [idx_AdminLevelsSpatial] ON [info].[AdminLevels] ([Geo])
else
	CREATE SPATIAL INDEX [idx_AdminLevelsSpatial] ON [info].[AdminLevels] ([Geo]) USING  GEOGRAPHY_AUTO_GRID 

GO

-- INFO ROAD CREATION


--[dbo].[ConvertUnits]('Miles/hour','Km/hour', LEFT(WayTag2.Info, 2)) THIS WILL BE FOR CONVERTING, req specific!! 
;WITH CTE( Id, Street,HighWayType, Name, MaxSpeed, RowNum, DateCreated)
AS (

SELECT    Way.Id, Way.Line as Street,WayTag.Info as HighWayType, COALESCE(WayTagRef.Info + ' (' + WayTagName.Info + ')', WayTagName.Info, WayTagRef.Info) Name, CASE WHEN ISNUMERIC(LEFT(WayTag2.Info, 2)) = 1 THEN LEFT(WayTag2.Info, 2) ELSE NULL END as MaxSpeed,  ROW_NUMBER() OVER(PARTITION BY Way.Id ORDER BY Way.id) AS RowNum, getdate() as DateCreated
FROM            Way INNER JOIN
				WayTag ON WayTag.WayId = Way.Id INNER JOIN
				TagType ON WayTag.Typ = TagType.Typ and WayTag.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'highway') LEFT JOIN
				WayTag AS WayTagName ON Way.Id = WayTagName.WayId and WayTagName.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'name') LEFT JOIN
				WayTag AS WayTagRef ON Way.Id = WayTagRef.WayId and WayTagRef.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'ref') INNER JOIN
				WayTag AS WayTag2 ON Way.Id = WayTag2.WayId and WayTag2.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'maxspeed') --LEFT JOIN
			
where Way.line is not null
and COALESCE(WayTagRef.Info + ' (' + WayTagName.Info + ')', WayTagName.Info, WayTagRef.Info) is not null

)
MERGE info.Roads target USING (select * from CTE c WHERE  RowNum = 1) source
ON (target.id = source.id)
WHEN MATCHED AND (
		 target.MaxSpeed != source.MaxSpeed
		 OR (target.MaxSpeed IS NULL AND source.MaxSpeed IS NOT NULL)
		 OR (target.MaxSpeed IS NOT NULL AND source.MaxSpeed IS NULL)

		 OR target.Name != source.Name
		 OR (target.Name IS NULL AND source.Name IS NOT NULL)
		 OR (target.Name IS NOT NULL AND source.Name IS NULL)

		 OR target.HighWayType != source.HighWayType
		 OR (target.HighWayType IS NULL AND source.HighWayType IS NOT NULL)
		 OR (target.HighWayType IS NOT NULL AND source.HighWayType IS NULL)
	 )
    THEN UPDATE  SET target.Street = source.Street ,target.HighWayType = source.HighWayType, target.Name = source.Name, target.MaxSpeed = source.MaxSpeed, target.LastUpdated = GETDATE() 
	 
WHEN NOT MATCHED
    THEN INSERT (Id, Street,HighWayType,  Name, MaxSpeed, DateCreated) VALUES (source.Id, source.Street,source.HighWayType,  source.Name, source.MaxSpeed, source.DateCreated);
--WHEN NOT MATCHED BY SOURCE
    --as it is a delta load, do nothing. But could do this if full load: THEN DELETE;

	  delete [info].[Roads]
  where [HighWayType] = 'service'

IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idx_AdminLevelsSpatial') 
IF(@@VERSION like '%Server 2008%')
	CREATE SPATIAL INDEX [idx_AdminLevelsSpatial] ON [info].[AdminLevels] ([Geo])
else
	CREATE SPATIAL INDEX [idx_AdminLevelsSpatial] ON [info].[AdminLevels] ([Geo]) USING  GEOGRAPHY_AUTO_GRID 

GO



IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idx_Roads_Spacial') 
CREATE SPATIAL INDEX [idx_Roads_Spacial] ON [info].[Roads]
(
	[Street]
)USING  GEOGRAPHY_AUTO_GRID 
WITH (
CELLS_PER_OBJECT = 16, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO




;WITH CTE( Id, Latitude,Longitude,  location, Name, Place, RowNum, DateCreated)
AS
(

SELECT      Node.Id, node.Latitude, node.Longitude, Node.location,  NodeTag.Info as Name, NodeTag2.Info as Place,  ROW_NUMBER() OVER(PARTITION BY Node.Id ORDER BY Node.Id) AS RowNum, getdate() as DateCreated
FROM            Node LEFT JOIN
				NodeTag ON Node.id = NodeTag.NodeId INNER JOIN
				TagType ON NodeTag.Typ = TagType.Typ and NodeTag.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name = 'name') JOIN
				NodeTag AS NodeTag2 ON Node.Id = NodeTag2.NodeId and NodeTag2.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'place') 
				LEFT JOIN info.Cities c ON c.Id = Node.Id
where Node.location is not null and c.Id is null

)
insert info.Cities 
SELECT Id, Latitude,Longitude,  location, Name, Place, DateCreated  FROM  cte WHERE RowNum = 1


IF NOT EXISTS(SELECT 1 FROM SYS.INDEXES where name = 'idx_Cities_Spacial') 
CREATE SPATIAL INDEX [idx_Cities_Spacial] ON [info].[Cities]
(
	[Location]
)USING  GEOGRAPHY_AUTO_GRID 
WITH (
CELLS_PER_OBJECT = 16, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
