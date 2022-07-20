
-- Create index on Collections.Extends
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Collections]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[Collections]')
   AND   [name] = N'IX_Collections_Extends')
   CREATE NONCLUSTERED INDEX [IX_Collections_Extends] ON [dbo].[Collections]
      (
        [Extends]
      , [DevelopmentFlag]
      )
      WITH  FILLFACTOR = 90 ON [PRIMARY]
GO