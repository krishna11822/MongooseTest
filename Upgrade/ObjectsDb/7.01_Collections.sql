SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Collections table upgrade script
-- Steps:
-- 1. Temporarily rename the CreateDate column
-- 2. Drop EnvironmentId, SourceEnvironmentId, StatusFlag, Guid,
--    CodeGenDate, and SourceRevisionNo columns
-- 3. Convert varchar columns to nvarchar
-- 4. Rebuild constraints
-- 5. Add new system columns
-- 6. Update CreateDate and drop TmpCreateDate
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_Collections.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

-- The SyteLine Objects database contains this index...[CollectionNameDevFlagIdx]...not sure why but we can drop it
-- since it duplicates the primary key index.
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Collections]') AND name = N'CollectionNameDevFlagIdx')
DROP INDEX [CollectionNameDevFlagIdx] ON [dbo].[Collections] WITH ( ONLINE = OFF )
GO

/** R E N A M E    C R E A T E D A T E **/
-- Create a temporary column to store the CreateDate values.
ALTER TABLE [dbo].[Collections] ADD
  [TmpCreateDate] [datetime] NULL
GO
-- Copy the values from CreateDate to TmpCreateDate.
UPDATE [dbo].[Collections]
SET [TmpCreateDate] = [CreateDate]
GO
-- Drop the default constraint for CreateDate.
ALTER TABLE [dbo].[Collections] DROP CONSTRAINT [DF_Collections_CreateDate]
GO
-- Drop the CreateDate column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [CreateDate]
EXEC UpgradeDropColumn N'Collections', N'CreateDate'
GO

/** D R O P    C O L U M N S **/
-- Drop the unique key constraint.
ALTER TABLE [dbo].[Collections] DROP CONSTRAINT [UQ_Collections]
GO
-- Drop the primary key constraint.
ALTER TABLE [dbo].[Collections] DROP CONSTRAINT [PK_Collections]
GO
-- Drop the EnvironmentId column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [EnvironmentId]
EXEC UpgradeDropColumn N'Collections', N'EnvironmentId'
GO
-- Drop the SourceEnvironmentId column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [SourceEnvironmentId]
EXEC UpgradeDropColumn N'Collections', N'SourceEnvironmentId'
GO
-- Drop the RefreshKeysFlag default constraint.
ALTER TABLE [dbo].[Collections] DROP CONSTRAINT [DF_Collections_RefFlag]
GO
-- Drop the RefreshKeysFlag column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [RefreshKeysFlag]
EXEC UpgradeDropColumn N'Collections', N'RefreshKeysFlag'
GO
-- Drop the StatusFlag default constraint.
ALTER TABLE [dbo].[Collections] DROP CONSTRAINT [DF_Collections_StatusFlag]
GO
-- Drop the StatusFlag column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [StatusFlag]
EXEC UpgradeDropColumn N'Collections', N'StatusFlag'
GO
-- Drop the Guid column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [Guid]
EXEC UpgradeDropColumn N'Collections', N'Guid'
GO
-- Drop the CodeGenDate column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [CodeGenDate]
EXEC UpgradeDropColumn N'Collections', N'CodeGenDate'
GO
-- Drop the SourceRevisionNo column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [SourceRevisionNo]
EXEC UpgradeDropColumn N'Collections', N'SourceRevisionNo'
GO

/** N V A R C H A R    C O N V E R S I O N **/
ALTER TABLE [dbo].[Collections] ALTER COLUMN [CollectionName] [nvarchar](80)  NOT NULL
ALTER TABLE [dbo].[Collections] ALTER COLUMN [ServerName]     [nvarchar](80)  NOT NULL
ALTER TABLE [dbo].[Collections] ALTER COLUMN [ItemName]       [nvarchar](80)  NOT NULL
ALTER TABLE [dbo].[Collections] ALTER COLUMN [CollectionDesc] [nvarchar](255) NULL
ALTER TABLE [dbo].[Collections] ALTER COLUMN [LockBy]         [nvarchar](80)  NULL
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[Collections] WITH NOCHECK ADD
  CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED
  (
      [CollectionName]
    , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO
-- Re-create the unique key constraint.
ALTER TABLE [dbo].[Collections] WITH NOCHECK ADD
  CONSTRAINT [UQ_Collections] UNIQUE NONCLUSTERED
  (
      [ItemName]
    , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[Collections] ADD
  [CustomAssemblyName]   [nvarchar](80)    NULL
, [ExtClassNamespace]    [nvarchar](255)   NULL
, [ExtClassName]         [nvarchar](80)    NULL
, [Extends]              [nvarchar](80)    NULL
, [ReplaceFlag]          [FlagNyType]      NULL
, [InWorkflow]           [FlagNyType]      NOT NULL CONSTRAINT [DF_Collections_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]       [FlagNyType]      NOT NULL CONSTRAINT [DF_Collections_NoteExistsFlag] DEFAULT (0)
, [RecordDate]           [CurrentDateType] NOT NULL CONSTRAINT [DF_Collections_RecordDate] DEFAULT (getdate())
, [RowPointer]           [RowPointerType]  NOT NULL CONSTRAINT [DF_Collections_RowPointer] DEFAULT (newid())
, [CreatedBy]            [UsernameType]    NOT NULL CONSTRAINT [DF_Collections_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]            [UsernameType]    NOT NULL CONSTRAINT [DF_Collections_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]           [CurrentDateType] NOT NULL CONSTRAINT [DF_Collections_CreateDate] DEFAULT (getdate())
GO

/** U P D A T E    C R E A T E D A T E **/
-- Copy the values from TmpCreateDate to CreateDate.
UPDATE [dbo].[Collections]
SET [CreateDate] = [TmpCreateDate]
GO
-- Drop the TmpCreateDate column.
-- ALTER TABLE [dbo].[Collections] DROP COLUMN [TmpCreateDate]
EXEC UpgradeDropColumn N'Collections', N'TmpCreateDate'
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[Collections] WITH NOCHECK ADD
  CONSTRAINT [IX_Collections_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO