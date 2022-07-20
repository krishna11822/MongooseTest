SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- SysParameters table upgrade script
-- Steps:
-- 1. Drop constraints
-- 2. Convert varchar columns to nvarchar
-- 3. Rebuild constraints
-- 4. Add new system columns
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_SysParameters.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    C O N S T R A I N T S **/
-- Drop the primary key constraint.
ALTER TABLE [dbo].[SysParameters] DROP CONSTRAINT [PK_SysParameters]
GO

/** N V A R C H A R    C O N V E R S I O N **/
ALTER TABLE [dbo].[SysParameters] ALTER COLUMN [Name]           [nvarchar](80)  NOT NULL
ALTER TABLE [dbo].[SysParameters] ALTER COLUMN [Description]    [nvarchar](255) NOT NULL
ALTER TABLE [dbo].[SysParameters] ALTER COLUMN [ParameterValue] [nvarchar](255) NULL
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[SysParameters] WITH NOCHECK ADD
  CONSTRAINT [PK_SysParameters] PRIMARY KEY CLUSTERED
  (
    [Name]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[SysParameters] ADD
  [InWorkflow]     [FlagNyType]      NOT NULL CONSTRAINT [DF_SysParms_InWorkflow] DEFAULT (0)
, [NoteExistsFlag] [FlagNyType]      NOT NULL CONSTRAINT [DF_SysParms_NoteExistsFlag] DEFAULT (0)
, [RecordDate]     [CurrentDateType] NOT NULL CONSTRAINT [DF_SysParms_RecordDate] DEFAULT (getdate())
, [RowPointer]     [RowPointerType]  NOT NULL CONSTRAINT [DF_SysParms_RowPointer] DEFAULT (newid())
, [CreatedBy]      [UsernameType]    NOT NULL CONSTRAINT [DF_SysParms_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]      [UsernameType]    NOT NULL CONSTRAINT [DF_SysParms_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]     [CurrentDateType] NOT NULL CONSTRAINT [DF_SysParms_CreateDate] DEFAULT (getdate())
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[SysParameters] WITH NOCHECK ADD
  CONSTRAINT [IX_SysParameters_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO