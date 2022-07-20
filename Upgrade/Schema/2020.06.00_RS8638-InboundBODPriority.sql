SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InboundBODPriority]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InboundBODPriority](
	[BODNoun] [dbo].[NameType] NOT NULL,
	[Priority] [dbo].[ESBPriorityType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [PK_InboundBODPriority] PRIMARY KEY CLUSTERED 
(
	[BODNoun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_InboundBODPriority_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InboundBODPriority_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InboundBODPriority] ADD  CONSTRAINT [DF_InboundBODPriority_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InboundBODPriority_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InboundBODPriority] ADD  CONSTRAINT [DF_InboundBODPriority_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InboundBODPriority_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InboundBODPriority] ADD  CONSTRAINT [DF_InboundBODPriority_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InboundBODPriority_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InboundBODPriority] ADD  CONSTRAINT [DF_InboundBODPriority_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InboundBODPriority_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InboundBODPriority] ADD  CONSTRAINT [DF_InboundBODPriority_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InboundBODPriority_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InboundBODPriority] ADD  CONSTRAINT [DF_InboundBODPriority_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InboundBODPriority_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InboundBODPriority] ADD  CONSTRAINT [DF_InboundBODPriority_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_InboundBODPriority_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[InboundBODPriority]'))
ALTER TABLE [dbo].[InboundBODPriority]  WITH CHECK ADD  CONSTRAINT [CK_InboundBODPriority_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_InboundBODPriority_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[InboundBODPriority]'))
ALTER TABLE [dbo].[InboundBODPriority] CHECK CONSTRAINT [CK_InboundBODPriority_InWorkflow]
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_InboundBODPriority_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[InboundBODPriority]'))
ALTER TABLE [dbo].[InboundBODPriority]  WITH CHECK ADD  CONSTRAINT [CK_InboundBODPriority_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_InboundBODPriority_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[InboundBODPriority]'))
ALTER TABLE [dbo].[InboundBODPriority] CHECK CONSTRAINT [CK_InboundBODPriority_NoteExistsFlag]
GO

EXEC dbo.SchemaAdditionalTasksSp 
  @PStartingTable = N'InboundBODPriority'
, @PEndingTable = N'InboundBODPriority'
, @Infobar = ''
, @PModuleName = 'Core'
GO
