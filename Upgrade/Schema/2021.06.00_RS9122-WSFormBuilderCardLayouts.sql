
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE SCHEMA_ID = SCHEMA_ID('dbo') AND name = 'WSFormBuilderCardLayouts')
CREATE TABLE [dbo].[WSFormBuilderCardLayouts](
 [LayoutName] [dbo].[NameType] NOT NULL
,[CardNum] [dbo].[GenericIntType] NOT NULL
,[CardFieldsCount] [dbo].[GenericIntType] NULL
,[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_WSFormBuilderCardLayouts_CreatedBy]  DEFAULT (suser_sname()) 
,[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_WSFormBuilderCardLayouts_UpdatedBy]  DEFAULT (suser_sname()) 
,[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_WSFormBuilderCardLayouts_CreateDate]  DEFAULT (getdate())
,[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_WSFormBuilderCardLayouts_RecordDate]  DEFAULT (getdate())
,[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_WSFormBuilderCardLayouts_RowPointer]  DEFAULT (newid()) 
,[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_WSFormBuilderCardLayouts_NoteExistsFlag]  DEFAULT ((0)) 
,[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_WSFormBuilderCardLayouts_InWorkflow]  DEFAULT ((0)) 
,CONSTRAINT [PK_WSFormBuilderCardLayouts] PRIMARY KEY NONCLUSTERED ( [LayoutName] ASC,	[CardNum] ASC ) ON [PRIMARY]
,CONSTRAINT [IX_WSFormBuilderCardLayouts_RowPointer] UNIQUE NONCLUSTERED (	[RowPointer] ASC ) ON [PRIMARY] ) ON [PRIMARY]
GO

EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'WSFormBuilderCardLayouts'
   , @PEndingTable = N'WSFormBuilderCardLayouts'
   , @Infobar = ''
   , @pModuleName = 'Core'
GO