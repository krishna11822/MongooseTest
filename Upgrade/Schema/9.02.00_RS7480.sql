SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- AllowRemoteTrustedSession column for UserNames
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'AllowRemoteTrustedSession')
   ALTER TABLE [dbo].[UserNames] ADD
      [AllowRemoteTrustedSession] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_UserNames_AllowRemoteTrustedSession] DEFAULT ((0))
      CONSTRAINT [CK_UserNames_AllowRemoteTrustedSession] CHECK ([AllowRemoteTrustedSession] IN (0,1))
GO

