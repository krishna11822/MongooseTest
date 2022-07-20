/* **********************************************************************
 * Drop foreign keys and disable triggers                               *
 ************************************************************************/

DECLARE 
	 @ObjectDropCode NVARCHAR(MAX)
	,@ObjectAddCode NVARCHAR(MAX)
	,@FKList NVARCHAR(MAX)
	,@OrigTableName NVARCHAR (128)
	,@IncludeNOCHECKForAdd tinyint = 1
	,@Infobar Infobar

DECLARE @Tables TABLE(
    [TableName] NVARCHAR (128) NOT NULL
   ,[KeyColumnName] ColumnNameType
)

INSERT INTO @Tables ([TableName], [KeyColumnName])
EXEC GetListOfNonMultiSiteTablesToCopySp '<SQLINSTANCE>', '<SQLDBNAME>', @Infobar

INSERT INTO @Tables ([TableName])
EXEC GetListOfMultiSiteTablesToCopySp '<SQLINSTANCE>', '<SQLDBNAME>', @Infobar

IF OBJECT_ID('[dbo].[tmp_CopySite_ForeignKeyTrigger]') IS NULL
CREATE TABLE [dbo].[tmp_CopySite_ForeignKeyTrigger] (
   [TableName] NVARCHAR (128) NOT NULL
,  [ObjectDropCode] NVARCHAR(MAX)
,  [ObjectAddCode] NVARCHAR(MAX)
)

TRUNCATE TABLE [dbo].[tmp_CopySite_ForeignKeyTrigger]

--Preserve FKs on table and drop them
--Extracted form PartitionAndCopyTableWrapperSp

DECLARE  ObjectList_cr CURSOR FOR
SELECT TableName
FROM @Tables

OPEN ObjectList_cr
FETCH NEXT FROM ObjectList_cr INTO @OrigTableName
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @ObjectDropCode = NULL
	SET @ObjectAddCode = NULL

	--ForeignKeys
	SELECT
		@ObjectAddCode=ISNULL(@ObjectAddCode,N'')
	+ N' IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([fk].[object_id])) + ''') AND parent_object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id])) + '''))'
	+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id]))
	+ N' WITH NOCHECK'
	+ N' ADD CONSTRAINT ' + QUOTENAME(OBJECT_NAME([fk].[object_id]))
	+ N' FOREIGN KEY '
	+ N'('
	+ (SELECT STUFF(((SELECT N',' + QUOTENAME(COL_NAME([fc1].[parent_object_id],[fc1].[parent_column_id]))  --comma separated string of columns
						FROM sys.foreign_key_columns [fc1]
						WHERE 1=1
						AND [fc1].[constraint_object_id]=[fk].[object_id]
						ORDER BY [fc1].[constraint_column_id]
						FOR XML PATH (''),TYPE).value('.[1]', 'nvarchar(max)')),1,1,'')
		)
	+ N') REFERENCES ' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[referenced_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fk].[referenced_object_id]))
	+ N' ('
	+ (SELECT STUFF(((SELECT N',' + QUOTENAME(COL_NAME([fc2].[referenced_object_id],[fc2].[referenced_column_id])) --comma separated string of columns
						FROM sys.foreign_key_columns [fc2]
						WHERE [fc2].[constraint_object_id]=[fk].[object_id]
						ORDER BY [fc2].[constraint_column_id]
						FOR XML PATH (''),TYPE).value('.[1]', 'nvarchar(max)')),1,1,'')
		)
	+ N')'
	+ CASE WHEN [fk].[delete_referential_action]=1 THEN N' ON DELETE CASCADE' ELSE N'' END
	+ CASE WHEN [fk].[update_referential_action]=1 THEN N' ON UPDATE CASCADE' ELSE N'' END
	+ CASE WHEN [fk].[is_not_for_replication]=1 THEN N' NOT FOR REPLICATION' ELSE N'' END
	, @ObjectDropCode = ISNULL(@ObjectDropCode,N'')
	+ N' IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([fk].[object_id])) + ''') AND parent_object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id])) + '''))'
	+ N' ALTER TABLE '
	+ QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id]))
	+ N' DROP CONSTRAINT ' + QUOTENAME(OBJECT_NAME([fk].[object_id]))
	,@FKList=ISNULL(@FKList,N', ')
	+QUOTENAME(OBJECT_NAME([fk].[object_id]))
	FROM sys.foreign_keys [fk]
	INNER JOIN sys.objects [o] on [fk].[parent_object_id] = [o].[object_id]
	WHERE [o].[name] not in ('dtproperties','sysdiagrams')  -- not true user tables
	AND OBJECT_NAME([o].[object_id])=@OrigTableName

	--Triggers
	DECLARE @Triggers NVARCHAR(MAX)
	SET @Triggers = 'DISABLE TRIGGER ALL ON ' + @OrigTableName
	SET @Infobar=N'Disabling triggers for ' + @OrigTableName
	RAISERROR(@Infobar,0,1) WITH NOWAIT
	EXEC sp_executesql @Triggers							

	IF @ObjectDropCode <> '' OR @ObjectAddCode <> ''
		INSERT INTO [dbo].[tmp_CopySite_ForeignKeyTrigger]
		(TableName, ObjectDropCode, ObjectAddCode)
		VALUES 
		(@OrigTableName, @ObjectDropCode, @ObjectAddCode)

	IF ISNULL(@ObjectDropCode,'') <> '' 
    BEGIN
		SET @Infobar=N'Dropping foreign keys for ' + @OrigTableName
		RAISERROR(@Infobar,0,1) WITH NOWAIT
		EXEC sp_executesql @ObjectDropCode
    END

	FETCH NEXT FROM ObjectList_cr INTO @OrigTableName

END

CLOSE ObjectList_cr
DEALLOCATE ObjectList_cr

SET @Infobar=N'Foreign keys dropped and triggers disabled'
RAISERROR(@Infobar,0,1) WITH NOWAIT
GO
