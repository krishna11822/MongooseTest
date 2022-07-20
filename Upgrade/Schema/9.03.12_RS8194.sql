-- ====================================================
--  RS8194 (ReplicateAppBuilderInMG):
-- ====================================================

-- ====================
--  Data Types:
-- ====================
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ImageNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ImageNameType] FROM [nvarchar](250) NULL
GO

-- ====================
--  Tables:
-- ====================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WSFormWizardCategories]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[WSFormWizardCategories]')
      AND [name] = N'AccessAs')
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD [AccessAs] [dbo].[AccessAsType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WSFormWizardCategories]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[WSFormWizardCategories]')
      AND [name] = N'ImageName')
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD [ImageName] [dbo].[ImageNameType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WSFormWizards]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[WSFormWizards]')
      AND [name] = N'AccessAs')
   ALTER TABLE [dbo].[WSFormWizards] ADD [AccessAs] [dbo].[AccessAsType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WSFormWizards]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[WSFormWizards]')
      AND [name] = N'ImageName')
   ALTER TABLE [dbo].[WSFormWizards] ADD [ImageName] [dbo].[ImageNameType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WSFormWizards]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[WSFormWizards]')
      AND [name] = N'IsRuntimeBuilder')
   ALTER TABLE [dbo].[WSFormWizards] ADD [IsRuntimeBuilder] [dbo].[FlagNyType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WSFormWizards]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Wiz_IsRuntimeBuilder]') AND type = 'D')
   ALTER TABLE [dbo].[WSFormWizards] ADD  CONSTRAINT [DF_Wiz_IsRuntimeBuilder]  DEFAULT (0) FOR [IsRuntimeBuilder]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WSFormWizards]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CK_Wiz_IsRuntimeBuilder]') AND type = 'C')
   ALTER TABLE [dbo].[WSFormWizards] ADD  CONSTRAINT [CK_Wiz_IsRuntimeBuilder]  CHECK ([IsRuntimeBuilder]=(0) OR [IsRuntimeBuilder]=(1))
GO