IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_UserNotes]')
   AND   [name] = N'IX_tmp_UserNotes_UserNoteToken_OldUserNoteToken')
DROP INDEX [IX_tmp_UserNotes_UserNoteToken_OldUserNoteToken] ON [dbo].[tmp_UserNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_UserNotes_UserNoteToken_OldUserNoteToken] ON [dbo].[tmp_UserNotes]
(
	[UserNoteToken] ASC,
	[OldUserNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_UserNotes]')
   AND   [name] = N'IX_tmp_UserNotes_OldUserNoteToken')
DROP INDEX [IX_tmp_UserNotes_OldUserNoteToken] ON [dbo].[tmp_UserNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_UserNotes_OldUserNoteToken] ON [dbo].[tmp_UserNotes]
(
	[OldUserNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_UserNotes]')
   AND   [name] = N'IX_tmp_UserNotes_OldRowPointer')
DROP INDEX [IX_tmp_UserNotes_OldRowPointer] ON [dbo].[tmp_UserNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_UserNotes_OldRowPointer] ON [dbo].[tmp_UserNotes]
(
	[OldRowPointer] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_UserNotes]')
   AND   [name] = N'IX_tmp_UserNotes_Migrated')
DROP INDEX [IX_tmp_UserNotes_Migrated] ON [dbo].[tmp_UserNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_UserNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_UserNotes_Migrated] ON [dbo].[tmp_UserNotes]
(
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SystemNotes]')
   AND   [name] = N'IX_tmp_SystemNotes_SystemNoteToken_OldSystemToken')
DROP INDEX [IX_tmp_SystemNotes_SystemNoteToken_OldSystemToken] ON [dbo].[tmp_SystemNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SystemNotes_SystemNoteToken_OldSystemToken] ON [dbo].[tmp_SystemNotes]
(
	[SystemNoteToken] ASC,
	[OldSystemNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SystemNotes]')
   AND   [name] = N'IX_tmp_SystemNotes_OldSystemToken')
DROP INDEX [IX_tmp_SystemNotes_OldSystemToken] ON [dbo].[tmp_SystemNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SystemNotes_OldSystemToken] ON [dbo].[tmp_SystemNotes]
(
	[OldSystemNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SystemNotes]')
   AND   [name] = N'IX_tmp_SystemNotes_OldRowPointer')
DROP INDEX [IX_tmp_SystemNotes_OldRowPointer] ON [dbo].[tmp_SystemNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SystemNotes_OldRowPointer] ON [dbo].[tmp_SystemNotes]
(
	[OldRowPointer] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SystemNotes]')
   AND   [name] = N'IX_tmp_SystemNotes_Migrated')
DROP INDEX [IX_tmp_SystemNotes_Migrated] ON [dbo].[tmp_SystemNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SystemNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SystemNotes_Migrated] ON [dbo].[tmp_SystemNotes]
(
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SpecificNotes]')
   AND   [name] = N'IX_tmp_SpecificNotes_SpecificNoteToken_OldSpecificNoteToken')
DROP INDEX [IX_tmp_SpecificNotes_SpecificNoteToken_OldSpecificNoteToken] ON [dbo].[tmp_SpecificNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SpecificNotes_SpecificNoteToken_OldSpecificNoteToken] ON [dbo].[tmp_SpecificNotes]
(
	[SpecificNoteToken] ASC,
	[OldSpecificNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SpecificNotes]')
   AND   [name] = N'IX_tmp_SpecificNotes_OldSpecificNoteToken')
DROP INDEX [IX_tmp_SpecificNotes_OldSpecificNoteToken] ON [dbo].[tmp_SpecificNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SpecificNotes_OldSpecificNoteToken] ON [dbo].[tmp_SpecificNotes]
(
	[OldSpecificNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SpecificNotes]')
   AND   [name] = N'IX_tmp_SpecificNotes_OldRowPointer')
DROP INDEX [IX_tmp_SpecificNotes_OldRowPointer] ON [dbo].[tmp_SpecificNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SpecificNotes_OldRowPointer] ON [dbo].[tmp_SpecificNotes]
(
	[OldRowPointer] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_SpecificNotes]')
   AND   [name] = N'IX_tmp_SpecificNotes_Migrated')
DROP INDEX [IX_tmp_SpecificNotes_Migrated] ON [dbo].[tmp_SpecificNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_SpecificNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_SpecificNotes_Migrated] ON [dbo].[tmp_SpecificNotes]
(
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
   AND   [name] = N'IX_tmp_ObjectNotes_OldUserNoteToken_Migrated')
DROP INDEX [IX_tmp_ObjectNotes_OldUserNoteToken_Migrated] ON [dbo].[tmp_ObjectNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ObjectNotes_OldUserNoteToken_Migrated] ON [dbo].[tmp_ObjectNotes]
(
	[OldUserNoteToken] ASC,
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
   AND   [name] = N'IX_tmp_ObjectNotes_OldSystemNoteToken_Migrated')
DROP INDEX [IX_tmp_ObjectNotes_OldSystemNoteToken_Migrated] ON [dbo].[tmp_ObjectNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ObjectNotes_OldSystemNoteToken_Migrated] ON [dbo].[tmp_ObjectNotes]
(
	[OldSystemNoteToken] ASC,
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
   AND   [name] = N'IX_tmp_ObjectNotes_OldSpecificNoteToken_Migrated')
DROP INDEX [IX_tmp_ObjectNotes_OldSpecificNoteToken_Migrated] ON [dbo].[tmp_ObjectNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ObjectNotes_OldSpecificNoteToken_Migrated] ON [dbo].[tmp_ObjectNotes]
(
	[OldSpecificNoteToken] ASC,
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
   AND   [name] = N'IX_tmp_ObjectNotes_OldObjectNoteToken')
