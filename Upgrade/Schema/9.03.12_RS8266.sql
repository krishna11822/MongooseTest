IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Usernames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[Usernames]')
      AND [name] = N'UserAlias')
   ALTER TABLE [dbo].[Usernames] ADD
      [UserAlias] [dbo].[UsernameType] NULL
GO

