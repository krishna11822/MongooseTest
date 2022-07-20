IF OBJECT_ID(N'[dbo].[ExtendableStoredProcedure]', N'U') IS NULL
CREATE TABLE [dbo].[ExtendableStoredProcedure](
   [ProcedureName] SYSNAME NOT NULL,
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ExtendableProc_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ExtendableProc_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ExtendableProc_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ExtendableProc_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_ExtendableProc_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ExtendableProc_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ExtendableProc_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ExtendableProc_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ExtendableProc_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ExtendableStoredProcedure] PRIMARY KEY CLUSTERED 
   (
      [ProcedureName]
   ),
   CONSTRAINT [IX_ExtendableProc_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) 
)
GO


