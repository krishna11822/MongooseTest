
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjCollections]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
   WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[ObjCollections]')
   AND   [name] = N'IX_ObjCollections_Extends')
   DROP INDEX [dbo].[ObjCollections].[IX_ObjCollections_Extends]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjCollections]'), N'IsUserTable') = 1
   CREATE INDEX [IX_ObjCollections_Extends] ON [dbo].[ObjCollections]
   (
      [Extends], [DevelopmentFlag]
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

