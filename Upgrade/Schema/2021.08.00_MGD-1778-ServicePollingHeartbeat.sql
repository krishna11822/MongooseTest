SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServicePollingHeartbeat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServicePollingHeartbeat](
	[PollingService] [dbo].[PollingServiceType] NOT NULL,
	[ServerName] [dbo].[OSLocationType] NOT NULL,
	[LastHeartbeat] [dbo].[CurrentDateType] NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL
 CONSTRAINT [PK_ServicePollingHeartbeat] PRIMARY KEY CLUSTERED 
(
	[ServerName] ASC,
	[PollingService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ServicePollingHeartbeat_RP] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServicePollingHeartbeat_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingHeartbeat] ADD  CONSTRAINT [DF_ServicePollingHeartbeat_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServicePollingHeartbeat_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingHeartbeat] ADD  CONSTRAINT [DF_ServicePollingHeartbeat_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServicePollingHeartbeat_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingHeartbeat] ADD  CONSTRAINT [DF_ServicePollingHeartbeat_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServicePollingHeartbeat_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingHeartbeat] ADD  CONSTRAINT [DF_ServicePollingHeartbeat_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ServicePollingHeartbeat_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ServicePollingHeartbeat] ADD  CONSTRAINT [DF_ServicePollingHeartbeat_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ServicePollingHeartbeat_PollingService]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingHeartbeat]'))
BEGIN
ALTER TABLE [dbo].[ServicePollingHeartbeat]  WITH CHECK ADD  CONSTRAINT [CK_ServicePollingHeartbeat_PollingService] CHECK  (([PollingService]>=(1) AND [PollingService]<=(7)))
END
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ServicePollingHeartbeat_PollingService]') AND parent_object_id = OBJECT_ID(N'[dbo].[ServicePollingHeartbeat]'))
BEGIN
ALTER TABLE [dbo].[ServicePollingHeartbeat] CHECK CONSTRAINT [CK_ServicePollingHeartbeat_PollingService]
END
GO

EXEC dbo.SchemaAdditionalTasksSp 
  @PStartingTable = N'ServicePollingHeartbeat'
, @PEndingTable = N'ServicePollingHeartbeat'
, @Infobar = ''
, @PModuleName = 'Core'
GO