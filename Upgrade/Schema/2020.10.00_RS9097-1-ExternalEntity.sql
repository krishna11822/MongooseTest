/*
   ReqSet 9077
   A) Add a pair of new data types
   B) Add a new field to the [GroupNames] table
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ExternalEntityAppCodeType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExternalEntityAppCodeType] FROM [nvarchar](100) NULL
GO


/*
   Object:  Table [dbo].[GroupNames]
   Adds a new column - ExternalEntityApp
   [ExternalEntityApp] [dbo].[ExternalEntityAppCodeType] NULL
   with no constraint (yes, default to null)
*/

-- New type to the existing table
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'GroupNames'
AND COLUMN_NAME = 'ExternalEntityApp' )
BEGIN
   ALTER TABLE [dbo].[GroupNames]
   ADD [ExternalEntityApp] [dbo].[ExternalEntityAppCodeType] NULL
END
GO


DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = 'GroupNames'
   , @PEndingTable = 'GroupNames'
   , @Infobar = @Infobar OUTPUT
   , @PModuleName = 'Core'
GO

