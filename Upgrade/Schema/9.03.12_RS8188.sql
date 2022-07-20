--RS8188

/*** 
New UDDT's
***/
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ApplicationFeatureIDType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ApplicationFeatureIDType] FROM [nvarchar](20) NULL   
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ApplicationFeatureNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ApplicationFeatureNameType] FROM [nvarchar](255) NULL   
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'MaxDescriptionType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[MaxDescriptionType] FROM [nvarchar](max) NULL   
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ApplicationFeatureTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ApplicationFeatureTypeType] FROM [NCHAR] (1) NULL
GO

/*** 
New Table - <AppFeature_mst>: To manage Application Features
***/

IF OBJECT_ID(N'[dbo].[AppFeature_mst]', N'U') IS NULL
CREATE TABLE [dbo].[AppFeature_mst](
   [SiteRef] [dbo].[SiteType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_SiteRef]  DEFAULT (RTRIM(CONVERT([nvarchar](8),context_info(),0))),
   [ProductName] [dbo].[ProductNameType] NOT NULL,
   [FeatureId] [dbo].[ApplicationFeatureIDType] NOT NULL,
   [Name] [dbo].[ApplicationFeatureNameType] NOT NULL, 
   [Description] [dbo].[MaxDescriptionType] NULL,
   [Active] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_Active]  DEFAULT ((0))
      CONSTRAINT [CK_AppFeature_mst_Active] CHECK ([Active] IN (0,1)), 
   [FeatureType] [dbo].[ApplicationFeatureTypeType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_FeatureType] DEFAULT (N'H') 
      CONSTRAINT [CK_AppFeature_mst_FeatureType] CHECK ([FeatureType] IN (N'H', N'P', N'A')),
   [PreReleaseKey] [dbo].[EncryptedClientPasswordType] NULL,
   [PlannedActivationDate] [dbo].[DateType] NULL,
   [ActivationDate] [dbo].[DateType] NULL,
   [ActivatedBy] [dbo].[UsernameType] NULL,

   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_AppFeature_mst_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_AppFeature_mst_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_AppFeature_mst_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_AppFeature_mst] PRIMARY KEY CLUSTERED
   (
      [ProductName] ,
      [FeatureId] ,
      [SiteRef] 
   ) ,
   CONSTRAINT [IX_AppFeature_mst_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ,
      [SiteRef] 
   ) 
) 
GO

           
/***
Perform additional tasks on the new table. 
***/

DECLARE
@PStartingTable TableNameType
,@PEndingTable TableNameType
,@Infobar InfobarType
,@PModuleName AppModuleType

-- New table
SET @PStartingTable = N'AppFeature_mst'
SET @PEndingTable = N'AppFeature_mst'
SET @Infobar = NULL
SET @PModuleName = N'Core'

EXEC dbo.SchemaAdditionalTasksSp
@PStartingTable
,@PEndingTable
,@Infobar
,@PModuleName
GO

