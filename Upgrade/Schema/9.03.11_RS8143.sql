--RS8143 - Report Paper Size

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
                WHERE DOMAIN_SCHEMA = N'dbo' 
                  AND DOMAIN_NAME = N'ReportPaperSizeType' )
   CREATE TYPE [dbo].[ReportPaperSizeType] FROM NVARCHAR(50) NULL
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ReportPaperSize' )
BEGIN
   CREATE TABLE [dbo].[ReportPaperSize] (
      [PaperSize] [dbo].[ReportPaperSizeType] NOT NULL,
      [IsSystemRecord] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ReportPaperSize_IsSystemRecord] DEFAULT((0)),
      [DefaultOrientation] [dbo].[ReportOrientationType] NOT NULL CONSTRAINT [DF_ReportPaperSize_DefaultOrientation] DEFAULT(('P')),
      [PixelWidth] [dbo].[GenericIntType] NULL,
      [PixelHeight] [dbo].[GenericIntType] NULL,
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ReportPaperSize_NoteExistsFlag]  DEFAULT ((0)),
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ReportPaperSize_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ReportPaperSize_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ReportPaperSize_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ReportPaperSize_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ReportPaperSize_RowPointer]  DEFAULT (newid()),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ReportPaperSize_InWorkflow]  DEFAULT ((0)),
      CONSTRAINT [PK_ReportPaperSize] PRIMARY KEY CLUSTERED (
         [PaperSize] ASC
      ),
      CONSTRAINT [IX_ReportPaperSize_RowPointer] UNIQUE NONCLUSTERED (
         [RowPointer] ASC
      ),
      CONSTRAINT [CK_ReportPaperSize_IsSystemRecord] CHECK ([IsSystemRecord] = (1) Or [IsSystemRecord] = (0)),
      CONSTRAINT [CK_ReportPaperSize_InWorkflow] CHECK ([InWorkflow] = (1) Or [InWorkflow] = (0)),
      CONSTRAINT [CK_ReportPaperSize_NoteExistsFlag] CHECK ([NoteExistsFlag] = (1) Or [NoteExistsFlag] = (0)),
      CONSTRAINT [CK_ReportPaperSize_DefaultOrientation] CHECK ([DefaultOrientation] = ('P') Or [DefaultOrientation] = ('L'))
   )
END

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = N'dbo'
            AND   TABLE_NAME = N'BGTaskDefinitions' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = N'dbo'
                 AND   TABLE_NAME = N'BGTaskDefinitions'
                 AND   COLUMN_NAME = N'PaperSize' )
BEGIN
   ALTER TABLE [dbo].[BGTaskDefinitions]
   ADD [PaperSize] [dbo].[ReportPaperSizeType] NULL
END

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = N'dbo'
            AND   TABLE_NAME = N'BGTaskDefinitions'
            AND   COLUMN_NAME = N'PaperSize' )
AND NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'BGTaskDefinitions'
                AND   CONSTRAINT_NAME = N'FK_BGTaskDefinitions_PaperSize'
                AND   CONSTRAINT_TYPE = N'FOREIGN KEY')
BEGIN
   ALTER TABLE [dbo].[BGTaskDefinitions]
   ADD CONSTRAINT [FK_BGTaskDefinitions_PaperSize]
   FOREIGN KEY ([PaperSize]) REFERENCES [dbo].[ReportPaperSize] ([PaperSize])
END

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = N'dbo'
            AND   TABLE_NAME = N'ReportOptions_mst' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = N'dbo'
                 AND   TABLE_NAME = N'ReportOptions_mst'
                 AND   COLUMN_NAME = N'PaperSize' )
BEGIN
   ALTER TABLE [dbo].[ReportOptions_mst]
   ADD [PaperSize] [dbo].[ReportPaperSizeType] NULL
END

IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = N'dbo'
            AND   TABLE_NAME = N'ReportOptions_mst'
            AND   COLUMN_NAME = N'PaperSize' )
AND NOT EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ReportOptions_mst'
                AND   CONSTRAINT_NAME = N'FK_ReportOptions_mst_PaperSize'
                AND   CONSTRAINT_TYPE = N'FOREIGN KEY')
BEGIN
   ALTER TABLE [dbo].[ReportOptions_mst]
   ADD CONSTRAINT [FK_ReportOptions_mst_PaperSize]
   FOREIGN KEY ([PaperSize]) REFERENCES [dbo].[ReportPaperSize] ([PaperSize])
END

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     N'ReportOptions_mst'
   , N'ReportOptions_mst'
   , @Infobar OUTPUT
   , N'Core'
   , N'SiteRef'
