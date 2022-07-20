SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExternalWorkflow](
	[WorkflowID] [dbo].[LongDescType] NOT NULL,
	[Sequence] [dbo].[SequenceType] NOT NULL,
	[BODField] [dbo].[ESBPropertyNameType] NULL,
	[OutboundValue] [dbo].[EventExpressionType] NULL,
	[InboundValue] [dbo].[CollectionPropertyNameType] NULL,
	[UseNewValue] [dbo].[FlagNyType] NOT NULL,
	[EnableBODField] [dbo].[FlagNyType] NOT NULL,
	[EnableOutbound] [dbo].[FlagNyType] NOT NULL,
	[EnableInbound] [dbo].[FlagNyType] NOT NULL,
	[EnableUseNewValue] [dbo].[FlagNyType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [PK_ExternalWorkflow] PRIMARY KEY CLUSTERED 
(
	[WorkflowID] ASC,
	[Sequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ExternalWorkflow_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_UseNewValue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_UseNewValue]  DEFAULT ((0)) FOR [UseNewValue]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_EnableBODField]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_EnableBODField]  DEFAULT ((0)) FOR [EnableBODField]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_EnableOutbound]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_EnableOutbound]  DEFAULT ((0)) FOR [EnableOutbound]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_EnableInbound]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_EnableInbound]  DEFAULT ((0)) FOR [EnableInbound]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_EnableUseNewValue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_EnableUseNewValue]  DEFAULT ((0)) FOR [EnableUseNewValue]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalWorkflow_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalWorkflow] ADD  CONSTRAINT [DF_ExternalWorkflow_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_UseNewValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow]  WITH CHECK ADD  CONSTRAINT [CK_ExternalWorkflow_UseNewValue] CHECK  (([UseNewValue]=(1) OR [UseNewValue]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_UseNewValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow] CHECK CONSTRAINT [CK_ExternalWorkflow_UseNewValue]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableBODField]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow]  WITH CHECK ADD  CONSTRAINT [CK_ExternalWorkflow_EnableBODField] CHECK  (([EnableBODField]=(1) OR [EnableBODField]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableBODField]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow] CHECK CONSTRAINT [CK_ExternalWorkflow_EnableBODField]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableOutbound]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow]  WITH CHECK ADD  CONSTRAINT [CK_ExternalWorkflow_EnableOutbound] CHECK  (([EnableOutbound]=(1) OR [EnableOutbound]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableOutbound]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow] CHECK CONSTRAINT [CK_ExternalWorkflow_EnableOutbound]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableInbound]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow]  WITH CHECK ADD  CONSTRAINT [CK_ExternalWorkflow_EnableInbound] CHECK  (([EnableInbound]=(1) OR [EnableInbound]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableInbound]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow] CHECK CONSTRAINT [CK_ExternalWorkflow_EnableInbound]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableUseNewValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow]  WITH CHECK ADD  CONSTRAINT [CK_ExternalWorkflow_EnableUseNewValue] CHECK  (([EnableUseNewValue]=(1) OR [EnableUseNewValue]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_EnableUseNewValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow] CHECK CONSTRAINT [CK_ExternalWorkflow_EnableUseNewValue]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow]  WITH CHECK ADD  CONSTRAINT [CK_ExternalWorkflow_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow] CHECK CONSTRAINT [CK_ExternalWorkflow_NoteExistsFlag]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow]  WITH CHECK ADD  CONSTRAINT [CK_ExternalWorkflow_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalWorkflow_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalWorkflow]'))
ALTER TABLE [dbo].[ExternalWorkflow] CHECK CONSTRAINT [CK_ExternalWorkflow_InWorkflow]
GO

EXEC dbo.SchemaAdditionalTasksSp 
  @PStartingTable = N'ExternalWorkflow'
, @PEndingTable = N'ExternalWorkflow'
, @Infobar = ''
, @PModuleName = 'Core'
GO