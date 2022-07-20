DECLARE @SQL NVARCHAR(MAX)
DECLARE @Infobar InfobarType

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AppColumn' AND COLUMN_NAME = 'NextkeyPreGenerate')
BEGIN
SET @SQL=N'IF EXISTS (SELECT 1 FROM [dbo].[AppColumn] WHERE [NextkeyPreGenerate] IS NOT NULL AND [NextkeyPreGenerate] <> N''AUTONUMBER'') '
+N'SET @Infobar= N''Next Key failure. This is forbidden by new security policy. Upgrade can not continue. '
+N'Before generator code is no longer allowed. Any such necessary logic should be written inside of the generator stored procedure itself. '''
EXEC sp_executesql @SQL,N'@Infobar InfobarType OUTPUT',@Infobar=@Infobar OUTPUT

IF @Infobar IS NOT NULL
RAISERROR(@Infobar,16,1)
END
