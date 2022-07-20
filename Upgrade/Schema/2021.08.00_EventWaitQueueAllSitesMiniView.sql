SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON 
GO

IF object_id('dbo.EventWaitQueueAllSitesMiniView') IS NOT NULL
   DROP VIEW dbo.EventWaitQueueAllSitesMiniView
GO
/* $Header: /Tools/SQLScripts/ApplicationDB/Views/EventWaitQueueAllSitesMiniView.sql $ */
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
 * DEV 264083 johndou Sep 08 2020 - Same query hints as main view.
 * DEV EventWaitQueueAllSitesMiniView johndou Aug 13 2020
 * A reduced version of the EventWaitQueueAllSitesView useful for CLM_GetConfigsWaitingSp.
 *
 * $NoKeywords: $
 */
-- Update EventWaitQueueAllSitesView if you update this!
CREATE VIEW EventWaitQueueAllSitesMiniView
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
