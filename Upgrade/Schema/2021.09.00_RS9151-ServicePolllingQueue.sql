SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ConfigVersionType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ConfigVersionType] FROM [nvarchar](20) NOT NULL
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]') AND type in (N'U'))
BEGIN
   IF NOT EXISTS (  SELECT TOP 1 * FROM   sys.columns WHERE  object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]') AND name = 'ConfigVersion' )
   BEGIN 
    DROP TABLE [dbo].[ServicePollingQueue]
   END
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServicePollingQueue](
	[ConfigName] [dbo].[ConfigurationNameType] NOT NULL,
	[PollingService] [dbo].[PollingServiceType] NOT NULL,
	[ConfigVersion] [dbo].[ConfigVersionType] NOT NULL,
	[ServerName] [dbo].[OSLocationType] NOT NULL,
	[DatabaseName] [dbo].[OSLocationType] NOT NULL,
	[LastPollDate] [dbo].[CurrentDateType] NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
	[HashedPointer]  AS (CONVERT([varbinary](64),hashbytes('SHA2_512',([ServerName]+[DatabaseName])+CONVERT([sysname],[PollingService],(0))),(0))) PERSISTED,
	[FlushRequestDate] [dbo].[CurrentDateType] NULL,
 CONSTRAINT [PK_ServicePollingQueue] PRIMARY KEY CLUSTERED 
(
	[ConfigName] ASC,
	[PollingService] ASC,
	[ConfigVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [IX_ServicePollingQueue_RP] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]') AND name = N'IX_ServicePollingQueue_Hashed')
CREATE NONCLUSTERED INDEX [IX_ServicePollingQueue_Hashed] ON [dbo].[ServicePollingQueue]
(
	[HashedPointer] ASC
)
INCLUDE([ServerName],[DatabaseName],[PollingService],[ConfigVersion]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_ConfigVersion]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_ConfigVersion]  DEFAULT ('') FOR [ConfigVersion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SvcPollQ_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingQueue] ADD  CONSTRAINT [DF_SvcPollQ_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_SvcPollQ_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]'))
ALTER TABLE [dbo].[ServicePollingQueue]  WITH CHECK ADD  CONSTRAINT [CK_SvcPollQ_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_SvcPollQ_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]'))
ALTER TABLE [dbo].[ServicePollingQueue] WITH CHECK CHECK CONSTRAINT [CK_SvcPollQ_InWorkflow]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_SvcPollQ_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]'))
ALTER TABLE [dbo].[ServicePollingQueue]  WITH CHECK ADD  CONSTRAINT [CK_SvcPollQ_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_SvcPollQ_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]'))
ALTER TABLE [dbo].[ServicePollingQueue] WITH CHECK CHECK CONSTRAINT [CK_SvcPollQ_NoteExistsFlag]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_SvcPollQ_PollingService]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]'))
ALTER TABLE [dbo].[ServicePollingQueue]  WITH CHECK ADD  CONSTRAINT [CK_SvcPollQ_PollingService] CHECK  (([PollingService]>=(1) AND [PollingService]<=(7)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_SvcPollQ_PollingService]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]'))
ALTER TABLE [dbo].[ServicePollingQueue] WITH CHECK CHECK CONSTRAINT [CK_SvcPollQ_PollingService]
GO