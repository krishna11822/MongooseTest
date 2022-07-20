--rep_rule UtcRecordDate
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'rep_rule' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'rep_rule'
                 AND   COLUMN_NAME = 'UtcRecordDate' )
BEGIN
   ALTER TABLE [dbo].[rep_rule]
   ADD UtcRecordDate CurrentDateType NOT NULL
   CONSTRAINT [DF_rep_rule_UtcRecordDate]  DEFAULT (getutcdate())
END

GO

BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'rep_rule'
   , @PEndingTable = N'rep_rule'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO

-- rep_category UtcRecordDate
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'rep_category' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'rep_category'
                 AND   COLUMN_NAME = 'UtcRecordDate' )
BEGIN
   ALTER TABLE [dbo].[rep_category]
   ADD UtcRecordDate CurrentDateType NOT NULL
   CONSTRAINT [DF_rep_category_UtcRecordDate]  DEFAULT (getutcdate())
END

GO

BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'rep_category'
   , @PEndingTable = N'rep_category'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO

-- rep_object_category UtcRecordDate
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'rep_object_category' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'rep_object_category'
                 AND   COLUMN_NAME = 'UtcRecordDate' )
BEGIN
   ALTER TABLE [dbo].[rep_object_category]
   ADD UtcRecordDate CurrentDateType NOT NULL
   CONSTRAINT [DF_rep_object_category_UtcRecordDate]  DEFAULT (getutcdate())
END

GO

BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'rep_object_category'
   , @PEndingTable = N'rep_object_category'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO