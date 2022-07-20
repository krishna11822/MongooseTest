/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S003_IdoEventHandlerAppliesToTasksView.sql 1     3/5/19 6:00p kmmeneses $ */
/*
Copyright ? 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*
* 03/06/2020 - dartiaga - Issue 260253: added row pointer
* 09/15/2020 - dartiaga - MGD-548: remove rowpointer (undo)
*/
CREATE VIEW dbo.IdoEventHandlerAppliesToTasksView
AS
SELECT
	ie.EventName, 
	ie.TaskName, 
	COUNT(ie.EventName) AS EventHandlerCount
FROM    
	(SELECT DISTINCT 
		eh.EventName, 
		eh.Sequence, 
		eh.AppliesToObjects, 
		bg.TaskName
     FROM EventHandler eh
     INNER JOIN Event e ON 
		e.EventName = eh.EventName 
		AND (e.EventName = 'TaskOnPerform' 
			 OR e.EventName = 'TaskPostPerform' 
			 OR e.EventName = 'TaskOnPerformFailed')
     CROSS APPLY dbo.TableOfEntries(eh.AppliesToObjects, ',', 1, 0, 1) t, BGTaskDefinitions bg
     WHERE dbo.EventAppliesToTask(bg.TaskName, eh.AppliesToObjects) = 1
     UNION
     SELECT DISTINCT 
		eh.EventName, 
		eh.Sequence, 
		eh.AppliesToObjects, 
		bg.TaskName
     FROM EventHandler eh
     INNER JOIN Event e ON 
		e.EventName = eh.EventName 
		AND (e.EventName = 'TaskOnPerform' 
			 OR e.EventName = 'TaskPostPerform' 
			 OR e.EventName = 'TaskOnPerformFailed')
     INNER JOIN BGTaskDefinitions bg ON 1=1
     WHERE eh.AppliesToObjects IS NULL) ie
GROUP BY ie.EventName, ie.TaskName
GO