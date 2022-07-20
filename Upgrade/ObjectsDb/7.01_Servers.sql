SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Servers table upgrade script
-- Steps:
-- 1. Drop constraints
-- 2. Drop obsolete columns
-- 3. Convert varchar columns to nvarchar
-- 4. Rebuild constraints
-- 5. Add new system columns
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_Servers.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    C O N S T R A I N T S **/
-- Drop the unique key constraint.
ALTER TABLE [dbo].[Servers] DROP CONSTRAINT [UQ_ServerProjectNames]
GO
-- Drop the default constraint on ProjectType.
ALTER TABLE [dbo].[Servers] DROP CONSTRAINT [DF_Servers_ProjectType]
GO
-- Drop the primary key constraint.
ALTER TABLE [dbo].[Servers] DROP CONSTRAINT [PK_Servers]
GO

/** D R O P    C O L U M N S **/
-- Drop the ProjectName column.
-- ALTER TABLE [dbo].[Servers] DROP COLUMN [ProjectName]
EXEC UpgradeDropColumn N'Servers', N'ProjectName'
GO
-- Drop the ProjectConfigName column.
-- ALTER TABLE [dbo].[Servers] DROP COLUMN [ProjectConfigName]
EXEC UpgradeDropColumn N'Servers', N'ProjectConfigName'
GO
-- Drop the ProjectType column.
-- ALTER TABLE [dbo].[Servers] DROP COLUMN [ProjectType]
EXEC UpgradeDropColumn N'Servers', N'ProjectType'
GO
-- Drop the ProgIDPrefix column.
-- ALTER TABLE [dbo].[Servers] DROP COLUMN [ProgIDPrefix]
EXEC UpgradeDropColumn N'Servers', N'ProgIDPrefix'
GO

/** N V A R C H A R    C O N V E R S I O N **/
ALTER TABLE [dbo].[Servers] ALTER COLUMN [ServerName] [nvarchar](80)  NOT NULL
ALTER TABLE [dbo].[Servers] ALTER COLUMN [ServerDesc] [nvarchar](255) NULL
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[Servers] WITH NOCHECK ADD
  CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED
  (
    [ServerName]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[Servers] ADD
  [AccessAs]          [nvarchar](50)    NULL
, [InWorkflow]        [FlagNyType]      NOT NULL CONSTRAINT [DF_Servers_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]    [FlagNyType]      NOT NULL CONSTRAINT [DF_Servers_NoteExistsFlag] DEFAULT (0)
, [RecordDate]        [CurrentDateType] NOT NULL CONSTRAINT [DF_Servers_RecordDate] DEFAULT (getdate())
, [RowPointer]        [RowPointerType]  NOT NULL CONSTRAINT [DF_Servers_RowPointer] DEFAULT (newid())
, [CreatedBy]         [UsernameType]    NOT NULL CONSTRAINT [DF_Servers_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]         [UsernameType]    NOT NULL CONSTRAINT [DF_Servers_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]        [CurrentDateType] NOT NULL CONSTRAINT [DF_Servers_CreateDate] DEFAULT (getdate())
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[Servers] WITH NOCHECK ADD
  CONSTRAINT [IX_Servers_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO