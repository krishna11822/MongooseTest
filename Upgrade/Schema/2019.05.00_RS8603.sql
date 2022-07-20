SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'LogMonitorPolicies' )
BEGIN
	CREATE TABLE [dbo].[LogMonitorPolicies](
		[PolicyId] [smallint] NOT NULL,
		[SourceFilter] [dbo].[FilterType] NULL,
		[LogTypeFilter] [dbo].[FilterType] NULL,
		[MessageFilter] [dbo].[FilterType] NULL,
		[LogRetentionDays] [smallint] NULL CONSTRAINT [DF_LogMonitorPolicies_LogRetentionDays]  DEFAULT ((30)),
		[LogUntilDateTime] [dbo].[DateTimeType] NULL,
		[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LogMonitorPolicies_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LogMonitorPolicies_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_LogMonitorPolicies_CreateDate]  DEFAULT (getdate()),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_LogMonitorPolicies_RecordDate]  DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_LogMonitorPolicies_RowPointer]  DEFAULT (newid()),
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LogMonitorPolicies_NoteExistsFlag]  DEFAULT ((0)),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LogMonitorPolicies_InWorkflow]  DEFAULT ((0)),
	 CONSTRAINT [PK_LogMonitorPolicies] PRIMARY KEY CLUSTERED 
	(
		[PolicyId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	 CONSTRAINT [IX_LogMonitorPolicies_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY]
END

GO
