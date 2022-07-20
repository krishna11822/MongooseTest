IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'ActiveBGTasks_mst' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'ActiveBGTasks_mst'
                 AND   COLUMN_NAME = 'LastActiveDate' )
   ALTER TABLE dbo.ActiveBGTasks_mst
   ADD LastActiveDate DateTimeType NULL
GO

BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ActiveBGTasks_mst'
   , @PEndingTable = N'ActiveBGTasks_mst'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO