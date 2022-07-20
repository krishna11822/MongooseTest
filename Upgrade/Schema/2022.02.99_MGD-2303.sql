IF NOT EXISTS (
	SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'UserPreferences'
	AND COLUMN_NAME = 'PromptSaveDataViewLayoutChanges'
)
ALTER TABLE [dbo].[UserPreferences]
ADD [PromptSaveDataViewLayoutChanges] FlagNyType NOT NULL
CONSTRAINT [DF_UserPreferences_PromptSaveDataViewLayoutChanges] DEFAULT ((0)),
CONSTRAINT [CK_UserPreferences_PromptSaveDataViewLayoutChanges] CHECK ([PromptSaveDataViewLayoutChanges]=(1) OR [PromptSaveDataViewLayoutChanges]=(0));

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
@PStartingTable = 'UserPreferences'
, @PEndingTable = 'UserPreferences'
, @Infobar = @Infobar OUTPUT
, @PModuleName = 'Core'
GO