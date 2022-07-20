
/****** Object:  Table [dbo].[ExternalEntityApplication]    Script Date: 22/08/20 06:05:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExternalEntityApplication]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExternalEntityApplication](
   [ApplicationCode] [dbo].[ExternalEntityAppCodeType] NOT NULL,
   [ApplicationLid] [dbo].[MessageBusIdType] NOT NULL,
   [ExternalEntity] [dbo].[ExternalEntityCodeType] NOT NULL,
   [CreatedBy] [dbo].[UsernameType] NOT NULL,
   [UpdatedBy] [dbo].[UsernameType] NOT NULL,
   [CreateDate] [dbo].[CurrentDateType] NOT NULL,
   [RecordDate] [dbo].[CurrentDateType] NOT NULL,
   [RowPointer] [dbo].[RowPointerType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
   [InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [PK_ExternalEntityApplication] PRIMARY KEY NONCLUSTERED 
(
   [ApplicationCode] ASC,
   [ExternalEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ExternalEntityApplication_RowPointer] UNIQUE NONCLUSTERED 
(
   [RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalEntityApplication_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalEntityApplication] ADD  CONSTRAINT [DF_ExternalEntityApplication_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalEntityApplication_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalEntityApplication] ADD  CONSTRAINT [DF_ExternalEntityApplication_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalEntityApplication_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalEntityApplication] ADD  CONSTRAINT [DF_ExternalEntityApplication_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalEntityApplication_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalEntityApplication] ADD  CONSTRAINT [DF_ExternalEntityApplication_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalEntityApplication_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalEntityApplication] ADD  CONSTRAINT [DF_ExternalEntityApplication_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalEntityApplication_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalEntityApplication] ADD  CONSTRAINT [DF_ExternalEntityApplication_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ExternalEntityApplication_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ExternalEntityApplication] ADD  CONSTRAINT [DF_ExternalEntityApplication_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO


IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalEntityApplication_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalEntityApplication]'))
ALTER TABLE [dbo].[ExternalEntityApplication]  WITH CHECK ADD  CONSTRAINT [CK_ExternalEntityApplication_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalEntityApplication_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalEntityApplication]'))
ALTER TABLE [dbo].[ExternalEntityApplication] WITH CHECK CHECK CONSTRAINT [CK_ExternalEntityApplication_InWorkflow]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalEntityApplication_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalEntityApplication]'))
ALTER TABLE [dbo].[ExternalEntityApplication]  WITH CHECK ADD  CONSTRAINT [CK_ExternalEntityApplication_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ExternalEntityApplication_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExternalEntityApplication]'))
ALTER TABLE [dbo].[ExternalEntityApplication] WITH CHECK CHECK CONSTRAINT [CK_ExternalEntityApplication_NoteExistsFlag]
GO




DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = 'ExternalEntityApplication'
   , @PEndingTable = 'ExternalEntityApplication'
   , @Infobar = @Infobar OUTPUT
   , @PModuleName = 'Core'
GO
