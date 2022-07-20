
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'PrinterTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[PrinterTypeType] FROM [nvarchar](10) NULL
GO

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'Printer' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'Printer'
                 AND   COLUMN_NAME = 'PrintServerName' )
   ALTER TABLE dbo.Printer
   ADD PrintServerName OSMachineNameType NULL
GO
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'Printer' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'Printer'
                 AND   COLUMN_NAME = 'PrinterType' )
   ALTER TABLE dbo.Printer
   ADD PrinterType PrinterTypeType NULL
GO

BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'Printer'
   , @PEndingTable = N'Printer'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO