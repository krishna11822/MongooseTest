--create UDDTs 
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'PopulationDepthType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[PopulationDepthType] FROM [tinyint] NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'FolderTemplateType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[FolderTemplateType] FROM [nvarchar](256) NULL
GO

--For FileServer Table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServer]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[FileServer]')
      AND [name] = N'RemoteServerName')
   ALTER TABLE [dbo].[FileServer] ADD
      [RemoteServerName] [dbo].[OSMachineNameType] NULL
GO

--For DocumentType Table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'LogicalFolderName')
   ALTER TABLE [dbo].[DocumentType] ADD
      [LogicalFolderName] [dbo].[AuthorizationObjectNameType] NOT NULL
	  CONSTRAINT [DF_DocumentType_LogicalFolderName]  DEFAULT ((N'Default'))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'UseServerPathAsRootPath')
   ALTER TABLE [dbo].[DocumentType] ADD
      [UseServerPathAsRootPath] [dbo].[ListYesNoType] NOT NULL 
	  CONSTRAINT [DF_DocumentType_UseServerPathAsRootPath]  DEFAULT ((0))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'AutoPopulate')
   ALTER TABLE [dbo].[DocumentType] ADD
      [AutoPopulate] [dbo].[ListYesNoType] NOT NULL 
	  CONSTRAINT [DF_DocumentType_AutoPopulate]  DEFAULT ((0))
GO

--check constraint
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'UseServerPathAsRootPath')
	  AND OBJECT_ID('dbo.[CK_DocumentType_UseServerPathAsRootPath]', 'C') IS NULL
   ALTER TABLE [dbo].[DocumentType] ADD
      CONSTRAINT [CK_DocumentType_UseServerPathAsRootPath] CHECK ([UseServerPathAsRootPath] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'AutoPopulate')
	  AND OBJECT_ID('dbo.[CK_DocumentType_AutoPopulate]', 'C') IS NULL
   ALTER TABLE [dbo].[DocumentType] ADD
      CONSTRAINT [CK_DocumentType_AutoPopulate] CHECK ([AutoPopulate] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'PopulationDepth')
   ALTER TABLE [dbo].[DocumentType] ADD
      [PopulationDepth] [dbo].[PopulationDepthType] NOT NULL CONSTRAINT [DF_DocumentType_PopulationDepth]  DEFAULT ((0))
GO

-- new table MediaType

IF OBJECT_ID(N'[dbo].[MediaType]', N'U') IS NULL
	CREATE TABLE [dbo].[MediaType](
	[DocumentExtension] [dbo].[DocumentExtensionType] NOT NULL,
	[MediaType] [dbo].[InternetMediaTypeType] NOT NULL,
	[Active] [dbo].[ListYesNoType] NOT NULL 
	CONSTRAINT [DF_MediaType_Active]  DEFAULT ((0)) 
	CONSTRAINT [CK_MediaType_Active] CHECK ([Active] IN (0,1)),
	[BlobFormat] [dbo].[DocumentExtensionType] NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL
	CONSTRAINT [DF_MediaType_CreatedBy] DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL
	CONSTRAINT [DF_MediaType_UpdatedBy] DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL
	CONSTRAINT [DF_MediaType_CreateDate] DEFAULT (getdate()),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL
	CONSTRAINT [DF_MediaType_RecordDate] DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL
	CONSTRAINT [DF_MediaType_RowPointer] DEFAULT (newid()),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
	CONSTRAINT [DF_MediaType_NoteExistsFlag] DEFAULT ((0))
	CONSTRAINT [CK_MediaType_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL
	CONSTRAINT [DF_MediaType_InWorkflow] DEFAULT ((0))
	CONSTRAINT [CK_MediaType_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
	CONSTRAINT [PK_MediaType] PRIMARY KEY CLUSTERED 
	(
		[DocumentExtension] ASC
	),
	CONSTRAINT [IX_MediaType_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer]
	)
	)

GO

--new table FileServerLogicalFolder_mst 
IF OBJECT_ID(N'[dbo].[FileServerLogicalFolder_mst]', N'U') IS NULL
	CREATE TABLE [dbo].[FileServerLogicalFolder_mst](
	[SiteRef] [dbo].[SiteType] DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),0))) NOT NULL,
	[LogicalFolderName] [dbo].[AuthorizationObjectNameType] NOT NULL,
	[ServerName] [dbo].[OSMachineNameType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_ServerName]  DEFAULT ((N'*')),
	[FolderTemplate] [dbo].[FolderTemplateType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_FolderTemplate]  DEFAULT ((N'*')),
	[Active] [dbo].[ListYesNoType] NOT NULL 
	CONSTRAINT [DF_FileServerLogicalFolder_mst_Active]  DEFAULT ((1)) 
	CONSTRAINT [CK_FileServerLogicalFolder_mst_Active] CHECK ([Active] IN (0,1)),
	[FolderAccessDepth] [dbo].[PopulationDepthType] NOT NULL 
	CONSTRAINT [DF_FileServerLogicalFolder_mst_FolderAccessDepth]  DEFAULT ((0)), 
	[CreatedBy] [dbo].[UsernameType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_CreatedBy] DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_UpdatedBy] DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_CreateDate] DEFAULT (getdate()),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_RecordDate] DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_RowPointer] DEFAULT (newid()),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_NoteExistsFlag] DEFAULT ((0))
	CONSTRAINT [CK_FileServerLogicalFolder_mst_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL
	CONSTRAINT [DF_FileServerLogicalFolder_mst_InWorkflow] DEFAULT ((0))
	CONSTRAINT [CK_FileServerLogicalFolder_mst_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
	CONSTRAINT [PK_FileServerLogicalFolder_mst] PRIMARY KEY CLUSTERED 
	(
	[LogicalFolderName] ASC,
	[SiteRef] ASC
	),
	CONSTRAINT [IX_FileServerLogicalFolder_mst_RowPointer] UNIQUE NONCLUSTERED 
	(
	[RowPointer] ASC,
	[SiteRef] ASC
	)
	)
GO

	DECLARE
	  @PStartingTable TableNameType
	, @PEndingTable TableNameType
	, @Infobar InfobarType
	, @PModuleName AppModuleType

	SET @PStartingTable = N'FileServerLogicalFolder_mst'
	SET @PEndingTable = N'FileServerLogicalFolder_mst'
	SET @Infobar = NULL
	SET @PModuleName = 'Core'

	EXEC dbo.SchemaAdditionalTasksSp
	  @PStartingTable
	, @PEndingTable
	, @Infobar
	, @PModuleName

GO

UPDATE [dbo].[AppTable]
	SET [AppViewName] = 'FileServerLogicalFolder'
   ,[SiteColumnName] = 'SiteRef'
	WHERE TableName = 'FileServerLogicalFolder_mst'
GO


