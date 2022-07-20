IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[parms_mst_all]'), N'IsUserTable') = 1
    AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[parms_mst_all]')
      AND [name] = N'Uf_3159')
BEGIN
   ALTER TABLE [dbo].[parms_mst_all] DROP COLUMN [Uf_3159]
END
GO
DECLARE @Infobar InfobarType
IF EXISTS (SELECT 1
FROM sys.procedures
WHERE name = 'CreateViewsOverMultiSiteTabsSp')
EXEC CreateViewsOverMultiSiteTabsSp
   'parms_mst_all', -- @StartingTable TableNameType=NULL,     -- _mst table
   'parms_mst_all', -- @EndingTable   TableNameType=NULL,     -- _mst table
   @Infobar       OUTPUT
GO
