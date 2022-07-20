IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_SCHEMA = 'dbo'
			AND TABLE_NAME = 'DefaultTypes'
			AND COLUMN_NAME = 'DefaultRegEx')
BEGIN
	ALTER TABLE [dbo].[DefaultTypes]
	ADD DefaultRegEx LongListType NULL

	EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'DefaultTypes'
   , @PEndingTable = N'DefaultTypes'
   , @Infobar = ''
   , @pModuleName = 'Core'
END
GO