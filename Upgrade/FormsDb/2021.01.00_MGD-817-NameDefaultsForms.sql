DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Styles' AND COLUMN_NAME = 'ID') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[Styles]') AND [name] = 'ID';	
	IF @ObjectName <> N'DF_Styles_ID' EXEC('ALTER TABLE [dbo].[Styles] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Styles_ID]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].[Styles] ADD CONSTRAINT [DF_Styles_ID] DEFAULT (newid()) FOR [ID]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Themes' AND COLUMN_NAME = 'ID') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[Themes]') AND [name] = 'ID';	
	IF @ObjectName <> N'DF_Themes_ID' EXEC('ALTER TABLE [dbo].[Themes] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Themes_ID]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].Themes ADD CONSTRAINT DF_Themes_ID DEFAULT (newid()) FOR [ID]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Themes' AND COLUMN_NAME = 'ScopeType') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[Themes]') AND [name] = 'ScopeType';	
	IF @ObjectName <> N'DF_Themes_ScopeType' EXEC('ALTER TABLE [dbo].[Themes] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Themes_ScopeType]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].Themes ADD CONSTRAINT DF_Themes_ScopeType DEFAULT ((0)) FOR [ScopeType]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Themes' AND COLUMN_NAME = 'ScopeName') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[Themes]') AND [name] = 'ScopeName';	
	IF @ObjectName <> N'DF_Themes_ScopeName' EXEC('ALTER TABLE [dbo].[Themes] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Themes_ScopeName]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].Themes ADD CONSTRAINT DF_Themes_ScopeName DEFAULT (N'[NULL]') FOR [ScopeName]
	END
END
GO


