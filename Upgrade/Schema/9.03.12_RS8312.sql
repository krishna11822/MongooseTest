IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'ServicePollingQueue'
              AND   COLUMN_NAME = N'HashedPointer' )
ALTER TABLE ServicePollingQueue
ADD HashedPointer AS CAST(HASHBYTES('SHA2_512', ServerName + DatabaseName + cast(PollingService AS SYSNAME)) AS VARBINARY(64)) PERSISTED
GO
IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_ServicePollingQueue_Hashed'
              AND   object_id  = OBJECT_ID( N'[dbo].[ServicePollingQueue]'))  
CREATE NONCLUSTERED INDEX IX_ServicePollingQueue_Hashed ON dbo.ServicePollingQueue( HashedPointer ) 
INCLUDE (ServerName, DatabaseName, PollingService)
GO