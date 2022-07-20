SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- SubColFilterProperties table upgrade script
-- Steps:
-- 1. Drop EnvironmentId column
-- 2. Convert varchar columns to nvarchar
-- 3. Rebuild constraints
-- 4. Add new system columns
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_SubColFilterProperties.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    E N V I R O N M E N T I D **/
-- Drop the primary key constraint.
ALTER TABLE [dbo].[SubColFilterProperties] DROP CONSTRAINT [PK_SCFilter]
GO
-- Drop the EnvironmentId column.
-- ALTER TABLE [dbo].[SubColFilterProperties] DROP COLUMN [EnvironmentId]
EXEC UpgradeDropColumn N'SubColFilterProperties', N'EnvironmentId'
GO

/** N V A R C H A R    C O N V E R S I O N **/
ALTER TABLE [dbo].[SubColFilterProperties] ALTER COLUMN [CollectionName]     [nvarchar](80) NOT NULL
ALTER TABLE [dbo].[SubColFilterProperties] ALTER COLUMN [PropertyName]       [nvarchar](80) NOT NULL
ALTER TABLE [dbo].[SubColFilterProperties] ALTER COLUMN [FilterPropertyName] [nvarchar](80) NOT NULL
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[SubColFilterProperties] WITH NOCHECK ADD
  CONSTRAINT [PK_SCFilter] PRIMARY KEY CLUSTERED
  (
      [CollectionName]
    , [PropertyName]
    , [Sequence]
    , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[SubColFilterProperties] ADD
  [InWorkflow]         [FlagNyType]      NOT NULL CONSTRAINT [DF_SCFilter_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]     [FlagNyType]      NOT NULL CONSTRAINT [DF_SCFilter_NoteExistsFlag] DEFAULT (0)
, [RecordDate]         [CurrentDateType] NOT NULL CONSTRAINT [DF_SCFilter_RecordDate] DEFAULT (getdate())
, [RowPointer]         [RowPointerType]  NOT NULL CONSTRAINT [DF_SCFilter_RowPointer] DEFAULT (newid())
, [CreatedBy]          [UsernameType]    NOT NULL CONSTRAINT [DF_SCFilter_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]          [UsernameType]    NOT NULL CONSTRAINT [DF_SCFilter_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]         [CurrentDateType] NOT NULL CONSTRAINT [DF_SCFilter_CreateDate] DEFAULT (getdate())
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[SubColFilterProperties] WITH NOCHECK ADD
  CONSTRAINT [IX_SubColFilterProperties_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO