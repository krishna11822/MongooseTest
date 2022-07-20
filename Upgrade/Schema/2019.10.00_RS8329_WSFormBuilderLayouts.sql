SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WSFormBuilderLayouts](
	[LayoutName] [NameType] NOT NULL,
	[FormType] [WSFormWizardCategoryNameType] NOT NULL,	
	[Description] [LongDescType] NULL,
	[FormName] [FormNameType] NOT NULL,
	[MasterFormName] [FormNameType] NULL,
	[NumberOfProperties] [SmallIntType] NULL,
	[Sequence] [SmallIntType] NULL,
	[HasTileFlag] [FlagNyType] NOT NULL,
	[TileHasImageFlag] [FlagNyType] NOT NULL,
	[TileFormName] [FormNameType] NULL,
	[TileMasterFormName] [FormNameType] NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
	[AccessAs] [dbo].[AccessAsType] NULL,
	[ImageName] [ImageNameType] NULL,
 CONSTRAINT [PK_WSFormBuilderLayouts] PRIMARY KEY CLUSTERED 
(
	[LayoutName] ASC,
	[FormType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON), 
 CONSTRAINT [IX_FormBuilderLayouts_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
EXEC SchemaAdditionalTasksSp N'WSFormBuilderLayouts', N'WSFormBuilderLayouts', NULL, N'Core'
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_HasTileFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_HasTileFlag]  DEFAULT ((0)) FOR [HasTileFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WSFormBuilderLayouts_TileHasImageFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WSFormBuilderLayouts] ADD  CONSTRAINT [DF_WSFormBuilderLayouts_TileHasImageFlag]  DEFAULT ((0)) FOR [TileHasImageFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_HasTileFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts]  WITH CHECK ADD  CONSTRAINT [CK_WSFormBuilderLayouts_HasTileFlag] CHECK  (([HasTileFlag]=(0) OR [HasTileFlag]=(1)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_HasTileFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts] WITH CHECK CHECK CONSTRAINT [CK_WSFormBuilderLayouts_HasTileFlag]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_TileHasImageFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts]  WITH CHECK ADD  CONSTRAINT [CK_WSFormBuilderLayouts_TileHasImageFlag] CHECK  (([TileHasImageFlag]=(0) OR [TileHasImageFlag]=(1)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_TileHasImage]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts] WITH CHECK CHECK CONSTRAINT [CK_WSFormBuilderLayouts_TileHasImageFlag]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts]  WITH CHECK ADD  CONSTRAINT [CK_WSFormBuilderLayouts_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts] WITH CHECK CHECK CONSTRAINT [CK_WSFormBuilderLayouts_InWorkflow]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts]  WITH CHECK ADD  CONSTRAINT [CK_WSFormBuilderLayouts_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_WSFormBuilderLayouts_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]'))
ALTER TABLE [dbo].[WSFormBuilderLayouts] WITH CHECK CHECK CONSTRAINT [CK_WSFormBuilderLayouts_NoteExistsFlag]
GO

