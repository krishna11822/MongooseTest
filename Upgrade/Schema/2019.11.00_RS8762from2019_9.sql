/*
   ReqSet 8762 - External Entity
   Object:  Table [dbo].[ExternalEntity]
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ExternalEntity' )
BEGIN
    CREATE TABLE [dbo].[ExternalEntity](
       [Code] [dbo].[NameType] NOT NULL,
       [Name] [dbo].[NameType] NOT NULL,
       [Description] [dbo].[LongDescType] NULL,
       [ApplicationLid] [dbo].[MessageBusIdType] NULL,
       [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ExternalEntity_CreatedBy]  DEFAULT (suser_sname()),
       [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ExternalEntity_UpdatedBy]  DEFAULT (suser_sname()),
       [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ExternalEntity_CreateDate]  DEFAULT (getdate()),
       [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ExternalEntity_RecordDate]  DEFAULT (getdate()),
       [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ExternalEntity_RowPointer]  DEFAULT (newid()),
       [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ExternalEntity_NoteExistsFlag]  DEFAULT ((0)),
          CONSTRAINT [CK_ExternalEntity_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
       [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ExternalEntity_InWorkflow]  DEFAULT ((0)),
          CONSTRAINT [CK_ExternalEntity_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
    CONSTRAINT [PK_ExternalEntity] PRIMARY KEY CLUSTERED
    (
       [Code] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT [IX_ExternalEntity_RowPointer] UNIQUE NONCLUSTERED
    (
       [RowPointer] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    ) ON [PRIMARY]

END
GO

EXEC dbo.SchemaAdditionalTasksSp
  @PStartingTable = N'ExternalEntity'
, @PEndingTable = N'ExternalEntity'
, @Infobar = ''
, @pModuleName = 'Core'

GO

