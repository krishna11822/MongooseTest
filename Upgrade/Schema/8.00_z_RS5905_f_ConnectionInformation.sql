IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ConnectionInformation]'), N'IsUserTable') = 1 
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns] 
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ConnectionInformation]') 
      AND [name] = N'Site') 
   ALTER TABLE [dbo].[ConnectionInformation] ADD 
      [Site] [dbo].[SiteType] NULL	
GO
