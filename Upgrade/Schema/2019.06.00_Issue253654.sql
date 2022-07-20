IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ExplorerMenuPathType' AND ss.name = N'dbo')
	CREATE TYPE [dbo].[ExplorerMenuPathType] FROM [nvarchar](500) NULL
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'UserPreferences'
           AND TABLE_TYPE = 'BASE TABLE') 
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_SCHEMA = N'dbo'
			AND TABLE_NAME = 'UserPreferences'
			AND COLUMN_NAME = 'ExplorerMenuPathWasPinned' ) 
BEGIN
	ALTER TABLE UserPreferences
	ADD ExplorerMenuPathWasPinned [dbo].[FlagNyType] NULL
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'UserPreferences'
           AND TABLE_TYPE = 'BASE TABLE') 
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA = N'dbo'
	AND TABLE_NAME = 'UserPreferences'
	AND COLUMN_NAME = 'ExplorerMenuPath' )
BEGIN	
	ALTER TABLE UserPreferences
	ADD ExplorerMenuPath [dbo].[ExplorerMenuPathType] NULL
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'UserPreferences'
           AND TABLE_TYPE = 'BASE TABLE') 
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA = N'dbo'
	AND TABLE_NAME = 'UserPreferences'
	AND COLUMN_NAME = 'ExplorerDisplayed' )
BEGIN
	ALTER TABLE UserPreferences
	ADD ExplorerDisplayed [dbo].[FlagNyType] NULL
END