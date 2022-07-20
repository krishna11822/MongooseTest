/*
	For ReadyToApply
	ReqSet 8884 - Add Report Theme Setting
	Object:  Table [dbo].[intranet]
	Adds a new column - ReportThemeName
	Adds the following new constraints for the new column:
		> Default: InforReport
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- New types in the existing columns
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'intranet'
AND COLUMN_NAME = 'ReportThemeName' )
BEGIN
	ALTER TABLE intranet
	ADD [ReportThemeName] [dbo].[FormsDBThemeNameType] NOT NULL
	CONSTRAINT [DF_intranet_ReportThemeName] DEFAULT (N'InforReport')
   
   
	EXEC dbo.SchemaAdditionalTasksSp 
	@PStartingTable = N'intranet'
	, @PEndingTable = N'intranet'
	, @Infobar = ''
	, @PModuleName = 'Core'
END
GO