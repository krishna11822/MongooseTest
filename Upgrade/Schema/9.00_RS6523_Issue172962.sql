IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'LastActiveDate')
   ALTER TABLE [dbo].[UserNames] ADD
      [LastActiveDate] [dbo].[DateType] NOT NULL
      CONSTRAINT [DF_UserNames_LastActiveDate] DEFAULT (getdate())
GO