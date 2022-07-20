--RS9154 DataView Report Batch Mode

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ReportBatchModeType' AND ss.name = N'dbo')
CREATE TYPE [dbo].ReportBatchModeType FROM [nchar](1) NULL
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = 'dbo'
		   AND   TABLE_NAME = 'WBDataViewIDO')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'dbo'
				AND   TABLE_NAME = 'WBDataViewIDO'
				AND   COLUMN_NAME = 'ReportBatchMode')
BEGIN
   ALTER TABLE [dbo].[WBDataViewIDO]
   ADD ReportBatchMode ReportBatchModeType NOT NULL 
   CONSTRAINT [DF_WBDataViewIDO_ReportBatchMode] DEFAULT('C')
   CONSTRAINT [CK_WBDataViewIDO_ReportBatchMode] CHECK ([ReportBatchMode]='C' OR [ReportBatchMode]='N')
   ,   ReportBatchSize GenericIntType NULL
   
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'WBDataViewIDO'
   , @PEndingTable = N'WBDataViewIDO'
   , @Infobar = ''
   , @pModuleName = 'Core'
END
GO

UPDATE dbo.WBDataViewIDO
SET ReportBatchMode = 'N'
WHERE SourceType = 'M'
AND ReportBatchMode = 'C'
GO