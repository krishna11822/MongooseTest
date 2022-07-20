IF NOT EXISTS (  SELECT TOP 1 * FROM   sys.columns WHERE  object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]') AND name = 'LayoutType' )
BEGIN 
 ALTER TABLE [dbo].[WSFormBuilderLayouts]  ADD [LayoutType] GenericIntType NULL
END

IF NOT EXISTS ( SELECT TOP 1 * FROM sys.columns WHERE  object_id = OBJECT_ID(N'[dbo].[WSFormBuilderLayouts]') AND name = 'MaxNumberOfCards')
BEGIN 
 ALTER TABLE [dbo].[WSFormBuilderLayouts]  ADD [MaxNumberOfCards] GenericIntType NULL
END

EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'WSFormBuilderLayouts'
   , @PEndingTable = N'WSFormBuilderLayouts'
   , @Infobar = ''
   , @pModuleName = 'Core'
GO