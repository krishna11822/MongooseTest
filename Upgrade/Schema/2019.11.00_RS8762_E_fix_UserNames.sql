/*
   ReqSet 8762 - External Entity Master
   Add "ExternalEntity" column to table
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'UserNames'
AND COLUMN_NAME = 'ExternalEntity' )
BEGIN
   
   ALTER TABLE [dbo].[UserNames]
   ADD [ExternalEntity] [dbo].[ExternalEntityCodeType] NULL

   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'UserNames'
   , @PEndingTable = N'UserNames'
   , @Infobar = ''
   , @pModuleName = 'Core'
      
END
GO

