IF EXISTS (SELECT 1 
FROM sys.sysindexes
WHERE NAME = 'IX_EventActionStatePath')
DROP INDEX eventactionstate.[IX_EventActionStatePath]
GO
CREATE NONCLUSTERED INDEX IX_EventActionStatePath ON [dbo].[eventactionstate] ([HasPathToWatch],[LastWatchedDate]) INCLUDE ([RowPointer], [WatchSubdirectories], [WatchRequestedDate])
WHERE PathToWatch IS NOT NULL AND LastWatchedDate IS NULL
GO
ALTER VIEW EventWaitQueueAllSitesView
AS
SELECT 
   es.SiteRef,
   RetestAtDate as QueueOrderingColumn,
   ehs.RowPointer as Id,
   RetestAtDate,
   CASE ehs.RestartCurrentAction WHEN 1 THEN 0 ELSE 1 END AS WaitingObjectType,
   ea.ActionType, -- Prompt, Sleep, or Wait
   ea.Parameters, -- for the CONDITION() of a Wait ActionType
   eh.Transactional AS HandlerTransactional,
   eh.RowPointer AS EventHandlerRowPointer,
   eh.Suspend,
   ehs.RowPointer as EventHandlerStateRowPointer,
   eas.RowPointer as EventActionStateRowPointer,
   NULL as TimeOutDestSequence,
   es.EventParmId,
   -- EventTrigger placeholders:
   NULL as EventTriggerRowPointer,
   NULL as EventName,
   NULL as RequestedBy,
   es.ConfigurationName as ConfigurationName,
   es.Transactional,
   NULL as Condition,
   NULL as FailureRetestInterval,
   NULL as SuccessRetestInterval,
   eas.PathToWatch,
   eas.FilesToWatch,
   eas.WatchSubdirectories
-- Update EventWaitQueueAllSitesMiniView if you update this!
FROM EventHandlerState ehs WITH (INDEX([IX_EventHandlerState_RetestAtDate]), READPAST, UPDLOCK, READCOMMITTEDLOCK)
INNER JOIN EventState es WITH (NOLOCK)
   ON es.RowPointer = ehs.EventStateRowPointer
INNER JOIN EventHandlerRevision eh WITH (NOLOCK)
   ON eh.RowPointer = ehs.EventHandlerRowPointer
INNER JOIN EventAction ea WITH (NOLOCK)
   ON ea.RowPointer = ehs.CurrentEventActionRowPointer
INNER JOIN EventActionState eas WITH (UPDLOCK)
   ON eas.EventHandlerStateRowPointer = ehs.RowPointer
   AND eas.EventActionRowPointer = ea.RowPointer
WHERE ehs.RetestAtDate IS NOT NULL
AND ehs.InProcess = 0
UNION

SELECT
   et.SiteRef,
   CASE WHEN et.LastFireDate IS NULL
      -- Let untested Triggers come to the top of the queue for initial testing:
      THEN dbo.LowDate()
      -- Let just-reActivated Triggers come to the top of the queue for retesting:
      ELSE ISNULL(RetestAtDate, dbo.LowDate())
   END AS QueueOrderingColumn,
   et.RowPointer as Id,
   ISNULL(RetestAtDate, dbo.LowDate()) AS RetestAtDate,
   2,
   -- EventHandlerState placeholders:
   NULL as ActionType,
   NULL as Parameters,
   NULL AS HandlerTransactional,
   NULL AS EventHandlerRowPointer,
   NULL AS [Suspend],
   NULL as EventHandlerStateRowPointer,
   NULL as EventActionStateRowPointer,
   NULL as TimeOutDestSequence,
   NULL as EventParmId,

   et.RowPointer,
   et.EventName,
   et.RequestedBy,
   CASE WHEN et.ConfigurationName IS NULL THEN ISNULL(site.DefaultConfig, et.SiteRef) ELSE et.ConfigurationName END,
   et.Transactional,
   et.Condition,
   et.FailureRetestInterval,
   et.SuccessRetestInterval,
   NULL AS PathToWatch,
   NULL AS FilesToWatch,
   NULL AS WatchSubdirectories
-- Update EventWaitQueueAllSitesMiniView if you update this!
FROM EventTrigger_mst et WITH (INDEX(IX_EventTrigger_mst_RetestAtDate), READPAST, READCOMMITTEDLOCK)
INNER JOIN site WITH (NOLOCK)
   ON site.site = et.SiteRef
