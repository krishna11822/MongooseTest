
IF OBJECT_ID('dbo.ActiveBGTasks_mstIup') IS NOT NULL 
   DISABLE TRIGGER [ActiveBGTasks_mstIup] ON [dbo].[ActiveBGTasks_mst]
GO

UPDATE at
SET [TaskParm] = ISNULL([TaskParms1], N'') + ISNULL([TaskParms2], N'')
FROM [dbo].[ActiveBGTasks_mst] at
WHERE [TaskParm] IS NULL
AND ([TaskParms1] IS NOT NULL OR [TaskParms2] IS NOT NULL)
GO

IF OBJECT_ID('dbo.ActiveBGTasks_mstIup') IS NOT NULL 
   ENABLE TRIGGER [ActiveBGTasks_mstIup] ON [dbo].[ActiveBGTasks_mst]
GO



