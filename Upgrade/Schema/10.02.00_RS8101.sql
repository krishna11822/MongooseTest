-- ====================================================
--  8101 : RemoteDebuggingDiagnostics
-- ====================================================

-- ====================
--  FormExtensionHints:
-- ====================
-- Structure

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'LogMessageTypeType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[LogMessageTypeType] FROM [nvarchar](50) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'LogMessageType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[LogMessageType] FROM [nvarchar](MAX) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'LogMessageSourceType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[LogMessageSourceType] FROM [nvarchar](50) NULL
GO


-- ====================
--  LogMessages:
-- ====================
-- Structure

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LogMessages](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [dbo].[DateTimeType] NULL,
	[Source] [dbo].[LogMessageSourceType] NULL,
	[Type] [dbo].[LogMessageTypeType] NULL,
	[Message] [dbo].[LogMessageType] NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [IX_LogMessages_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LogMessages]') AND name = N'IX_LogMessages')
CREATE CLUSTERED INDEX [IX_LogMessages] ON [dbo].[LogMessages]
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LogMessages_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LogMessages] ADD  CONSTRAINT [DF_LogMessages_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LogMessages_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LogMessages] ADD  CONSTRAINT [DF_LogMessages_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LogMessages_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LogMessages] ADD  CONSTRAINT [DF_LogMessages_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LogMessages_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LogMessages] ADD  CONSTRAINT [DF_LogMessages_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LogMessages_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LogMessages] ADD  CONSTRAINT [DF_LogMessages_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LogMessages_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LogMessages] ADD  CONSTRAINT [DF_LogMessages_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LogMessages_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LogMessages] ADD  CONSTRAINT [DF_LogMessages_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO