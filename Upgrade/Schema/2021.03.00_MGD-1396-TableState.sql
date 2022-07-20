SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--HashStateType UDDT
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'HashStateType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[HashStateType] FROM [varbinary](64) NULL
GO

--TableState Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableState]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TableState](
	[TableName] [dbo].[TableNameType] NOT NULL,
	[ReplTriggerState] [dbo].[HashStateType] NULL,
	[TriggerState] [dbo].[HashStateType] NULL,
	[ViewState] [dbo].[HashStateType] NULL,
	[MetadataDeleteDate] [dbo].[DateTimeType] NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [PK_TableState] PRIMARY KEY CLUSTERED 
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TableState_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TableState_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TableState] ADD  CONSTRAINT [DF_TableState_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TableState_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TableState] ADD  CONSTRAINT [DF_TableState_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TableState_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TableState] ADD  CONSTRAINT [DF_TableState_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TableState_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TableState] ADD  CONSTRAINT [DF_TableState_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TableState_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TableState] ADD  CONSTRAINT [DF_TableState_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TableState_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TableState] ADD  CONSTRAINT [DF_TableState_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TableState_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TableState] ADD  CONSTRAINT [DF_TableState_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO

EXEC dbo.SchemaAdditionalTasksSp 
  @PStartingTable = N'TableState'
, @PEndingTable = N'TableState'
, @Infobar = ''
, @PModuleName = 'Core'
GO