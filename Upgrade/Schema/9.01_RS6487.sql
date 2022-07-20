SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'StorageMethodType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[StorageMethodType] FROM [nchar](1) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'FileSpecType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[FileSpecType] FROM [nvarchar](255) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'FileServerTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].FileServerTypeType FROM [nchar](1) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'NetworkDomainNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].NetworkDomainNameType FROM [nvarchar](256) NULL
GO

-- StorageMethod column for DocumentType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'StorageMethod')
   ALTER TABLE [dbo].[DocumentType] ADD
      [StorageMethod] [dbo].[StorageMethodType] NULL
   
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'StorageMethod')
   -- update the existing StorageMethod of DocumentType as 'D'  
	UPDATE [dbo].[DocumentType]
	SET StorageMethod = N'D'
	WHERE StorageMethod is NULL
GO

-- StorageMethod column for DocumentType make this not null
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'StorageMethod')
   --make this not null
   ALTER TABLE [dbo].[DocumentType] ALTER COLUMN [StorageMethod] [dbo].[StorageMethodType] NOT NULL
GO
   
-- FileSpec column for DocumentType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'FileSpec')
   ALTER TABLE [dbo].[DocumentType] ADD
      [FileSpec] [dbo].[FileSpecType] NULL
GO
   
-- FileServer column for DocumentType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'FileServer')
   ALTER TABLE [dbo].[DocumentType] ADD
      [FileServer] [dbo].[OSMachineNameType] NULL
GO

-- FileSpec column for DocumentObject
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObject]')
      AND [name] = N'FileSpec')
   ALTER TABLE [dbo].DocumentObject ADD
      [FileSpec] [dbo].[FileSpecType] NULL
GO

-- FileImported column for DocumentObject
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObject]')
      AND [name] = N'FileImported')
   ALTER TABLE [dbo].DocumentObject ADD
      [FileImported] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_DocumentObject_FileImported] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObject_FileImported] CHECK ([FileImported] IN (0,1))
GO

-- SharedFile column for DocumentObject
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObject]')
      AND [name] = N'SharedFile')
   ALTER TABLE [dbo].DocumentObject ADD
      [SharedFile] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_DocumentObject_SharedFile] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObject_SharedFile] CHECK ([SharedFile] IN (0,1))
GO

-- StorageMethod column for DocumentObject
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObject]')
      AND [name] = N'StorageMethod')
   ALTER TABLE [dbo].DocumentObject ADD
      [StorageMethod] [dbo].[StorageMethodType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObject]')
      AND [name] = N'StorageMethod')
   -- update the existing StorageMethod of DocumentObject as 'D'  
	UPDATE [dbo].[DocumentObject]
	SET StorageMethod = N'D'
	WHERE StorageMethod is NULL
GO

-- EmbedInEmail column for DocumentObjectReference
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObjectReference]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObjectReference]')
      AND [name] = N'EmbedInEmail')
   ALTER TABLE [dbo].DocumentObjectReference ADD
      [EmbedInEmail] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_EmbedInEmail] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObjectReference_EmbedInEmail] CHECK ([EmbedInEmail] IN (0,1))
GO

-- FormName column for DocumentObjectReference
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObjectReference]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObjectReference]')
      AND [name] = N'FormName')
   ALTER TABLE [dbo].DocumentObjectReference ADD
      FormName [dbo].[FormNameType] NULL
GO

IF OBJECT_ID(N'[dbo].[DocTypeFormProperty_mst]', N'U') IS NULL
CREATE TABLE [dbo].[DocTypeFormProperty_mst](
   [SiteRef] [dbo].[SiteType] DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),0))) NOT NULL,
   [FormName] [dbo].[FormNameType] NOT NULL,
   [PropertyName] [dbo].[CollectionPropertyNameType] NOT NULL,
   [DocumentType] [dbo].[DocumentTypeType] NOT NULL,
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocTypeFP_mst_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocTypeFP_mst_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocTypeFP_mst_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocTypeFP_mst_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_DocTypeFP_mst_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocTypeFP_mst_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_DocTypeFP_mst_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocTypeFP_mst_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_DocTypeFP_mst_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_DocTypeFormProperty_mst] PRIMARY KEY CLUSTERED 
   (
      [FormName],
      [PropertyName],
      [DocumentType],
      [SiteRef]
   ),
   CONSTRAINT [IX_DocTypeFP_mst_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer],
      [SiteRef]
   ) 
)
GO

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DocTypeFormProperty_mst')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DocTypeFormProperty_mst',
      NULL, NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'DocTypeFormProperty', N'SiteRef')
      
Go

UPDATE [dbo].[AppTable]
   SET [AppViewName] = 'DocTypeFormProperty'
      ,[SiteColumnName] = 'SiteRef'
 WHERE TableName = 'DocTypeFormProperty_mst'
GO

IF OBJECT_ID(N'[dbo].[DocTypeFormProperty_mst]', N'U') IS NOT NULL
	EXEC dbo.CreateViewsOverMultiSiteTablesSp
		N'DocTypeFormProperty_mst'
	  ,N'DocTypeFormProperty_mst'
	  ,NULL

GO

IF OBJECT_ID(N'[dbo].[FileServer]', N'U') IS NULL
CREATE TABLE [dbo].[FileServer](
	[ServerName] [dbo].[OSMachineNameType] NOT NULL,
	[ServerType] [dbo].[FileServerTypeType] NOT NULL,
	[DomainName] [dbo].[NetworkDomainNameType] NOT NULL,
	[SharedPath] [dbo].[LongDescType] NULL,
	[UserName] [dbo].[UsernameType] NOT NULL,
	[UserPassword] [dbo].[EncryptedPasswordType] NOT NULL,
	[Active] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_FileServer_Active] DEFAULT ((0))
      CONSTRAINT [CK_FileServer_Active] CHECK ([Active] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_FileServer_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_FileServer_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_FileServer_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_FileServer_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_FileServer_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_FileServer_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_FileServer_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_FileServer_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_FileServer_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
	CONSTRAINT [PK_FileServer] PRIMARY KEY CLUSTERED 
	(
		[ServerName] ASC
   ),
   CONSTRAINT [IX_FileServer_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )
)

