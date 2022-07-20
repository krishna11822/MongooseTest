SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'ProfileNameType')
CREATE TYPE ProfileNameType FROM NVARCHAR(50)
GO
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'TimeoutType')
CREATE TYPE TimeoutType FROM INT
GO
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'DatabaseTypeType')
CREATE TYPE DatabaseTypeType FROM tinyint
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedColumn]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedColumn]')
      AND [name] = N'PropertyDataType')
   ALTER TABLE [dbo].[IdoLinkedColumn] ADD
      [PropertyDataType] [dbo].[CollectionPropertyDataTypeType] NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedColumn]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedColumn]')
      AND [name] = N'PropertyLength')
   ALTER TABLE [dbo].[IdoLinkedColumn] ADD
      [PropertyLength] [dbo].[ColumnPrecisionType] NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedColumn]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedColumn]')
      AND [name] = N'PropertyScale')
   ALTER TABLE [dbo].[IdoLinkedColumn] ADD
      [PropertyScale] [dbo].[ColumnScaleType] NULL


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]')
      AND [name] = 'ProfileName')
   ALTER TABLE [dbo].[IdoLinkedDatabase] ADD
      [ProfileName] [dbo].[ProfileNameType] NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]')
      AND [name] = N'DatabaseType')
   ALTER TABLE [dbo].[IdoLinkedDatabase] ADD
      [DatabaseType] [dbo].[DatabaseTypeType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'), N'IsUserTable') = 1
UPDATE IdoLinkedDatabase
SET DatabaseType = 1
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]')
      AND [name] = N'DatabaseType')
ALTER TABLE [dbo].[IdoLinkedDatabase] ALTER COLUMN
   [DatabaseType] [dbo].[DatabaseTypeType] NOT NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]')
      AND [name] = N'DatabaseName')
ALTER TABLE [dbo].[IdoLinkedDatabase] ALTER COLUMN
   [DatabaseName] SYSNAME NULL


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'IdoLinkedDatabase')
AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_IdoLinkedDatabase_DbType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'))
      ALTER TABLE [dbo].[IdoLinkedDatabase] ADD
      CONSTRAINT [CK_IdoLinkedDatabase_DbType] CHECK ([DatabaseType] = (1) Or [DatabaseType] = (0))



IF OBJECT_ID(N'[dbo].[OutriggerProfile]', N'U') IS NULL
BEGIN
   CREATE TABLE [dbo].[OutriggerProfile](
       [ProfileName] [ProfileNameType] NOT NULL,
       [DatabaseType] [dbo].[DatabaseTypeType] NOT NULL
         CONSTRAINT [CK_OutriggerProfile_DatabaseType] CHECK ([DatabaseType] IN (0,1)),
       [Username] [dbo].[UsernameType] NOT NULL,
       [UserPassword] [dbo].[EncryptedClientPasswordType] NULL,
       [ServerName] [dbo].[OSMachineNameType] NULL,
       [DataSourceName] SYSNAME NOT NULL,
       [QueryTimeout] TimeoutType NOT NULL
         CONSTRAINT [DF_OutriggerProfile_QueryTimeout] DEFAULT (0)
         CONSTRAINT [CK_OutriggerProfile_QueryTimeout] CHECK ([QueryTimeout] >= -1),
       [NoteExistsFlag] [dbo].[FlagNyType]      NOT NULL
         CONSTRAINT [DF_OutriggerProfile_NoteExistsFlag] DEFAULT ((0))
         CONSTRAINT [CK_OutriggerProfile_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
      [RecordDate]     [dbo].[CurrentDateType] NOT NULL
         CONSTRAINT [DF_OutriggerProfile_RecordDate] DEFAULT (getdate()),
      [RowPointer]     [dbo].[RowPointerType]  NOT NULL
         CONSTRAINT [DF_OutriggerProfile_RowPointer] DEFAULT (newid()),
      [CreatedBy]      [dbo].[UsernameType]    NOT NULL
         CONSTRAINT [DF_OutriggerProfile_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy]      [dbo].[UsernameType]    NOT NULL
         CONSTRAINT [DF_OutriggerProfile_UpdatedBy] DEFAULT (suser_sname()),
      [CreateDate]     [dbo].[CurrentDateType] NOT NULL
         CONSTRAINT [DF_OutriggerProfile_CreateDate] DEFAULT (getdate()),
      [InWorkflow]     [dbo].[FlagNyType]      NOT NULL
         CONSTRAINT [DF_OutriggerProfile_InWorkflow] DEFAULT ((0))
         CONSTRAINT [CK_OutriggerProfile_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
    CONSTRAINT [PK_OutriggerProfile] PRIMARY KEY CLUSTERED 
   (
       [ProfileName] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_OutriggerProfile_RowPointer] UNIQUE ([RowPointer])
    ON [PRIMARY]
   ) ON [PRIMARY]
END
GO
