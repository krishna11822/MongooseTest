/*
   ReqSet 9027
   Object:  Table [dbo].[MediaType]
   Adds a new column - AllowUpload
   [AllowUpload] [dbo].[FlagNyType] NULL
   with no constraint (yes, default to null)
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- New types in the existing columns
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'MediaType'
AND COLUMN_NAME = 'AllowUpload' )
BEGIN
   ALTER TABLE [dbo].[MediaType]
   ADD [AllowUpload] [dbo].[FlagNyType] NULL
END
GO