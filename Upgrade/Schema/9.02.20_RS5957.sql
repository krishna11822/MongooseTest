SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID(N'[dbo].[NextKeyDefinition_mst]', N'U') IS NULL
CREATE TABLE dbo.NextKeyDefinition_mst (
  [SiteRef]          [dbo].[SiteType] NOT NULL
    CONSTRAINT [DF_NextKeyDefinition_mst_SiteRef]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) ,
  [TableName]        [SYSNAME]        NOT NULL,
  [ColumnName]       [SYSNAME]        NOT NULL,
  [SubKeyName]       [SYSNAME]            NULL,
  [Table2Name]       [SYSNAME]            NULL,
  [Column2Name]      [SYSNAME]            NULL,
  [SubKey2Name]      [SYSNAME]            NULL,
  [MasterTableName]  [SYSNAME]            NULL,
  [MasterColumnName] [SYSNAME]            NULL,
  [CreatedBy] [dbo].[UsernameType]     NOT NULL
     CONSTRAINT [DF_NextKeyDefinition_CreatedBy] DEFAULT (suser_sname()),
  [UpdatedBy] [dbo].[UsernameType]    NOT NULL
     CONSTRAINT [DF_NextKeyDefinition_UpdatedBy] DEFAULT (suser_sname()),
  [CreateDate] [dbo].[CurrentDateType] NOT NULL
     CONSTRAINT [DF_NextKeyDefinition_CreateDate] DEFAULT (getdate()),
  [RecordDate] [dbo].[CurrentDateType] NOT NULL
     CONSTRAINT [DF_NextKeyDefinition_RecordDate] DEFAULT (getdate()),
  [RowPointer] [dbo].[RowPointerType] NOT NULL
     CONSTRAINT [DF_NextKeyDefinition_RowPointer] DEFAULT (newid()),
  [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
     CONSTRAINT [DF_NextKeyDefinition_NoteExistsFlag] DEFAULT ((0))
     CONSTRAINT [CK_NextKeyDefinition_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
  [InWorkflow] [dbo].[FlagNyType] NOT NULL
     CONSTRAINT [DF_NextKeyDefinition_InWorkflow] DEFAULT ((0))
     CONSTRAINT [CK_NextKeyDefinition_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
CONSTRAINT IX_NextKeyDefinition_mst_RowPointer UNIQUE NONCLUSTERED (
  RowPointer ASC,
  SiteRef ASC
) ,
 CONSTRAINT PK_NextKeyDefinition_mst PRIMARY KEY CLUSTERED (
  TableName
, ColumnName
, SiteRef
)
)
GO

DECLARE
  @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     @PStartingTable = N'NextKeyDefinition_mst'
   , @PEndingTable = N'NextKeyDefinition_mst'
   , @Infobar = @Infobar OUTPUT
   , @PSiteColumnName = N'SiteRef'
   , @PModuleName = N'Core'
   , @PIgnoreUpdate = 1
GO
