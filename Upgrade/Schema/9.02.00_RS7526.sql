-- DefaultConfig column on site table.
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[site]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[site]')
      AND [name] = N'DefaultConfig')
   ALTER TABLE [dbo].[site] ADD
      [DefaultConfig] [dbo].[ConfigurationNameType] NULL
   
GO