GO

IF OBJECT_ID(N'[dbo].[EmailTemplate_mst]', N'U') IS NULL
CREATE TABLE [dbo].[EmailTemplate_mst](
	[SiteRef] [dbo].[SiteType] DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),0))) NOT NULL,
	[FormName] [dbo].[FormNameType] NOT NULL,
	[TemplateName] [dbo].[NameType] NOT NULL,
	[Description] [dbo].[LongDescType] NULL,
	[EmailFrom] [dbo].[EmailType] NULL,
	[ToList] [dbo].[MessageRecipientListType] NULL,
	[CcList] [dbo].[MessageRecipientListType] NULL,
	[BccList] [dbo].[MessageRecipientListType] NULL,
	[Subject] [dbo].[MessageSubjectType] NULL,
	[Message] [dbo].[NoteType] NULL,
	[HtmlFormat] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_HtmlFormat] DEFAULT ((0))
      CONSTRAINT [CK_EmailTML_mst_HtmlFormat] CHECK ([HtmlFormat] IN (0,1)),
   [Active] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_Active] DEFAULT ((0))
      CONSTRAINT [CK_EmailTML_mst_Active] CHECK ([Active] IN (0,1)),
	[CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_EmailTML_mst_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_EmailTML_mst_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_EmailTML_mst_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
	CONSTRAINT [PK_EmailTemplate_mst] PRIMARY KEY CLUSTERED 
	(
		[TemplateName] ASC,
		[FormName] ASC,
		[SiteRef] ASC
   ),
   CONSTRAINT [IX_EmailTML_mst_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer],
      [SiteRef]
   ) 
)

GO

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EmailTemplate_mst')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EmailTemplate_mst',
      NULL, NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'EmailTemplate', N'SiteRef')
GO

UPDATE [dbo].[AppTable]
   SET [AppViewName] = 'EmailTemplate'
      ,[SiteColumnName] = 'SiteRef'
 WHERE TableName = 'EmailTemplate_mst'
GO
     
IF OBJECT_ID(N'[dbo].[EmailTemplate_mst]', N'U') IS NOT NULL
	EXEC dbo.CreateViewsOverMultiSiteTablesSp
		N'EmailTemplate_mst'
	  ,N'EmailTemplate_mst'
	  ,NULL
GO

IF OBJECT_ID(N'[dbo].[ObjectSentEmail_mst]', N'U') IS NULL
CREATE TABLE [dbo].[ObjectSentEmail_mst](
	[SiteRef] [dbo].[SiteType] DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),0))) NOT NULL,
	[Seq] [dbo].[SequenceType] DEFAULT ((0)) NOT NULL,
	[TableName] [dbo].[TableNameType] NOT NULL,
	[TableRowPointer] [dbo].[RowPointerType] NOT NULL,
	[FormName] [dbo].[FormNameType] NOT NULL,
	[EmailFrom] [dbo].[EmailType] NOT NULL,
	[ToList] [dbo].[MessageRecipientListType] NOT NULL,
	[CcList] [dbo].[MessageRecipientListType] NULL,
	[BccList] [dbo].[MessageRecipientListType] NULL,
	[Subject] [dbo].[MessageSubjectType] NOT NULL,
	[Message] [dbo].[NoteType] NULL,
	[Sent] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_Sent] DEFAULT ((0))
      CONSTRAINT [CK_ObjSE_mst_Sent] CHECK ([Sent] IN (0,1)),
   [HtmlFormat] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_HtmlFormat] DEFAULT ((0))
      CONSTRAINT [CK_ObjSE_mst_HtmlFormat] CHECK ([HtmlFormat] IN (0,1)),
	[SentDate] [dbo].[CurrentDateType] NULL,
	[TemplateName] [dbo].[NameType] NULL,
	[SentNote] [dbo].[NoteType] NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ObjSE_mst_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ObjSE_mst_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ObjSE_mst_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
  CONSTRAINT [PK_ObjectSentEmail_mst] PRIMARY KEY CLUSTERED 
  (
      [TableName] ASC,
      [TableRowPointer] ASC,
      [FormName] ASC,
      [Seq] DESC,
      [SiteRef] ASC
   ),
   CONSTRAINT [IX_ObjSE_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer],
      [SiteRef]
   ) 
)
GO
IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjectSentEmail_mst')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjectSentEmail_mst',
      NULL, NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'ObjectSentEmail', N'SiteRef')
GO

UPDATE [dbo].[AppTable]
   SET [AppViewName] = 'ObjectSentEmail'
      ,[SiteColumnName] = 'SiteRef'
 WHERE TableName = 'ObjectSentEmail_mst'
GO

IF OBJECT_ID(N'[dbo].[ObjectSentEmail_mst]', N'U') IS NOT NULL
	EXEC dbo.CreateViewsOverMultiSiteTablesSp
		N'ObjectSentEmail_mst'
	  ,N'ObjectSentEmail_mst'
	  ,NULL
GO

IF NOT EXISTS(SELECT 1 FROM AppColumn WHERE TableName = N'ObjectSentEmail_mst' AND ColumnName = N'Seq' )
   INSERT INTO AppColumn ([TableName],[ColumnName],[NextkeyGenerator])
   VALUES (N'ObjectSentEmail_mst', N'Seq', N'AUTONUMBER')
GO

