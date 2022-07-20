IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'ProjectNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ProjectNameType] FROM [nvarchar](80) NULL
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[dbo].[AppProfile]', N'U') IS NULL
BEGIN
   CREATE TABLE [dbo].[AppProfile](
	   [ProfileName] [dbo].[NameType] NOT NULL,
	   [AccessAs] [dbo].[AccessAsType] NULL,
	   [ConfigurationName] [dbo].[ConfigurationNameType] NULL,
	   [ServerName] [dbo].[ProjectNameType] NULL,
	   [FilterValue] [dbo].[AccessAsType] NULL,
	   [ScriptSchema] [dbo].[ListYesNoType] NOT NULL,
	   [ScriptIDOs] [dbo].[ListYesNoType] NOT NULL,
	   [ScriptForms] [dbo].[ListYesNoType] NOT NULL,
	   [IncludeAppData] [dbo].[ListYesNoType] NOT NULL,
	   [RowPointer] [dbo].[RowPointerType] NOT NULL,
	   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	   [CreatedBy] [dbo].[UsernameType] NOT NULL,
	   [UpdatedBy] [dbo].[UsernameType] NOT NULL,
	   [CreateDate] [dbo].[CurrentDateType] NOT NULL,
	   [RecordDate] [dbo].[CurrentDateType] NOT NULL,
	   [InWorkflow] [dbo].[FlagNyType] NOT NULL,
    CONSTRAINT [PK_AppProfile] PRIMARY KEY CLUSTERED
   (
	   [ProfileName] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT [IX_AppProfile_RowPointer] UNIQUE NONCLUSTERED 
   (
	   [RowPointer] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
   ) ON [PRIMARY]


   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_ScriptSchema]  DEFAULT ((1)) FOR [ScriptSchema]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_ScriptIDOs]  DEFAULT ((1)) FOR [ScriptIDOs]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_ScriptForms]  DEFAULT ((1)) FOR [ScriptForms]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_RowPointer]  DEFAULT (newid()) FOR [RowPointer]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]

   ALTER TABLE [dbo].[AppProfile] ADD  CONSTRAINT [DF_AppProfile_IncludeAppData]  DEFAULT ((0)) FOR [IncludeAppData]

   ALTER TABLE [dbo].[AppProfile]  WITH CHECK ADD  CONSTRAINT [CK_AppProfile_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))

   ALTER TABLE [dbo].[AppProfile] CHECK CONSTRAINT [CK_AppProfile_InWorkflow]

   ALTER TABLE [dbo].[AppProfile]  WITH CHECK ADD  CONSTRAINT [CK_AppProfile_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))

   ALTER TABLE [dbo].[AppProfile] CHECK CONSTRAINT [CK_AppProfile_NoteExistsFlag]

   ALTER TABLE [dbo].[AppProfile]  WITH CHECK ADD  CONSTRAINT [CK_AppProfile_ScriptForms] CHECK  (([ScriptForms]=(1) OR [ScriptForms]=(0)))

   ALTER TABLE [dbo].[AppProfile] CHECK CONSTRAINT [CK_AppProfile_ScriptForms]

   ALTER TABLE [dbo].[AppProfile]  WITH CHECK ADD  CONSTRAINT [CK_AppProfile_ScriptIDOs] CHECK  (([ScriptIDOs]=(1) OR [ScriptIDOs]=(0)))

   ALTER TABLE [dbo].[AppProfile] CHECK CONSTRAINT [CK_AppProfile_ScriptIDOs]

   ALTER TABLE [dbo].[AppProfile]  WITH CHECK ADD  CONSTRAINT [CK_AppProfile_ScriptSchema] CHECK  (([ScriptSchema]=(1) OR [ScriptSchema]=(0)))

   ALTER TABLE [dbo].[AppProfile] CHECK CONSTRAINT [CK_AppProfile_ScriptSchema]
END
GO


