/*
   ReqSet 8762 - External Entity Master
   Remove obsolete version of table.
*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Table is obsolete
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExternalEntity]') AND type in (N'U'))
BEGIN
   DROP TABLE [dbo].[ExternalEntity]
END
GO

