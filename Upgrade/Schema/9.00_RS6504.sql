SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- PasscodeUser column for UserNames
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'PasscodeUser')
   ALTER TABLE [dbo].[UserNames] ADD
      [PasscodeUser] [dbo].[UsernameType] NULL
GO
