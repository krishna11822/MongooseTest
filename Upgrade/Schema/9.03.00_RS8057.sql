/****** Object:  Table [dbo].[ExternalAppParamter_mst]    Script Date: 2/14/2017 8:48:50 AM ******/

SET ANSI_WARNINGS, ANSI_NULLS, ANSI_PADDING, XACT_ABORT, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, NOCOUNT ON
SET NUMERIC_ROUNDABORT OFF

/** Create User Defined Data Types **/
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
		WHERE st.name = N'ApplicationNameType' AND ss.name = N'dbo')
	CREATE TYPE [dbo].[ApplicationNameType] 
	FROM nvarchar(100);
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
		WHERE st.name = N'AuthenticationModeType' AND ss.name = N'dbo')
	CREATE TYPE [dbo].[AuthenticationModeType]
	FROM tinyint
GO

/** Create Table **/
IF OBJECT_ID('[dbo].[ExternalAppParameter_mst]') IS NULL
	CREATE TABLE [dbo].[ExternalAppParameter_mst](
		[SiteRef] [dbo].[SiteType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_SiteRef]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))),
		[AppName] [dbo].[ApplicationNameType] NOT NULL,
		[AppInstance] [dbo].[ApplicationNameType] NOT NULL,
		[BaseURL] [dbo].[URLType] NULL,
		[UserName] [dbo].[UsernameType] NULL,
		[UserPassword] [dbo].[EncryptedClientPasswordType] NULL,
		[AuthMethod] [dbo].[AuthenticationModeType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_AuthMethod] DEFAULT((0)),
		[IsActive] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_IsActive]  DEFAULT ((0)),
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_NoteExistsFlag]  DEFAULT ((0)),
		[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_CreateDate]  DEFAULT (getdate()),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_RecordDate]  DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_RowPointer]  DEFAULT (newid()),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ExternalAppParameter_mst_InWorkflow]  DEFAULT ((0)),
	 CONSTRAINT [PK_ExternalAppParameter_mst] PRIMARY KEY CLUSTERED 
	(
		[AppName] ASC,
		[AppInstance] ASC,
		[SiteRef]
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
	  CONSTRAINT [IX_ExternalAppParameter_mst_RowPointer] UNIQUE NONCLUSTERED 
	  (
		[RowPointer] ASC,
		[SiteRef] ASC
	  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
	) 
GO

/** Unique Index on ApplicationName **/
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[indexes]
		WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]')
		AND [name] = N'IX_ExternalAppParameter_mst_AppName')
   DROP INDEX [dbo].[ExternalAppParameter_mst].[IX_ExternalAppParameter_mst_AppName]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'), N'IsUserTable') = 1
   CREATE UNIQUE INDEX [IX_ExternalAppParameter_mst_AppName] ON [dbo].[ExternalAppParameter_mst]
   (
	AppName, 
	SiteRef
   )
   WHERE (IsActive = 1)
   WITH  FILLFACTOR = 90
GO

/** Constraints **/

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
                   WHERE [name]= N'CK_ExternalAppParameter_mst_IsActive'
                     AND [type] = 'C' 
                     AND [parent_object_id] = OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'))
   ALTER TABLE [dbo].[ExternalAppParameter_mst] 
	  ADD CONSTRAINT [CK_ExternalAppParameter_mst_IsActive] CHECK ( IsActive = 1 OR IsActive = 0 )
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
                   WHERE [name]= N'CK_ExternalAppParameter_mst_InWorkflow'
                     AND [type] = 'C' 
                     AND [parent_object_id] = OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'))
   ALTER TABLE [dbo].[ExternalAppParameter_mst] 
	  ADD CONSTRAINT [CK_ExternalAppParameter_mst_InWorkflow] CHECK ( InWorkflow = 1 OR InWorkflow = 0 )
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
                   WHERE [name]= N'CK_ExternalAppParameter_mst_NoteExistsFlag'
                     AND [type] = 'C' 
                     AND [parent_object_id] = OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'))
   ALTER TABLE [dbo].[ExternalAppParameter_mst] 
	  ADD CONSTRAINT [CK_ExternalAppParameter_mst_NoteExistsFlag] CHECK ( NoteExistsFlag = 1 OR NoteExistsFlag = 0 )
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
                   WHERE [name]= N'CK_ExternalAppParameter_mst_AuthMethod'
                     AND [type] = 'C' 
                     AND [parent_object_id] = OBJECT_ID(N'[dbo].[ExternalAppParameter_mst]'))
   ALTER TABLE [dbo].[ExternalAppParameter_mst] 
	  ADD CONSTRAINT [CK_ExternalAppParameter_mst_AuthMethod] CHECK ( AuthMethod BETWEEN 0 and 9 )
GO

/* Miscellaneous Setup */ 

DECLARE @TableName 	TableNameType
DECLARE @Infobar 	InfobarType
DECLARE @ModuleName	nvarchar(40)
DECLARE @SiteColumn 	nvarchar(32)

SET @TableName = N'ExternalAppParameter_mst'
SET @ModuleName = N'Core'
SET @SiteColumn = N'SiteRef'
SET @Infobar = NULL

EXECUTE [dbo].[SchemaAdditionalTasksSp] @TableName, @TableName, @Infobar, @ModuleName, @SiteColumn
GO


