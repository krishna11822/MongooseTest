/*
   ReqSet 8762 - External Entity Master
   Add "ExternalEntity" column to table
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'GroupNames'
AND COLUMN_NAME = 'ExternalEntity' )
BEGIN
   
   ALTER TABLE [dbo].[GroupNames]
   ADD [ExternalEntity] [dbo].[ExternalEntityCodeType] NULL

   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'GroupNames'
   , @PEndingTable = N'GroupNames'
   , @Infobar = ''
   , @pModuleName = 'Core'
      
END
GO

