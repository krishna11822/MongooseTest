/** Add TaskParms column **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/** New BGTaskParmsHugeType data-type **/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'BGTaskParmsHugeType' AND ss.name = N'dbo')
	CREATE TYPE [dbo].[BGTaskParmsHugeType] FROM [nvarchar](max) NULL
GO


/** ActiveBGTasks_mst new [TaskParm] column **/
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ActiveBGTasks_mst'
AND COLUMN_NAME = 'TaskParm' )
BEGIN
	
	ALTER TABLE [dbo].[ActiveBGTasks_mst]
	ADD [TaskParm] [dbo].[BGTaskParmsHugeType] NULL

	EXEC dbo.SchemaAdditionalTasksSp 'ActiveBGTasks_mst', 'ActiveBGTasks_mst', NULL, 'Core'
END
GO

UPDATE at
SET [TaskParm] = ISNULL([TaskParms1], N'') + ISNULL([TaskParms2], N'')
FROM [dbo].[ActiveBGTasks_mst] at
WHERE [TaskParm] IS NULL
AND ([TaskParms1] IS NOT NULL OR [TaskParms2] IS NOT NULL)
GO


/** BGTaskHistory_mst new [TaskParm] column **/
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'BGTaskHistory_mst'
AND COLUMN_NAME = 'TaskParm' )
BEGIN
	
	ALTER TABLE [dbo].[BGTaskHistory_mst]
	ADD [TaskParm] [dbo].[BGTaskParmsHugeType] NULL

	EXEC dbo.SchemaAdditionalTasksSp 'BGTaskHistory_mst', 'BGTaskHistory_mst', NULL, 'Core'
END
GO

UPDATE bt
SET [TaskParm] = ISNULL([TaskParms1], N'') + ISNULL([TaskParms2], N'')
FROM [dbo].[BGTaskHistory_mst] bt
WHERE [TaskParm] IS NULL
AND ([TaskParms1] IS NOT NULL OR [TaskParms2] IS NOT NULL)
GO