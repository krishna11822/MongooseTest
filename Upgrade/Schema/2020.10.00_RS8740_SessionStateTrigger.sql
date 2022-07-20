BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ConnectionInformation'
   , @PEndingTable = N'ConnectionInformation'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO

