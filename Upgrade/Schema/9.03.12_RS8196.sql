-- RS8196

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'Initiator')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [Initiator] [dbo].[EventObjectType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[BGTaskHistory_mst]')
      AND [name] = N'Initiator')
   ALTER TABLE [dbo].[BGTaskHistory_mst] ADD
      [Initiator] [dbo].[EventObjectType] NULL
GO

--
-- SchemaAdditionalTasksSp
--
DECLARE
@PStartingTable TableNameType
,@PEndingTable TableNameType
,@Infobar InfobarType

SET @PStartingTable = 'ActiveBGTasks_mst'
SET @PEndingTable = 'ActiveBGTasks_mst'
SET @Infobar = NULL

EXEC dbo.SchemaAdditionalTasksSp
@PStartingTable
,@PEndingTable
,@Infobar

SET @PStartingTable = 'BGTaskHistory_mst'
SET @PEndingTable = 'BGTaskHistory_mst'
SET @Infobar = NULL

EXEC dbo.SchemaAdditionalTasksSp
@PStartingTable
,@PEndingTable
,@Infobar

GO