WHERE et.Active = 1
AND et.InProcess = 0
UNION

SELECT
   es.SiteRef,
   TimesOutAtDate as QueueOrderingColumn,
   ehs.RowPointer as Id,
   TimesOutAtDate,
   3,
   ea.ActionType,  -- Don't need to know the difference between Prompt & Wait in this context, but we'll use it in a Verbose log message.
   NULL as Parameters,
   eh.Transactional AS HandlerTransactional,
   eh.RowPointer AS EventHandlerRowPointer,
   eh.Suspend,
   ehs.RowPointer,
   eas.RowPointer as EventActionStateRowPointer,
   ehs.TimeOutDestSequence,
   es.EventParmId,
   -- EventTrigger placeholders:
   NULL as EventTriggerRowPointer,
   NULL as EventName,
   NULL as RequestedBy,
   es.ConfigurationName,
   es.Transactional,
   NULL as Condition,
   NULL as FailureRetestInterval,
   NULL as SuccessRetestInterval,
   eas.PathToWatch,
   eas.FilesToWatch,
   eas.WatchSubdirectories
-- Update EventWaitQueueAllSitesMiniView if you update this!
FROM EventHandlerState ehs WITH (INDEX([IX_EventHandlerState_TimesOutAtDate]), READPAST, UPDLOCK, READCOMMITTEDLOCK)
INNER JOIN EventState es WITH (NOLOCK)
   ON es.RowPointer = ehs.EventStateRowPointer
INNER JOIN EventHandlerRevision eh WITH (NOLOCK)
   ON eh.RowPointer = ehs.EventHandlerRowPointer
INNER JOIN EventAction ea WITH (NOLOCK)
   ON ea.RowPointer = ehs.CurrentEventActionRowPointer
INNER JOIN EventActionState eas WITH (UPDLOCK)
   ON eas.EventHandlerStateRowPointer = ehs.RowPointer
   AND eas.EventActionRowPointer = ehs.CurrentEventActionRowPointer
WHERE ehs.TimesOutAtDate IS NOT NULL
AND ehs.InProcess = 0
UNION

SELECT
   es.SiteRef,
   dbo.GetSiteDate(getdate()) AS QueueOrderingColumn, -- continuing events should be picked up ASAP, but not before other objects
   es.RowPointer AS Id,
   dbo.LowDate() AS RetestAtDate,
   4,
   -- EventHandlerState placeholders:
   NULL AS ActionType,
   NULL AS Parameters,
   NULL AS HandlerTransactional,
   NULL AS EventHandlerRowPointer,
   NULL AS Suspend,
   es.ContinueAfterHandlerRowPointer as EventHandlerStateRowPointer,
   NULL AS EventActionStateRowPointer,
   NULL AS TimeOutDestSequence,
   es.EventParmId,
   -- EventTrigger placeholders:
   NULL AS EventTriggerRowPointer,
   es.EventName as EventName,
   es.Originator as RequestedBy,
   es.ConfigurationName as ConfigurationName,
   NULL AS Transactional,
   NULL AS Condition,
   NULL AS FailureRetestInterval,
   NULL AS SuccessRetestInterval,
   NULL AS PathToWatch,
   NULL AS FilesToWatch,
   NULL AS WatchSubdirectories
-- Update EventWaitQueueAllSitesMiniView if you update this!
FROM EventState es WITH (READPAST, UPDLOCK, READCOMMITTEDLOCK)
INNER JOIN EventHandlerState ehs ON
  ehs.RowPointer = es.ContinueAfterHandlerRowPointer
WHERE es.ContinueAfterHandlerRowPointer IS NOT NULL  -- DO NOT REMOVE THIS CLAUSE!
AND ehs.InProcess = 0
UNION
SELECT
   es.SiteRef,
   eas.WatchRequestedDate as QueueOrderingColumn,
   ehs.RowPointer as Id,
   dbo.LowDate() AS RetestAtDate,
   5,
   ea.ActionType, -- DiscoverFile
   ea.Parameters,
   eh.Transactional AS HandlerTransactional,
   eh.RowPointer AS EventHandlerRowPointer,
   eh.Suspend,
   ehs.RowPointer as EventHandlerStateRowPointer,
   eas.RowPointer as EventActionStateRowPointer,
   NULL as TimeOutDestSequence,
   es.EventParmId,
   -- EventTrigger placeholders:
   NULL as EventTriggerRowPointer,
   NULL as EventName,
   NULL as RequestedBy,
   NULL as ConfigurationName,
   es.Transactional,
   NULL as Condition,
   NULL as FailureRetestInterval,
   NULL as SuccessRetestInterval,
   eas.PathToWatch,
   eas.FilesToWatch,
   eas.WatchSubdirectories
