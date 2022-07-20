SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================
-- Enhancement #: MGD-3020 - SMTP Email enhancements to support recent CSP changes	
-- =============================================================

-- [dbo].[intranet]: Add SMTPTimeout column
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'intranet'
AND COLUMN_NAME = 'SMTPTimeout' )
BEGIN
   ALTER TABLE intranet
   ADD [SMTPTimeout] [dbo].[TimeoutType] NULL
END
GO

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
@PStartingTable = 'intranet'
, @PEndingTable = 'intranet'
, @Infobar = @Infobar OUTPUT
, @PModuleName = 'Core'
GO