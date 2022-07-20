-- RS8214 - DataView Reporting Phase 3

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'WBDataView')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'WBDataView'
                AND   COLUMN_NAME = N'DisplayReportHeader')
BEGIN
   ALTER TABLE [dbo].[WBDataView]
   ADD
     [DisplayReportHeader] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataView_DisplayReportHea] DEFAULT((1)),
     [DisplayPageHeaderFooter] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataView_DisplayPageHeade] DEFAULT((1)),
     [RepeatHeadersNewPage] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataView_RepeatHeadersNew] DEFAULT((1)),
     [RepeatHeadersCollectionChange] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataView_RepeatHeadersCol] DEFAULT((1)),
     [InsertPageBreakGroup] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataView_InsertPageBreakG] DEFAULT((0)),
     [ResetPageNumGroup] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataView_ResetPageNumGrou] DEFAULT((0)),
     [CanGrow] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataView_CanGrow] DEFAULT((1)),
     [CriteriaForm] [dbo].[FormNameType] NULL,

     CONSTRAINT [CK_WBDataView_DisplayReportHea] CHECK ([DisplayReportHeader] = (1) Or [DisplayReportHeader] = (0)),
     CONSTRAINT [CK_WBDataView_DisplayPageHeade] CHECK ([DisplayPageHeaderFooter] = (1) Or [DisplayPageHeaderFooter] = (0)),
     CONSTRAINT [CK_WBDataView_RepeatHeadersNew] CHECK ([RepeatHeadersNewPage] = (1) Or [RepeatHeadersNewPage] = (0)),
     CONSTRAINT [CK_WBDataView_RepeatHeadersCol] CHECK ([RepeatHeadersCollectionChange] = (1) Or [RepeatHeadersCollectionChange] = (0)),
     CONSTRAINT [CK_WBDataView_InsertPageBreakG] CHECK ([InsertPageBreakGroup] = (1) Or [InsertPageBreakGroup] = (0)),
     CONSTRAINT [CK_WBDataView_ResetPageNumGrou] CHECK ([ResetPageNumGroup] = (1) Or [ResetPageNumGroup] = (0)),
     CONSTRAINT [CK_WBDataView_CanGrow] CHECK ([CanGrow] = (1) Or [CanGrow] = (0))

     EXEC dbo.SchemaAdditionalTasksSp 'WBDataView', 'WBDataView', NULL, 'Core'
END
