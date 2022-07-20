IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjAccessAs]') AND name = N'IX_ObjAccessAs_RowPointer')
ALTER TABLE [dbo].[ObjAccessAs] DROP CONSTRAINT [IX_ObjAccessAs_RowPointer]
GO
ALTER TABLE [dbo].[ObjAccessAs]  ADD
  CONSTRAINT [IX_ObjAccessAs_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjCollectionRules]') AND name = N'IX_ObjCollectionRules_RP')
ALTER TABLE [dbo].[ObjCollectionRules] DROP CONSTRAINT [IX_ObjCollectionRules_RP]
GO
ALTER TABLE [dbo].[ObjCollectionRules]  ADD
  CONSTRAINT [IX_ObjCollectionRules_RP] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjCollections]') AND name = N'IX_ObjCollections_RowPointer')
ALTER TABLE [dbo].[ObjCollections] DROP CONSTRAINT [IX_ObjCollections_RowPointer]
GO
ALTER TABLE [dbo].[ObjCollections]  ADD
  CONSTRAINT [IX_ObjCollections_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjCustomAssembly]') AND name = N'IX_ObjCustomAssembly_RP')
ALTER TABLE [dbo].[ObjCustomAssembly] DROP CONSTRAINT [IX_ObjCustomAssembly_RP]
GO
ALTER TABLE [dbo].[ObjCustomAssembly]  ADD
  CONSTRAINT [IX_ObjCustomAssembly_RP] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodParameters]') AND name = N'IX_ObjMethodParameters_RP')
ALTER TABLE [dbo].[ObjMethodParameters] DROP CONSTRAINT [IX_ObjMethodParameters_RP]
GO
ALTER TABLE [dbo].[ObjMethodParameters]  ADD
  CONSTRAINT [IX_ObjMethodParameters_RP] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethodResultSets]') AND name = N'IX_ObjMethodResultSets_RP')
ALTER TABLE [dbo].[ObjMethodResultSets] DROP CONSTRAINT [IX_ObjMethodResultSets_RP]
GO
ALTER TABLE [dbo].[ObjMethodResultSets]  ADD
  CONSTRAINT [IX_ObjMethodResultSets_RP] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjMethods]') AND name = N'IX_ObjMethods_RowPointer')
ALTER TABLE [dbo].[ObjMethods] DROP CONSTRAINT [IX_ObjMethods_RowPointer]
GO
ALTER TABLE [dbo].[ObjMethods]  ADD
  CONSTRAINT [IX_ObjMethods_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjProperties]') AND name = N'IX_ObjProperties_RowPointer')
ALTER TABLE [dbo].[ObjProperties] DROP CONSTRAINT [IX_ObjProperties_RowPointer]
GO
ALTER TABLE [dbo].[ObjProperties]  ADD
  CONSTRAINT [IX_ObjProperties_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjPropertyClasses]') AND name = N'IX_ObjPropertyClasses_RP')
ALTER TABLE [dbo].[ObjPropertyClasses] DROP CONSTRAINT [IX_ObjPropertyClasses_RP]
GO
ALTER TABLE [dbo].[ObjPropertyClasses]  ADD
  CONSTRAINT [IX_ObjPropertyClasses_RP] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjServers]') AND name = N'IX_ObjServers_RowPointer')
ALTER TABLE [dbo].[ObjServers] DROP CONSTRAINT [IX_ObjServers_RowPointer]
GO
ALTER TABLE [dbo].[ObjServers]  ADD
  CONSTRAINT [IX_ObjServers_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ObjTables]') AND name = N'IX_ObjTables_RowPointer')
ALTER TABLE [dbo].[ObjTables] DROP CONSTRAINT [IX_ObjTables_RowPointer]
GO
ALTER TABLE [dbo].[ObjTables]  ADD
  CONSTRAINT [IX_ObjTables_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO

