IF EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[SiteConnectionInformation]') 
               AND name = N'PK_SiteConnectionInformation'
                   AND allow_page_locks = 1)
ALTER INDEX PK_SiteConnectionInformation ON .dbo.SiteConnectionInformation SET (ALLOW_PAGE_LOCKS = OFF)
GO
IF EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[TrackRows]') 
               AND name = N'PK_TrackRows'
                   AND allow_page_locks = 1)
ALTER INDEX PK_TrackRows ON .dbo.TrackRows SET (ALLOW_PAGE_LOCKS = OFF)
GO