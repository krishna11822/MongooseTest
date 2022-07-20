IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'PollingServiceType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[PollingServiceType] FROM TINYINT NULL
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServicePollingQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ServicePollingQueue] (
  [ConfigName] [ConfigurationNameType] NOT NULL 
, [PollingService] [PollingServiceType] NOT NULL
, [ServerName] [OSLocationType] NOT NULL
, [DatabaseName] [OSLocationType] NOT NULL
, [LastPollDate] [CurrentDateType] NULL 
, [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_SvcPollQ_NoteExistsFlag] DEFAULT ((0))
, [RecordDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_SvcPollQ_RecordDate] DEFAULT (getdate())
, [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_SvcPollQ_RowPointer] DEFAULT (newid())
, [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_SvcPollQ_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_SvcPollQ_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_SvcPollQ_CreateDate] DEFAULT (getdate())
, [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_SvcPollQ_InWorkflow] DEFAULT ((0))
, CONSTRAINT [CK_SvcPollQ_PollingService] CHECK (PollingService BETWEEN 1 and 7)
, CONSTRAINT [CK_SvcPollQ_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))
, CONSTRAINT [CK_SvcPollQ_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0))
, CONSTRAINT [PK_ServicePollingQueue] PRIMARY KEY CLUSTERED ([ConfigName], [PollingService])
, CONSTRAINT [IX_ServicePollingQueue_RP] UNIQUE NONCLUSTERED ([RowPointer])
)
END
GO

