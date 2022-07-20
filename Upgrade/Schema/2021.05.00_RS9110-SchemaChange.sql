--AppTable UtcRecordDate
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'AppTable' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'AppTable'
                 AND   COLUMN_NAME = 'UtcRecordDate' )
BEGIN
   ALTER TABLE [dbo].[AppTable]
   ADD UtcRecordDate CurrentDateType NOT NULL
   CONSTRAINT [DF_AppTable_UtcRecordDate]  DEFAULT (getutcdate())
END

GO

BEGIN
   EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = N'AppTable'
   , @PEndingTable = N'AppTable'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO

-- AppColumn UtcRecordDate
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'AppColumn' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'AppColumn'
                 AND   COLUMN_NAME = 'UtcRecordDate' )
BEGIN
   ALTER TABLE [dbo].[AppColumn]
   ADD UtcRecordDate CurrentDateType NOT NULL
   CONSTRAINT [DF_AppColumn_UtcRecordDate]  DEFAULT (getutcdate())
END

GO

BEGIN
   EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = N'AppColumn'
   , @PEndingTable = N'AppColumn'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO
