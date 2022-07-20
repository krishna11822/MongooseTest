IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[tmp_SystemNotes]')
      AND [name] = N'Validated')
   ALTER TABLE [dbo].[tmp_SystemNotes] ADD
      [Validated] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_tmp_SystemNotes_Validated] DEFAULT ((0))
         CONSTRAINT [CK_tmp_SystemNotes_Validated] CHECK ([Validated] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[tmp_UserNotes]')
      AND [name] = N'Validated')
   ALTER TABLE [dbo].[tmp_UserNotes] ADD
      [Validated] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_tmp_UserNotes_Validated] DEFAULT ((0))
         CONSTRAINT [CK_tmp_UserNotes_Validated] CHECK ([Validated] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[tmp_SpecificNotes]')
      AND [name] = N'Validated')
   ALTER TABLE [dbo].[tmp_SpecificNotes] ADD
      [Validated] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_tmp_SpecificNotes_Validated] DEFAULT ((0))
         CONSTRAINT [CK_tmp_SpecificNotes_Validated] CHECK ([Validated] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[tmp_NoteHeaders]')
      AND [name] = N'Validated')
   ALTER TABLE [dbo].[tmp_NoteHeaders] ADD
      [Validated] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_tmp_NoteHeaders_Validated] DEFAULT ((0))
         CONSTRAINT [CK_tmp_NoteHeaders_Validated] CHECK ([Validated] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[tmp_ClassNotes]')
      AND [name] = N'Validated')
   ALTER TABLE [dbo].[tmp_ClassNotes] ADD
      [OldClassNoteToken] [dbo].[TokenType] NULL,
      [Validated] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_tmp_ClassNotes_Validated] DEFAULT ((0))
         CONSTRAINT [CK_tmp_ClassNotes_Validated] CHECK ([Validated] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
      AND [name] = N'Validated')
   ALTER TABLE [dbo].[tmp_ObjectNotes] ADD
      [OldObjectNoteToken] [dbo].[TokenType] NULL,
      [Validated] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_tmp_ObjectNotes_Validated] DEFAULT ((0))
         CONSTRAINT [CK_tmp_ObjectNotes_Validated] CHECK ([Validated] IN (0,1))
GO