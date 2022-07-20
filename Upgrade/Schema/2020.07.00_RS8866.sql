/* ReplDocument */
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'BODActionCodeMappingType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[BODActionCodeMappingType] FROM [nvarchar](256) NULL
GO

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'dbo'
            AND   TABLE_NAME = 'ReplDocument' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'ReplDocument'
                 AND   COLUMN_NAME = 'BODActionCodeMapping' )
BEGIN
   ALTER TABLE dbo.ReplDocument
   ADD BODActionCodeMapping BODActionCodeMappingType NULL

   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ReplDocument'
   , @PEndingTable = N'ReplDocument'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO