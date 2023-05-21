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
 CONSTRAINT [PK_AdminLevels] PRIMARY KEY CLUSTERED 
(
	[RelationId] ASC
))



IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Cities') 
CREATE TABLE [info].[Cities](
	[Id] [bigint] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[location] [geography] NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[Place] [nvarchar](1000) NOT NULL,
	[RowNum] [bigint] NULL,
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
	[MaxSpeed] [nvarchar](max) NULL,
	[RowNum] [bigint] NULL,
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

insert info.AdminLevels 
select * from
src WHERE idx = 1;
GO
--ALTER TABLE info.AdminLevels ADD CONSTRAINT
--PK_AdminLevels PRIMARY KEY CLUSTERED (RelationId)
--GO
--CREATE NONCLUSTERED INDEX idx_AdminLevels ON [info].[AdminLevels]
--(AdminLevel ASC)
--GO

--IF(@@VERSION like '%Server 2008%')
--	CREATE SPATIAL INDEX [idx_AdminLevelsSpatial] ON [info].[AdminLevels] ([Geo])
--else
--	CREATE SPATIAL INDEX [idx_AdminLevelsSpatial] ON [info].[AdminLevels] ([Geo]) USING  GEOGRAPHY_AUTO_GRID 

--GO

-- INFO ROAD CREATION


;WITH CTE( Id, Street,HighWayType,  Name, MaxSpeed, RowNum, DateCreated)
AS (SELECT       Way.Id, Way.Line as Street,WayTag.Info as HighWayType, WayTag1.Info as Name, WayTag2.Info as MaxSpeed,  ROW_NUMBER() OVER(PARTITION BY Way.Id ORDER BY Way.id) AS RowNum, getdate() as DateCreated
FROM            Way LEFT JOIN
				WayTag ON WayTag.WayId = Way.Id INNER JOIN
				TagType ON WayTag.Typ = TagType.Typ and WayTag.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'highway') LEFT JOIN
				WayTag AS WayTag1 ON Way.Id = WayTag1.WayId and WayTag1.Typ =  (SELECT TOP(1) Typ FROM TagType WHERE name like 'name') LEFT JOIN
				WayTag AS WayTag2 ON Way.Id = WayTag2.WayId and WayTag2.Typ = (SELECT TOP(1) Typ FROM TagType WHERE name like 'maxspeed') LEFT JOIN
				info.Roads r ON r.Id = Way.Id 
where Way.line is not null and r.Id is null
)
insert info.Roads 
SELECT * FROM  cte WHERE RowNum = 1
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
SELECT *  FROM  cte WHERE RowNum = 1

--ALTER TABLE info.Cities ADD CONSTRAINT PK_Cities PRIMARY KEY CLUSTERED (Id)

--IF(@@VERSION like '%Server 2008%')
--	CREATE SPATIAL INDEX [idxCities] ON [info].Cities (location)
--ELSE
--	CREATE SPATIAL INDEX [idxCities] ON [info].Cities (location) USING  GEOGRAPHY_AUTO_GRID 

