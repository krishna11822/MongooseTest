EXEC dbo.SchemaAdditionalTasksSp
  @PStartingTable = N'ABProjects'
, @PEndingTable = N'ABProjects'
, @Infobar = ''
, @pModuleName = 'Core'

GO

EXEC dbo.SchemaAdditionalTasksSp
  @PStartingTable = N'ABRuntimeApps'
, @PEndingTable = N'ABRuntimeApps'
, @Infobar = ''
, @pModuleName = 'Core'
