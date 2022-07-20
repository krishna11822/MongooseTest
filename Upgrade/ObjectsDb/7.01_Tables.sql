SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Tables table upgrade script
-- Steps:
-- 1. Drop EnvironmentId column
-- 2. Drop unused columns
-- 3. Add new system columns
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_Tables.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    E N V I R O N M E N T I D **/
-- Drop the unique key constraint.
-- Note that this was removed in a previous step so it shouldn't exist but check just in case.
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tables]') AND name = N'UQ_TableAlias')
ALTER TABLE [dbo].[Tables] DROP CONSTRAINT [UQ_TableAlias]
GO
-- Drop the EnvironmentId column.
-- ALTER TABLE [dbo].[Tables] DROP COLUMN [EnvironmentId]
EXEC UpgradeDropColumn N'Tables', N'EnvironmentId'
GO

/** D R O P    C O L U M N S **/
IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Tables]') AND name = N'InsertSequence')
ALTER TABLE [dbo].[Tables] DROP COLUMN [InsertSequence]
GO
IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Tables]') AND name = N'UpdateSequence')
ALTER TABLE [dbo].[Tables] DROP COLUMN [UpdateSequence]
GO
IF EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[Tables]') AND name = N'DeleteSequence')
ALTER TABLE [dbo].[Tables] DROP COLUMN [DeleteSequence]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[Tables] ADD
  [InWorkflow]      [FlagNyType]       NOT NULL CONSTRAINT [DF_Tables_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]  [FlagNyType]       NOT NULL CONSTRAINT [DF_Tables_NoteExistsFlag] DEFAULT (0)
, [RecordDate]      [CurrentDateType]  NOT NULL CONSTRAINT [DF_Tables_RecordDate] DEFAULT (getdate())
, [RowPointer]      [RowPointerType]   NOT NULL CONSTRAINT [DF_Tables_RowPointer] DEFAULT (newid())
, [CreatedBy]       [UsernameType]     NOT NULL CONSTRAINT [DF_Tables_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]       [UsernameType]     NOT NULL CONSTRAINT [DF_Tables_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]      [CurrentDateType]  NOT NULL CONSTRAINT [DF_Tables_CreateDate] DEFAULT (getdate())
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[Tables] WITH NOCHECK ADD
  CONSTRAINT [IX_Tables_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO