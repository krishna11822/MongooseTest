IF NOT EXISTS(SELECT 1 FROM [dbo].[systypes] WHERE [name] = N'AppModuleType')
   CREATE TYPE [dbo].[AppModuleType] FROM [nvarchar](40) NULL
GO

IF NOT EXISTS(SELECT 1 FROM [dbo].[systypes] WHERE [name] = N'ColumnNameType')
   CREATE TYPE [dbo].[ColumnNameType] FROM [nvarchar](32) NULL
GO

IF NOT EXISTS(SELECT 1 FROM [dbo].[systypes] WHERE [name] = N'NextKeyPrefixListType')
   -- "table1.column1,table2.column2" = 32 + 1 + 32 + 1 + 32 + 1 + 32 = 131
   CREATE TYPE [dbo].[NextKeyPrefixListType] FROM [nvarchar](131) NULL
GO

IF NOT EXISTS(SELECT 1 FROM [dbo].[systypes] WHERE [name] = N'NextKeyLengthExprType')
   -- "table.column" = 32 + 1 + 32 = 65
   CREATE TYPE [dbo].[NextKeyLengthExprType] FROM [nvarchar](65) NULL
GO

IF OBJECT_ID(N'[dbo].[AppModule]') IS NULL
CREATE TABLE [dbo].[AppModule] (
   [ModuleName] [AppModuleType] NOT NULL  ,
   [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_AppModule_NoteExistsFlag] DEFAULT (0),
   [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_AppModule_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_AppModule_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_AppModule_CreateDate] DEFAULT (getdate()),
   [RecordDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_AppModule_RecordDate] DEFAULT (getdate()),
   [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_AppModule_RowPointer] DEFAULT (newid()),
   [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_AppModule_InWorkflow] DEFAULT (0),
   CONSTRAINT [PK_AppModule] PRIMARY KEY  CLUSTERED
   (
      [ModuleName]
   ) ON [PRIMARY] ,
   CONSTRAINT [IX_AppModule_RowPointer] UNIQUE  NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY] ,
   CONSTRAINT [CK_AppModule_NoteExistsFlag] CHECK ([NoteExistsFlag] = 1 or [NoteExistsFlag] = 0),
   CONSTRAINT [CK_AppModule_InWorkflow] CHECK ([InWorkflow] IN (0, 1))
   ) ON [PRIMARY]
GO


