SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Remove the TableId column and associated dependencies.  Also drop the TableJoins
-- and TableJoinsHistory tables.  Note that this step in the upgrade process is
-- executed separately because there are dependencies among the Tables, TableJoins,
-- and Properties tables that must be handled in the correct order.
-- 
--  1. Drop Tables PK/UQ constraints
--  2. Convert varchar columns to nvarchar and re-create PK constraint.
--  3. Create ColumnTableAlias column in Properties.
--  4. Update ColumnTableAlias based on ColumnTableId in Properties.
--  5. Drop ColumnTableId in Properties.
--  6. Rename the Tables.CustomJoin column to JoinText.
--  7. Change the datatype of JoinText to nvarchar(max).
--  8. Update the Tables.JoinText column based on data from the TableJoins table.
--  9. Drop the TableId column from Tables.
-- 10. Drop the TableJoins tables.
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_04_RemoveTableId.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

-- *** 1. Drop Tables PK/UQ constraints. 
-- Drop the primary key constraint.
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tables]') AND name = N'PK_Tables')
ALTER TABLE [dbo].[Tables] DROP CONSTRAINT [PK_Tables]
GO
-- Drop the unique key constraint.
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tables]') AND name = N'UQ_TableAlias')
ALTER TABLE [dbo].[Tables] DROP CONSTRAINT [UQ_TableAlias]
GO
-- The SyteLine Objects database contains this index...not sure where it came from but dropping for now.
-- Can be recreated with this...
-- CREATE NONCLUSTERED INDEX [IX_Tables_TableName_Type] ON [dbo].[Tables] 
-- (
--  [TableName] ASC,
--  [TableType] ASC
-- ) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
--
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Tables]') AND name = N'IX_Tables_TableName_Type')
DROP INDEX [IX_Tables_TableName_Type] ON [dbo].[Tables] WITH ( ONLINE = OFF )
GO

-- *** 2. Convert varchar columns to nvarchar and re-create PK constraint.
-- We need to convert the datatypes first, since the PK constraint is dependent
-- on some of these columns.
ALTER TABLE [dbo].[Tables] ALTER COLUMN [CollectionName] [nvarchar](80) NOT NULL
GO
-- ALTER TABLE [dbo].[Tables] ALTER COLUMN [TableName] [nvarchar](80) NOT NULL 
EXEC UpgradeAlterColumn N'Tables', N'TableName', N'[nvarchar](80) NOT NULL'
GO
ALTER TABLE [dbo].[Tables] ALTER COLUMN [TableAlias] [nvarchar](80) NOT NULL
GO
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[Tables] WITH NOCHECK ADD
  CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED
  (
    [CollectionName]
  , [TableAlias]
  , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

-- *** 3. Create ColumnTableAlias column in Properties.
ALTER TABLE [dbo].[Properties] ADD [ColumnTableAlias] [nvarchar](80) NULL
GO

-- *** 4. Update ColumnTableAlias based on ColumnTableId in Properties.
UPDATE Properties
SET Properties.ColumnTableAlias = Tables.TableAlias
FROM Tables INNER JOIN Properties ON Tables.TableId = Properties.ColumnTableId
GO

-- *** 5. Drop ColumnTableId in Properties.
EXEC UpgradeDropColumn N'Properties', N'ColumnTableId'
GO

-- *** 6. Rename the Tables.CustomJoin column to JoinText.
EXECUTE sp_rename N'dbo.Tables.CustomJoin', N'JoinText', 'COLUMN';
GO

-- *** 7. Change the datatype of JoinText to nvarchar(max).
ALTER TABLE [dbo].[Tables] ALTER COLUMN [JoinText] [nvarchar](max)
GO

-- *** 8. Update the Tables.JoinText column based on data from the TableJoins table.
-- Add three temporary columns to TableJoins (this table will be dropped in a later step).
ALTER TABLE [dbo].[TableJoins] ADD [ColumnNamePlusAlias] [nvarchar](255) NULL
GO
ALTER TABLE [dbo].[TableJoins] ADD [JoinToColumnNamePlusAlias] [nvarchar](255) NULL
GO
ALTER TABLE [dbo].[TableJoins] ADD [JoinText] [nvarchar](max) NULL
GO
-- Update the contents of TableJoins.ColumnNamePlusAlias.
UPDATE TableJoins
SET TableJoins.ColumnNamePlusAlias = Tables.TableAlias + N'.' + TableJoins.ColumnName
FROM Tables INNER JOIN TableJoins ON Tables.TableId = TableJoins.TableId
GO
-- Update the contents of TableJoins.JoinToColumnNamePlusAlias.
UPDATE TableJoins
SET TableJoins.JoinToColumnNamePlusAlias = Tables.TableAlias + '.' + TableJoins.JoinToColumnName
FROM Tables INNER JOIN TableJoins ON Tables.TableId = TableJoins.JoinToTableId
GO
-- Update the contents of TableJoins.JoinText.
UPDATE TableJoins
SET JoinText = ColumnNamePlusAlias + N' = ' + JoinToColumnNamePlusAlias

-- Update the Tables.JoinText column.
-- This is done by joining Tables to TableJoins, then updating the Tables.JoinText column to the
-- value of TableJoins.JoinText.
-- In some instances there are multiple matches. In this case we need to "AND" each of the JoinText values
-- together into the final string, the order of which is determined by the TableJoins.Sequence column.
-- First, set Tables.JoinText to TableJoins.JoinText where Sequence = 0.
UPDATE Tables
SET Tables.JoinText = TableJoins.JoinText
FROM Tables INNER JOIN TableJoins ON Tables.TableId = TableJoins.TableId
WHERE TableJoins.Sequence = 0
GO
-- Next, loop for each row with Sequence > 0 and "AND" TableJoins.JoinText to Tables.JoinText.
-- We limit our query to a maximum Sequence of 32, which should be more than sufficient.
DECLARE @Sequence int
SET @Sequence = 1

WHILE @Sequence <= 32
BEGIN
  -- Append TableJoins.JoinText to Tables.JoinText.
  UPDATE Tables
  SET Tables.JoinText = Tables.JoinText + N' AND ' + TableJoins.JoinText
  FROM Tables INNER JOIN TableJoins ON Tables.TableId = TableJoins.TableId
  WHERE TableJoins.Sequence = @Sequence

  -- If no matches found we can exit the loop.
  IF @@ROWCOUNT = 0
    BREAK

  -- Increment @Sequence
  SET @Sequence = @Sequence + 1
END
GO

-- *** 9. Drop the TableId column from Tables/TablesHistory.
EXEC UpgradeDropColumn N'Tables', N'TableId'
GO

-- *** 10. Drop the TableJoins tables.
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableJoins]') AND type IN (N'U'))
DROP TABLE [dbo].[TableJoins]
GO
