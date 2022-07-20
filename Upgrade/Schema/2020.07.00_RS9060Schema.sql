IF NOT EXISTS (SELECT 1 FROM AppTable WHERE TableName = 'ManualReplicationBlock')
INSERT INTO AppTable(TableName, IgnoreInsert, IgnoreUpdate, ModuleName) values ('ManualReplicationBlock', 1, 1, 'Core')
IF NOT EXISTS (SELECT 1 FROM AppTable WHERE TableName = 'ManualReplicationHeader')
INSERT INTO AppTable(TableName, ModuleName) values ('ManualReplicationHeader', 'Core')

UPDATE AppTable
SET IgnoreInsert = 1,
	AppViewName = 'ReplicatedRows3',
	SiteColumnName = 'SiteRef'
WHERE TableName = 'ReplicatedRows3_mst'

IF EXISTS (SELECT 1
FROM sys.triggers
WHERE name = 'ReplicatedRows3_mstInsert')
DROP TRIGGER ReplicatedRows3_mstInsert
GO

IF NOT EXISTS (SELECT 1 
FROM sys.sysindexes
WHERE NAME = 'IX_ReplicatedRows3_mst_ProcessingTop')
create index IX_ReplicatedRows3_mst_ProcessingTop on ReplicatedRows3_mst(SiteRef, ToSite, ProcessingPtr, OperationNumber, CreateDate) include (RowPointer)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]')
      AND [name] = N'OneData')
   ALTER TABLE [dbo].[ReplicatedRows3_mst] ADD
      [OneData] [dbo].[VeryLongListType]  NULL
GO

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = 'ReplicatedRows3_mst'
   , @PEndingTable = 'ReplicatedRows3_mst'
   , @PIgnoreUpdate  = 1
   , @PIgnoreInsert = 1
   , @Infobar = @Infobar OUTPUT
   , @PModuleName = 'Core'
GO
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE SCHEMA_ID = SCHEMA_ID('dbo') AND name = 'ManualReplicationHeader')
CREATE TABLE [dbo].[ManualReplicationHeader] (
  [ProcessID]            [RowPointer] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_ProcessID] DEFAULT (newid())
, [Site]                 [SiteType] NULL
, [SiteGroup]            [SiteGroupType] NULL
, [Category]             [RepCategoryType] NOT NULL
, [RecordDateMinimum]    [GenericDateType] NULL
, [CreateDateMinimum]    [GenericDateType] NULL
, [LocalSiteOnly]        [ListYesNoType] NULL
, [TableName]            [TableNameType] NULL 
, [CurrentTable]         [TableNameType] NULL
, [CurrentSite]          [SiteType] NULL
, [CurrentLastRow]       [RowPointerType] NULL
, [CurrentCount]         [OperationCounterType] NULL
, [MaxCount]             [OperationCounterType] NULL
, [BatchSize]            [GenericIntType] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_BatchSize] DEFAULT (1000)
, [FreezeFlag]           [ListYesNoType] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_FreezeFlag] DEFAULT (0)
, [NoteExistsFlag] [Flag] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_NoteExistsFlag] DEFAULT ((0))
, [RecordDate] [GenericDate] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_RecordDate] DEFAULT (getdate())
, [RowPointer] [RowPointer] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_RowPointer] DEFAULT (newid())
, [CreatedBy] [TableNameType] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy] [TableNameType] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_CreateDate] DEFAULT (getdate())
, [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_ManualReplicationHeader_InWorkflow] DEFAULT ((0))
, CONSTRAINT [ManualReplicationHeaderNoteExistsFlagCk1] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))
, CONSTRAINT [ManualReplicationHeaderFreezeFlagCk1] CHECK ([FreezeFlag]=(1) OR [FreezeFlag]=(0))
, CONSTRAINT [ManualReplicationHeaderBatchSizeCk1] CHECK ([BatchSize]>=(100))
, CONSTRAINT [IX_ManualReplicationHeader_RowPointer] UNIQUE NONCLUSTERED ([RowPointer])
, CONSTRAINT [PK_ManualReplicationHeader] PRIMARY KEY CLUSTERED ([ProcessID])
)
GO


DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = 'ManualReplicationHeader'
   , @PEndingTable = 'ManualReplicationHeader'
   , @PIgnoreUpdate  = 1
   , @PIgnoreInsert = 1
   , @Infobar = @Infobar OUTPUT
   , @PModuleName = 'Core'
GO
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE SCHEMA_ID = SCHEMA_ID('dbo') AND name = 'ManualReplicationBlock')
CREATE TABLE [dbo].[ManualReplicationBlock] (
  [FromSite] [SiteType] NOT NULL
 , [ToSite] [SiteType] NOT NULL
 , [OperationNumber] [OperationCounterType] NOT NULL
 , [InProcess] [ListYesNoType] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_InProcess] DEFAULT (0)
 , [ProcessingPtr] [RowPointerType] NOT NULL
, [NoteExistsFlag] [Flag] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_NoteExistsFlag] DEFAULT ((0))
, [RecordDate] [GenericDate] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_RecordDate] DEFAULT (getdate())
, [RowPointer] [RowPointer] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_RowPointer] DEFAULT (newid())
, [CreatedBy] [TableNameType] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy] [TableNameType] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate] [CurrentDateType] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_CreateDate] DEFAULT (getdate())
, [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_ManualReplicationBlock_InWorkflow] DEFAULT ((0))
, CONSTRAINT [IX_ManualReplicationBlock_RowPointer] UNIQUE NONCLUSTERED ([RowPointer])
, CONSTRAINT [IX_ManualReplicationBlock_ProcessingPtr] UNIQUE NONCLUSTERED ([ProcessingPtr])
, CONSTRAINT [PK_ManualReplicationBlock] PRIMARY KEY CLUSTERED ([FromSite], [ToSite], [OperationNumber])
)
GO


DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = 'ManualReplicationBlock'
   , @PEndingTable = 'ManualReplicationBlock'
   , @Infobar = @Infobar OUTPUT
   , @PModuleName = 'Core'
GO
