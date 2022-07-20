IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'PK_BGTaskHistory_mst'
   AND [type] = 'PK'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'))
   ALTER TABLE [dbo].[BGTaskHistory_mst] DROP CONSTRAINT [PK_BGTaskHistory_mst]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'PK_BGTaskHistory_mst'
   AND [xtype] = 'PK' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'))
   ALTER TABLE [dbo].[BGTaskHistory_mst] ADD
      CONSTRAINT [PK_BGTaskHistory_mst] PRIMARY KEY CLUSTERED
   (
      [TaskNumber]
     ,[SiteRef]
	) WITH FILLFACTOR = 90 ON [PRIMARY] 
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[NextKeys_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[NextKeys_mst]')
   AND   [name] = N'IX_NextKeys_mst_TableKey')
   DROP INDEX [dbo].[NextKeys_mst].[IX_NextKeys_mst_TableKey]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[NextKeys_mst]'), N'IsUserTable') = 1
   CREATE CLUSTERED INDEX [IX_NextKeys_mst_TableKey] ON [dbo].[NextKeys_mst]
   (
      [TableColumnName]
    , [KeyPrefix]
    , [SiteRef]
    , [SubKey]
    , [KeyID]
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO