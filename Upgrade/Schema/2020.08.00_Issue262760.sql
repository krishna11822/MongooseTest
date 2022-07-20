-- amm - Issue 262760 - There is nothing in Task Parameters in Background Task History.

IF OBJECT_ID('dbo.BGTaskHistory_mstIup') IS NOT NULL 
   DISABLE TRIGGER [BGTaskHistory_mstIup] ON [dbo].[BGTaskHistory_mst]
GO

UPDATE at
SET [TaskParm] = ISNULL([TaskParms1], N'') + ISNULL([TaskParms2], N'')
FROM [dbo].[BGTaskHistory_mst] at
WHERE [TaskParm] IS NULL
AND ([TaskParms1] IS NOT NULL OR [TaskParms2] IS NOT NULL)
GO

IF OBJECT_ID('dbo.BGTaskHistory_mstIup') IS NOT NULL 
   ENABLE TRIGGER [BGTaskHistory_mstIup] ON [dbo].[BGTaskHistory_mst]
GO