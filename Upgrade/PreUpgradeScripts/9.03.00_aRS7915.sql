IF OBJECT_ID(N'[dbo].[AppTrigger]') IS NULL
CREATE TABLE [dbo].[AppTrigger](
   [TriggerName] ObjectNameType NOT NULL,
   [SpContainingAppSpecificCode] ObjectNameType NOT NULL,
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_AppTrigger_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_AppTrigger_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_AppTrigger_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL  
      CONSTRAINT [DF_AppTrigger_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_AppTrigger_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_AppTrigger_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_AppTrigger_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_AppTrigger_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_AppTrigger_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_AppTrigger] PRIMARY KEY CLUSTERED
   (
      [TriggerName]
   ) ,
   CONSTRAINT [IX_AppTrigger_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )
) 
GO