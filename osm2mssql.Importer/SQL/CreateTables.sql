use [OSM];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'WayCreation') 
CREATE TABLE [WayCreation]	(
	wayId bigint NOT NULL,
	nodeId bigint NOT NULL,
	sort int NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Way') 
CREATE TABLE [Way] (
	[Id] bigint NOT NULL,
	[line] [geography] NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'WayTag') 
CREATE TABLE [WayTag] (
	[WayId] bigint NOT NULL,
	[Typ] [int] NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Node') 
CREATE TABLE [Node](
	[Id] bigint NOT NULL,
	[location] [geography] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'NodeTag') 
CREATE TABLE [NodeTag](
	[NodeId] bigint NOT NULL,
	[Typ] [int] NOT NULL,
	[Info] [nvarchar](1000) NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'TagType') 
create table [TagType] (
	[Typ] [int] not null,
	[Name] nvarchar(255),
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()		
)

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'RelationCreation') 
CREATE TABLE [RelationCreation]	(
	RelationId bigint NOT NULL,
	[ref] bigint NOT NULL,
	[type] int not null,
	[role] int not null,
	sort int NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'Relation') 
CREATE TABLE [Relation] (
	[id] bigint NOT NULL,
	[geo] [geography] NULL	 ,	
	[role] int not null,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'RelationTag') 
CREATE TABLE [RelationTag] (
	[RelationId] bigint NOT NULL,
	[Typ] [int] NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()
) ON [temp];


IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'MemberType') 
create table [MemberType] (
	[id] [int] not null constraint PK_MemberType_Id primary key clustered,
	[Name] nvarchar(255),
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()		
)

IF NOT EXISTS(SELECT 1 FROM SYS.TABLES where name = 'MemberRole') 
create table [MemberRole] (
	[id] [int] not null constraint PK_MemberRole_Id primary key clustered,
	[Name] nvarchar(255),
	[DateCreated] [datetime] NOT NULL DEFAULT GETDATE()		
)
