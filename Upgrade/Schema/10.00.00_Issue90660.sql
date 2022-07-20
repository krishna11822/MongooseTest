IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ClassNotes]'), N'IsUserTable') = 1
   IF EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[ClassNotesCk1]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[ClassNotes]'))
      ALTER TABLE ClassNotes DROP
         CONSTRAINT ClassNotesCk1,
         CONSTRAINT ClassNotesCk2,
         CONSTRAINT ClassNotesCk3
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ClassNotes]'), N'IsUserTable') = 1
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[CK_ClassNotes]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[ClassNotes]'))
      ALTER TABLE ClassNotes ADD
         CONSTRAINT [CK_ClassNotes] CHECK(
            ([SystemNoteToken] IS NULL AND [UserNoteToken] IS NOT NULL)
            OR ([UserNoteToken] IS NULL AND [SystemNoteToken] IS NOT NULL))

GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjectNotes]'), N'IsUserTable') = 1
   IF EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[ObjectNotesCk1]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[ObjectNotes]'))
      ALTER TABLE ObjectNotes DROP
         CONSTRAINT ObjectNotesCk1,
         CONSTRAINT ObjectNotesCk2,
         CONSTRAINT ObjectNotesCk3,
         CONSTRAINT ObjectNotesCk4
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjectNotes]'), N'IsUserTable') = 1
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[CK_ObjectNotes]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[ObjectNotes]'))
      ALTER TABLE ObjectNotes ADD
         CONSTRAINT CK_ObjectNotes CHECK (
            ([SystemNoteToken] IS NOT NULL AND [UserNoteToken] IS NULL AND [SpecificNoteToken] IS NULL)
            OR ([SystemNoteToken] IS NULL AND [UserNoteToken] IS NOT NULL AND [SpecificNoteToken] IS NULL)
            OR ([SystemNoteToken] IS NULL AND [UserNoteToken] IS NULL AND [SpecificNoteToken] IS NOT NULL))

GO
