IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDBFiles]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[ProductDBFiles]')
   AND   [name] = N'IX_ProductDBFiles_AppliedBy')
   DROP INDEX [dbo].[ProductDBFiles].[IX_ProductDBFiles_AppliedBy]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductDBFiles]'), N'IsUserTable') = 1
   CREATE INDEX [IX_ProductDBFiles_AppliedBy] ON [dbo].[ProductDBFiles]
   (
      AppliedBy
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

