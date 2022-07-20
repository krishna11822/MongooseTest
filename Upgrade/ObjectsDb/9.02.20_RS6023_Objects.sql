SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID(N'[dbo].[ObjAccessAs]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjAccessAs](
	[AccessAsId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ObjAccessAs_AccessAsId]  DEFAULT (newid()),
	[AccessAs] [nvarchar](50) NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjAccessAs_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjAccessAs_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjAccessAs_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjAccessAs_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjAccessAs_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjAccessAs_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjAccessAs_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjAccessAs] PRIMARY KEY CLUSTERED 
(
	[AccessAsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

END
GO
IF OBJECT_ID(N'[dbo].[AccessAs]', N'U') IS NOT NULL
INSERT INTO ObjAccessAs (AccessAsID, AccessAs, InWOrkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate)
SELECT AccessAsID, AccessAs, InWOrkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM AccessAs a1
WHERE NOT EXISTS (SELECT 1
  FROM ObjAccessAs a2
  WHERE a1.AccessAsID = a2.AccessAsId)

GO
IF OBJECT_ID(N'[dbo].[AccessAs]', N'U') IS NOT NULL
DROP TABLE AccessAs
GO

IF OBJECT_ID(N'[dbo].[ObjCollectionRules]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjCollectionRules](
	[CollectionName] [nvarchar](80) NOT NULL,
	[DevelopmentFlag] [int] NOT NULL,
	[PropertyList] [nvarchar](400) NOT NULL,
	[ReferencedBy] [nvarchar](80) NOT NULL,
	[RefPropertyList] [nvarchar](400) NOT NULL,
	[DeleteAction] [int] NOT NULL CONSTRAINT DF_ObjCollectionRules_DeleteAction DEFAULT ((0)),
	[Filter] [nvarchar](max) NULL,
	[MessageObjectName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](30) NOT NULL CONSTRAINT DF_ObjCollectionRules_CreatedBy DEFAULT (suser_sname()),
	[UpdatedBy] [nvarchar](30) NOT NULL CONSTRAINT DF_ObjCollectionRules_UpdatedBy DEFAULT (suser_sname()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT DF_ObjCollectionRules_CreateDate DEFAULT (getdate()),
	[RecordDate] [datetime] NOT NULL CONSTRAINT DF_ObjCollectionRules_RecordDate DEFAULT (getdate()),
	[RowPointer] [uniqueidentifier] NOT NULL CONSTRAINT DF_ObjCollectionRules_RowPointer DEFAULT (newid()),
	[NoteExistsFlag] [tinyint] NOT NULL CONSTRAINT DF_ObjCollectionRules_NoteExistsFlag DEFAULT ((0)),
	[InWorkflow] [tinyint] NOT NULL CONSTRAINT DF_ObjCollectionRules_InWorkflow DEFAULT ((0)),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjCollectionRules] PRIMARY KEY CLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
IF NOT EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[ObjCollectionRules]') 
               AND name = N'IX_ObjCollRules_Name_DevFlag')

CREATE NONCLUSTERED INDEX [IX_ObjCollRules_Name_DevFlag] ON [dbo].[ObjCollectionRules]
(
	[CollectionName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO

IF OBJECT_ID(N'[dbo].[CollectionRules]', N'U') IS NOT NULL
INSERT INTO ObjCollectionRules (CollectionName, DevelopmentFlag, PropertyList, ReferencedBy, RefPropertyList, DeleteAction, Filter,
	MessageObjectName, CreatedBy, UpdatedBy, CreateDate, RecordDate, RowPointer, NoteExistsFlag, InWorkflow)
SELECT CollectionName, DevelopmentFlag, PropertyList, ReferencedBy, RefPropertyList, DeleteAction, Filter,
	MessageObjectName, CreatedBy, UpdatedBy, CreateDate, RecordDate, RowPointer, NoteExistsFlag, InWorkflow
FROM CollectionRules o1
WHERE NOT EXISTS (SELECT 1
  FROM ObjCollectionRules o2
  WHERE o1.RowPointer = o2.RowPointer)

GO
IF OBJECT_ID(N'[dbo].[CollectionRules]', N'U') IS NOT NULL
DROP TABLE CollectionRules
GO

IF OBJECT_ID(N'[dbo].[ObjCollections]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjCollections](
	[CollectionName] [nvarchar](80) NOT NULL,
	[ServerName] [nvarchar](80) NOT NULL,
	[CollectionDesc] [nvarchar](255) NULL,
	[LockBy] [nvarchar](80) NULL,
	[RevisionNo] [int] NOT NULL CONSTRAINT [DF_ObjCollections_RevisionNo]  DEFAULT ((1)),
	[RevisionDate] [datetime] NOT NULL CONSTRAINT [DF_ObjCollection_RevisionDate]  DEFAULT (getdate()),
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjCollections_DevFlag]  DEFAULT ((0)),
	[CustomAssemblyName] [nvarchar](80) NULL,
	[ExtClassNamespace] [nvarchar](255) NULL,
	[ExtClassName] [nvarchar](80) NULL,
	[Extends] [nvarchar](80) NULL,
	[ReplaceFlag] [dbo].[FlagNyType] NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjCollections_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjCollections_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjCollections_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjCollections_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjCollections_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjCollections_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjCollections_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
	[LabelStringID] [nvarchar](50) NULL,
	[OutriggerProfile] [nvarchar](50) NULL,
    [QuoteTableAliases] [FlagNyType] NOT NULL CONSTRAINT [DF_ObjCollections_QuoteTabAli] DEFAULT (0),
 CONSTRAINT [PK_ObjCollections] PRIMARY KEY CLUSTERED 
(
	[CollectionName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF OBJECT_ID(N'[dbo].[Collections]', N'U') IS NOT NULL
INSERT INTO ObjCollections (CollectionName, ServerName, CollectionDesc, LockBy, RevisionNo, RevisionDate, DevelopmentFlag, CustomAssemblyName, ExtClassNamespace,
	ExtClassName, Extends, ReplaceFlag, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate, LabelStringID, OutriggerProfile, QuoteTableAliases )
SELECT CollectionName, ServerName, CollectionDesc, LockBy, RevisionNo, RevisionDate, DevelopmentFlag, CustomAssemblyName, ExtClassNamespace,
	ExtClassName, Extends, ReplaceFlag, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate, LabelStringID, OutriggerProfile, QuoteTableAliases
FROM Collections o1
WHERE NOT EXISTS (SELECT 1
  FROM ObjCollections o2
  WHERE o1.CollectionName = o2.CollectionName
  AND   o1.DevelopmentFlag = o2.DevelopmentFlag)
GO
IF OBJECT_ID(N'[dbo].[Collections]', N'U') IS NOT NULL
DROP TABLE Collections
GO

IF OBJECT_ID(N'[dbo].[ObjCustomAssembly]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjCustomAssembly](
	[AssemblyName] [nvarchar](80) NOT NULL,
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_DevFlag]  DEFAULT ((0)),
	[FullName] [nvarchar](200) NOT NULL,
	[AssemblyImage] [varbinary](max) NOT NULL,
	[AssemblySymbols] [varbinary](max) NULL,
	[FileName] [nvarchar](80) NOT NULL,
	[SymbolFileName] [nvarchar](80) NULL,
	[LockBy] [nvarchar](80) NULL,
	[RevisionNo] [int] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_RevisionNo]  DEFAULT ((1)),
	[RevisionDate] [datetime] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_RevisionDate]  DEFAULT (getdate()),
	[AccessAs] [nvarchar](50) NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjCustomAssembly_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjCustomAssembly] PRIMARY KEY CLUSTERED 
(
	[AssemblyName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UQ_CustomAssemblyFullName] UNIQUE NONCLUSTERED 
(
	[FullName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF OBJECT_ID(N'[dbo].[CustomAssembly]', N'U') IS NOT NULL
INSERT INTO ObjCustomAssembly (AssemblyName, DevelopmentFlag, FullName, AssemblyImage, AssemblySymbols, FileName, SymbolFileName, LockBy, RevisionNo
	, RevisionDate, AccessAs, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate)
SELECT AssemblyName, DevelopmentFlag, FullName, AssemblyImage, AssemblySymbols, FileName, SymbolFileName, LockBy, RevisionNo
	, RevisionDate, AccessAs, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM CustomAssembly c1
WHERE NOT EXISTS (SELECT 1
  FROM ObjCustomAssembly c2
  WHERE c1.AssemblyName = c2.AssemblyName
  AND   c1.DevelopmentFlag = c2.DevelopmentFlag)
GO
IF OBJECT_ID(N'[dbo].[CustomAssembly]', N'U') IS NOT NULL
DROP TABLE CustomAssembly
GO
IF OBJECT_ID(N'[dbo].[ObjFilters]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjFilters](
	[CollectionName] [nvarchar](80) NOT NULL,
	[UserName] [nvarchar](80) NULL,
	[GroupName] [nvarchar](80) NULL,
	[Filter] [ntext] NULL,
	[DevelopmentFlag] [int] NOT NULL
   CONSTRAINT DF_ObjFilters_DevFlag DEFAULT ((0)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL
   CONSTRAINT DF_ObjFilters_InWorkflow DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
   CONSTRAINT DF_ObjFilters_NoteExists DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL
   CONSTRAINT DF_ObjFilters_RecordDate DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL
   CONSTRAINT DF_ObjFilters_RowPointer DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL
   CONSTRAINT DF_ObjFilters_CreatedBy DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL
   CONSTRAINT DF_ObjFiltersUpdatedBy DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL
   CONSTRAINT DF_ObjFiltersCreateDate DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
	[Active] [dbo].[FlagNyType] NOT NULL
   CONSTRAINT [DF_ObjFilters_Active]  DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
CREATE UNIQUE CLUSTERED INDEX [PK_ObjFilters] ON [dbo].[ObjFilters]
(
	[CollectionName] ASC,
	[UserName] ASC,
	[GroupName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
CREATE UNIQUE NONCLUSTERED INDEX [IX_ObjFilters_Rowpointer] ON [dbo].[ObjFilters]
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

END
GO
IF OBJECT_ID(N'[dbo].[Filters]', N'U') IS NOT NULL
BEGIN
INSERT INTO ObjFilters(CollectionName, UserName, GroupName, Filter,
	DevelopmentFlag, InWorkflow, NoteExistsFlag, RecordDate, RowPointer,
	CreatedBy, UpdatedBy, CreateDate, Active)
SELECT CollectionName, UserName, GroupName, Filter, DevelopmentFlag,
InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy,
CreateDate, Active
FROM Filters f1
WHERE NOT EXISTS (SELECT 1
	FROM ObjFilters f2
	WHERE f1.CollectionName = f2.CollectionName
	AND f1.UserName = f2.UserName
	AND f1.GroupName = f2.GroupName
	AND f1.DevelopmentFlag = f2.DevelopmentFlag)
END
GO
IF OBJECT_ID(N'[dbo].[Filters]', N'U') IS NOT NULL
DROP TABLE Filters
GO

IF OBJECT_ID(N'[dbo].[ObjMethodParameters]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjMethodParameters](
	[CollectionName] [nvarchar](80) NOT NULL,
	[MethodName] [nvarchar](80) NOT NULL,
	[ParameterName] [nvarchar](80) NOT NULL,
	[Sequence] [smallint] NOT NULL,
	[DataType] [nvarchar](80) NOT NULL,
	[SpDataType] [nvarchar](80) NULL,
	[SpDataLength] [int] NULL,
	[SpDataScale] [int] NULL,
	[InputFlag] [smallint] NOT NULL,
	[OutputFlag] [smallint] NOT NULL,
	[MessageFlag] [smallint] NOT NULL CONSTRAINT [DF_ObjMethodParams_MessageFlag]  DEFAULT ((0)),
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjMethodParams_DevFlag]  DEFAULT ((0)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjMethodParams_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjMethodParams_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjMethodParams_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjMethodParams_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjMethodParams_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjMethodParams_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjMethodParams_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjMethodParameters] PRIMARY KEY CLUSTERED 
(
	[CollectionName] ASC,
	[MethodName] ASC,
	[ParameterName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UQ_ObjMethodParam_Seq] UNIQUE NONCLUSTERED 
(
	[CollectionName] ASC,
	[MethodName] ASC,
	[Sequence] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF OBJECT_ID(N'[dbo].[MethodParameters]', N'U') IS NOT NULL
INSERT INTO ObjMethodParameters (CollectionName, MethodName, ParameterName, Sequence, DataType, SpDataType, SpDataLength, SpDataScale, InputFlag
	, OutputFlag, MessageFlag, DevelopmentFlag, InWOrkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate)
SELECT CollectionName, MethodName, ParameterName, Sequence, DataType, SpDataType, SpDataLength, SpDataScale, InputFlag
	, OutputFlag, MessageFlag, DevelopmentFlag, InWOrkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM MethodParameters o1
WHERE NOT EXISTS (SELECT 1
  FROM ObjMethodParameters o2
  WHERE o1.CollectionName = o2.CollectionName
  AND   o1.MethodName = o2.MethodName
  AND   o1.ParameterName = o2.ParameterName
  AND   o1.DevelopmentFlag = o2.DevelopmentFlag)
GO

IF OBJECT_ID(N'[dbo].[MethodParameters]', N'U') IS NOT NULL
DROP TABLE MethodParameters
GO

IF OBJECT_ID(N'[dbo].[ObjMethodResultSets]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjMethodResultSets](
	[CollectionName] [nvarchar](80) NOT NULL,
	[MethodName] [nvarchar](80) NOT NULL,
	[PropertyName] [nvarchar](80) NOT NULL,
	[Sequence] [smallint] NOT NULL,
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjMethodResults_DevFlag]  DEFAULT ((0)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjMethodResults_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjMethodResults_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjMethodResults_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjMethodResults_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjMethodResults_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjMethodResults_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjMethodResults_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjMethodResultSets] PRIMARY KEY CLUSTERED 
(
	[CollectionName] ASC,
	[MethodName] ASC,
	[Sequence] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF OBJECT_ID(N'[dbo].[MethodResultSets]', N'U') IS NOT NULL
INSERT INTO ObjMethodResultSets (CollectionName, MethodName, PropertyName, Sequence, DevelopmentFlag, InWOrkflow, NoteExistsFlag
	, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate)
SELECT CollectionName, MethodName, PropertyName, Sequence, DevelopmentFlag, InWorkflow, NoteExistsFlag
	, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM MethodResultSets m1
WHERE NOT EXISTS (SELECT 1
  FROM ObjMethodResultSets m2
  WHERE m1.CollectionName = m2.CollectionName
  AND   m1.MethodName = m2.MethodName
  AND   m1.Sequence = m2.Sequence
  AND   m1.DevelopmentFlag = m2.DevelopmentFlag)
GO

IF OBJECT_ID(N'[dbo].[MethodResultSets]', N'U') IS NOT NULL
DROP TABLE MethodResultSets
GO

IF OBJECT_ID(N'[dbo].[ObjMethods]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjMethods](
	[CollectionName] [nvarchar](80) NOT NULL,
	[MethodName] [nvarchar](80) NOT NULL,
	[MethodDesc] [nvarchar](255) NULL,
	[MethodType] [int] NOT NULL CONSTRAINT [DF_ObjMethods_Type]  DEFAULT ((0)),
	[StoredProcName] [nvarchar](80) NULL,
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjMethods_DevFlag]  DEFAULT ((0)),
	[TxnFlag] [smallint] NOT NULL CONSTRAINT [DF_ObjMethods_TxnFlag]  DEFAULT ((1)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjMethods_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjMethods_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjMethods_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjMethods_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjMethods_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjMethods_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjMethods_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjMethods] PRIMARY KEY CLUSTERED 
(
	[CollectionName] ASC,
	[MethodName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF OBJECT_ID(N'[dbo].[Methods]', N'U') IS NOT NULL
INSERT INTO ObjMethods (CollectionName, MethodName, MethodDesc, MethodType, StoredProcName, DevelopmentFlag, TxnFlag
	, InWorkflow, NoteExistsFlag, RecordDate, ROwPointer, CreatedBy, UpdatedBy, CreateDate)
SELECT CollectionName, MethodName, MethodDesc, MethodType, StoredProcName, DevelopmentFlag, TxnFlag
	, InWOrkflow, NoteExistsFlag, RecordDate, ROwPointer, CreatedBy, UpdatedBy, CreateDate
FROM Methods m1
WHERE NOT EXISTS (SELECT 1
  FROM ObjMethods m2
  WHERE m1.CollectionName = m2.CollectionName
  AND   m1.MethodName = m2.MethodName
  AND   m1.DevelopmentFlag = m2.DevelopmentFlag)
GO

IF OBJECT_ID(N'[dbo].[Methods]', N'U') IS NOT NULL
DROP TABLE Methods
GO

IF OBJECT_ID(N'[dbo].[ObjProperties]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjProperties](
	[CollectionName] [nvarchar](80) NOT NULL,
	[PropertyName] [nvarchar](80) NOT NULL,
	[PropertyDesc] [nvarchar](255) NULL,
	[PropertyClass] [nvarchar](80) NULL,
	[PropertyType] [smallint] NOT NULL,
	[ColumnName] [nvarchar](80) NULL,
	[ColumnTableAlias] [nvarchar](80) NULL,
	[KeySequence] [smallint] NULL,
	[SubCollectionName] [nvarchar](80) NULL,
	[PropertyValue] [nvarchar](2000) NULL,
	[PseudoKeyFlag] [smallint] NULL,
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjProperties_DevFlag]  DEFAULT ((0)),
	[Sequence] [smallint] NOT NULL CONSTRAINT [DF_ObjProperties_Sequence]  DEFAULT ((0)),
	[BinaryDataFormat] [nvarchar](30) NULL,
	[BoolFalseValue] [nvarchar](30) NULL,
	[BoolTrueValue] [nvarchar](30) NULL,
	[CaseFormat] [nvarchar](10) NULL,
	[ColumnDataType] [nvarchar](80) NULL,
	[DataDecimalPos] [int] NULL,
	[DataLength] [int] NULL,
	[DataType] [nvarchar](80) NULL,
	[DateFormat] [nvarchar](30) NULL,
	[DefaultIMECharset] [nvarchar](30) NULL,
	[DefaultValue] [nvarchar](80) NULL,
	[DisplayDecimalPos] [int] NULL,
	[DomainIDOName] [nvarchar](80) NULL,
	[DomainListProperties] [nvarchar](500) NULL,
	[DomainProperty] [nvarchar](80) NULL,
	[InputMask] [nvarchar](50) NULL,
	[InputMaskPrompt] [nvarchar](50) NULL,
	[IsHTML] [smallint] NULL,
	[IsReadOnly] [smallint] NULL,
	[IsRequired] [smallint] NULL,
	[IsRORecordFlag] [smallint] NULL,
	[JustifyFormat] [nvarchar](10) NULL,
	[LabelStringID] [nvarchar](50) NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjProperties_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjProperties_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjProperties_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjProperties_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjProperties_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjProperties_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjProperties_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
	[InlineList] [nvarchar](max) NULL,
	[Validators] [nvarchar](max) NULL,
 CONSTRAINT [PK_ObjProperties] PRIMARY KEY CLUSTERED 
(
	[CollectionName] ASC,
	[PropertyName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF OBJECT_ID(N'[dbo].[Properties]', N'U') IS NOT NULL
INSERT INTO ObjProperties (CollectionName, PropertyName, PropertyDesc, PropertyClass, PropertyType, ColumnName, KeySequence, SubCollectionName
	, PropertyValue, PseudoKeyFlag, DevelopmentFlag, ColumnTableAlias, Sequence, BinaryDataFormat, BoolFalseValue, BoolTrueValue, CaseFormat
	, ColumnDataType, DataDecimalPos, DataLength, DataType, DateFormat, DefaultIMECharset, DefaultValue, DisplayDecimalPos, DomainIDOName
	, DomainListProperties, DomainProperty, InputMask, InputMaskPrompt, IsHTML, IsReadOnly, IsRequired, IsRORecordFlag, JustifyFormat
	, LabelStringID, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate, InlineList, Validators)
SELECT CollectionName, PropertyName, PropertyDesc, PropertyClass, PropertyType, ColumnName, KeySequence, SubCollectionName
	, PropertyValue, PseudoKeyFlag, DevelopmentFlag, ColumnTableAlias, Sequence, BinaryDataFormat, BoolFalseValue, BoolTrueValue, CaseFormat
	, ColumnDataType, DataDecimalPos, DataLength, DataType, DateFormat, DefaultIMECharset, DefaultValue, DisplayDecimalPos, DomainIDOName
	, DomainListProperties, DomainProperty, InputMask, InputMaskPrompt, IsHTML, IsReadOnly, IsRequired, IsRORecordFlag, JustifyFormat
	, LabelStringID, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate, InlineList, Validators
FROM Properties p1
WHERE NOT EXISTS (SELECT 1
  FROM ObjProperties p2
  WHERE p1.CollectionName = p2.CollectionName
  AND   p1.PropertyName = p2.PropertyName
  AND   p1.DevelopmentFlag = p2.DevelopmentFlag)
GO

IF OBJECT_ID(N'[dbo].[Properties]', N'U') IS NOT NULL
DROP TABLE Properties
GO

IF OBJECT_ID(N'[dbo].[ObjPropertyClasses]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjPropertyClasses](
	[ClassName] [nvarchar](80) NOT NULL,
	[ParentClassName] [nvarchar](80) NULL,
	[Description] [nvarchar](255) NULL,
	[LockBy] [nvarchar](80) NULL,
	[RevisionNo] [int] NOT NULL CONSTRAINT [DF_ObjPropClass_RevisionNo]  DEFAULT ((1)),
	[RevisionDate] [datetime] NOT NULL CONSTRAINT [DF_ObjPropClass_RevisionDate]  DEFAULT (getdate()),
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjPropClass_DevFlag]  DEFAULT ((0)),
	[AccessAs] [nvarchar](50) NULL,
	[BinaryDataFormat] [nvarchar](30) NULL,
	[BoolFalseValue] [nvarchar](30) NULL,
	[BoolTrueValue] [nvarchar](30) NULL,
	[CaseFormat] [nvarchar](10) NULL,
	[ColumnDataType] [nvarchar](80) NULL,
	[DataDecimalPos] [int] NULL,
	[DataLength] [int] NULL,
	[DataType] [nvarchar](80) NULL,
	[DateFormat] [nvarchar](30) NULL,
	[DefaultIMECharset] [nvarchar](30) NULL,
	[DefaultValue] [nvarchar](80) NULL,
	[DisplayDecimalPos] [int] NULL,
	[DomainIDOName] [nvarchar](80) NULL,
	[DomainListProperties] [nvarchar](500) NULL,
	[DomainProperty] [nvarchar](80) NULL,
	[InputMask] [nvarchar](50) NULL,
	[InputMaskPrompt] [nvarchar](50) NULL,
	[IsHTML] [smallint] NULL,
	[IsReadOnly] [smallint] NULL,
	[IsRequired] [smallint] NULL,
	[IsRORecordFlag] [smallint] NULL,
	[JustifyFormat] [nvarchar](10) NULL,
	[LabelStringID] [nvarchar](50) NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjPropClass_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjPropClass_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjPropClass_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjPropClass_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjPropClass_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjPropClass_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjPropClass_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
	[InlineList] [nvarchar](max) NULL,
	[Validators] [nvarchar](max) NULL,
 CONSTRAINT [PK_ObjPropertyClasses] PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF OBJECT_ID(N'[dbo].[PropertyClasses]', N'U') IS NOT NULL
INSERT INTO ObjPropertyClasses (ClassName, ParentClassName, Description, LockBy, RevisionNo, RevisionDate, DevelopmentFlag, AccessAs, BinaryDataFormat, 
	BoolFalseValue, BoolTrueValue, CaseFormat, ColumnDataType, DataDecimalPos, DataLength, DataType, DateFormat, DefaultIMECharset, DefaultValue, 
	DisplayDecimalPos, DomainIDOName, DomainListProperties, DomainProperty, InputMask, InputMaskPrompt, IsHTML, IsReadOnly, IsRequired, IsRORecordFlag, 
	JustifyFormat, LabelStringID, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate, InlineList, Validators)
SELECT ClassName, ParentClassName, Description, LockBy, RevisionNo, RevisionDate, DevelopmentFlag, AccessAs, BinaryDataFormat, 
	BoolFalseValue, BoolTrueValue, CaseFormat, ColumnDataType, DataDecimalPos, DataLength, DataType, DateFormat, DefaultIMECharset, DefaultValue, 
	DisplayDecimalPos, DomainIDOName, DomainListProperties, DomainProperty, InputMask, InputMaskPrompt, IsHTML, IsReadOnly, IsRequired, IsRORecordFlag, 
	JustifyFormat, LabelStringID, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate, InlineList, Validators
FROM PropertyClasses p1
WHERE NOT EXISTS (SELECT 1
  FROM ObjPropertyClasses p2
  WHERE p1.ClassName = p2.ClassName
  AND   p1.DevelopmentFlag = p2.DevelopmentFlag)
GO

IF OBJECT_ID(N'[dbo].[PropertyClasses]', N'U') IS NOT NULL
DROP TABLE PropertyClasses
GO

IF OBJECT_ID(N'[dbo].[ObjServers]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjServers](
	[ServerName] [nvarchar](80) NOT NULL,
	[ServerDesc] [nvarchar](255) NULL,
	[AccessAs] [nvarchar](50) NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjServers_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjServers_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjServers_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjServers_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjServers_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjServers_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjServers_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjServers] PRIMARY KEY CLUSTERED 
(
	[ServerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF OBJECT_ID(N'[dbo].[Servers]', N'U') IS NOT NULL
INSERT INTO ObjServers (ServerName, ServerDesc, AccessAs, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate)
SELECT ServerName, ServerDesc, AccessAs, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM Servers s1
WHERE NOT EXISTS (SELECT 1
  FROM ObjServers s2
  WHERE s1.ServerName = s2.ServerName)
GO

IF OBJECT_ID(N'[dbo].[Servers]', N'U') IS NOT NULL
DROP TABLE Servers
GO

IF OBJECT_ID(N'[dbo].[ObjSubColFilterProperties]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjSubColFilterProperties](
	[CollectionName] [nvarchar](80) NOT NULL,
	[PropertyName] [nvarchar](80) NOT NULL,
	[Sequence] [int] NOT NULL,
	[FilterPropertyName] [nvarchar](80) NOT NULL,
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjSCFilter_DevFlag]  DEFAULT (0),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjSCFilter_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjSCFilter_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjSCFilter_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjSCFilter_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjSCFilter_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjSCFilter_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjSCFilter_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjSCFilter] PRIMARY KEY CLUSTERED 
(
	[CollectionName] ASC,
	[PropertyName] ASC,
	[Sequence] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_ObjSubColFilterProps_RP] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF OBJECT_ID(N'[dbo].[SubColFilterProperties]', N'U') IS NOT NULL
INSERT INTO ObjSubColFilterProperties (CollectionName, PropertyName, Sequence, FilterPropertyName,
	DevelopmentFlag, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy,
	CreateDate)
SELECT CollectionName, PropertyName, Sequence, FilterPropertyName, DevelopmentFlag, InWorkflow,
NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM SubColFilterProperties s1
WHERE NOT EXISTS (SELECT 1
  FROM ObjSubColFilterProperties s2
  WHERE s1.CollectionName = s2.CollectionName
  AND s1.PropertyName = s2.Propertyname
  AND s1.Sequence = s2.Sequence
  AND s1.DevelopmentFlag = s2.DevelopmentFlag
)
GO
IF OBJECT_ID(N'[dbo].[SubColFilterProperties]', N'U') IS NOT NULL
DROP TABLE SubColFilterProperties
GO

IF OBJECT_ID(N'[dbo].[ObjSysParameters]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjSysParameters](
	[Name] [nvarchar](80) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[ParameterValue] [nvarchar](255) NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT DF_ObjSysParms_InWorkflow  DEFAULT (0),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT DF_ObjSysParms_NoteExistsFlag DEFAULT (0),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT DF_ObjSysParms_RecordDate DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT DF_ObjSysParms_RowPointer DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT DF_ObjSysParms_CreatedBy DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT DF_ObjSysParms_UpdatedBy DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT DF_ObjSysParms_CreateDate DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjSysParameters] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_ObjSysParameters_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF OBJECT_ID(N'[dbo].[SysParameters]', N'U') IS NOT NULL
INSERT INTO ObjSysParameters (Name, Description, ParameterValue, InWorkflow,
	NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy,
	CreateDate)
SELECT Name, Description, ParameterValue, InWOrkflow, NoteExistsFlag,
RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM SysParameters s1
WHERE NOT EXISTS (SELECT 1
  FROM ObjSysParameters s2
  WHERE s1.Name = s2.Name)
GO
IF OBJECT_ID(N'[dbo].[SysParameters]', N'U') IS NOT NULL
DROP TABLE SysParameters
GO

IF OBJECT_ID(N'[dbo].[ObjTables]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[ObjTables](
	[CollectionName] [nvarchar](80) NOT NULL,
	[TableName] [nvarchar](80) NOT NULL,
	[TableAlias] [nvarchar](80) NOT NULL,
	[TableType] [smallint] NOT NULL,
	[JoinType] [smallint] NOT NULL,
	[JoinText] [nvarchar](max) NULL,
	[DevelopmentFlag] [int] NOT NULL CONSTRAINT [DF_ObjTables_DevFlag]  DEFAULT (0),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjTables_InWorkflow]  DEFAULT ((0)),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ObjTables_NoteExistsFlag]  DEFAULT ((0)),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjTables_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ObjTables_RowPointer]  DEFAULT (newid()),
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjTables_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ObjTables_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ObjTables_CreateDate]  DEFAULT (getdate()),
	[DataRowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ObjTables] PRIMARY KEY CLUSTERED 
(
	[CollectionName] ASC,
	[TableAlias] ASC,
	[DevelopmentFlag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_ObjTables_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF OBJECT_ID(N'[dbo].[Tables]', N'U') IS NOT NULL
INSERT INTO ObjTables (CollectionName, TableName, TableAlias, TableType,
	JoinType, JoinText, DevelopmentFlag, InWOrkflow, NoteExistsFlag,
	RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate)
SELECT CollectionName, TableName, TableAlias, TableType, JoinType, JoinText,
DevelopmentFlag, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy,
UpdatedBy, CreateDate
FROM Tables t1
WHERE NOT EXISTS (SELECT 1
	FROM ObjTables t2
	WHERE t1.CollectionName = t2.CollectionName
	AND t1.TableAlias = t2.TableAlias
	AND t1.DevelopmentFlag = t2.DevelopmentFlag)
GO
IF OBJECT_ID(N'[dbo].[Tables]', N'U') IS NOT NULL
DROP TABLE [Tables]
GO


--   Triggers reloaded
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjAccessAsIup]'))
DROP TRIGGER [dbo].[ObjAccessAsIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjAccessAsIup]
ON [dbo].[ObjAccessAs]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjCollectionRulesDel]'))
DROP TRIGGER [dbo].[ObjCollectionRulesDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjCollectionRulesDel]
ON [dbo].[ObjCollectionRules]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjCollectionRulesIup]'))
DROP TRIGGER [dbo].[ObjCollectionRulesIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjCollectionRulesIup]
ON [dbo].[ObjCollectionRules]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjCollectionRules
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjCollectionRules.RowPointer
ELSE
  UPDATE ObjCollectionRules
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjCollectionRules.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjCollectionsDel]'))
DROP TRIGGER [dbo].[ObjCollectionsDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjCollectionsDel]
ON [dbo].[ObjCollections]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

UPDATE c
SET Extends = dd.Extends
FROM ObjCollections c
INNER JOIN deleted dd ON
  dd.CollectionName = c.Extends
WHERE dd.ReplaceFlag = 1
AND c.ReplaceFlag = 1
AND NOT EXISTS (SELECT 1
  FROM ObjCollections c2
  WHERE c2.CollectionName = dd.CollectionName
  AND c2.DevelopmentFlag != dd.DevelopmentFlag)

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp

GO


SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjCollectionsIup]'))
DROP TRIGGER [dbo].[ObjCollectionsIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjCollectionsIup]
ON [dbo].[ObjCollections]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

--  If an extends and replace is made on a collection that already has an extends and replace,
-- then change the extends on the new collection to be at the current bottom of the extends and
-- replace chain.  Only do this operation for inserted rows that have no duplicate with a different
-- development flag.  So do it for standard new collections from Winstudio, which will have no equivalent
-- development flag = 0 record.  Also do it for new collections with a development flag of 0 which have
-- no equivalent development flag = 1 record.  This should handle imports, loads, and Winstudio new collection
-- cases.
IF @InsertFlag = 1
BEGIN

;WITH BottomReplace (BaseCollectionName, CollectionName, Extends, LockBy, DevelopmentFlag, BaseDevelopmentFlag, CLevel)
AS
(
  SELECT ii.CollectionName, ii.CollectionName, ii.Extends, ISNULL(ii.LockBy, N''), ii.DevelopmentFlag, ii.DevelopmentFlag, 0
  FROM inserted ii
  WHERE 
  NOT EXISTS (SELECT 1
  FROM ObjCollections c2
  WHERE c2.CollectionName = ii.CollectionName
  AND c2.DevelopmentFlag != ii.DevelopmentFlag)
  AND ii.ReplaceFlag = 1
UNION ALL
  SELECT br.BaseCollectionName, c3.Extends, c3.CollectionName, ISNULL(c3.LockBy, ''), c3.DevelopmentFlag, br.BaseDevelopmentFlag, br.CLevel + 1
  FROM BottomReplace br
  INNER JOIN inserted ii ON
    ii.CollectionName = br.BaseCollectionName
  AND ii.DevelopmentFlag = br.BaseDevelopmentFlag
  INNER JOIN ObjCollections c3 ON
    c3.Extends = br.Extends
  AND ((c3.LockBy = ii.LockBy AND c3.DevelopmentFlag = 1 AND ii.DevelopmentFlag = 1) OR ( c3.DevelopmentFlag = 0))
  WHERE c3.ReplaceFlag = 1
  AND c3.CollectionName != ii.CollectionName
)
UPDATE c
SET Extends = (SELECT TOP 1 br.Extends
  FROM BottomReplace br
  WHERE ii.CollectionName = br.BaseCollectionName
  AND CLevel != 0
  ORDER BY br.CLevel DESC)
FROM ObjCollections c
INNER JOIN inserted ii ON
  ii.CollectionName = c.CollectionName
WHERE NOT EXISTS (SELECT 1
FROM ObjCollections c2
WHERE c.CollectionName = c2.CollectionName
AND c.DevelopmentFlag != c2.DevelopmentFlag)
AND EXISTS (SELECT 1
FROM BottomReplace br2
WHERE br2.BaseCollectionName = c.CollectionName
AND br2.CLevel = 1)

END -- @InsertFlag = 1

IF @InsertFlag = 0
  UPDATE ObjCollections
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjCollections.RowPointer
ELSE
  UPDATE ObjCollections
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjCollections.RowPointer
GO



SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjCustomAssemblyDel]'))
DROP TRIGGER [dbo].[ObjCustomAssemblyDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjCustomAssemblyDel]
ON [dbo].[ObjCustomAssembly]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp

GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjCustomAssemblyIup]'))
DROP TRIGGER [dbo].[ObjCustomAssemblyIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjCustomAssemblyIup]
ON [dbo].[ObjCustomAssembly]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjCustomAssembly
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjCustomAssembly.RowPointer
ELSE
  UPDATE ObjCustomAssembly
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjCustomAssembly.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodParametersDel]'))
DROP TRIGGER [dbo].[ObjMethodParametersDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjMethodParametersDel]
ON [dbo].[ObjMethodParameters]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp

GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodParametersIup]'))
DROP TRIGGER [dbo].[ObjMethodParametersIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjMethodParametersIup]
ON [dbo].[ObjMethodParameters]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjMethodParameters
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjMethodParameters.RowPointer
ELSE
  UPDATE ObjMethodParameters
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjMethodParameters.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodResultSetsDel]'))
DROP TRIGGER [dbo].[ObjMethodResultSetsDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjMethodResultSetsDel]
ON [dbo].[ObjMethodResultSets]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp


GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodResultSetsIup]'))
DROP TRIGGER [dbo].[ObjMethodResultSetsIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjMethodResultSetsIup]
ON [dbo].[ObjMethodResultSets]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjMethodResultSets
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjMethodResultSets.RowPointer
ELSE
  UPDATE ObjMethodResultSets
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjMethodResultSets.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodsDel]'))
DROP TRIGGER [dbo].[ObjMethodsDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjMethodsDel]
ON [dbo].[ObjMethods]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp


GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodsIup]'))
DROP TRIGGER [dbo].[ObjMethodsIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjMethodsIup]
ON [dbo].[ObjMethods]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjMethods
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjMethods.RowPointer
ELSE
  UPDATE ObjMethods
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjMethods.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjPropertiesDel]'))
DROP TRIGGER [dbo].[ObjPropertiesDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjPropertiesDel]
ON [dbo].[ObjProperties]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp


GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjPropertiesIup]'))
DROP TRIGGER [dbo].[ObjPropertiesIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjPropertiesIup]
ON [dbo].[ObjProperties]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjProperties
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjProperties.RowPointer
ELSE
  UPDATE ObjProperties
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjProperties.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjPropertyClassesDel]'))
DROP TRIGGER [dbo].[ObjPropertyClassesDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjPropertyClassesDel]
ON [dbo].[ObjPropertyClasses]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp

GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjPropertyClassesIup]'))
DROP TRIGGER [dbo].[ObjPropertyClassesIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjPropertyClassesIup]
ON [dbo].[ObjPropertyClasses]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjPropertyClasses
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjPropertyClasses.RowPointer
ELSE
  UPDATE ObjPropertyClasses
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjPropertyClasses.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjServersDel]'))
DROP TRIGGER [dbo].[ObjServersDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjServersDel]
ON [dbo].[ObjServers]
FOR DELETE
AS

