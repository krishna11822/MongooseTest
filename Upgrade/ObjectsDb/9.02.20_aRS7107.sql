IF NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[Collections]')
      AND [name] = N'QuoteTableAliases')
   ALTER TABLE [dbo].[Collections] ADD
      [QuoteTableAliases] [FlagNyType] NOT NULL CONSTRAINT [DF_Collections_QuoteTableAliases] DEFAULT (0)
GO

