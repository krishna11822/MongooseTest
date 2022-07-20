/*
	For ReadyToApply
	ReqSet 8939 - SMTP Retry Configuration
	Object:  Table [dbo].[intranet]
	Adds a new column - Number of Retries.
	Adds the following new constraints for the new column:
		> Default: 3
		> Check: values from 0 to 10.
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- New types in the existing columns
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'intranet'
AND COLUMN_NAME = 'SMTPNumberOfRetries' )
BEGIN
   ALTER TABLE intranet
   ADD [SMTPNumberOfRetries] [dbo].[GenericIntType] NOT NULL
   CONSTRAINT [DF_intranet_SMTPNumberOfRetries] DEFAULT ((3))
   CONSTRAINT [CK_intranet_SMTPNumberOfRetries] CHECK (([SMTPNumberOfRetries]>=(0) AND [SMTPNumberOfRetries]<=(10)))
END
GO