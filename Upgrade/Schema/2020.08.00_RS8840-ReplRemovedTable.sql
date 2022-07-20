SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReplRemovedTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReplRemovedTable](
	[TableName] [dbo].[TableNameType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [PK_ReplRemovedTable] PRIMARY KEY CLUSTERED 
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ReplRemovedTable_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReplRemovedTable_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReplRemovedTable] ADD  CONSTRAINT [DF_ReplRemovedTable_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReplRemovedTable_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReplRemovedTable] ADD  CONSTRAINT [DF_ReplRemovedTable_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReplRemovedTable_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReplRemovedTable] ADD  CONSTRAINT [DF_ReplRemovedTable_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReplRemovedTable_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReplRemovedTable] ADD  CONSTRAINT [DF_ReplRemovedTable_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReplRemovedTable_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReplRemovedTable] ADD  CONSTRAINT [DF_ReplRemovedTable_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReplRemovedTable_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReplRemovedTable] ADD  CONSTRAINT [DF_ReplRemovedTable_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReplRemovedTable_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReplRemovedTable] ADD  CONSTRAINT [DF_ReplRemovedTable_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ReplRemovedTable_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReplRemovedTable]'))
ALTER TABLE [dbo].[ReplRemovedTable] CHECK CONSTRAINT [CK_ReplRemovedTable_InWorkflow]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ReplRemovedTable_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReplRemovedTable]'))
ALTER TABLE [dbo].[ReplRemovedTable]  WITH CHECK ADD  CONSTRAINT [CK_ReplRemovedTable_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ReplRemovedTable_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReplRemovedTable]'))
ALTER TABLE [dbo].[ReplRemovedTable] CHECK CONSTRAINT [CK_ReplRemovedTable_NoteExistsFlag]
GO

EXEC dbo.SchemaAdditionalTasksSp 
  @PStartingTable = N'ReplRemovedTable'
, @PEndingTable = N'ReplRemovedTable'
, @Infobar = ''
, @PModuleName = 'Core'
GO


