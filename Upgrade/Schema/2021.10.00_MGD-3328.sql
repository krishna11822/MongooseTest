SET ANSI_NULLS, ANSI_PADDING ON
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]')
      AND [name] = N'RecordDate')
   ALTER TABLE [dbo].[ReplicatedRows3_mst] ADD
      [RecordDate] [dbo].[CurrentDateType]  NULL
GO
IF NOT EXISTS (SELECT 1 
FROM sys.sysindexes
WHERE NAME = 'IX_ReplicatedRows3_mst_RecordDate')
CREATE INDEX IX_ReplicatedRows3_mst_RecordDate on ReplicatedRows3_mst(RecordDate) INCLUDE(ProcessingPtr)
WHERE RecordDate IS NOT NULL
GO

EXEC SchemaAdditionalTasks2Sp
  @PStartingTable = 'ReplicatedRows3_mst'
, @PEndingTable = 'ReplicatedRows3_mst'
, @Infobar = ''
, @PModuleName = 'Core'

GO
