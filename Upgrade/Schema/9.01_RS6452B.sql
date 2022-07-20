-- RS6452: Progress & DB2 & Postgres Outrigger (Part 2)

-- Add new child table OutriggerProfileOptions
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'OutriggerProfileOptions')
BEGIN
   CREATE TABLE [dbo].[OutriggerProfileOptions](
	   [ProfileName] [dbo].[ProfileNameType] NOT NULL,
      [OptionName] [dbo].[ShortDescType] NOT NULL,
      [OptionValue] [dbo].[LongDescType] NULL,
	   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_OutriggerProfileOptions_NoteExistsFlag]  DEFAULT ((0)),
	   [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_OutriggerProfileOptions_RecordDate]  DEFAULT (getdate()),
	   [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_OutriggerProfileOptions_RowPointer]  DEFAULT (newid()),
	   [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_OutriggerProfileOptions_CreatedBy]  DEFAULT (suser_sname()),
	   [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_OutriggerProfileOptions_UpdatedBy]  DEFAULT (suser_sname()),
	   [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_OutriggerProfileOptions_CreateDate]  DEFAULT (getdate()),
	   [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_OutriggerProfileOptions_InWorkflow]  DEFAULT ((0))
       CONSTRAINT [PK_OutriggerProfileOptions] PRIMARY KEY CLUSTERED 
      (
	      [ProfileName] ASC,
	      [OptionName] ASC
      ),
       CONSTRAINT [IX_OutriggerProfileOptions_RowPointer] UNIQUE NONCLUSTERED 
      (
	      [RowPointer] ASC
      )
      , CONSTRAINT [CK_OutriggerProfileOptions_InWorkflow] CHECK  ([InWorkflow]=(1) OR [InWorkflow]=(0))
      , CONSTRAINT [CK_OutriggerProfileOptions_NoteExistsFlag] CHECK  ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))
   )
END
GO
