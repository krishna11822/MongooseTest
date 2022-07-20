/* ********************************************
 * Add foreign keys back and enable triggers *
 **********************************************/

DECLARE 
	 @ObjectDropCode NVARCHAR(MAX)
	,@ObjectAddCode NVARCHAR(MAX)
	,@OrigTableName NVARCHAR (128)
	,@IncludeNOCHECKForAdd tinyint = 1
	,@Infobar Infobar

--Add Fks back
DECLARE ObjectList_cr CURSOR FOR
SELECT [TableName], [ObjectAddCode]
FROM [dbo].[tmp_CopySite_ForeignKeyTrigger]

OPEN ObjectList_cr
FETCH NEXT FROM ObjectList_cr INTO @OrigTableName, @ObjectAddCode
WHILE @@FETCH_STATUS = 0
BEGIN

	IF ISNULL(@ObjectAddCode,'') <> ''
	BEGIN
		SET @Infobar=N'Adding foreign keys for ' + @OrigTableName
		RAISERROR(@Infobar,0,1) WITH NOWAIT
		EXEC sp_executesql @ObjectAddCode
	END

	FETCH NEXT FROM ObjectList_cr INTO @OrigTableName, @ObjectAddCode

END

CLOSE ObjectList_cr
DEALLOCATE ObjectList_cr

DECLARE @Tables TABLE(
    [TableName] NVARCHAR (128) NOT NULL
   ,[KeyColumnName] ColumnNameType
)

INSERT INTO @Tables ([TableName], [KeyColumnName])
EXEC GetListOfNonMultiSiteTablesToCopySp '<SQLINSTANCE>', '<SQLDBNAME>', @Infobar

INSERT INTO @Tables ([TableName])
EXEC GetListOfMultiSiteTablesToCopySp '<SQLINSTANCE>', '<SQLDBNAME>', @Infobar

DECLARE  TableList_cr CURSOR FOR
SELECT TableName
FROM @Tables

OPEN TableList_cr
FETCH NEXT FROM TableList_cr INTO @OrigTableName
WHILE @@FETCH_STATUS = 0
BEGIN

	--Triggers
	DECLARE @Triggers NVARCHAR(MAX)
	SET @Triggers = 'ENABLE TRIGGER ALL ON ' + @OrigTableName
	EXEC sp_executesql @Triggers

	FETCH NEXT FROM TableList_cr INTO @OrigTableName
END
CLOSE TableList_cr
DEALLOCATE TableList_cr