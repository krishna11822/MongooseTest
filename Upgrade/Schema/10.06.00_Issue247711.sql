IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[SessionContextNames]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[SessionContextNames]')
   AND   [name] = N'IX_SessionContextNames_SessionID')
   DROP INDEX [dbo].[SessionContextNames].[IX_SessionContextNames_SessionID]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[SessionContextNames]'), N'IsUserTable') = 1
   CREATE INDEX [IX_SessionContextNames_SessionID] ON [dbo].[SessionContextNames]
   (
      [SessionID]
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

