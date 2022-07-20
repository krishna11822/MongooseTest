IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ReplicationParameters' )
BEGIN
	CREATE TABLE [dbo].[ReplicationParameters](
	    [ParmKey] [dbo].[ParmKeyType] NOT NULL,
		[SchemaOperationNumber] [OperationCounterType] NOT NULL CONSTRAINT [DF_ReplicationParameters_SchemaOperationNumber] DEFAULT ((-1)),
		[InProcess] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ReplicationParameters_InProcess]  DEFAULT ((0))
		CONSTRAINT [CK_ReplicationParameters_InProcess] CHECK ([InProcess] IN (0,1)),
		[InProcessUTCDate] [dbo].[DateType] NOT NULL CONSTRAINT [DF_ReplicationParameters_InProcessUTCDate]  DEFAULT ((getutcdate())),
		[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ReplicationParameters_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ReplicationParameters_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ReplicationParameters_CreateDate]  DEFAULT (getdate()),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ReplicationParameters_RecordDate]  DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ReplicationParameters_RowPointer]  DEFAULT (newid()),
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ReplicationParameters_NoteExistsFlag]  DEFAULT ((0))
		CONSTRAINT [CK_ReplicationParameters_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ReplicationParameters_InWorkflow]  DEFAULT ((0))
		CONSTRAINT [CK_ReplicationParameters_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
	 CONSTRAINT [PK_ReplicationParameters] PRIMARY KEY CLUSTERED 
	(
		[ParmKey] ASC
	) ON [PRIMARY],
	 CONSTRAINT [IX_ReplicationParameters_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer] ASC
	)WITH (FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY]
END

GO
EXEC dbo.SchemaAdditionalTasksSp
  @PStartingTable = N'ReplicationParameters'
, @PEndingTable = N'ReplicationParameters'
, @Infobar = ''
, @pModuleName = 'Core'
GO