DROP INDEX [IX_tmp_ObjectNotes_OldObjectNoteToken] ON [dbo].[tmp_ObjectNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ObjectNotes_OldObjectNoteToken] ON [dbo].[tmp_ObjectNotes]
(
	[OldObjectNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
   AND   [name] = N'IX_tmp_ObjectNotes_OldRowPointer')
DROP INDEX [IX_tmp_ObjectNotes_OldRowPointer] ON [dbo].[tmp_ObjectNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ObjectNotes_OldRowPointer] ON [dbo].[tmp_ObjectNotes]
(
	[OldRowPointer] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
   AND   [name] = N'IX_tmp_ObjectNotes_OldNoteHeaderToken_Migrated')
DROP INDEX [IX_tmp_ObjectNotes_OldNoteHeaderToken_Migrated] ON [dbo].[tmp_ObjectNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ObjectNotes_OldNoteHeaderToken_Migrated] ON [dbo].[tmp_ObjectNotes]
(
	[OldNoteHeaderToken] ASC,
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_NoteHeaders]')
   AND   [name] = N'IX_tmp_NoteHeaders_OldRowPointer')
DROP INDEX [IX_tmp_NoteHeaders_OldRowPointer] ON [dbo].[tmp_NoteHeaders]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_NoteHeaders_OldRowPointer] ON [dbo].[tmp_NoteHeaders]
(
	[OldRowPointer] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ObjectNotes]')
   AND   [name] = N'IX_tmp_ObjectNotes_Migrated')
DROP INDEX [IX_tmp_ObjectNotes_Migrated] ON [dbo].[tmp_ObjectNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ObjectNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ObjectNotes_Migrated] ON [dbo].[tmp_ObjectNotes]
(
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_NoteHeaders]')
   AND   [name] = N'IX_tmp_NoteHeaders_NoteHeaderToken_OldNoteHeaderToken')
DROP INDEX [IX_tmp_NoteHeaders_NoteHeaderToken_OldNoteHeaderToken] ON [dbo].[tmp_NoteHeaders]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_NoteHeaders_NoteHeaderToken_OldNoteHeaderToken] ON [dbo].[tmp_NoteHeaders]
(
	[NoteHeaderToken] ASC,
	[OldNoteHeaderToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_NoteHeaders]')
   AND   [name] = N'IX_tmp_NoteHeaders_OldNoteHeaderToken')
DROP INDEX [IX_tmp_NoteHeaders_OldNoteHeaderToken] ON [dbo].[tmp_NoteHeaders]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_NoteHeaders_OldNoteHeaderToken] ON [dbo].[tmp_NoteHeaders]
(
	[OldNoteHeaderToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_NoteHeaders]')
   AND   [name] = N'IX_tmp_NoteHeaders_Migrated')
DROP INDEX [IX_tmp_NoteHeaders_Migrated] ON [dbo].[tmp_NoteHeaders]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_NoteHeaders]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_NoteHeaders_Migrated] ON [dbo].[tmp_NoteHeaders]
(
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ClassNotes]')
   AND   [name] = N'IX_tmp_ClassNotes_OldUserNoteToken_Migrated')
DROP INDEX [IX_tmp_ClassNotes_OldUserNoteToken_Migrated] ON [dbo].[tmp_ClassNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ClassNotes_OldUserNoteToken_Migrated] ON [dbo].[tmp_ClassNotes]
(
	[OldUserNoteToken] ASC,
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ClassNotes]')
   AND   [name] = N'IX_tmp_ClassNotes_OldSystemNoteToken_Migrated')
DROP INDEX [IX_tmp_ClassNotes_OldSystemNoteToken_Migrated] ON [dbo].[tmp_ClassNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ClassNotes_OldSystemNoteToken_Migrated] ON [dbo].[tmp_ClassNotes]
(
	[OldSystemNoteToken] ASC,
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ClassNotes]')
   AND   [name] = N'IX_tmp_ClassNotes_OldRowPointer')
DROP INDEX [IX_tmp_ClassNotes_OldRowPointer] ON [dbo].[tmp_ClassNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ClassNotes_OldRowPointer] ON [dbo].[tmp_ClassNotes]
(
	[OldRowPointer] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ClassNotes]')
   AND   [name] = N'IX_tmp_ClassNotes_OldNoteHeaderToken_Migrated')
DROP INDEX [IX_tmp_ClassNotes_OldNoteHeaderToken_Migrated] ON [dbo].[tmp_ClassNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ClassNotes_OldNoteHeaderToken_Migrated] ON [dbo].[tmp_ClassNotes]
(
	[OldNoteHeaderToken] ASC,
	[Migrated] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ClassNotes]')
   AND   [name] = N'IX_tmp_ClassNotes_OldClassNoteToken')
DROP INDEX [IX_tmp_ClassNotes_OldClassNoteToken] ON [dbo].[tmp_ClassNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ClassNotes_OldClassNoteToken] ON [dbo].[tmp_ClassNotes]
(
	[OldClassNoteToken] ASC
)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[tmp_ClassNotes]')
   AND   [name] = N'IX_tmp_ClassNotes_Migrated')
DROP INDEX [IX_tmp_ClassNotes_Migrated] ON [dbo].[tmp_ClassNotes]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[tmp_ClassNotes]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_tmp_ClassNotes_Migrated] ON [dbo].[tmp_ClassNotes]
(
	[Migrated] ASC
)
GO
