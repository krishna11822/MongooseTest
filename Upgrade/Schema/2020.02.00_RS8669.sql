IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABProjects'
AND COLUMN_NAME = 'Expressions' )
BEGIN
       ALTER TABLE ABProjects
       ADD Expressions [dbo].[JSONStringType] NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ABProjects'
   , @PEndingTable = N'ABProjects'
   , @Infobar = ''
   , @pModuleName = 'Core'

END

GO


IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABRuntimeApps'
AND COLUMN_NAME = 'Expressions' )
BEGIN
       ALTER TABLE ABRuntimeApps
       ADD Expressions [dbo].[JSONStringType] NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ABRuntimeApps'
   , @PEndingTable = N'ABRuntimeApps'
   , @Infobar = ''
   , @pModuleName = 'Core'

END

GO



