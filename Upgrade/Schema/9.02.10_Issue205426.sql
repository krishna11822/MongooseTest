IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[site]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[site]')
      AND [name] = N'app_db_server_name')
   ALTER TABLE [dbo].[site] ADD
      [app_db_server_name] [sysname] NULL
GO


