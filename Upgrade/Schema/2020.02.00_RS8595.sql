-- ====================================================
--  RS8595 (ION API Generator):
-- ====================================================

-- ===========================
--  Data Types:
-- ===========================
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'APIOperationIDType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[APIOperationIDType] FROM [nvarchar](80) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'APIOperationTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[APIOperationTypeType] FROM [nvarchar](1) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'CollectionSortType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[CollectionSortType] FROM [nvarchar](max) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'LoadCollectionTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[LoadCollectionTypeType] FROM [nvarchar](1) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'BookmarkType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[BookmarkType] FROM [nvarchar](max) NULL
GO

-- ===========================
--  Tables and Constraints:
-- ===========================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ObjExtAPIs]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[ObjExtAPIs](
		[CollectionName] [dbo].[CollectionNameType] NOT NULL,
		[DocumentDescription] [dbo].[LongDescType] NULL,
		[CreatedBy] [dbo].[UsernameType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIs_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIs_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIs_CreateDate] DEFAULT (getdate()),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIs_RecordDate] DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIs_RowPointer] DEFAULT (newid()),
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIs_NoteExistsFlag] DEFAULT ((0))
			CONSTRAINT [CK_ObjExtAPIs_NoteExistsFlag] CHECK   (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIs_InWorkflow] DEFAULT ((0))
			CONSTRAINT [CK_ObjExtAPIs_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0))),
	 CONSTRAINT [PK_ObjExtAPIs] PRIMARY KEY CLUSTERED 
	(
		[CollectionName] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	 CONSTRAINT [IX_ObjExtAPIs_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY]	
	
	EXEC dbo.SchemaAdditionalTasksSp 'ObjExtAPIs', 'ObjExtAPIs', NULL, 'Core'
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ObjExtAPIEndpoints]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[ObjExtAPIEndpoints](
		[OperationID] [dbo].[APIOperationIDType] NOT NULL,
		[CollectionName] [dbo].[CollectionNameType] NOT NULL,
		[OperationType] [dbo].[APIOperationTypeType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_OperationType] DEFAULT ('G')
			CONSTRAINT [CK_ObjExtAPIEndpoints_OperationType] CHECK   (([OperationType] IN (N'G',N'I',N'L',N'U'))),
		[OperationSummary] [dbo].[LongDescType] NULL,
		[Method] [dbo].[HTTPMethodType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_Method] DEFAULT ('GET')
			CONSTRAINT [CK_ObjExtAPIEndpoints_Method] CHECK   (([Method]=N'GET' OR [Method]=N'POST')),
		[Properties] [dbo].[VeryLongListType] NULL,
		[Filter] [dbo].[CollectionFilterType] NULL,
		[OrderBy] [dbo].[CollectionSortType] NULL,
		[RecordCap] [dbo].[DataCacheCapType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_RecordCap] DEFAULT ((-1)),
		[IsDistinct] [dbo].[ListYesNoType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_IsDistinct] DEFAULT ((0))
			CONSTRAINT [CK_ObjExtAPIEndpoints_IsDistinct] CHECK   (([IsDistinct]=(1) OR [IsDistinct]=(0))),
		[MethodName] [dbo].[MethodNameType] NULL,
		[MethodParameterList] [dbo].[JSONStringType] NULL,
		[LoadCollectionType] [dbo].[LoadCollectionTypeType] NULL
			CONSTRAINT [CK_ObjExtAPIEndpoints_LoadCollectionType] CHECK (([LoadCollectionType] IN (N'F',N'N',N'P',N'L'))),
		[Bookmark] [dbo].[BookmarkType] NULL,
		[PostQueryCommand] [dbo].[MethodCallSpecType] NULL,
		[ReadOnly] [dbo].[ListYesNoType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_ReadOnly] DEFAULT ((0))
			CONSTRAINT [CK_ObjExtAPIEndpoints_ReadOnly] CHECK   (([ReadOnly]=(1) OR [ReadOnly]=(0))),
		[RequestBody] [dbo].[JSONStringType] NULL,
		[RefreshAfterUpdate] [dbo].[ListYesNoType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_RefreshAfterUpdate] DEFAULT ((0))
			CONSTRAINT [CK_ObjExtAPIEndpoints_RefreshAfterUpdate] CHECK   (([RefreshAfterUpdate]=(1) OR [RefreshAfterUpdate]=(0))),
		[CreatedBy] [dbo].[UsernameType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_CreateDate] DEFAULT (getdate()),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_RecordDate] DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_RowPointer] DEFAULT (newid()),
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_NoteExistsFlag] DEFAULT ((0))
			CONSTRAINT [CK_ObjExtAPIEndpoints_NoteExistsFlag] CHECK   (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL
			CONSTRAINT [DF_ObjExtAPIEndpoints_InWorkflow] DEFAULT ((0))
			CONSTRAINT [CK_ObjExtAPIEndpoints_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0))),
	 CONSTRAINT [PK_ObjExtAPIEndpoints] PRIMARY KEY CLUSTERED 
	(
		[OperationID] ASC,
		[CollectionName] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	 CONSTRAINT [IX_ObjExtAPIEndpoints_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	EXEC dbo.SchemaAdditionalTasksSp 'ObjExtAPIEndpoints', 'ObjExtAPIEndpoints', NULL, 'Core'
END
GO