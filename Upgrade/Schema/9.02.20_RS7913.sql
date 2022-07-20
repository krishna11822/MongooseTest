IF OBJECT_ID(N'[dbo].[AppForm]', N'U') IS NULL
BEGIN
   CREATE TABLE [dbo].[AppForm](
        [FormName] [dbo].[FormNameType] NOT NULL,
        [Description] [dbo].[DescriptionType] NULL,
        [UseAsCollabPlatformWidget] [dbo].[ListYesNoType] NOT NULL,
		[AccessAs] [AccessAsType] NULL,
        [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
        [CreatedBy] [dbo].[UsernameType] NOT NULL,
        [UpdatedBy] [dbo].[UsernameType] NOT NULL,
        [CreateDate] [dbo].[CurrentDateType] NOT NULL,
        [RecordDate] [dbo].[CurrentDateType] NOT NULL,
        [RowPointer] [dbo].[RowPointerType] NOT NULL,
        [InWorkflow] [dbo].[FlagNyType] NOT NULL,
    CONSTRAINT [PK_AppForm] PRIMARY KEY CLUSTERED 
   (
        [FormName] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
    CONSTRAINT [IX_AppForm_RowPointer] UNIQUE NONCLUSTERED 
   (
        [RowPointer] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
   )
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_UseAsCollabPlatformWidget]  DEFAULT ((1)) FOR [UseAsCollabPlatformWidget]
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
   ALTER TABLE [dbo].[AppForm] ADD  CONSTRAINT [DF_AppForm_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
   ALTER TABLE [dbo].[AppForm]  WITH CHECK ADD  CONSTRAINT [CK_AppForm_UseAsCollabPlatformWidget] CHECK  (([UseAsCollabPlatformWidget]=(1) OR [UseAsCollabPlatformWidget]=(0)))
   ALTER TABLE [dbo].[AppForm] WITH CHECK CHECK CONSTRAINT [CK_AppForm_UseAsCollabPlatformWidget]
   ALTER TABLE [dbo].[AppForm]  WITH CHECK ADD  CONSTRAINT [CK_AppForm_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
   ALTER TABLE [dbo].[AppForm] WITH CHECK CHECK CONSTRAINT [CK_AppForm_InWorkflow]
   ALTER TABLE [dbo].[AppForm]  WITH CHECK ADD  CONSTRAINT [CK_AppForm_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
   ALTER TABLE [dbo].[AppForm] WITH CHECK CHECK CONSTRAINT [CK_AppForm_NoteExistsFlag]
END
GO