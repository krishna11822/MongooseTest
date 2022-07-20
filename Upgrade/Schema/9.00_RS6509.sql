IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PasswordParameters]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[PasswordParameters]')
      AND [name] = N'MinimumPasswordExpiration')
   ALTER TABLE [dbo].[PasswordParameters] ADD
      [MinimumPasswordExpiration] [dbo].[PasswordExpirationType] NOT NULL
        CONSTRAINT [DF_PasswordParameters_MinimumPasswordExpiration] DEFAULT (0)
        CONSTRAINT [CK_PasswordParameters_MinimumPasswordExpiration] CHECK ([MinimumPasswordExpiration] >= 0 )
GO
IF NOT EXISTS (SELECT 1 FROM [sys].[sysconstraints]
  WHERE [constid] = OBJECT_ID(N'CK_PasswordParameters_PasswordExpiration2'))
   ALTER TABLE [dbo].[PasswordParameters] ADD
  CONSTRAINT [CK_PasswordParameters_PasswordExpiration2] CHECK ([MinimumPasswordExpiration] <= [PasswordExpiration] OR [PasswordExpiration] = 0)
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'PasswordSetDate')
   ALTER TABLE [dbo].[UserNames] ADD
      [PasswordSetDate] [dbo].[CurrentDateType] NOT NULL
        CONSTRAINT [DF_UserNames_PasswordSetDate] DEFAULT (getdate())
GO
