IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_AccessAs_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[AccessAs]'))
   ALTER TABLE [dbo].[AccessAs] ADD
   CONSTRAINT [IX_AccessAs_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_Collections_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[Collections]'))
   ALTER TABLE [dbo].[Collections] ADD
   CONSTRAINT [IX_Collections_RowPointer] UNIQUE
   (
     [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_CustomAssembly_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[CustomAssembly]'))
   ALTER TABLE [dbo].[CustomAssembly] ADD
   CONSTRAINT [IX_CustomAssembly_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_MethodParameters_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[MethodParameters]'))
   ALTER TABLE [dbo].[MethodParameters] ADD
   CONSTRAINT [IX_MethodParameters_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_MethodResultSets_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[MethodResultSets]'))
   ALTER TABLE [dbo].[MethodResultSets] ADD
   CONSTRAINT [IX_MethodResultSets_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_Methods_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[Methods]'))
   ALTER TABLE [dbo].[Methods] ADD
   CONSTRAINT [IX_Methods_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_Properties_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[Properties]'))
   ALTER TABLE [dbo].[Properties] ADD
   CONSTRAINT [IX_Properties_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_PropertyClasses_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[PropertyClasses]'))
   ALTER TABLE [dbo].[PropertyClasses] ADD
   CONSTRAINT [IX_PropertyClasses_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_Servers_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[Servers]'))
   ALTER TABLE [dbo].[Servers] ADD
   CONSTRAINT [IX_Servers_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_SubColFilterProperties_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[SubColFilterProperties]'))
   ALTER TABLE [dbo].[SubColFilterProperties] ADD
   CONSTRAINT [IX_SubColFilterProperties_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_SysParameters_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[SysParameters]'))
   ALTER TABLE [dbo].[SysParameters] ADD
   CONSTRAINT [IX_SysParameters_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_Tables_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[Tables]'))
   ALTER TABLE [dbo].[Tables] ADD
   CONSTRAINT [IX_Tables_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO
