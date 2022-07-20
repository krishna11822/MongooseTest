SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ProductDbFiles]')
      AND [name] = N'MinSp')
   ALTER TABLE [dbo].[ProductDbFiles] ADD
      [MinSp] [int] NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ProductDbFiles]')
      AND [name] = N'MaxSp')
   ALTER TABLE [dbo].[ProductDbFiles] ADD
      [MaxSp] [int] NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ProductDbFiles]')
      AND [name] = N'BuildLevel')
   ALTER TABLE [dbo].[ProductDbFiles] ADD
      [BuildLevel] [int] NULL
GO
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProductDbFiles]') AND name = N'IX_ProductDBFiles_AppliedBy')
DROP INDEX IX_ProductDBFiles_AppliedBy ON [dbo].[ProductDbFiles]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProductDbFiles]') AND name = N'IX_ProductDbFiles_ProcedureName')
CREATE NONCLUSTERED INDEX [IX_ProductDbFiles_ProcedureName] ON [dbo].[ProductDbFiles]
(
	[ProcedureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_AppliedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_AppliedBy]  DEFAULT (suser_sname()) FOR [AppliedBy]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_AppliedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_AppliedDate]  DEFAULT (getdate()) FOR [AppliedDate]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDbFiles]'), N'IsUserTable') = 1 AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ProductDbFiles_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDbFiles] ADD  CONSTRAINT [DF_ProductDbFiles_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO
