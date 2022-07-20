SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- RS7479 App Database upgrade script - Add columns to BODTemplate, Add Version to the PK
-- =================================================================================
/* $Header: /Tools/SQLScripts/ApplicationDB/SchemaChanges/ReadyToApply/9.02.00_RS7479_BODTemplates.sql 3     8/27/15 12:20p Lflaherty $ */
/*
Copyright © 2015 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/


/** Create Types */
IF TYPE_ID(N'[dbo].[BODTemplateSchemaType]') IS NULL CREATE TYPE [dbo].[BODTemplateSchemaType] FROM nvarchar(max) NULL;
GO
IF TYPE_ID(N'[dbo].[BODTemplateStatusType]') IS NULL CREATE TYPE [dbo].[BODTemplateStatusType] FROM nvarchar(12) NULL;
GO
IF TYPE_ID(N'[dbo].[BODTemplateVersionType]') IS NULL CREATE TYPE [dbo].[BODTemplateVersionType] FROM nvarchar(12) NULL;
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'BODTemplate'
               AND   COLUMN_NAME = N'Version')
BEGIN
   /** Drop primary key */
   ALTER TABLE [dbo].[BODTemplate] DROP CONSTRAINT [PK_BODTemplate],[IX_BODTemplate_RowPointer];

   /** Add new columns */
   ALTER TABLE [dbo].[BODTemplate]
   ADD [Version] [BODTemplateVersionType] NULL,
       [TemplateSchema] [BODTemplateSchemaType] NULL,
       [Status] [BODTemplateStatusType] NULL;

   /** Set Version to a suitable default value on existing rows */
   EXEC sp_executesql N'
      UPDATE [dbo].[BODTemplate] SET [Version] = ''1.0.0'' WHERE [Version] IS NULL;
      '

   /** alter version to prevent nulls */
   ALTER TABLE [dbo].[BODTemplate]
   ALTER COLUMN [Version] [BODTemplateVersionType] NOT NULL;

   /** Reset the primary key and index constraints, Version is added to the primary key */
   ALTER TABLE [dbo].[BODTemplate]
   ADD  
    CONSTRAINT [PK_BODTemplate] PRIMARY KEY CLUSTERED 
   (
	   [TemplateName] ASC,
	   [Version] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT [IX_BODTemplate_RowPointer] UNIQUE NONCLUSTERED 
   (
	   [RowPointer] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
END

GO