IF OBJECT_ID(N'[dbo].[AppTable]') IS NULL
CREATE TABLE [dbo].[AppTable] (
   [TableName] [TableNameType] NOT NULL ,

   [Update_AllWhen] [LongListType] NULL ,
   [UpdateRecordDateWhen] [LongListType] NULL ,
   [IgnoreInsert] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_IgnoreInsert] DEFAULT (0),
   [IgnoreUpdate] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_IgnoreUpdate] DEFAULT (0),
   [DisallowUpdate] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_DisallowUpdate] DEFAULT (0),
   [KeepClusteringKeys] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_KeepClusteringKeys] DEFAULT (0),
   [UseRPOnInsert] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_UseRPOnInsert] DEFAULT (0),
   [UseRPOnUpdate] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_UseRPOnUpdate] DEFAULT (0),
   [IupTriggerModifiesNewRows] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_IupTriggerModifiesNewRows] DEFAULT (0),
   [RememberIdentity] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_RememberIdentity] DEFAULT (0),
   [RegisterNewKey] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_RegisterNewKey] DEFAULT (0),
   [TestOutsideLockForNewKey] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_TestOutsideLockForNewKey] DEFAULT (0),
   [NextKeyReverseKeyOrder] [ListYesNoType] NOT NULL CONSTRAINT [DF_AppTable_NextKeyReverseKeyOrder] DEFAULT (0),

   [InheritorTableList] [LongListType] NULL ,
   [ModuleName] [AppModuleType] NOT NULL ,
   [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_AppTable_NoteExistsFlag] DEFAULT (0),
   [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_AppTable_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_AppTable_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_AppTable_CreateDate] DEFAULT (getdate()),
   [RecordDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_AppTable_RecordDate] DEFAULT (getdate()),
   [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_AppTable_RowPointer] DEFAULT (newid()),
   [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_AppTable_InWorkflow] DEFAULT (0),
   CONSTRAINT [PK_AppTable] PRIMARY KEY  CLUSTERED
   (
      [TableName]
   ) ON [PRIMARY] ,
   CONSTRAINT [IX_AppTable_RowPointer] UNIQUE  NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY] ,
   CONSTRAINT [CK_AppTable_IgnoreInsert] CHECK ([IgnoreInsert] IN (0, 1)),
   CONSTRAINT [CK_AppTable_IgnoreUpdate] CHECK ([IgnoreUpdate] IN (0, 1)),
   CONSTRAINT [CK_AppTable_DisallowUpdate] CHECK ([DisallowUpdate] IN (0, 1)),
   CONSTRAINT [CK_AppTable_KeepClusteringKeys] CHECK ([KeepClusteringKeys] IN (0, 1)),
   CONSTRAINT [CK_AppTable_UseRPOnInsert] CHECK ([UseRPOnInsert] IN (0, 1)),
   CONSTRAINT [CK_AppTable_UseRPOnUpdate] CHECK ([UseRPOnUpdate] IN (0, 1)),
   CONSTRAINT [CK_AppTable_IupTriggerModifiesNewRows] CHECK ([IupTriggerModifiesNewRows] IN (0, 1)),
   CONSTRAINT [CK_AppTable_RememberIdentity] CHECK ([RememberIdentity] IN (0, 1)),
   CONSTRAINT [CK_AppTable_RegisterNewKey] CHECK ([RegisterNewKey] IN (0, 1)),
   CONSTRAINT [CK_AppTable_TestOutsideLockForNewKey] CHECK ([TestOutsideLockForNewKey] IN (0, 1)),
   CONSTRAINT [CK_AppTable_NextKeyReverseKeyOrder] CHECK ([NextKeyReverseKeyOrder] IN (0, 1)),
   CONSTRAINT [CK_AppTable_NoteExistsFlag] CHECK ([NoteExistsFlag] = 1 or [NoteExistsFlag] = 0),
   CONSTRAINT [CK_AppTable_InWorkflow] CHECK ([InWorkflow] IN (0, 1))
   ) ON [PRIMARY]
GO


IF OBJECT_ID(N'[dbo].[AppColumn]') IS NULL
CREATE TABLE [dbo].[AppColumn] (
   [TableName] [TableNameType] NOT NULL ,
   [ColumnName] [ColumnNameType] NOT NULL ,

   [NextkeyPrefix] [NextKeyPrefixListType] NULL ,
   [NextkeyGenerator] [LongListType] NULL ,
   [NextkeyLength] [NextKeyLengthExprType] NULL ,
   [NextkeyPreGenerate] [LongListType] NULL ,
   [NextkeyPostGenerate] [LongListType] NULL ,
   [RegisterNewKeyAddlParms] [LongListType] NULL ,
   [NextkeyAddlKeys] [LongListType] NULL ,
   [NextkeyPartitionCondition] [LongListType] NULL ,

   [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_AppColumn_NoteExistsFlag] DEFAULT (0),
   [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_AppColumn_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_AppColumn_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_AppColumn_CreateDate] DEFAULT (getdate()),
   [RecordDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_AppColumn_RecordDate] DEFAULT (getdate()),
   [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_AppColumn_RowPointer] DEFAULT (newid()),
   [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_AppColumn_InWorkflow] DEFAULT (0),
   CONSTRAINT [PK_AppColumn] PRIMARY KEY  CLUSTERED
   (
      [TableName],
      [ColumnName]
   ) ON [PRIMARY] ,
   CONSTRAINT [IX_AppColumn_RowPointer] UNIQUE  NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY] ,
   CONSTRAINT [CK_AppColumn_NoteExistsFlag] CHECK ([NoteExistsFlag] = 1 or [NoteExistsFlag] = 0),
   CONSTRAINT [CK_AppColumn_InWorkflow] CHECK ([InWorkflow] IN (0, 1))
   ) ON [PRIMARY]
GO


