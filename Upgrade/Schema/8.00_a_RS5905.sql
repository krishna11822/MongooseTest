IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AppTable]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[AppTable]')
      AND [name] = N'AppViewName')
   ALTER TABLE [dbo].[AppTable] ADD
      [AppViewName] [dbo].[TableNameType] NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AppTable]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[AppTable]')
      AND [name] = N'SiteColumnName')
   ALTER TABLE [dbo].[AppTable] ADD
      [SiteColumnName] [dbo].[ColumnNameType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AppTable]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [sys].[indexes]
WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[AppTable]')
AND [name] = N'IX_AppTable_AppViewName')
DROP INDEX [dbo].[AppTable].[IX_AppTable_AppViewName]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AppTable]'), N'IsUserTable') = 1
CREATE NONCLUSTERED INDEX [IX_AppTable_AppViewName] ON [dbo].[AppTable]
(
[AppViewName]
)
WITH FILLFACTOR = 90 ON [PRIMARY]
GO