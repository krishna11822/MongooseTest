
IF EXISTS (select 1 from sys.stats s where s.name = 'Text' and s.object_id = OBJECT_ID('FormSyncLog'))
BEGIN
	DROP STATISTICS [dbo].[FormSyncLog].[Text]
END
ALTER table [dbo].[FormSyncLog] ALTER COLUMN Text nvarchar(max);
CREATE STATISTICS [Text] ON [dbo].[FormSyncLog]([Text])


IF EXISTS (select 1 from sys.stats s where s.name = 'ObjectName' and s.object_id = OBJECT_ID('FormSyncLog'))
BEGIN
	DROP STATISTICS [dbo].[FormSyncLog].[ObjectName]
END
ALTER table [dbo].[FormSyncLog] ALTER COLUMN ObjectName nvarchar(max);
CREATE STATISTICS [ObjectName] ON [dbo].[FormSyncLog]([ObjectName])


