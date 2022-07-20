-- ====================================================
--  RS7976 (H5NFWNewFormTypeWizard):
-- ====================================================

-- ====================
--  Data Types:
-- ====================
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'WSFormWizardCategoryNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[WSFormWizardCategoryNameType] FROM [nvarchar](50) NULL
GO

-- ====================
--  Tables:
-- ====================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WSFormWizardCategories]') AND type in (N'U'))
BEGIN
   CREATE TABLE [dbo].[WSFormWizardCategories](
      [CategoryName] [dbo].[WSFormWizardCategoryNameType] NOT NULL,
      [Description] [dbo].[LongDescType] NULL,
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL,
      [UpdatedBy] [dbo].[UsernameType] NOT NULL,
      [CreateDate] [dbo].[CurrentDateType] NOT NULL,
      [RecordDate] [dbo].[CurrentDateType] NOT NULL,
      [RowPointer] [dbo].[RowPointerType] NOT NULL,
      [InWorkflow] [dbo].[FlagNyType] NOT NULL,
   CONSTRAINT [PK_WizardCategories] PRIMARY KEY CLUSTERED 
   (
      [CategoryName] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
    CONSTRAINT [IX_WizardCategories_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
   )

   ALTER TABLE [dbo].[WSFormWizardCategories] ADD CONSTRAINT [DF_WizCat_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD CONSTRAINT [DF_WizCat_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD CONSTRAINT [DF_WizCat_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD CONSTRAINT [DF_WizCat_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD CONSTRAINT [DF_WizCat_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD CONSTRAINT [DF_WizCat_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
   ALTER TABLE [dbo].[WSFormWizardCategories] ADD CONSTRAINT [DF_WizCat_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
   ALTER TABLE [dbo].[WSFormWizardCategories] WITH CHECK ADD CONSTRAINT [CK_WizCat_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
   ALTER TABLE [dbo].[WSFormWizardCategories] CHECK CONSTRAINT [CK_WizCat_NoteExistsFlag]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WSFormWizards]') AND type in (N'U'))
BEGIN
   CREATE TABLE [dbo].[WSFormWizards](
      [WizardName] [dbo].[FormNameType] NOT NULL,
      [CategoryName] [dbo].[WSFormWizardCategoryNameType] NOT NULL,
      [Description] [dbo].[LongDescType] NULL,
      [FormName] [dbo].[FormNameType] NOT NULL,
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL,
      [UpdatedBy] [dbo].[UsernameType] NOT NULL,
      [CreateDate] [dbo].[CurrentDateType] NOT NULL,
      [RecordDate] [dbo].[CurrentDateType] NOT NULL,
      [RowPointer] [dbo].[RowPointerType] NOT NULL,
      [InWorkflow] [dbo].[FlagNyType] NOT NULL,
   CONSTRAINT [PK_Wizards] PRIMARY KEY CLUSTERED 
   (
      [WizardName] ASC,
      [CategoryName] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
    CONSTRAINT [IX_Wizards_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
   )
   
   ALTER TABLE [dbo].[WSFormWizards] ADD CONSTRAINT [DF_Wiz_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
   ALTER TABLE [dbo].[WSFormWizards] ADD CONSTRAINT [DF_Wiz_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
   ALTER TABLE [dbo].[WSFormWizards] ADD CONSTRAINT [DF_Wiz_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
   ALTER TABLE [dbo].[WSFormWizards] ADD CONSTRAINT [DF_Wiz_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
   ALTER TABLE [dbo].[WSFormWizards] ADD CONSTRAINT [DF_Wiz_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
   ALTER TABLE [dbo].[WSFormWizards] ADD CONSTRAINT [DF_Wiz_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
   ALTER TABLE [dbo].[WSFormWizards] ADD CONSTRAINT [DF_Wiz_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
   ALTER TABLE [dbo].[WSFormWizards]  WITH CHECK ADD  CONSTRAINT [CK_Wiz_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
   ALTER TABLE [dbo].[WSFormWizards] CHECK CONSTRAINT [CK_Wiz_NoteExistsFlag]
END
GO