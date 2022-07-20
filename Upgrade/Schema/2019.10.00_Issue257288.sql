/** Add TaskParms column **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/** New BGTaskParmsHugeType data-type **/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'VariationNumberIDType' AND ss.name = N'dbo')
	CREATE TYPE [dbo].[VariationNumberIDType] FROM DECIMAL(22,0) NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BodInformation]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[BodInformation]')
      AND [name] = N'VariationID')
   ALTER TABLE [dbo].[BodInformation] ALTER COLUMN
      [VariationID] [dbo].[VariationNumberIDType] NOT NULL
GO
