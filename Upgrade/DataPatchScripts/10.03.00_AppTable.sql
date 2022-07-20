DECLARE @tableName sysname
SET @tableName = 'user_class_record_assoc'

IF EXISTS (SELECT 1 FROM AppTable WHERE TableName = @tableName)
	DELETE FROM AppTable
	WHERE TableName = @tableName
GO
