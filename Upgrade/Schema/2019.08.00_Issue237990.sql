SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'EventState'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'EventState'
                AND   COLUMN_NAME = N'SiteRef')
BEGIN
   ALTER TABLE EventState
      ADD SiteRef [SiteType] NULL

   EXEC dbo.SchemaAdditionalTasksSp 'EventState', 'EventState', NULL, 'Core'
END

GO

-- Set SiteRef of "recent" EventState rows (created in MG9 or later) based on the MGCurrentSite EventParameter (see RS5905):
UPDATE es
SET SiteRef = ep.Value
FROM EventState es
INNER JOIN EventParameter ep WITH (NOLOCK)
   ON ep.EventParmId = es.EventParmId
   AND ep.Name = N'MG_CurrentSite'
WHERE ep.Value is not null

-- Set SiteRef of each "older" EventState row associated with the "primary" Configuration of its Site:
UPDATE es
SET SiteRef = ConfigSite.site
FROM EventState es
LEFT OUTER JOIN site ConfigSite
   ON ConfigSite.DefaultConfig = es.ConfigurationName
WHERE es.SiteRef IS NULL

-- SiteRef of any "older" EventState rows associated with _other_ Configurations will remain NULL;
-- if those are still Running and we let them subsequently come up in EventWaitQueueView,
-- they would be liable to get picked up by ANY Site's queue-processor,
-- which means they'd still be exposed to the symptoms of Issues 237990/250353.
-- So EventWaitQueueView will IGNORE those Events, leaving such in limbo.
-- In the future, we may provide a Form for assigning their SiteRefs;
-- Or non-Cloud users may manually set them via T-SQL;
-- after which they will appear in EventWaitQueueView naturally.

GO


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventActionState]')
   AND   [name] = N'IX_EventActionStatePath')
   -- Remove bad (bloated) index:
   DROP INDEX [dbo].[EventActionState].[IX_EventActionStatePath]
GO

-- Create computed column for EventWaitQueueView's Union #5:
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'EventActionState'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'EventActionState'
                AND   COLUMN_NAME = N'HasPathToWatch')
BEGIN
   ALTER TABLE EventActionState
      ADD HasPathToWatch AS (CASE WHEN PathToWatch IS NOT NULL THEN 1 ELSE 0 END)

   EXEC dbo.SchemaAdditionalTasksSp 'EventActionState', 'EventActionState', NULL, 'Core'
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventActionState]') AND name = N'IX_EventActionStatePath')
   -- Add better (compact) index:
   CREATE NONCLUSTERED INDEX [IX_EventActionStatePath] ON [dbo].[EventActionState]
      ([HasPathToWatch] ASC, [LastWatchedDate])
      INCLUDE(RowPointer, WatchSubdirectories, WatchRequestedDate)
GO


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventHandlerState]')
   AND   [name] = N'IX_EventHandlerState_RetestAtDate')
   -- Remove non-covering index:
   DROP INDEX [dbo].[EventHandlerState].[IX_EventHandlerState_RetestAtDate]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventHandlerState]') AND name = N'IX_EventHandlerState_RetestAtDate')
   -- Add covering index for EventWaitQueueView's Union #1
   CREATE NONCLUSTERED INDEX [IX_EventHandlerState_RetestAtDate] ON [dbo].[EventHandlerState]
   ([RetestAtDate] ASC)
   INCLUDE(CurrentEventActionRowPointer, RowPointer, RestartCurrentAction, InProcess)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventHandlerState]')
   AND   [name] = N'IX_EventHandlerState_TimesOutAtDate')
   -- Remove non-covering index:
   DROP INDEX [dbo].[EventHandlerState].[IX_EventHandlerState_TimesOutAtDate]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventHandlerState]') AND name = N'IX_EventHandlerState_TimesOutAtDate')
   -- Add covering index for EventWaitQueueView's Union #3
   CREATE NONCLUSTERED INDEX [IX_EventHandlerState_TimesOutAtDate] ON [dbo].[EventHandlerState]
   ([TimesOutAtDate] ASC)
   INCLUDE(CurrentEventActionRowPointer, RowPointer, TimeOutDestSequence, InProcess)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND EXISTS (SELECT top 5 * FROM [sys].[sysconstraints]
   WHERE [id] = OBJECT_ID(N'[dbo].[EventHandlerState]')
   AND   [constid] = OBJECT_ID('[dbo].[IX_EventHandlerState_RowPointer]'))
   -- Remove (non-covering) constraint:
   ALTER TABLE [dbo].[EventHandlerState]
      DROP CONSTRAINT [IX_EventHandlerState_RowPointer]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventHandlerState]')
   AND   [name] = N'IX_EventHandlerState_RowPointer')
   -- Remove any prior versions of index?
   DROP INDEX [dbo].[EventHandlerState].[IX_EventHandlerState_RowPointer]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventHandlerState]') AND name = N'IX_EventHandlerState_RowPointer')
   -- Add covering index for EventWaitQueueView's Union #4
   CREATE UNIQUE NONCLUSTERED INDEX [IX_EventHandlerState_RowPointer] ON  [dbo].[EventHandlerState]
   ([RowPointer] ASC)
      INCLUDE(InProcess
      -- Add covering column for EventWaitQueueView Union #5:
      , CurrentEventActionRowPointer)
GO


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerRevision]'), N'IsUserTable') = 1
   AND EXISTS (SELECT top 5 * FROM [sys].[sysconstraints]
   WHERE [id] = OBJECT_ID(N'[dbo].[EventHandlerRevision]')
   AND   [constid] = OBJECT_ID('[dbo].[IX_EventHandlerRevision_RowPointer]'))
   -- Remove (non-covering) constraint:
   ALTER TABLE [dbo].[EventHandlerRevision]
      DROP CONSTRAINT [IX_EventHandlerRevision_RowPointer]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerRevision]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventHandlerRevision]')
   AND   [name] = N'IX_EventHandlerRevision_RowPointer')
   -- Remove any prior versions of index?
   DROP INDEX [dbo].[EventHandlerRevision].[IX_EventHandlerRevision_RowPointer]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerRevision]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventHandlerRevision]') AND name = N'IX_EventHandlerRevision_RowPointer')
   -- Add covering index for EventWaitQueueView's Union #1
   CREATE UNIQUE NONCLUSTERED INDEX [IX_EventHandlerRevision_RowPointer] ON  [dbo].[EventHandlerRevision]
   ([RowPointer] ASC)
   INCLUDE(Transactional, Suspend)
GO


-- == EventState: Change clustered key to RowPointer for faster lookups ==
-- First drop all other indexes (which are dependent on the clustered):
IF EXISTS (SELECT 1 FROM dbo.sysindexes idx JOIN dbo.sysobjects obj ON (obj.Id = idx.Id) WHERE obj.Name = 'EventState' AND obj.xtype = 'U' AND idx.Name = 'IX_EventState_ContinueAfterHandlerRowPointer')
   DROP INDEX [dbo].[EventState].[IX_EventState_ContinueAfterHandlerRowPointer]
GO

IF EXISTS (SELECT 1 FROM dbo.sysindexes idx JOIN dbo.sysobjects obj ON (obj.Id = idx.Id) WHERE obj.Name = 'EventState' AND obj.xtype = 'U' AND idx.Name = 'IX_EventState_EventParmId')
   DROP INDEX [dbo].[EventState].[IX_EventState_EventParmId]
GO

IF EXISTS (SELECT 1 FROM dbo.sysindexes idx JOIN dbo.sysobjects obj ON (obj.Id = idx.Id) WHERE obj.Name = 'EventState' AND obj.xtype = 'U' AND idx.Name = 'IX_EventState_RefRowPointer')
   DROP INDEX [dbo].[EventState].[IX_EventState_RefRowPointer]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventState]'), N'IsUserTable') = 1
   AND EXISTS (SELECT top 5 * FROM [sys].[sysconstraints]
   WHERE [id] = OBJECT_ID(N'[dbo].[EventState]')
   AND   [constid] = OBJECT_ID('[dbo].[PK_EventState]'))
   -- Remove (non-covering) constraint:
   ALTER TABLE [dbo].[EventState]
      DROP CONSTRAINT [PK_EventState]
GO

-- Next drop the old, clustered index:
IF EXISTS (SELECT 1 FROM dbo.sysindexes idx JOIN dbo.sysobjects obj ON (obj.Id = idx.Id) WHERE obj.Name = 'EventState' AND obj.xtype = 'U' AND idx.Name = 'IX_EventState_EventName')
   DROP INDEX [dbo].[EventState].[IX_EventState_EventName]
GO

-- Now start over from scratch!

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventState]'), N'IsUserTable') = 1
BEGIN
   ALTER TABLE [dbo].[EventState] ADD
      CONSTRAINT [PK_EventState] PRIMARY KEY CLUSTERED 
      ([RowPointer] ASC)

   CREATE NONCLUSTERED INDEX [IX_EventState_EventName] ON [dbo].[EventState]
   (
	   [EventName] ASC,
	   [EventTitle] ASC,
	   [Originator] ASC,
	   [ConfigurationName] ASC
   )

   -- This is a covering index for EventWaitQueueView's Union #4
   CREATE NONCLUSTERED INDEX [IX_EventState_ContinueAfterHandlerRowPointer] ON [dbo].[EventState]
   (
	   [ContinueAfterHandlerRowPointer] ASC
   )
   INCLUDE(EventName, Originator, ConfigurationName, EventParmId, SiteRef)

   CREATE NONCLUSTERED INDEX [IX_EventState_EventParmId] ON [dbo].[EventState]
   (
	   [EventParmId] ASC
   )

   CREATE NONCLUSTERED INDEX [IX_EventState_RefRowPointer] ON [dbo].[EventState]
   (
	   [RefRowPointer] ASC
   )

END
GO

