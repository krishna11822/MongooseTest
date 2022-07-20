IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'SessionStateType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[SessionStateType] FROM [nvarchar](max) NULL
GO

IF EXISTS 
( 
SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'ConnectionInformation' AND
	( 
		COLUMN_NAME = 'SessionState'		
	)
)
BEGIN
ALTER TABLE [dbo].[ConnectionInformation]
ALTER COLUMN SessionState [SessionStateType]

EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ConnectionInformation'
   , @PEndingTable = N'ConnectionInformation'
   , @Infobar = ''
   , @pModuleName = 'Core'

END
GO

IF NOT EXISTS 
( 
	SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'SiteConnectionInformation' AND
	( 
		COLUMN_NAME = 'SessionState'		
	)
)
BEGIN
    ALTER TABLE SiteConnectionInformation
		ADD SessionState			[SessionStateType]	NULL
			

EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'SiteConnectionInformation'
   , @PEndingTable = N'SiteConnectionInformation'
   , @Infobar = ''
   , @pModuleName = 'Core'

END
GO