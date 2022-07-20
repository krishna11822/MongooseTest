-- RS8107: Redshift Outrigger

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Add new ExternalTableNameType UDDT
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ExternalTableNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ExternalTableNameType] FROM [nvarchar](257) NULL
GO


-- Drop object dependent on {IdoLinkedColumn,IdoLinkedTable}.TableName:
IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName'
   AND [type] = 'F'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[IdoLinkedColumn]'))
   ALTER TABLE [dbo].[IdoLinkedColumn] DROP CONSTRAINT [FK_IdoLinkedColumn_IdoLinkDatabase_TableName]
GO


-- Lengthen {IdoLinkedColumn,IdoLinkedTable}.TableName so they can store maxiumum width "SchemaName.TableName":
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedColumn]'), N'IsUserTable') = 1
   IF EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [name] = N'TableName'
      AND [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedColumn]'))
      ALTER TABLE [dbo].[IdoLinkedColumn]
         ALTER COLUMN [TableName] [dbo].[ExternalTableNameType] NOT NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedTable]'), N'IsUserTable') = 1
   IF EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [name] = N'TableName'
      AND [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedTable]'))
      ALTER TABLE [dbo].[IdoLinkedTable]
         ALTER COLUMN [TableName] [dbo].[ExternalTableNameType] NOT NULL
GO


-- Re-apply Foreign Key:
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedColumn]'), N'IsUserTable') = 1
AND OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedTable]'), N'IsUserTable') = 1
   ALTER TABLE [dbo].[IdoLinkedColumn]  WITH NOCHECK ADD  CONSTRAINT [FK_IdoLinkedColumn_IdoLinkDatabase_TableName] FOREIGN KEY([IdoLinkDatabase], [TableName])
   REFERENCES [IdoLinkedTable] ([IdoLinkDatabase], [TableName])
GO


-- Allow [IdoLinkedDatabase].[DatabaseType] of 5 (to represent Amazon Redshift)
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'IdoLinkedDatabase')
AND EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_IdoLinkedDatabase_DbType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'))
      ALTER TABLE [dbo].[IdoLinkedDatabase] DROP
      CONSTRAINT [CK_IdoLinkedDatabase_DbType]

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'IdoLinkedDatabase')
AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_IdoLinkedDatabase_DbType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'))
      ALTER TABLE [dbo].[IdoLinkedDatabase] ADD
      CONSTRAINT [CK_IdoLinkedDatabase_DbType] CHECK ([DatabaseType] = (5) Or [DatabaseType] = (4) Or [DatabaseType] = (3) Or [DatabaseType] = (2) Or [DatabaseType] = (1) Or [DatabaseType] = (0))

-- Allow [OutriggerProfile].[DatabaseType] of 5 (to represent Amazon Redshift)
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'OutriggerProfile')
AND EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_OutriggerProfile_DatabaseType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[OutriggerProfile]'))
      ALTER TABLE [dbo].[OutriggerProfile] DROP
      CONSTRAINT [CK_OutriggerProfile_DatabaseType]

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'OutriggerProfile')
AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_OutriggerProfile_DatabaseType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[OutriggerProfile]'))
      ALTER TABLE [dbo].[OutriggerProfile] ADD
      CONSTRAINT [CK_OutriggerProfile_DatabaseType] CHECK ([DatabaseType] = (5) Or [DatabaseType] = (4) Or [DatabaseType] = (3) Or [DatabaseType] = (2) Or [DatabaseType] = (1) Or [DatabaseType] = (0))

GO

