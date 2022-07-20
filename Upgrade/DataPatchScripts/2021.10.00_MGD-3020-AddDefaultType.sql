SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================
-- Enhancement #: MGD-3020 - SMTP Email enhancements to support recent CSP changes	
-- =============================================================

-- DefaultTypes: Add row : 82 - Use AES Intranet's from email
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 82)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc, DefaultRegEx) VALUES (82, N'Use AES Intranet''s from email', '^(?:0|1)$')