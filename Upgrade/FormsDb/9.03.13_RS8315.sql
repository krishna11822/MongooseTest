-- RS8315 AppBuilder
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'FormEventHandlers')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'dbo'
                AND   TABLE_NAME = 'FormEventHandlers'
                AND   COLUMN_NAME = 'ABData')
BEGIN
   ALTER TABLE FormEventHandlers
   ADD ABData NVARCHAR(MAX) NULL
END
