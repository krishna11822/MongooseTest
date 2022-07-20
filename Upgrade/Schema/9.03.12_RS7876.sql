
-- ================================
-- RS 7876 - ActiveBGTasks
-- ================================

--
-- Types
--
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchedFreqTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchedFreqTypeType] FROM tinyint NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchedFreqIntervalType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchedFreqIntervalType] FROM tinyint NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchedFreqSubDayTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchedFreqSubDayTypeType] FROM tinyint NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchedFreqSubDayIntervalType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchedFreqSubDayIntervalType] FROM int NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchedFreqRelativeIntervalType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchedFreqRelativeIntervalType] FROM tinyint NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchedFreqRecurrenceFactorType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchedFreqRecurrenceFactorType] FROM int NULL
GO

--
-- Fields
--
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedEnabled')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedEnabled] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_ActiveBGTasks_mst_SchedEnabled] DEFAULT (1)  
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'CK_ActiveBGTasks_mst_SchedEnabled'
   AND [type] = 'C' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'))
   ALTER TABLE [dbo].[ActiveBGTasks_mst] WITH NOCHECK ADD
      CONSTRAINT [CK_ActiveBGTasks_mst_SchedEnabled] CHECK ([SchedEnabled]IN (0,1) )
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'NextStartDate')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [NextStartDate] [dbo].[DateTimeType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedFreqType')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedFreqType] [dbo].[SchedFreqTypeType] NOT NULL
      CONSTRAINT [DF_ActiveBGTasks_mst_SchedFreqType] DEFAULT (1)  
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'CK_ActiveBGTasks_mst_SchedFreqType'
   AND [type] = 'C' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'))
   ALTER TABLE [dbo].[ActiveBGTasks_mst] WITH NOCHECK ADD
      CONSTRAINT [CK_ActiveBGTasks_mst_SchedFreqType] CHECK ([SchedFreqType]IN (1,4,8,16,32) )
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedFreqInterval')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedFreqInterval] [dbo].[SchedFreqIntervalType] NOT NULL
      CONSTRAINT [DF_ActiveBGTasks_mst_SchedFreqInterval] DEFAULT (1)  
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'CK_ActiveBGTasks_mst_SchedFreqInterval'
   AND [type] = 'C' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'))
   ALTER TABLE [dbo].[ActiveBGTasks_mst] WITH NOCHECK ADD
      CONSTRAINT [CK_ActiveBGTasks_mst_SchedFreqInterval] CHECK ([SchedFreqInterval] BETWEEN 1 AND 127)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedFreqSubDayType')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedFreqSubDayType] [dbo].[SchedFreqSubDayTypeType] NOT NULL
      CONSTRAINT [DF_ActiveBGTasks_mst_SchedFreqSubDayTypeType] DEFAULT (1)
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'CK_ActiveBGTasks_mst_SchedFreqSubDayType'
   AND [type] = 'C' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'))
   ALTER TABLE [dbo].[ActiveBGTasks_mst] WITH NOCHECK ADD
      CONSTRAINT [CK_ActiveBGTasks_mst_SchedFreqSubDayType] CHECK ([SchedFreqSubDayType] IN (1,4,8))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedFreqSubDayInterval')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedFreqSubDayInterval] [dbo].[SchedFreqSubDayIntervalType] NOT NULL
      CONSTRAINT [DF_ActiveBGTasks_mst_SchedFreqSubDayInterval] DEFAULT (0)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedFreqRelativeInterval')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedFreqRelativeInterval] [dbo].[SchedFreqRelativeIntervalType] NOT NULL
      CONSTRAINT [DF_ActiveBGTasks_mst_SchedFreqRelativeInterval] DEFAULT (1)
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'CK_ActiveBGTasks_mst_SchedFreqRelativeInterval'
   AND [type] = 'C' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'))
   ALTER TABLE [dbo].[ActiveBGTasks_mst] WITH NOCHECK ADD
      CONSTRAINT [CK_ActiveBGTasks_mst_SchedFreqRelativeInterval] CHECK ([SchedFreqRelativeInterval]IN (1,2,4,8,16))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedFreqRecurrenceFactor')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedFreqRecurrenceFactor] [dbo].[SchedFreqRecurrenceFactorType] NOT NULL
      CONSTRAINT [DF_ActiveBGTasks_mst_SchedFreqRecurrenceFactor] DEFAULT (0)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedStartDate')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedStartDate] [dbo].[DateTimeType] NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'SchedEndDate')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [SchedEndDate] [dbo].[DateTimeType] NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'BaseTaskNumber')
   ALTER TABLE [dbo].[ActiveBGTasks_mst] ADD
      [BaseTaskNumber] [dbo].[TokenType] NULL
GO

--
-- Index
--
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
   AND   [name] = N'IX_ActiveBGTasks_mst_NextStartDate_site_ref')
   DROP INDEX [dbo].[ActiveBGTasks_mst].[IX_ActiveBGTasks_mst_NextStartDate_site_ref]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]'), N'IsUserTable') = 1
   CREATE INDEX [IX_ActiveBGTasks_mst_NextStartDate_site_ref] ON [dbo].[ActiveBGTasks_mst]
   (
     NextStartDate
     ,SiteRef
   )
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

GO