/*
   ReqSet 8762 - External Entity Master
   Object:  Table [dbo].[ExternalEntityMaster]
   Change two column types.
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- New types in the existing columns
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ExternalEntityMaster'
AND COLUMN_NAME = 'Code' )
BEGIN
   ALTER TABLE ExternalEntityMaster
   ALTER COLUMN [Code] [dbo].[ExternalEntityCodeType] NOT NULL
END


IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ExternalEntityMaster'
AND COLUMN_NAME = 'Name' )
BEGIN
   ALTER TABLE ExternalEntityMaster
   ALTER COLUMN [Name] [dbo].[ExternalEntityNameType] NOT NULL
END

GO
