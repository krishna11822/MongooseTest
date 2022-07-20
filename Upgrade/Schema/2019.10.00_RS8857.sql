IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABProjects'
AND COLUMN_NAME = 'Interactions' )
BEGIN
       ALTER TABLE ABProjects
       ADD Interactions [dbo].[JSONStringType] NULL
END

GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABProjects'
AND COLUMN_NAME = 'MashupBoundaries' )
BEGIN
       ALTER TABLE ABProjects
       ADD MashupBoundaries [dbo].[JSONStringType] NULL
END

GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABProjects'
AND COLUMN_NAME = 'RootComponent' )
BEGIN
       ALTER TABLE ABProjects
       ADD RootComponent [dbo].[JSONStringType] NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ABProjects'
   , @PEndingTable = N'ABProjects'
   , @Infobar = ''
   , @pModuleName = 'Core'

END

GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABRuntimeApps'
AND COLUMN_NAME = 'Interactions' )
BEGIN
       ALTER TABLE ABRuntimeApps
       ADD Interactions [dbo].[JSONStringType] NULL
END

GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABRuntimeApps'
AND COLUMN_NAME = 'MashupBoundaries' )
BEGIN
       ALTER TABLE ABRuntimeApps
       ADD MashupBoundaries [dbo].[JSONStringType] NULL
END

GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ABRuntimeApps'
AND COLUMN_NAME = 'RootComponent' )
BEGIN
       ALTER TABLE ABRuntimeApps
       ADD RootComponent [dbo].[JSONStringType] NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ABRuntimeApps'
   , @PEndingTable = N'ABRuntimeApps'
   , @Infobar = ''
   , @pModuleName = 'Core'

END

