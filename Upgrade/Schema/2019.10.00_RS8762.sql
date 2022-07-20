/*
   ReqSet 8762 - External Entity Master
   Object:  Table [dbo].[ExternalEntityMaster]
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExternalEntityMaster]') AND type in (N'U'))
BEGIN
   CREATE TABLE [dbo].[ExternalEntityMaster](
      [Code] [dbo].[NameType] NOT NULL,
      [Name] [dbo].[NameType] NOT NULL,
      [Description] [dbo].[LongDescType] NULL,
      [Status] [smallint] NULL,
      [ID] [dbo].[NameType] NOT NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL,
      [UpdatedBy] [dbo].[UsernameType] NOT NULL,
      [CreateDate] [dbo].[CurrentDateType] NOT NULL,
      [RecordDate] [dbo].[CurrentDateType] NOT NULL,
      [RowPointer] [dbo].[RowPointerType] NOT NULL,
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
      [InWorkflow] [dbo].[FlagNyType] NOT NULL,
    CONSTRAINT [PK_ExternalEntityMaster] PRIMARY KEY CLUSTERED 
   (
      [Code] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT [IX_ExternalEntityMaster_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
   ) ON [PRIMARY]

   ALTER TABLE [dbo].[ExternalEntityMaster] ADD  CONSTRAINT [DF_ExternalEntityMaster_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
   ALTER TABLE [dbo].[ExternalEntityMaster] ADD  CONSTRAINT [DF_ExternalEntityMaster_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
   ALTER TABLE [dbo].[ExternalEntityMaster] ADD  CONSTRAINT [DF_ExternalEntityMaster_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
   ALTER TABLE [dbo].[ExternalEntityMaster] ADD  CONSTRAINT [DF_ExternalEntityMaster_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
   ALTER TABLE [dbo].[ExternalEntityMaster] ADD  CONSTRAINT [DF_ExternalEntityMaster_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
   ALTER TABLE [dbo].[ExternalEntityMaster] ADD  CONSTRAINT [DF_ExternalEntityMaster_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
   ALTER TABLE [dbo].[ExternalEntityMaster] ADD  CONSTRAINT [DF_ExternalEntityMaster_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
   ALTER TABLE [dbo].[ExternalEntityMaster]  WITH CHECK ADD  CONSTRAINT [CK_ExternalEntityMaster_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
   ALTER TABLE [dbo].[ExternalEntityMaster] CHECK CONSTRAINT [CK_ExternalEntityMaster_InWorkflow]
   ALTER TABLE [dbo].[ExternalEntityMaster]  WITH CHECK ADD  CONSTRAINT [CK_ExternalEntityMaster_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
   ALTER TABLE [dbo].[ExternalEntityMaster] CHECK CONSTRAINT [CK_ExternalEntityMaster_NoteExistsFlag]

END
GO


EXEC dbo.SchemaAdditionalTasksSp
  @PStartingTable = N'ExternalEntityMaster'
, @PEndingTable = N'ExternalEntityMaster'
, @Infobar = ''
, @pModuleName = 'Core'

GO

