IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SiteListType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SiteListType] FROM [NVARCHAR](MAX) NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[rep_object_category]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[rep_object_category]')
      AND [name] = N'retain_site')
   ALTER TABLE [dbo].[rep_object_category] ADD
      [retain_site] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_rep_object_category_retain_site] DEFAULT (1)
         CONSTRAINT [CK_rep_object_category_retain_site] CHECK ([retain_site] = (0) Or [retain_site] = (1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventHandler]')
      AND [name] = N'AppliesToSites')
   ALTER TABLE [dbo].[EventHandler] ADD
      [AppliesToSites] [dbo].[SiteListType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerRevision]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventHandlerRevision]')
      AND [name] = N'AppliesToSites')
   ALTER TABLE [dbo].[EventHandlerRevision] ADD
      [AppliesToSites] [dbo].[SiteListType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TmpEventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[TmpEventHandler]')
      AND [name] = N'AppliesToSites')
   ALTER TABLE [dbo].[TmpEventHandler] ADD
      [AppliesToSites] [dbo].[SiteListType] NULL
GO