SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubGroupMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubGroupMap](
	[GroupId] [dbo].[TokenType] NOT NULL,
	[SubGroupId] [dbo].[TokenType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [PK_GroupMap] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[SubGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_SubGroupMap_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubGroupMap_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubGroupMap] ADD  CONSTRAINT [DF_SubGroupMap_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubGroupMap_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubGroupMap] ADD  CONSTRAINT [DF_SubGroupMap_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubGroupMap_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubGroupMap] ADD  CONSTRAINT [DF_SubGroupMap_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubGroupMap_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubGroupMap] ADD  CONSTRAINT [DF_SubGroupMap_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubGroupMap_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubGroupMap] ADD  CONSTRAINT [DF_SubGroupMap_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubGroupMap_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubGroupMap] ADD  CONSTRAINT [DF_SubGroupMap_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubGroupMap_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubGroupMap] ADD  CONSTRAINT [DF_SubGroupMap_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO
