IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABProjects'
AND COLUMN_NAME = 'TypeDef' )
BEGIN
       ALTER TABLE ABProjects
       ADD TypeDef int NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ABProjects'
   , @PEndingTable = N'ABProjects'
   , @Infobar = ''
   , @pModuleName = 'Core'

END

GO

