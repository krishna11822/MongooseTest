SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- MethodResultSets table upgrade script
-- Steps:
-- 1. Drop EnvironmentId column
-- 2. Convert varchar columns to nvarchar
-- 3. Rebuild constraints
-- 4. Add new system columns
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_MethodResultSets.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    E N V I R O N M E N T I D **/
-- Drop the primary key constraint.
ALTER TABLE [dbo].[MethodResultSets] DROP CONSTRAINT [PK_MethodResultSets]
GO
-- Drop the EnvironmentId column.
-- ALTER TABLE [dbo].[MethodResultSets] DROP COLUMN [EnvironmentId]
EXEC UpgradeDropColumn N'MethodResultSets', N'EnvironmentId'
GO

/** N V A R C H A R    C O N V E R S I O N **/
ALTER TABLE [dbo].[MethodResultSets] ALTER COLUMN [CollectionName] [nvarchar](80)  NOT NULL
ALTER TABLE [dbo].[MethodResultSets] ALTER COLUMN [MethodName]     [nvarchar](80)  NOT NULL
ALTER TABLE [dbo].[MethodResultSets] ALTER COLUMN [PropertyName]   [nvarchar](80)  NOT NULL
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[MethodResultSets] WITH NOCHECK ADD
  CONSTRAINT [PK_MethodResultSets] PRIMARY KEY CLUSTERED
  (
      [CollectionName]
    , [MethodName]
    , [Sequence]
    , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[MethodResultSets] ADD
  [InWorkflow]      [FlagNyType]      NOT NULL CONSTRAINT [DF_MethodResults_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]  [FlagNyType]      NOT NULL CONSTRAINT [DF_MethodResults_NoteExistsFlag] DEFAULT (0)
, [RecordDate]      [CurrentDateType] NOT NULL CONSTRAINT [DF_MethodResults_RecordDate] DEFAULT (getdate())
, [RowPointer]      [RowPointerType]  NOT NULL CONSTRAINT [DF_MethodResults_RowPointer] DEFAULT (newid())
, [CreatedBy]       [UsernameType]    NOT NULL CONSTRAINT [DF_MethodResults_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]       [UsernameType]    NOT NULL CONSTRAINT [DF_MethodResults_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]      [CurrentDateType] NOT NULL CONSTRAINT [DF_MethodResults_CreateDate] DEFAULT (getdate())
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[MethodResultSets] WITH NOCHECK ADD
  CONSTRAINT [IX_MethodResultSets_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO