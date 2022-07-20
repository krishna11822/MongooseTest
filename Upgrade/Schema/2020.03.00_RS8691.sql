--RS 8691 - Critical Number IDO Method Support
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
            WHERE TABLE_SCHEMA = 'dbo'
            AND TABLE_NAME = 'WBKPI'
            AND CONSTRAINT_SCHEMA = 'dbo'
            AND CONSTRAINT_NAME = 'CK_WBKPI_SourceType' )
BEGIN
   ALTER TABLE dbo.WBKPI
   DROP CONSTRAINT CK_WBKPI_SourceType
END

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
                WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'WBKPI'
                AND CONSTRAINT_SCHEMA = 'dbo'
                AND CONSTRAINT_NAME = 'CK_WBKPI_SourceType' )
BEGIN
   ALTER TABLE dbo.WBKPI
   WITH CHECK ADD CONSTRAINT CK_WBKPI_SourceType CHECK (([SourceType]=N'S' OR [SourceType]=N'I' OR [SourceType]=N'M'))
END

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'WBKPI' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'WBKPI'
                 AND   COLUMN_NAME = 'MethodName' )
BEGIN
   ALTER TABLE dbo.WBKPI
   ADD MethodName MethodNameType NULL

   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'WBKPI'
   , @PEndingTable = N'WBKPI'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
            WHERE TABLE_SCHEMA = 'dbo'
            AND TABLE_NAME = 'WBDrilldown'
            AND CONSTRAINT_SCHEMA = 'dbo'
            AND CONSTRAINT_NAME = 'CK_WBDrilldown_SourceType' )
BEGIN
   ALTER TABLE dbo.WBDrilldown
   DROP CONSTRAINT CK_WBDrilldown_SourceType
END

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
                WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'WBDrilldown'
                AND CONSTRAINT_SCHEMA = 'dbo'
                AND CONSTRAINT_NAME = 'CK_WBDrilldown_SourceType' )
BEGIN
   ALTER TABLE dbo.WBDrilldown
   WITH CHECK ADD CONSTRAINT CK_WBDrilldown_SourceType CHECK (([SourceType]=N'S' OR [SourceType]=N'I' OR [SourceType]=N'M'))
END

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'WBDrilldown' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'WBDrilldown'
                 AND   COLUMN_NAME = 'MethodName' )
BEGIN
   ALTER TABLE dbo.WBDrilldown
   ADD MethodName MethodNameType NULL

   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'WBDrilldown'
   , @PEndingTable = N'WBDrilldown'
   , @Infobar = ''
   , @pModuleName = 'Core'
END