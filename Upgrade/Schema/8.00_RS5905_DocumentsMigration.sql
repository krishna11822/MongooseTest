IF OBJECT_ID(N'[dbo].[tmp_DocumentType]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_DocumentType](
   [DocumentType] [dbo].[DocumentTypeType] NOT NULL,
   [Description] [dbo].[DescriptionType] NULL,
   [DocumentExtension] [dbo].[DocumentExtensionType] NULL,
   [OldDocumentType] [dbo].[DocumentTypeType] NULL,
   [OldDescription] [dbo].[DescriptionType] NULL,
   [OldDocumentExtension] [dbo].[DocumentExtensionType] NULL,
   [OldMediaType] [dbo].[InternetMediaTypeType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentType_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_DocumentType_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentType_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentType_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentType_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentType_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentType_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentType_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_DocumentType_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [PK_tmp_DocumentType] PRIMARY KEY CLUSTERED 
      ([DocumentType]),
   CONSTRAINT [IX_tmp_DocumentType_RowPointer] UNIQUE NONCLUSTERED 
      ([RowPointer])
)
GO

IF OBJECT_ID(N'[dbo].[tmp_DocumentObject]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_DocumentObject](
   [DocumentName] [dbo].[DocumentNameType] NOT NULL,
   [Sequence] [dbo].[SequenceType] NOT NULL,
   [Description] [dbo].[LongDescType] NULL,
   [DocumentType] [dbo].[DocumentTypeType] NOT NULL,
   [DocumentExtension] [dbo].[DocumentExtensionType] NOT NULL,
   [IndexExtension]  AS (N'.'+[DocumentExtension]),
   [Internal] [dbo].[ListYesNoType] NOT NULL,
   [DocumentObject] [dbo].[DocumentObjectType] NULL,
   [OldDocumentName] [dbo].[DocumentNameType] NULL,
   [OldSequence] [dbo].[SequenceType] NULL,
   [OldDescription] [dbo].[LongDescType] NULL,
   [OldDocumentType] [dbo].[DocumentTypeType] NULL,
   [OldDocumentExtension] [dbo].[DocumentExtensionType] NULL,
   [OldInternal] [dbo].[ListYesNoType] NULL,
   [OldDocumentObject] [dbo].[DocumentObjectType] NULL,
   [OldMediaType] [dbo].[InternetMediaTypeType] NULL,
   [OldRowPointer] [dbo].[RowPointerType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObject_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_DocumentObject_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObject_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObject_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObject_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObject_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObject_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObject_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_DocumentObject_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [PK_tmp_DocumentObject] PRIMARY KEY CLUSTERED 
      ([DocumentName],[Sequence]),
   CONSTRAINT [IX_tmp_DocumentObject_RowPointer] UNIQUE NONCLUSTERED 
      ([RowPointer]) 
) 
GO

IF OBJECT_ID(N'[dbo].[tmp_DocumentObjectReference]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_DocumentObjectReference](
   [TableName] [dbo].[TableNameType] NOT NULL,
   [TableRowPointer] [dbo].[RowPointerType] NOT NULL,
   [RefSequence] [dbo].[SequenceType] NOT NULL,
   [DocumentObjectRowPointer] [dbo].[RowPointerType] NOT NULL,
   [OldTableName] [dbo].[TableNameType] NULL,						
   [OldTableRowPointer] [dbo].[RowPointerType] NULL,				
   [OldRefSequence] [dbo].[SequenceType] NULL,						
   [OldDocumentObjectRowPointer] [dbo].[RowPointerType] NULL,		
   [OldSuspend] [dbo].[ListYesNoType] NULL,						
   [OldRowPointer] [dbo].[RowPointerType] NULL,					
   [Migrated] [dbo].[ListYesNoType] NULL,								
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObjectReference_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_DocumentObjectReference_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObjectReference_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObjectReference_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObjectReference_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObjectReference_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObjectReference_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_DocumentObjectReference_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_DocumentObjectReference_InWorkflow] CHECK ([InWorkflow] IN (0,1)),[MediaType] [dbo].[InternetMediaTypeType] NULL,
   [Suspend] [dbo].[ListYesNoType] NOT NULL,
   CONSTRAINT [PK_tmp_DocumentObjectReference] PRIMARY KEY CLUSTERED 
      ([TableName]
      ,[TableRowPointer]
      ,[DocumentObjectRowPointer]),
   CONSTRAINT [IX_tmp_DocumentObjectReference_RowPointer] UNIQUE NONCLUSTERED 
      ([RowPointer]),
   CONSTRAINT [IX_tmp_DocumentObjectReference_TableName_RowPointer_RefSequence] UNIQUE NONCLUSTERED 
      ([TableName]
      ,[TableRowPointer]
      ,[RefSequence])
) 
GO