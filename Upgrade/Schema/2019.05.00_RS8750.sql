IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Usernames]'), N'IsUserTable') = 1
  AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[Usernames]')
   AND   [name] = N'IX_Usernames_WorkstationLogin')
   DROP INDEX [dbo].[Usernames].[IX_Usernames_WorkstationLogin]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Usernames]'), N'IsUserTable') = 1
   CREATE INDEX [IX_Usernames_WorkstationLogin] ON [dbo].[Usernames]
   (
      [WorkstationLogin]
   )
GO
