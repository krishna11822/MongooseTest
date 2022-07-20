SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- PathToWatch column for EventActionState
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'PathToWatch')
   ALTER TABLE [dbo].[EventActionState] ADD
      [PathToWatch] [dbo].[OSLocationType] NULL
GO

-- FilesToWatch column for EventActionState
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'FilesToWatch')
   ALTER TABLE [dbo].[EventActionState] ADD
      [FilesToWatch] [dbo].[OSLocationType] NULL
GO

-- WatchSubdirectories column for EventActionState
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'WatchSubdirectories')
   ALTER TABLE [dbo].[EventActionState] ADD
      [WatchSubdirectories] [dbo].[ListYesNoType] NOT NULL DEFAULT(0)
GO


-- WatchRequestedDate column for EventActionState
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'WatchRequestedDate')
   ALTER TABLE [dbo].[EventActionState] ADD
      [WatchRequestedDate] [dbo].[DateType] NULL
GO

-- LastWatchedDate column for EventActionState
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'LastWatchedDate')
   ALTER TABLE [dbo].[EventActionState] ADD
      [LastWatchedDate] [dbo].[DateType] NULL
GO
