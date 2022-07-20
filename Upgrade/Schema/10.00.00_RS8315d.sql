IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABRepositoryComposites')
BEGIN
   CREATE TABLE [dbo].[ABRepositoryComposites](
      [Id] [dbo].[ABIdType] NOT NULL,
      [Version] [dbo].[ABVersionType] NOT NULL,
      [DisplayName] [dbo].[LongDescType] NOT NULL,
      [Data] [dbo].[JSONStringType] NOT NULL,
      [CreatedByDisplayName] [dbo].[LongDescType] NULL,
      [LastChangedByDisplayName] [dbo].[LongDescType] NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRepositoryComposites_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRepositoryComposites_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRepositoryComposites_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRepositoryComposites_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABRepositoryComposites_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRepositoryComposites_NoteExistsFlag]  DEFAULT ((0))
                                                   CONSTRAINT [CK_ABRepositoryComposites_NoteExistsFlag] CHECK([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRepositoryComposites_InWorkflow]  DEFAULT ((0))
                                               CONSTRAINT [CK_ABRepositoryComposites_InWorkflow] CHECK([InWorkflow]=(1) OR [InWorkflow]=(0)),
      CONSTRAINT [PK_ABRepositoryComposites] PRIMARY KEY CLUSTERED 
      (
         [Id] ASC,
         [Version] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABRepositoryComposites_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) ON [PRIMARY],
   ) ON [PRIMARY]

   EXEC dbo.SchemaAdditionalTasksSp 'ABRepositoryComposites', 'ABRepositoryComposites', NULL, 'Core'
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS
               WHERE CONSTRAINT_SCHEMA = 'dbo'
               AND   CONSTRAINT_NAME = 'CK_ABProjects_NoteExistsFlag')
BEGIN
   ALTER TABLE [dbo].[ABDataServices] ADD CONSTRAINT [CK_ABDataServices_Runtime] CHECK ([Runtime]=(0) OR [Runtime]=(1))
   ALTER TABLE [dbo].[ABDataServices] ADD CONSTRAINT [CK_ABDataServices_NoteExistsFlag] CHECK ([NoteExistsFlag]=(0) OR [NoteExistsFlag]=(1))
   ALTER TABLE [dbo].[ABDataServices] ADD CONSTRAINT [CK_ABDataServices_InWorkflow] CHECK ([InWorkflow]=(0) OR [InWorkflow]=(1))
   ALTER TABLE [dbo].[ABProjectRoles] ADD CONSTRAINT [CK_ABProjectRoles_NoteExistsFlag] CHECK ([NoteExistsFlag]=(0) OR [NoteExistsFlag]=(1))
   ALTER TABLE [dbo].[ABProjectRoles] ADD CONSTRAINT [CK_ABProjectRoles_InWorkflow] CHECK ([InWorkflow]=(0) OR [InWorkflow]=(1))
   ALTER TABLE [dbo].[ABProjects] ADD CONSTRAINT [CK_ABProjects_ShowTitleBar] CHECK ([ShowTitleBar]=(0) OR [ShowTitleBar]=(1))
   ALTER TABLE [dbo].[ABProjects] ADD CONSTRAINT [CK_ABProjects_ThemeSwitchEnabled] CHECK ([ThemeSwitchEnabled]=(0) OR [ThemeSwitchEnabled]=(1))
   ALTER TABLE [dbo].[ABProjects] ADD CONSTRAINT [CK_ABProjects_NoteExistsFlag] CHECK ([NoteExistsFlag]=(0) OR [NoteExistsFlag]=(1))
   ALTER TABLE [dbo].[ABProjects] ADD CONSTRAINT [CK_ABProjects_InWorkflow] CHECK ([InWorkflow]=(0) OR [InWorkflow]=(1))
   ALTER TABLE [dbo].[ABRepositoryDataServices] ADD CONSTRAINT [CK_ABRepositoryDataServices_NoteExistsFlag] CHECK ([NoteExistsFlag]=(0) OR [NoteExistsFlag]=(1))
   ALTER TABLE [dbo].[ABRepositoryDataServices] ADD CONSTRAINT [CK_ABRepositoryDataServices_InWorkflow] CHECK ([InWorkflow]=(0) OR [InWorkflow]=(1))
   ALTER TABLE [dbo].[ABRepositoryProjects] ADD CONSTRAINT [CK_ABRepositoryProjects_IsSystemRecord] CHECK ([IsSystemRecord]=(0) OR [IsSystemRecord]=(1))
   ALTER TABLE [dbo].[ABRepositoryProjects] ADD CONSTRAINT [CK_ABRepositoryProjects_NoteExistsFlag] CHECK ([NoteExistsFlag]=(0) OR [NoteExistsFlag]=(1))
   ALTER TABLE [dbo].[ABRepositoryProjects] ADD CONSTRAINT [CK_ABRepositoryProjects_InWorkflow] CHECK ([InWorkflow]=(0) OR [InWorkflow]=(1))
   ALTER TABLE [dbo].[ABRuntimeApps] ADD CONSTRAINT [CK_ABRuntimeApps_IsSystemRecord] CHECK ([IsSystemRecord]=(0) OR [IsSystemRecord]=(1))
   ALTER TABLE [dbo].[ABRuntimeApps] ADD CONSTRAINT [CK_ABRuntimeApps_Active] CHECK ([Active]=(0) OR [Active]=(1))
   ALTER TABLE [dbo].[ABRuntimeApps] ADD CONSTRAINT [CK_ABRuntimeApps_NoteExistsFlag] CHECK ([NoteExistsFlag]=(0) OR [NoteExistsFlag]=(1))
   ALTER TABLE [dbo].[ABRuntimeApps] ADD CONSTRAINT [CK_ABRuntimeApps_InWorkflow] CHECK ([InWorkflow]=(0) OR [InWorkflow]=(1))
   ALTER TABLE [dbo].[ABTags] ADD CONSTRAINT [CK_ABTags_IsSystemRecord] CHECK ([IsSystemRecord]=(0) OR [IsSystemRecord]=(1))
   ALTER TABLE [dbo].[ABTags] ADD CONSTRAINT [CK_ABTags_NoteExistsFlag] CHECK ([NoteExistsFlag]=(0) OR [NoteExistsFlag]=(1))
   ALTER TABLE [dbo].[ABTags] ADD CONSTRAINT [CK_ABTags_InWorkflow] CHECK ([InWorkflow]=(0) OR [InWorkflow]=(1))
   ALTER TABLE [dbo].[ABTags] ADD CONSTRAINT [CK_ABTags_Runtime] CHECK ([Runtime]=(0) OR [Runtime]=(1))

   EXEC dbo.SchemaAdditionalTasksSp 'ABDataServices', 'ABTags', NULL, 'Core'
END
