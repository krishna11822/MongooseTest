SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- MethodParameters table upgrade script
-- Steps:
-- 1. Drop EnvironmentId column
-- 2. Convert varchar columns to nvarchar
-- 3. Rebuild constraints
-- 4. Add new system columns
-- 5. Update the OutputFlag and MessageFlag columns.
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_MethodParameters.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    E N V I R O N M E N T I D **/
-- Drop the unique key constraint.
ALTER TABLE [dbo].[MethodParameters] DROP CONSTRAINT [UQ_MethodParam_Seq]
GO
-- Drop the primary key constraint.
ALTER TABLE [dbo].[MethodParameters] DROP CONSTRAINT [PK_MethodParameters]
GO
-- Drop the EnvironmentId column.
-- ALTER TABLE [dbo].[MethodParameters] DROP COLUMN [EnvironmentId]
EXEC UpgradeDropColumn N'MethodParameters', N'EnvironmentId'
GO

/** N V A R C H A R    C O N V E R S I O N **/
ALTER TABLE [dbo].[MethodParameters] ALTER COLUMN [CollectionName] [nvarchar](80) NOT NULL
ALTER TABLE [dbo].[MethodParameters] ALTER COLUMN [MethodName]     [nvarchar](80) NOT NULL
ALTER TABLE [dbo].[MethodParameters] ALTER COLUMN [ParameterName]  [nvarchar](80) NOT NULL
ALTER TABLE [dbo].[MethodParameters] ALTER COLUMN [DataType]       [nvarchar](80) NOT NULL
ALTER TABLE [dbo].[MethodParameters] ALTER COLUMN [SpDataType]     [nvarchar](80) NULL
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[MethodParameters] WITH NOCHECK ADD
  CONSTRAINT [PK_MethodParameters] PRIMARY KEY CLUSTERED
  (
      [CollectionName]
    , [MethodName]
    , [ParameterName]
    , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO
-- Re-create the unique key constraint.
ALTER TABLE [dbo].[MethodParameters] WITH NOCHECK ADD
  CONSTRAINT [UQ_MethodParam_Seq] UNIQUE NONCLUSTERED
  (
      [CollectionName]
    , [MethodName]
    , [Sequence]
    , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[MethodParameters] ADD
  [MessageFlag]     [smallint]        NOT NULL CONSTRAINT [DF_MethodParams_MessageFlag] DEFAULT (0)
, [InWorkflow]      [FlagNyType]      NOT NULL CONSTRAINT [DF_MethodParams_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]  [FlagNyType]      NOT NULL CONSTRAINT [DF_MethodParams_NoteExistsFlag] DEFAULT (0)
, [RecordDate]      [CurrentDateType] NOT NULL CONSTRAINT [DF_MethodParams_RecordDate] DEFAULT (getdate())
, [RowPointer]      [RowPointerType]  NOT NULL CONSTRAINT [DF_MethodParams_RowPointer] DEFAULT (newid())
, [CreatedBy]       [UsernameType]    NOT NULL CONSTRAINT [DF_MethodParams_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]       [UsernameType]    NOT NULL CONSTRAINT [DF_MethodParams_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]      [CurrentDateType] NOT NULL CONSTRAINT [DF_MethodParams_CreateDate] DEFAULT (getdate())
GO

/** U P D A T E    M E S S A G E F L A G **/
UPDATE [dbo].[MethodParameters]
SET [MessageFlag] = 1, [OutputFlag] = 1
WHERE [OutputFlag] = 3

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[MethodParameters] WITH NOCHECK ADD
  CONSTRAINT [IX_MethodParameters_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO