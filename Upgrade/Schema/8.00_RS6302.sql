-- Create type SiteTypeType
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
   WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'SiteTypeType')
   CREATE TYPE SiteTypeType FROM NVARCHAR(10) NULL
GO

-- Drop CK_site_type constraint on site.type
IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'CK_site_type'
   AND [type] = 'C'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[site]'))
   ALTER TABLE [dbo].[site] DROP CONSTRAINT [CK_site_type]
GO

-- Drop DF_site_type constraint on site.type
IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'DF_site_type'
   AND [type] = 'D'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[site]'))
   ALTER TABLE [dbo].[site] DROP CONSTRAINT [DF_site_type]
GO

-- Change UDDT on site.type
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'site'
            AND COLUMN_NAME = N'type')
   ALTER TABLE [dbo].[site] ALTER COLUMN [type] [SiteTypeType] NULL
GO

-- Add site.type Default constraint back in.
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[site]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'DF_site_type'
   AND [type] = 'D'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[site]'))
   ALTER TABLE [dbo].[site] ADD
      CONSTRAINT [DF_site_type] DEFAULT (N'S') FOR [type]
GO

-- Create Table SiteTypeModuleMap
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'SiteTypeModuleMap')
BEGIN
   CREATE TABLE [SiteTypeModuleMap]
   (
      [SiteType] [SiteTypeType] NOT NULL,
      [ModuleName] [LicenseModuleNameType] NOT NULL,
      [RowPointer] [dbo].[RowPointerType] NOT NULL 
         CONSTRAINT [DF_SiteTypeModuleMap_RowPointer] DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
         CONSTRAINT [DF_SiteTypeModuleMap_NoteExistsFlag] DEFAULT ((0))
         CONSTRAINT [CK_SiteTypeModuleMap_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
      [CreatedBy] [dbo].[UsernameType] NOT NULL  
         CONSTRAINT [DF_SiteTypeModuleMap_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL 
         CONSTRAINT [DF_SiteTypeModuleMap_UpdatedBy] DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL 
         CONSTRAINT [DF_SiteTypeModuleMap_CreateDate] DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL 
         CONSTRAINT [DF_SiteTypeModuleMap_RecordDate] DEFAULT (getdate()),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL 
         CONSTRAINT [DF_SiteTypeModuleMap_InWorkflow] DEFAULT ((0))
         CONSTRAINT [CK_SiteTypeModuleMap_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
      CONSTRAINT [PK_SiteTypeModuleMap] PRIMARY KEY CLUSTERED
      (
         [SiteType],
         [ModuleName]
      ) ON [PRIMARY],
      CONSTRAINT [IX_SiteTypeModuleMap_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer]
      ) ON [PRIMARY]
   ) ON [PRIMARY]
END
GO