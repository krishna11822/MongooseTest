IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[parms_mst]'), N'IsUserTable') = 1
    AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[parms_mst]')
      AND [name] = N'Uf_3159')
BEGIN
   ALTER TABLE [dbo].[parms_mst] DROP COLUMN [Uf_3159]
END
GO

IF (OBJECT_ID(N'[dbo].[parms]', 'V') IS NOT NULL)
BEGIN
   DROP VIEW [dbo].[parms]  
END
GO
CREATE VIEW [dbo].[parms] as select * FROM [dbo].[parms_mst] WHERE site_ref = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO

