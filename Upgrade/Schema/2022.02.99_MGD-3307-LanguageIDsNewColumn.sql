SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================
-- Enhancement #: MGD-3307 - Missing space before : (COLON)  in French (France) (and French (Canada))	
-- =============================================================

-- [dbo].[LanguageIDs]: Add StaticHasSpaceBeforeColon column
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'LanguageIDs'
AND COLUMN_NAME = 'StaticHasSpaceBeforeColon' )
BEGIN
   ALTER TABLE [dbo].[LanguageIDs]
   ADD [StaticHasSpaceBeforeColon] [dbo].[FlagNyType] NOT NULL 
   CONSTRAINT [DF_LanguageIDs_StaticHasSpaceBeforeColon] DEFAULT ((0)),
   CONSTRAINT [CK_LanguageIDs_StaticHasSpaceBeforeColon] CHECK ([StaticHasSpaceBeforeColon]=(1) OR [StaticHasSpaceBeforeColon]=(0));

END
GO

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
@PStartingTable = 'LanguageIDs'
, @PEndingTable = 'LanguageIDs'
, @Infobar = @Infobar OUTPUT
, @PModuleName = 'Core'
GO