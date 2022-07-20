IF OBJECT_ID('[dbo].[SessionMap]') IS NULL
     CREATE TABLE [dbo].[SessionMap](
           [SessionID] [dbo].[RowpointerType] NOT NULL CONSTRAINT [DF_SessionMap_SessionID]  DEFAULT (NEWID()),
           [ConfigurationName]  [dbo].[ConfigurationNameType] NOT NULL,     
           [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_SessionMap_NoteExistsFlag]  DEFAULT ((0)),
           [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_SessionMap_CreatedBy]  DEFAULT (suser_sname()),
           [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_SessionMap_UpdatedBy]  DEFAULT (suser_sname()),
           [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_SessionMap_CreateDate]  DEFAULT (getdate()),
           [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_SessionMap_RecordDate]  DEFAULT (getdate()),
           [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_SessionMap_RowPointer]  DEFAULT (newid()),
           [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_SessionMap_InWorkflow]  DEFAULT ((0)),
     CONSTRAINT [PK_SessionMap] PRIMARY KEY NONCLUSTERED 
     (
           [SessionID] ASC
     ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
       CONSTRAINT [IX_SessionMap_RowPointer] UNIQUE NONCLUSTERED 
       (
           [RowPointer] ASC
       ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
     ) 
GO
