SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON 
GO

IF object_id('dbo.EventWaitQueueAllSitesView') IS NOT NULL
   DROP VIEW dbo.EventWaitQueueAllSitesView
GO
/* $Header: /Tools/SQLScripts/ApplicationDB/Views/EventWaitQueueAllSitesView.sql $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2020 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/
/* $Archive: /Tools/SQLScripts/ApplicationDB/Views/EventWaitQueueAllSitesView.sql $
 * DEV MGD-2719 johndou Jun 8, 2021 - Make the LastWatched index filtered.
 * DEV 264083 johndou Sep 08 2020 - Index hint and join type hints to make SQL create a good plan.
 * DEV 264036 johndou Sep 1 2020 - remove index hint, query plan is still bad.
 * DEV 263607 johndou Aug 12 2020
 * Add an index hint on the watch directory query.
 *
 * DEV  258169 nicthu Feb 20 16:00 2020
 * Created from Site-free guts of EventWaitQueueView.sql, whose Archive is shown below:
 *
 * DEV  254794 nicthu Aug 1 17:10 2019
 *
 * CoreDev 24 246719 johndou Jul 23 10:25:43 2018
 *
 * CoreDev  246084 : Make readpast work in snapshot isolation. Jun 25, 2018
 *
 * Core90310 22 233086 Nthurn Fri Sep 08 11:48:10 2017
 * Event Service - Occasional timeout error upon finishing final Handler of an Asynchronously fired Event
 *
 * CoreDev 21 RS7526 Djohnson Thu Aug 20 14:16:53 2015
 *
 * CoreDev 20 RS5782 Gmalakar Fri Oct 10 13:43:48 2014
 * RS 5782
 *
 * CoreDev 19 170902 Nthurn Mon Oct 28 14:56:20 2013
 * VISUAL IQM - Null Reference Exception in Event Service when monitored App database contains an extra-Site Event Trigger.
 * Consider EventTriggers only from the current Site (correction to previous version).  (Issue 170902)
 *
 * CoreDev 18 166784 Sruffing Tue Sep 10 12:39:27 2013
 * EventWaitQueueAllSitesView.sql includes an index hint on EventTrigger.
 * Replaced reference to EventTrigger View with EventTrigger_mst base table in order to use IX_EventTrigger_mst_RetestAtDate hint.  
 *
 * CoreDev 17 136140 Djohnson Mon Apr 04 14:00:42 2011
 * Naked call to getdate().
 * Issue #136140 - change getdate() to dbo.GetSiteDate(getdate())
 *
 * CoreDev 16 136328 Nthurn Mon Feb 14 15:26:10 2011
 * Setting "Condtion Retest Interval" to zero on an Event Trigger causes havoc.
 * Let just-reActivated Triggers come to the top of the queue for retesting.
 *
 * CoreDev 15 RS4557 Lobkrom Mon Mar 29 11:54:57 2010
 * RS4557 - add a new wait object type for continuing events after retrying.
 *
 * CoreDev 14 rs4588 Dahn Mon Mar 08 09:03:13 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 13 125962 Nthurn Tue Nov 24 10:14:03 2009
 * Prompt event sending 2 messages when External email checkbox is enabled.
 * Moved READPAST hints to here from EventGetQueueTopSp.  (Issue 125962)
 * Added locking hints.  (Issue 125962)
 *
 * CoreDev 12 124987 Nthurn Sun Nov 01 08:17:46 2009
 * FRD-4553 Workflow Outlook Response
 * Return WaitingObjectType = 1 for a Prompt to be restarted. (RS 4553)
 *
 * CoreDev 11 124879 Djohnson Wed Oct 14 13:25:50 2009
 * Make EventTriggers ConfigurationName column nullable.
 * Issue #124879 - CURRENT_CONFIG replaced by a check for NULL.
 *
 * CoreDev 10 124651 Djohnson Mon Oct 12 17:26:34 2009
 * RS4669 TaskList needed in 8.01 service pack.
 * Issue #124651 - Handle a generic configuration name by getting parms.site.
 *
 * CoreDev 9 122706 Nthurn Wed Jul 29 14:46:57 2009
 * Error on testing of Condition for a Wait Event Action.
 * Also output EventParmId for retesting Wait Conditions.  (Issue 122706)
 *
 * CoreDev 7 109512 Nthurn Thu Jun 05 14:25:17 2008
 * When an Event has multiple effective Suspend Handlers, only the first runs.
 * Output Handler's Suspend flag, rather than EventState's Suspended flag.  (Issue 109512)
 *
 * $NoKeywords: $
 */
CREATE VIEW EventWaitQueueAllSitesView
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
