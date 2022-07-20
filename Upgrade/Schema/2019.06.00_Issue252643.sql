IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'ActiveBGTasks_mst'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ActiveBGTasks_mst'
                AND   COLUMN_NAME = N'LastDequeueDate')
BEGIN
   ALTER TABLE [dbo].[ActiveBGTasks_mst]
   ADD
     [LastDequeueDate] [dbo].[DateTimeType] NULL

     EXEC dbo.SchemaAdditionalTasksSp 'ActiveBGTasks_mst', 'ActiveBGTasks_mst', NULL, 'Core'
END
GO