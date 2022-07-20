-- ====================================================
--  RS5343 (FormExtendReplace):
-- ====================================================
IF OBJECT_ID('dbo.WSFormExtensions') IS NOT NULL
   DROP TABLE dbo.WSFormExtensions
GO

-- ====================
--  FormExtensionHints:
-- ====================
IF OBJECT_ID(N'[dbo].[WSFormExtensions]', N'U') IS NULL
BEGIN
   CREATE TABLE [dbo].[WSFormExtensions](
      [Form] [FormNameType] NOT NULL,
      [ScopeType] [WBScopeTypeType] NOT NULL,
      [ScopeName] [WBScopeNameType] NOT NULL,
      [LocaleID] [GenericIntType] NULL,
      [AccessAs] [AccessAsType] NULL,
      [ReplacedBy] [FormNameType] NOT NULL,
      [InWorkflow] [dbo].[FlagNyType] NOT NULL,
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
      [RecordDate] [dbo].[CurrentDateType] NOT NULL,
      [RowPointer] [dbo].[RowPointer] NOT NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL,
      [UpdatedBy] [dbo].[UsernameType] NOT NULL,
      [CreateDate] [dbo].[CurrentDateType] NOT NULL,
    CONSTRAINT [PK_WSFormExtensions] PRIMARY KEY CLUSTERED 
   (
      [Form] ASC,
      [ScopeType] ASC,
      [ScopeName] ASC,
	  [ReplacedBy] ASC
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
   ) ON [PRIMARY]

   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_ScopeType]  DEFAULT ((0)) FOR [ScopeType]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_ScopeName]  DEFAULT (N'[NULL]') FOR [ScopeName]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
   ALTER TABLE [dbo].[WSFormExtensions] ADD  CONSTRAINT [DF_WSFormExtensions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     N'WSFormExtensions'
   , N'WSFormExtensions'
   , @Infobar OUTPUT
   , N'Core'
GO
