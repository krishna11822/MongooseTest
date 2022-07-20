/** Update DefineVariables with new variable value length **/

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DefineVariables]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'VariableValue' 
   AND OBJECT_NAME(id) = N'DefineVariables')
   ALTER TABLE [dbo].[DefineVariables]
      ALTER COLUMN [VariableValue] [dbo].[VeryLongListType] NULL
GO

/** Create User Defined Data Types **/

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'EncryptedFileType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[EncryptedFileType] FROM [varbinary](max) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'HTTPMethodType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[HTTPMethodType] FROM [nvarchar](6) NULL
GO

/** Create Tables **/

IF OBJECT_ID('[dbo].[IONAPIServers]') IS NULL
   CREATE TABLE [dbo].[IONAPIServers](
	[ServerID] [dbo].[SequenceType] NOT NULL,
	[ServerURL] [dbo].[URLType] NULL,
	[STSURL] [dbo].[URLType] NOT NULL,
	[TokenURL] [dbo].[URLType] NOT NULL,
	[Description] [dbo].[LongDescType] NULL,
	[ionapi] [dbo].[EncryptedFileType] NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
		CONSTRAINT [DF_IONAPIServers_NoteExistsFlag] DEFAULT ((0))
		CONSTRAINT [CK_IONAPIServers_NoteExistsFlag] CHECK   (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))),
	[CreatedBy] [dbo].[UsernameType] NOT NULL
		CONSTRAINT [DF_IONAPIServers_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL
		CONSTRAINT [DF_IONAPIServers_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL
		CONSTRAINT [DF_IONAPIServers_CreateDate] DEFAULT (getdate()),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL
		CONSTRAINT [DF_IONAPIServers_RecordDate] DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL
		CONSTRAINT [DF_IONAPIServers_RowPointer] DEFAULT (newid()),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL
		CONSTRAINT [DF_IONAPIServers_InWorkflow] DEFAULT ((0))
		CONSTRAINT [CK_IONAPIServers_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0))),
   CONSTRAINT [PK_IONAPIServers] PRIMARY KEY NONCLUSTERED 
   (
	[RowPointer] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90),
   CONSTRAINT [IX_IONAPIServers_ServerID] UNIQUE CLUSTERED 
   (
	[ServerID] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
   )
GO

IF OBJECT_ID('[dbo].[IONAPISuites]') IS NULL
   CREATE TABLE [dbo].[IONAPISuites](
	[ServerID] [dbo].[SequenceType] NOT NULL,
	[SuiteContext] [dbo].[LongStringType] NOT NULL,
	[SuiteName] [dbo].[NameType] NOT NULL,
	[Description] [dbo].[LongDescType] NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
		CONSTRAINT [DF_IONAPISuites_NoteExistsFlag] DEFAULT ((0))
		CONSTRAINT [CK_IONAPISuites_NoteExistsFlag] CHECK   (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))),
	[CreatedBy] [dbo].[UsernameType] NOT NULL
		CONSTRAINT [DF_IONAPISuites_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL
		CONSTRAINT [DF_IONAPISuites_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL
		CONSTRAINT [DF_IONAPISuites_CreateDate] DEFAULT (getdate()),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL
		CONSTRAINT [DF_IONAPISuites_RecordDate] DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL
		CONSTRAINT [DF_IONAPISuites_RowPointer] DEFAULT (newid()),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL
		CONSTRAINT [DF_IONAPISuites_InWorkflow] DEFAULT ((0))
		CONSTRAINT [CK_IONAPISuites_InWorkflow] CHECK   (([InWorkflow]=(1) OR [InWorkflow]=(0))),
    CONSTRAINT [PK_IONAPISuites] PRIMARY KEY NONCLUSTERED 
    (
	[RowPointer] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90),
    CONSTRAINT [IX_IONAPISuites_ServerID_SuiteName] UNIQUE CLUSTERED 
    (
	[ServerID] ASC,
	[SuiteName] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
   )
GO

IF OBJECT_ID('[dbo].[IONAPIMethods]') IS NULL
   CREATE TABLE [dbo].[IONAPIMethods](
	[ServerID] [dbo].[SequenceType] NOT NULL,
	[SuiteName] [dbo].[NameType] NOT NULL,
	[Name] [dbo].[NameType] NOT NULL,
	[Description] [dbo].[LongDescType] NULL,
	[Method] [dbo].[HTTPMethodType] NOT NULL
		CONSTRAINT [CK_IONAPIMethods_Method] CHECK  (([Method]=N'GET' OR [Method]=N'POST' OR [Method]=N'PUT' OR [Method]=N'DELETE' OR [Method]=N'HEAD')),
	[Path] [dbo].[LongStringType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
		CONSTRAINT [DF_IONAPIMethods_NoteExistsFlag] DEFAULT ((0))
		CONSTRAINT [CK_IONAPIMethods_NoteExistsFlag] CHECK   (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))),
	[CreatedBy] [dbo].[UsernameType] NOT NULL
		CONSTRAINT [DF_IONAPIMethods_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL
		CONSTRAINT [DF_IONAPIMethods_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL
		CONSTRAINT [DF_IONAPIMethods_CreateDate] DEFAULT (getdate()),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL
		CONSTRAINT [DF_IONAPIMethods_RecordDate] DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL
		CONSTRAINT [DF_IONAPIMethods_RowPointer] DEFAULT (newid()),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL
		CONSTRAINT [DF_IONAPIMethods_InWorkflow] DEFAULT ((0))
		CONSTRAINT [CK_IONAPIMethods_InWorkflow] CHECK   (([InWorkflow]=(1) OR [InWorkflow]=(0))),
    CONSTRAINT [PK_IONAPIMethods] PRIMARY KEY NONCLUSTERED 
    (
	[RowPointer] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90),
    CONSTRAINT [IX_IONAPIMethods_ServerID_SuiteName_Name] UNIQUE CLUSTERED 
    (
	[ServerID] ASC,
	[SuiteName] ASC,
	[Name] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
   )
GO

/** Unique Index for IONAPIMethods **/
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IONAPIMethods]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
		WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[IONAPIMethods]')
		AND [name] = N'IX_IONAPIMethods_ServerID_SuiteName_Method_Path')
   DROP INDEX [dbo].[IONAPIMethods].[IX_IONAPIMethods_ServerID_SuiteName_Method_Path]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IONAPIMethods]'), N'IsUserTable') = 1
   CREATE UNIQUE INDEX [IX_IONAPIMethods_ServerID_SuiteName_Method_Path] on [dbo].[IONAPIMethods] 
   (
	[ServerID] ASC,
	[SuiteName] ASC,
	[Method] ASC,
	[Path] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO

