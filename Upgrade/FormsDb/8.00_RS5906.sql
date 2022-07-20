-- =============================================================
--  Forms DB Upgrade Script (RS 5906):
-- =============================================================
IF NOT EXISTS( SELECT 1 FROM [dbo].[syscolumns] WHERE [name] = N'BaseFormName' AND [id] = OBJECT_ID( N'[dbo].[Forms]' ) )
	ALTER TABLE [dbo].[Forms] ADD BaseFormName nvarchar(50) NULL