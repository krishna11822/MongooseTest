IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[LanguageIDs]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[LanguageIDs]')
      AND [name] = N'OverrideMidHelpURL')
  ALTER TABLE [dbo].[LanguageIDs] ADD
      [OverrideMidHelpURL] [dbo].[URLType] NULL
GO
/*RS7573*/
