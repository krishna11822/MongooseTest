IF NOT EXISTS ( SELECT 1 
				FROM sys.types st 
					JOIN sys.schemas ss 
					ON st.schema_id = ss.schema_id 
				WHERE st.name = N'LongPasswordType' 
					AND ss.name = N'dbo' )
	CREATE TYPE [dbo].[LongPasswordType] FROM [nvarchar](250) NULL
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = 'dbo'
				AND   TABLE_NAME = 'intranet'
				AND   COLUMN_NAME = 'SMTPPassword' )
	ALTER TABLE dbo.intranet
	ALTER COLUMN SMTPPassword LongPasswordType NULL
GO

BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'intranet'
   , @PEndingTable = N'intranet'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO