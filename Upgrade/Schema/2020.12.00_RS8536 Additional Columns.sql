IF NOT EXISTS 
(	
	SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'ObjExtDataSource' AND
	( 
		   COLUMN_NAME = 'ServerID' 
		OR COLUMN_NAME = 'SuiteContext'
		OR COLUMN_NAME = 'GetInputParameters'
		OR COLUMN_NAME = 'GetOutputParameters'
		OR COLUMN_NAME = 'PostPath'
		OR COLUMN_NAME = 'PostInputParameters'
		OR COLUMN_NAME = 'PutPath'
		OR COLUMN_NAME = 'PutInputParameters'
		OR COLUMN_NAME = 'DeletePath'
		OR COLUMN_NAME = 'DeleteInputParameters'
	)
)
BEGIN
    ALTER TABLE ObjExtDataSource
		ADD [ServerID]				[dbo].[SequenceType]	NULL,
			[SuiteContext]			[dbo].[LongStringType]	NULL,
			[GetPath]				[dbo].[LongStringType]	NULL,
			[GetInputParameters]	[dbo].[JSONStringType]	NULL,
			[GetOutputParameters]	[dbo].[JSONStringType]	NULL,
			[PostPath]				[dbo].[LongStringType]	NULL,
			[PostInputParameters]	[dbo].[JSONStringType]	NULL,
			[PutPath]				[dbo].[LongStringType]	NULL,
			[PutInputParameters]	[dbo].[JSONStringType]	NULL,
			[DeletePath]			[dbo].[LongStringType]	NULL,
			[DeleteInputParameters] [dbo].[JSONStringType]	NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ObjExtDataSource'
   , @PEndingTable = N'ObjExtDataSource'
   , @Infobar = ''
   , @pModuleName = 'Core'

END
GO

IF NOT EXISTS 
( 
	SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'ObjExtDataSource' AND
	( 
		COLUMN_NAME = 'PostHttpVerb'
		OR COLUMN_NAME = 'PutHttpVerb'
		OR COLUMN_NAME = 'DeleteHttpVerb'
	)
)

BEGIN
    ALTER TABLE ObjExtDataSource
		ADD [PostHttpVerb]			[dbo].[HTTPMethodType]	NULL,
			[PutHttpVerb]			[dbo].[HTTPMethodType]	NULL,
			[DeleteHttpVerb]		[dbo].[HTTPMethodType]	NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ObjExtDataSource'
   , @PEndingTable = N'ObjExtDataSource'
   , @Infobar = ''
   , @pModuleName = 'Core'

END
GO


IF NOT EXISTS 
( 
	SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ObjExtDataSource' AND COLUMN_NAME = 'HttpMethod'
)
BEGIN
    ALTER TABLE ObjExtDataSource
	ADD [HttpMethod]	[dbo].[ColumnNameType]	NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'ObjExtDataSource'
   , @PEndingTable = N'ObjExtDataSource'
   , @Infobar = ''
   , @pModuleName = 'Core'

END
GO