-- Update EventWaitQueueAllSitesMiniView if you update this!
FROM EventActionState eas WITH (UPDLOCK, INDEX=IX_EventActionStatePath)
INNER LOOP JOIN EventHandlerState ehs WITH (READPAST, UPDLOCK, READCOMMITTEDLOCK)
   ON eas.EventHandlerStateRowPointer = ehs.RowPointer
   AND eas.EventActionRowPointer = ehs.CurrentEventActionRowPointer
INNER LOOP JOIN EventState es WITH (NOLOCK)
   ON es.RowPointer = ehs.EventStateRowPointer
INNER LOOP JOIN EventHandlerRevision eh WITH (NOLOCK)
   ON eh.RowPointer = ehs.EventHandlerRowPointer
INNER LOOP JOIN EventAction ea WITH (NOLOCK)
   ON ea.RowPointer = ehs.CurrentEventActionRowPointer
WHERE eas.HasPathToWatch = 1 AND eas.PathToWatch IS NOT NULL AND eas.LastWatchedDate IS NULL -- necessary to use the IX_EventActionStatePath filtered index.
AND ehs.InProcess = 0
GO
ALTER VIEW EventWaitQueueAllSitesMiniView
AS
SELECT
   es.SiteRef,
   RetestAtDate
FROM EventHandlerState ehs WITH (INDEX([IX_EventHandlerState_RetestAtDate]), READPAST, READCOMMITTEDLOCK)
INNER JOIN EventState es WITH (NOLOCK)
   ON es.RowPointer = ehs.EventStateRowPointer
WHERE ehs.RetestAtDate IS NOT NULL
AND ehs.InProcess = 0
UNION -- Update EventWaitQueueAllSitesView if you update this!
SELECT
   et.SiteRef,
   ISNULL(RetestAtDate, '17530101') AS RetestAtDate
FROM EventTrigger_mst et WITH (INDEX(IX_EventTrigger_mst_RetestAtDate), READPAST, READCOMMITTEDLOCK)
WHERE et.Active = 1
AND et.InProcess = 0
UNION -- Update EventWaitQueueAllSitesView if you update this!
SELECT
   es.SiteRef,
   TimesOutAtDate
FROM EventHandlerState ehs WITH (INDEX([IX_EventHandlerState_TimesOutAtDate]), READPAST, READCOMMITTEDLOCK)
INNER JOIN EventState es WITH (NOLOCK)
   ON es.RowPointer = ehs.EventStateRowPointer
WHERE ehs.TimesOutAtDate IS NOT NULL
AND ehs.InProcess = 0
UNION -- Update EventWaitQueueAllSitesView if you update this!
SELECT
   es.SiteRef,
   '17530101' AS RetestAtDate
FROM EventState es WITH (READPAST, READCOMMITTEDLOCK)
INNER JOIN EventHandlerState ehs ON
  ehs.RowPointer = es.ContinueAfterHandlerRowPointer
WHERE es.ContinueAfterHandlerRowPointer IS NOT NULL  -- DO NOT REMOVE THIS CLAUSE!
AND ehs.InProcess = 0
UNION -- Update EventWaitQueueAllSitesView if you update this!
SELECT
   es.SiteRef,
   '17530101' AS RetestAtDate
FROM EventActionState eas WITH (UPDLOCK, INDEX=IX_EventActionStatePath)
INNER LOOP JOIN EventHandlerState ehs WITH (READPAST, READCOMMITTEDLOCK)
   ON eas.EventHandlerStateRowPointer = ehs.RowPointer
   AND eas.EventActionRowPointer = ehs.CurrentEventActionRowPointer
INNER LOOP JOIN EventState es WITH (NOLOCK)
   ON es.RowPointer = ehs.EventStateRowPointer
WHERE eas.HasPathToWatch = 1 AND eas.PathToWatch IS NOT NULL AND eas.LastWatchedDate IS NULL -- necessary to use the IX_EventActionStatePath filtered index.
AND ehs.InProcess = 0
GO
