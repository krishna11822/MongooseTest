IF OBJECT_ID(N'[dbo].[tmp_ObjectNotes]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_ObjectNotes](
   [ObjectNoteToken] [dbo].[TokenType] IDENTITY(1,1) NOT NULL,
   [NoteHeaderToken] [dbo].[TokenType] NOT NULL,
   [RefRowPointer] [dbo].[RowPointerType] NOT NULL,
   [NoteType] [dbo].[GenericTypeType] NULL,
   [SystemNoteToken] [dbo].[TokenType] NULL,
   [UserNoteToken] [dbo].[TokenType] NULL,
   [SpecificNoteToken] [dbo].[TokenType] NULL,
   [OldNoteHeaderToken] [dbo].[TokenType] NULL,
   [OldSystemNoteToken] [dbo].[TokenType] NULL,
   [OldUserNoteToken] [dbo].[TokenType] NULL,
   [OldSpecificNoteToken] [dbo].[TokenType] NULL,
   [OldRowPointer] [dbo].[RowPointerType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_ObjectNotes_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_ObjectNotes_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_ObjectNotes_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_ObjectNotes_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_ObjectNotes_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_ObjectNotes_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_ObjectNotes_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_ObjectNotes_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_ObjectNotes_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [tmp_ObjectNotesIx0] PRIMARY KEY CLUSTERED 
      ([ObjectNoteToken]),
   CONSTRAINT [IX_tmp_ObjectNotes_RowPointer] UNIQUE NONCLUSTERED 
      ([RowPointer]),
   CONSTRAINT [tmp_ObjectNotesIx2] UNIQUE NONCLUSTERED 
      ([NoteHeaderToken]
      ,[NoteType]
      ,[SystemNoteToken]
      ,[UserNoteToken]
      ,[SpecificNoteToken]
      ,[RefRowPointer])
) 
GO

IF OBJECT_ID(N'[dbo].[tmp_ClassNotes]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_ClassNotes](
   [ClassNoteToken] [dbo].[TokenType] IDENTITY(1,1) NOT NULL,
   [NoteHeaderToken] [dbo].[TokenType] NOT NULL,
   [NoteType] [dbo].[GenericTypeType] NULL,
   [SystemNoteToken] [dbo].[TokenType] NULL,
   [UserNoteToken] [dbo].[TokenType] NULL,
   [OldNoteHeaderToken] [dbo].[TokenType] NULL,
   [OldSystemNoteToken] [dbo].[TokenType] NULL,
   [OldUserNoteToken] [dbo].[TokenType] NULL,
   [OldRowPointer] [dbo].[RowPointerType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_ClassNotes_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_ClassNotes_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_ClassNotes_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_ClassNotes_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_ClassNotes_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_ClassNotes_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_ClassNotes_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_ClassNotes_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_ClassNotes_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [tmp_ClassNotesIx0] PRIMARY KEY CLUSTERED 
   ([ClassNoteToken]),
   CONSTRAINT [tmp_ClassNotesIx2] UNIQUE NONCLUSTERED 
   ([NoteHeaderToken]
   ,[NoteType]
   ,[SystemNoteToken]
   ,[UserNoteToken]),
   CONSTRAINT [IX_tmp_ClassNotes_RowPointer] UNIQUE NONCLUSTERED 
   ([RowPointer])
) 
GO

IF OBJECT_ID(N'[dbo].[tmp_NoteHeaders]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_NoteHeaders](
   [NoteHeaderToken] [dbo].[TokenType] IDENTITY(1,1) NOT NULL,
   [ObjectName] [sysname] NOT NULL,
   [NoteFlag] [dbo].[FlagIeType] NOT NULL,
   [OldNoteHeaderToken] [dbo].[TokenType] NULL,
   [OldRowPointer] [dbo].[RowPointerType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_NoteHeaders_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_NoteHeaders_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_NoteHeaders_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_NoteHeaders_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_NoteHeaders_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_NoteHeaders_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_NoteHeaders_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_NoteHeaders_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_NoteHeaders_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [tmp_NoteHeadersIx0] PRIMARY KEY CLUSTERED 
      ([NoteHeaderToken]),
   CONSTRAINT [IX_tmp_NoteHeaders_RowPointer] UNIQUE NONCLUSTERED 
      ([RowPointer]),
   CONSTRAINT [tmp_NoteHeadersIx2] UNIQUE NONCLUSTERED 
   ([ObjectName],[NoteFlag])
)
GO

IF OBJECT_ID(N'[dbo].[tmp_SpecificNotes]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_SpecificNotes](
   [SpecificNoteToken] [dbo].[TokenType] IDENTITY(1,1) NOT NULL,
   [NoteContent] [dbo].[OleObjectType] NOT NULL,
   [NoteDesc] [dbo].[LongDescType] NOT NULL,
   [OldSpecificNoteToken] [dbo].[TokenType] NULL,
   [OldRowPointer] [dbo].[RowPointerType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_SpecificNotes_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_SpecificNotes_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_SpecificNotes_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_SpecificNotes_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_SpecificNotes_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_SpecificNotes_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_SpecificNotes_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_SpecificNotes_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_SpecificNotes_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [tmp_SpecificNotesIx0] PRIMARY KEY CLUSTERED
      ([SpecificNoteToken]),
   CONSTRAINT [IX_tmp_SpecificNotes_RowPointer] UNIQUE NONCLUSTERED
      ([RowPointer])
) 
GO

IF OBJECT_ID(N'[dbo].[tmp_UserNotes]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_UserNotes](
   [UserNoteToken] [dbo].[TokenType] IDENTITY(1,1) NOT NULL,
   [UserName] [dbo].[UsernameType] NOT NULL,
   [NoteContent] [dbo].[OleObjectType] NOT NULL,
   [NoteDesc] [dbo].[LongDescType] NOT NULL,
   [OldUserNoteToken] [dbo].[TokenType] NULL,
   [OldRowPointer] [dbo].[RowPointerType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_UserNotes_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_UserNotes_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_UserNotes_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_UserNotes_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_UserNotes_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_UserNotes_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_UserNotes_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_UserNotes_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_UserNotes_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [tmp_UserNotesIx0] PRIMARY KEY CLUSTERED
      ([UserNoteToken]),
   CONSTRAINT [IX_tmp_UserNotes_RowPointer] UNIQUE NONCLUSTERED
      ([RowPointer])
)
GO

IF OBJECT_ID(N'[dbo].[tmp_SystemNotes]', N'U') IS NULL
CREATE TABLE [dbo].[tmp_SystemNotes](
   [SystemNoteToken] [dbo].[TokenType] IDENTITY(1,1) NOT NULL,
   [NoteContent] [dbo].[OleObjectType] NOT NULL,
   [NoteDesc] [dbo].[LongDescType] NOT NULL,
   [OldSystemNoteToken] [dbo].[TokenType] NULL,
   [OldRowPointer] [dbo].[RowPointerType] NULL,
   [Migrated] [dbo].[ListYesNoType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_SystemNotes_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_tmp_SystemNotes_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_SystemNotes_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_tmp_SystemNotes_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_SystemNotes_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_tmp_SystemNotes_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_tmp_SystemNotes_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_tmp_SystemNotes_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_tmp_SystemNotes_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   [MediaType] [dbo].[InternetMediaTypeType] NULL,
   CONSTRAINT [tmp_SystemNotesIx0] PRIMARY KEY CLUSTERED
      ([SystemNoteToken]),
   CONSTRAINT [IX_tmp_SystemNotes_RowPointer] UNIQUE NONCLUSTERED
      ([RowPointer])
) 
GO