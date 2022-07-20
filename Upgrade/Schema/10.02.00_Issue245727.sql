IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServer]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[FileServer]')
      AND [name] = N'CurrentStatus'
      AND [is_nullable] = 0)
   ALTER TABLE [dbo].[FileServer] ADD
      [CurrentStatus] [dbo].[Flag] NOT NULL
	  CONSTRAINT [DF_FileServer_CurrentStatus]  DEFAULT ((0)) 
	  CONSTRAINT [CK_FileServer_CurrentStatus] CHECK ([CurrentStatus] IN (0,1,2))
GO
