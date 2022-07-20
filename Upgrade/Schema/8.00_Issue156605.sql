SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[dbo].[NextKeys]', N'U') IS NULL
BEGIN
   CREATE TABLE [dbo].[NextKeys](
       [TableColumnName] [sysname] NOT NULL,
       [KeyPrefix] [dbo].[GenericKeyType] NOT NULL,
       [KeyID] [dbo].[LargeIntType] NOT NULL,
       [SubKey] [dbo].[GenericKeyType] NULL,
      [NoteExistsFlag] [dbo].[FlagNyType]      NOT NULL
         CONSTRAINT [DF_NextKeys_NoteExistsFlag] DEFAULT ((0))
         CONSTRAINT [CK_NextKeys_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
      [RecordDate]     [dbo].[CurrentDateType] NOT NULL
         CONSTRAINT [DF_NextKeys_RecordDate] DEFAULT (getdate()),
      [RowPointer]     [dbo].[RowPointerType]  NOT NULL
         CONSTRAINT [DF_NextKeys_RowPointer] DEFAULT (newid()),
      [CreatedBy]      [dbo].[UsernameType]    NOT NULL
         CONSTRAINT [DF_NextKeys_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy]      [dbo].[UsernameType]    NOT NULL
         CONSTRAINT [DF_NextKeys_UpdatedBy] DEFAULT (suser_sname()),
      [CreateDate]     [dbo].[CurrentDateType] NOT NULL
         CONSTRAINT [DF_NextKeys_CreateDate] DEFAULT (getdate()),
      [InWorkflow]     [dbo].[FlagNyType]      NOT NULL
         CONSTRAINT [DF_NextKeys_InWorkflow] DEFAULT ((0))
         CONSTRAINT [CK_NextKeys_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
    CONSTRAINT [PK_NextKeys] PRIMARY KEY NONCLUSTERED 
   (
       [RowPointer] ASC
   ) ON [PRIMARY]
   ) ON [PRIMARY]
   
   CREATE NONCLUSTERED INDEX [IX_NextKeys_TableKey] ON [dbo].[NextKeys] 
   (
       [TableColumnName] ASC,
       [KeyPrefix] ASC,
       [SubKey] ASC,
       [KeyID] ASC
   ) ON [PRIMARY]
END
GO

