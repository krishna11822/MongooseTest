/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S003_IdoEventHandlerAppliesToObjectsView.sql 1     3/5/19 6:00p kmmeneses $ */
/*
Copyright ? 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*
*
* 03/06/2020 - dartiaga - Issue 260253: added row pointer
* 09/15/2020 - dartiaga - MGD-548: remove rowpointer (undo)
*/
CREATE VIEW dbo.IdoEventHandlerAppliesToObjectsView
AS
SELECT   
	ie.EventName, 
	ie.CollectionName, 
	COUNT(ie.EventName) AS EventHandlerCount
FROM     
	(SELECT  
		eh.EventName, 
		eh.Sequence, 
		ISNULL(i.CollectionName, t.Entry) as CollectionName,
		eh.AppliesToObjects
     FROM EventHandler eh 
	 CROSS APPLY dbo.TableOfEntries(eh.AppliesToObjects, ',', 1, 0, 1) t
	 INNER JOIN Event e ON 
		e.EventName = eh.EventName 
		AND e.IsFrameworkIDOEvent = 1
	 LEFT OUTER JOIN ido.Collections i ON i.CollectionName = t.Entry
	 UNION
	 SELECT  
		eh.EventName, 
		eh.Sequence, 
		i.CollectionName, 
		eh.AppliesToObjects
     FROM EventHandler eh 
	 INNER JOIN Event e ON 
		e.EventName = eh.EventName 
		AND e.IsFrameworkIDOEvent = 1
	 INNER JOIN ido.Collections i ON 1=1
	 WHERE eh.AppliesToObjects IS NULL) ie 
GROUP BY ie.EventName, ie.CollectionName
GO