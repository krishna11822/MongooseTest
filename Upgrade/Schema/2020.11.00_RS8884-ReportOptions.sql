/*
	For ReadyToApply
	ReqSet 8884 - Add Report Theme Setting
	Object: Table [dbo].[ReportOptions]
	Adds a new column - ReportThemeName
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ReportOptions_mst'
AND COLUMN_NAME = 'ReportThemeName' )
BEGIN
   ALTER TABLE ReportOptions_mst
   ADD [ReportThemeName] [dbo].[FormsDBThemeNameType] NULL

	EXEC dbo.SchemaAdditionalTasksSp 
	@PStartingTable = N'ReportOptions_mst'
	, @PEndingTable = N'ReportOptions_mst'
	, @Infobar = ''
	, @PModuleName = 'Core'
END
GO