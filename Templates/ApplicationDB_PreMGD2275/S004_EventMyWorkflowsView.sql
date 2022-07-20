/* $Header: /Mongoose/MAIN/Tools/Managed/Apps/ConfigManager/Templates/ApplicationDB/S004_EventMyWorkflowsView.sql $ */
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
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE VIEW EventMyWorkflowsView
AS
SELECT
   COALESCE(eh.Description, eh.EventName + ': ' + CAST(eh.Sequence AS nvarchar)) AS Description,
   eh.Purpose,
   CASE WHEN SUBSTRING(eh.AppliesToInitiators, 1, 5) = N'Form.'
      -- Replace with a FormServer call!?  (because the following trick works only for MG & SL forms!)
      -- Maybe you have to do that up in the IDO layer?
      THEN N'STRINGS(f' + dbo.Entry(1, SUBSTRING(eh.AppliesToInitiators, 6, LEN(eh.AppliesToInitiators)), N',') + N')'
      ELSE NULL
   END AS FormTitle,
   N'STRINGS(' + ido1.LabelStringID + ')' AS IDOCaption,
   eh.AppliesToObjects,
   eh.AppliesToInitiators,
   eh.TriggeringProperty,
   eh.MethodToCall,
   eh.EditableByWizard,
   eh.EventName,
   eh.Sequence,
   eh.RowPointer,
   eh.AccessAs,
   eh.CreateDate,
   eh.CreatedBy,
   eh.RecordDate,
   eh.UpdatedBy,
   eh.InWorkflow
FROM EventHandler eh
INNER JOIN ido.AccessAs aa ON 1=1
INNER JOIN UserNameView u ON 1=1
LEFT OUTER JOIN ido.Collections ido1
   ON ido1.CollectionName = dbo.Entry(1, eh.AppliesToObjects, N',')
WHERE eh.CreatedBy = u.UserName
AND COALESCE(eh.AccessAs, '') = COALESCE(aa.AccessAs, '')
AND dbo.IsInListFast(dbo.DefaultToLocalSite(NULL), COALESCE(eh.AppliesToSites, dbo.DefaultToLocalSite(NULL)), ',') = 1
