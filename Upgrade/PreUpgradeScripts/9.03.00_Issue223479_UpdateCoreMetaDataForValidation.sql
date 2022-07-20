IF EXISTS (select * from sys.columns where Name = 'UpdateRecordDateWhen' and OBJECT_ID = object_id(N'AppTable'))
BEGIN
UPDATE [dbo].[AppTable]
   SET [UpdateRecordDateWhen] = 'SkipRecordDate'
   
 WHERE TableName = 'UserNames'
END
GO


