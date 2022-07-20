IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'ServicePollingQueue'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ServicePollingQueue'
                AND   COLUMN_NAME = N'FlushRequestDate')
BEGIN
   ALTER TABLE [dbo].[ServicePollingQueue]
   ADD
     [FlushRequestDate] [dbo].[CurrentDateType] NULL
     EXEC dbo.SchemaAdditionalTasksSp 'ServicePollingQueue', 'ServicePollingQueue', NULL, 'Core'
END
GO
