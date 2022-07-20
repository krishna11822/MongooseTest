SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Procedures used during the upgrade process for dropping/altering columns.
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/8.00_02_CreateUpgradeProcedures.sql 1     8/21/13 2:03p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** U p g r a d e   D r o p   C o l u m n   P R O C E D U R E **/
-- Use this to drop columns.  It will make sure that any
-- statistics that may have been created by SQL server are
-- also dropped before the column is dropped.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpgradeDropColumn]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpgradeDropColumn]
GO

CREATE PROCEDURE dbo.UpgradeDropColumn( @table sysname, @column sysname )
AS
DECLARE 
  @statname sysname
, @cmd NVARCHAR(4000)

WHILE 1=1
BEGIN
   SET @statname = NULL
   select top 1 @statname = stats.name 
   from sys.stats stats
   inner join sys.stats_columns cols 
           on stats.object_id = cols.object_id
          and stats.stats_id = cols.stats_id
   inner join sys.columns syscol
           on syscol.object_id = cols.object_id
          and syscol.column_id = cols.column_id
   where stats.object_id = object_id(@table)
     and syscol.name = @column

   IF @statname IS NULL
      BREAK
   ELSE
   BEGIN
      SET @cmd = N'DROP STATISTICS [dbo].[' + @table + N'].[' + @statname + N']'
      EXEC sp_executesql @cmd
   END
END

SET @cmd = N'ALTER TABLE [dbo].[' + @table + N'] DROP COLUMN [' + @column + N']'
EXEC sp_executesql @cmd
GO

/** U p g r a d e   A l t e r   C o l u m n   P R O C E D U R E **/
-- Use this to alter columns.  It will make sure that any
-- statistics that may have been created by SQL server are
-- also dropped before the column is altered.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpgradeAlterColumn]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpgradeAlterColumn]
GO

CREATE PROCEDURE dbo.UpgradeAlterColumn( @table sysname, @column sysname, @newtype sysname )
AS
DECLARE
  @statname sysname
, @cmd NVARCHAR(4000)

WHILE 1=1
BEGIN
   SET @statname = NULL
   select top 1 @statname = stats.name 
   from sys.stats stats
   inner join sys.stats_columns cols 
           on stats.object_id = cols.object_id
          and stats.stats_id = cols.stats_id
   inner join sys.columns syscol
           on syscol.object_id = cols.object_id
          and syscol.column_id = cols.column_id
   where stats.object_id = object_id(@table)
     and syscol.name = @column

   IF @statname IS NULL
      BREAK
   ELSE
   BEGIN
      SET @cmd = N'DROP STATISTICS [dbo].[' + @table + N'].[' + @statname + N']'
      EXEC sp_executesql @cmd
   END
END

SET @cmd = N'ALTER TABLE [dbo].[' + @table + N'] ALTER COLUMN [' + @column + N'] ' + @newtype
EXEC sp_executesql @cmd
GO