SET NOCOUNT ON

DECLARE
  @Severity int
, @Infobar  InfobarType

IF EXISTS ( SELECT 1 FROM deleted )
  SELECT @Severity = 0
ELSE
  RETURN

-- Check if any child collections exist for this server.
IF EXISTS(SELECT 1 FROM deleted dd INNER JOIN ObjCollections col ON dd.ServerName = col.ServerName)
BEGIN
  -- Build @Infobar message.
  SET @Infobar = N'Cannot delete this record since one or more related child IDOs exist.';

  -- Set @Severity to force rollback of delete statement.
  SET @Severity = 16;
END

IF @Severity != 0
BEGIN
  SET @Infobar = '<MsgTag>' + @Infobar + '<MsgTag>';
  RAISERROR (@Infobar, @Severity, 3);

  IF @Severity != 0
  BEGIN
    ROLLBACK TRANSACTION
    RETURN
  END
END
--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjServersIup]'))
DROP TRIGGER [dbo].[ObjServersIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjServersIup]
ON [dbo].[ObjServers]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjServers
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjServers.RowPointer
ELSE
  UPDATE ObjServers
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjServers.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjSubColFilterPropertiesDel]'))
DROP TRIGGER [dbo].[ObjSubColFilterPropertiesDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjSubColFilterPropertiesDel]
ON [dbo].[ObjSubColFilterProperties]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp

GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjSubColFilterPropertiesIup]'))
DROP TRIGGER [dbo].[ObjSubColFilterPropertiesIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjSubColFilterPropertiesIup]
ON [dbo].[ObjSubColFilterProperties]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjSubColFilterProperties
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjSubColFilterProperties.RowPointer
ELSE
  UPDATE ObjSubColFilterProperties
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjSubColFilterProperties.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjSysParametersDel]'))
DROP TRIGGER [dbo].[ObjSysParametersDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjSysParametersDel]
ON [dbo].[ObjSysParameters]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp

GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjSysParametersIup]'))
DROP TRIGGER [dbo].[ObjSysParametersIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjSysParametersIup]
ON [dbo].[ObjSysParameters]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjSysParameters
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjSysParameters.RowPointer
ELSE
  UPDATE ObjSysParameters
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjSysParameters.RowPointer
GO
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjTablesDel]'))
DROP TRIGGER [dbo].[ObjTablesDel]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjTablesDel]
ON [dbo].[ObjTables]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ObjTablesIup]'))
DROP TRIGGER [dbo].[ObjTablesIup]
GO

/*$Header: /Tools/SQLScripts/ObjectsDB/SchemaChanges/ReadyToApply/9.02.20_RS6023_Objects.sql 1     5/09/16 1:50p Djohnson $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[ObjTablesIup]
ON [dbo].[ObjTables]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE ObjTables
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjTables.RowPointer
ELSE
  UPDATE ObjTables
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = ObjTables.RowPointer
GO

