GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WayTag]') AND type in (N'U'))
DROP TABLE [dbo].[WayTag]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WayCreation]') AND type in (N'U'))
DROP TABLE [dbo].[WayCreation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Way]') AND type in (N'U'))
DROP TABLE [dbo].[Way]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnitsConversion]') AND type in (N'U'))
DROP TABLE [dbo].[UnitsConversion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagType]') AND type in (N'U'))
DROP TABLE [dbo].[TagType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RelationTag]') AND type in (N'U'))
DROP TABLE [dbo].[RelationTag]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RelationCreation]') AND type in (N'U'))
DROP TABLE [dbo].[RelationCreation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Relation]') AND type in (N'U'))
DROP TABLE [dbo].[Relation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NodeTag]') AND type in (N'U'))
DROP TABLE [dbo].[NodeTag]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Node]') AND type in (N'U'))
DROP TABLE [dbo].[Node]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
DROP TABLE [dbo].[MemberType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberRole]') AND type in (N'U'))
DROP TABLE [dbo].[MemberRole]
GO
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WayTag]') AND type in (N'U'))
DROP TABLE [dbo].[WayTag]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WayCreation]') AND type in (N'U'))
DROP TABLE [dbo].[WayCreation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Way]') AND type in (N'U'))
DROP TABLE [dbo].[Way]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnitsConversion]') AND type in (N'U'))
DROP TABLE [dbo].[UnitsConversion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagType]') AND type in (N'U'))
DROP TABLE [dbo].[TagType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RelationTag]') AND type in (N'U'))
DROP TABLE [dbo].[RelationTag]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RelationCreation]') AND type in (N'U'))
DROP TABLE [dbo].[RelationCreation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Relation]') AND type in (N'U'))
DROP TABLE [dbo].[Relation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NodeTag]') AND type in (N'U'))
DROP TABLE [dbo].[NodeTag]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Node]') AND type in (N'U'))
DROP TABLE [dbo].[Node]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
DROP TABLE [dbo].[MemberType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberRole]') AND type in (N'U'))
DROP TABLE [dbo].[MemberRole]
GO

IF EXISTS(SELECT * FROM sys.databases where name = '[OSM]' AND Recovery_model = 3)
BEGIN

    DECLARE @TLOG_BACKUP_FILE_MOST_RECENT NVARCHAR(500)
    SELECT @TLOG_BACKUP_FILE_MOST_RECENT = B.physical_device_name
    FROM 
       ( 
       SELECT   
          CONVERT(CHAR(100), SERVERPROPERTY('Servername')) AS Server, 
          msdb.dbo.backupset.database_name,  
          MAX(msdb.dbo.backupset.backup_finish_date) AS last_db_backup_date 
       FROM 
          msdb.dbo.backupmediafamily  
          INNER JOIN msdb.dbo.backupset ON msdb.dbo.backupmediafamily.media_set_id = msdb.dbo.backupset.media_set_id  
       WHERE 
          msdb..backupset.type = 'l' 
       GROUP BY 
          msdb.dbo.backupset.database_name  
       ) AS A 
       LEFT JOIN  
       ( 
       SELECT   
          CONVERT(CHAR(100), SERVERPROPERTY('Servername')) AS Server, 
          msdb.dbo.backupset.database_name,  
          msdb.dbo.backupset.backup_start_date,  
          msdb.dbo.backupset.backup_finish_date, 
          msdb.dbo.backupset.expiration_date, 
          msdb.dbo.backupset.backup_size,  
          msdb.dbo.backupmediafamily.logical_device_name,  
          msdb.dbo.backupmediafamily.physical_device_name,   
          msdb.dbo.backupset.name AS backupset_name, 
          msdb.dbo.backupset.description 
       FROM 
          msdb.dbo.backupmediafamily  
          INNER JOIN msdb.dbo.backupset ON msdb.dbo.backupmediafamily.media_set_id = msdb.dbo.backupset.media_set_id  
       WHERE 
          msdb..backupset.type = 'l' 
       ) AS B 
       ON A.[server] = B.[server] AND A.[database_name] = B.[database_name] AND A.[last_db_backup_date] = B.[backup_finish_date] 
       WHERE A.[database_name] = '[OSM]'
    ORDER BY  
       A.database_name 

    BACKUP LOG [osm] TO  DISK = @TLOG_BACKUP_FILE_MOST_RECENT WITH NOFORMAT, NOINIT,  NAME = N'[OSM] Backup post cleanup and shrink db', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
    
END
ELSE
    CHECKPOINT;


DECLARE @DATABASE_FILE_COUNT INT = (SELECT COUNT(1) FROM sys.database_files)
DECLARE @REMAINING_FILES_TO_SHRINK INT =  @DATABASE_FILE_COUNT
WHILE @REMAINING_FILES_TO_SHRINK > 0
BEGIN
    DECLARE @FileName sysname = N'[OSM]';
    DECLARE @TargetSize INT = (SELECT 1 + size*8./1024 FROM sys.database_files WHERE name = @FileName);
    DECLARE @Factor FLOAT = .999;
 
   --WHILE @TargetSize > 0
   --BEGIN
        SET @TargetSize *= @Factor;
        DBCC SHRINKFILE(@FileName, @TargetSize);
        DECLARE @msg VARCHAR(200) = CONCAT('Shrink file completed. Target Size: ', 
             @TargetSize, ' MB. Timestamp: ', CURRENT_TIMESTAMP);
        RAISERROR(@msg, 1, 1) WITH NOWAIT;
        WAITFOR DELAY '00:00:01';
    --END;
    SET @REMAINING_FILES_TO_SHRINK =-1
END


USE [osm]
GO
DBCC SHRINKFILE (N'[OSM]_log' , 1308)
GO