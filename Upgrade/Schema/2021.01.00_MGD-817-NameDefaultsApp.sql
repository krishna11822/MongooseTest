DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DocTypeFormProperty_mst' AND COLUMN_NAME = 'SiteRef') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[DocTypeFormProperty_mst]') AND [name] = 'SiteRef';	
	IF @ObjectName <> N'DF_DocTypeFP_SiteRef' EXEC('ALTER TABLE [dbo].[DocTypeFormProperty_mst] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DocTypeFP_SiteRef]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].[DocTypeFormProperty_mst] ADD CONSTRAINT DF_DocTypeFP_SiteRef DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [SiteRef]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'EmailTemplate_mst' AND COLUMN_NAME = 'SiteRef') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[EmailTemplate_mst]') AND [name] = 'SiteRef';	
	IF @ObjectName <> N'DF_EmailTemp_SiteRef' EXEC('ALTER TABLE [dbo].[EmailTemplate_mst] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmailTemp_SiteRef]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].EmailTemplate_mst ADD CONSTRAINT DF_EmailTemp_SiteRef DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [SiteRef]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'EventActionState' AND COLUMN_NAME = 'WatchSubdirectories') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[EventActionState]') AND [name] = 'WatchSubdirectories';	
	IF @ObjectName <> N'DF_EventActionState_WatchSubDirs' EXEC('ALTER TABLE [dbo].[EventActionState] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EventActionState_WatchSubDirs]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].EventActionState ADD CONSTRAINT DF_EventActionState_WatchSubDirs DEFAULT ((0)) FOR [WatchSubdirectories]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'FileServerLogicalFolder_mst' AND COLUMN_NAME = 'SiteRef') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[FileServerLogicalFolder_mst]') AND [name] = 'SiteRef';	
	IF @ObjectName <> N'DF_FileServerLogicalFolder_SiteRef' EXEC('ALTER TABLE [dbo].[FileServerLogicalFolder_mst] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FileServerLogicalFolder_SiteRef]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].FileServerLogicalFolder_mst ADD CONSTRAINT DF_FileServerLogicalFolder_SiteRef DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [SiteRef]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'IONMessagingErrors_mst' AND COLUMN_NAME = 'RefRowPointer') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[IONMessagingErrors_mst]') AND [name] = 'RefRowPointer';	
	IF @ObjectName <> N'DF_IONMessagingErrors_RefRowPointer' EXEC('ALTER TABLE [dbo].[IONMessagingErrors_mst] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_IONMessagingErrors_RefRowPointer]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].IONMessagingErrors_mst ADD CONSTRAINT DF_IONMessagingErrors_RefRowPointer DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RefRowPointer]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ObjectSentEmail_mst' AND COLUMN_NAME = 'SiteRef') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[ObjectSentEmail_mst]') AND [name] = 'SiteRef';	
	IF @ObjectName <> N'DF_ObjectSentEmail_SiteRef' EXEC('ALTER TABLE [dbo].[ObjectSentEmail_mst] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ObjectSentEmail_SiteRef]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].ObjectSentEmail_mst ADD CONSTRAINT DF_ObjectSentEmail_SiteRef DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [SiteRef]
	END
END
GO

DECLARE @ObjectName NVARCHAR(100)
IF (SELECT Column_Default FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ObjectSentEmail_mst' AND COLUMN_NAME = 'Seq') is NOT NULL
BEGIN	
	SELECT @ObjectName = OBJECT_NAME([default_object_id]) FROM SYS.COLUMNS
	WHERE [object_id] = OBJECT_ID('[dbo].[ObjectSentEmail_mst]') AND [name] = 'Seq';	
	IF @ObjectName <> N'DF_ObjectSentEmail_Seq' EXEC('ALTER TABLE [dbo].[ObjectSentEmail_mst] DROP CONSTRAINT ' + @ObjectName)	
	IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ObjectSentEmail_Seq]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].ObjectSentEmail_mst ADD CONSTRAINT DF_ObjectSentEmail_Seq DEFAULT ((0)) FOR [Seq]
	END
END
