SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================
-- RS #: MGD-2283 - Inbox Notification in Web Client
-- =============================================================

-- UserPreferences: Add CheckForNewMessageInterval column
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'UserPreferences'
AND COLUMN_NAME = 'CheckForNewMessageInterval' )
BEGIN
	ALTER TABLE dbo.UserPreferences
	ADD [CheckForNewMessageInterval] [dbo].[GenericIntType] NULL
END

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
@PStartingTable = 'UserPreferences'
, @PEndingTable = 'UserPreferences'
, @Infobar = @Infobar OUTPUT
, @PModuleName = 'Core'
GO

-- DefaultTypes: Add row : 81 - Check for New Message Interval
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 81)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc, DefaultRegEx) VALUES (81, N'Check for New Message Interval', '^[1-9]+[0-9]*$')