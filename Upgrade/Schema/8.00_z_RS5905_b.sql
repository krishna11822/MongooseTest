IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[NextKeys_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[NextKeys_mst]')
   AND   [name] = N'IX_NextKeys_mst_TableKey')
   DROP INDEX [dbo].[NextKeys_mst].[IX_NextKeys_mst_TableKey]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[NextKeys_mst]'), N'IsUserTable') = 1
   CREATE NONCLUSTERED INDEX [IX_NextKeys_mst_TableKey] ON [dbo].[NextKeys_mst]
   (
      [TableColumnName] ASC,
      [KeyPrefix] ASC,
      [SiteRef] ASC,
      [SubKey] ASC,
      [KeyID] ASC
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO