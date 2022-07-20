-- RS 7335 IDOExtCodeSourceShipped

-- New columns for ObjCustomAssembly

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjCustomAssembly]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ObjCustomAssembly]')
      AND [name] = N'AssemblyType')
   ALTER TABLE [dbo].[ObjCustomAssembly] ADD
      [AssemblyType] [smallint] NOT NULL CONSTRAINT DF_ObjCustAsm_AssemblyType DEFAULT (0),
      [Language]     [nvarchar](10) NULL,
      [References]   [nvarchar](max) NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjCustomAssembly]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ObjCustomAssembly]')
      AND [name] = N'ExtendedAssemblyName')
   ALTER TABLE [dbo].[ObjCustomAssembly] ADD
      [ExtendedAssemblyName]   [nvarchar](80) NULL
GO

-- New table for Objects database
IF OBJECT_ID('[dbo].[ObjCustomAssemblySource]') IS NULL
   CREATE TABLE [dbo].[ObjCustomAssemblySource] (
      [AssemblyName]    [nvarchar](80) NOT NULL, 
      [FileName]        [nvarchar](80) NOT NULL,
      [DevelopmentFlag] [int] NOT NULL,
      [SourceCode]      [nvarchar](MAX) NOT NULL,
      [LockBy]          [UsernameType] NULL,
      [RevisionNo]      [int] NOT NULL,
      [RevisionDate]    [datetime] NOT NULL,
      [NoteExistsFlag]  [dbo].[FlagNyType] NOT NULL,
      [CreatedBy]       [dbo].[UsernameType] NOT NULL,
      [UpdatedBy]       [dbo].[UsernameType] NOT NULL,
      [CreateDate]      [dbo].[CurrentDateType] NOT NULL,
      [RecordDate]      [dbo].[CurrentDateType] NOT NULL,
      [RowPointer]      [dbo].[RowPointerType] NOT NULL,
      [InWorkflow]      [dbo].[FlagNyType] NOT NULL,
      CONSTRAINT [PK_ObjCASrc] PRIMARY KEY NONCLUSTERED 
      (
         [AssemblyName],
         [FileName],
         [DevelopmentFlag]
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
      CONSTRAINT [IX_ObjCASrc_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
   ) 
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_DevelopmentFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_DevelopmentFlag]  DEFAULT ((0)) FOR [DevelopmentFlag]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_RevisionNo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_RevisionNo]  DEFAULT ((1)) FOR [RevisionNo]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_RevisionDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_RevisionDate]  DEFAULT (getdate()) FOR [RevisionDate]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ObjCASrc_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ObjCustomAssemblySource] ADD  CONSTRAINT [DF_ObjCASrc_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
