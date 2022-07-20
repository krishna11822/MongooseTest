IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'ReportOrientationType')
   CREATE TYPE ReportOrientationType FROM NCHAR(1) NULL
GO   
   
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewIDO'
              AND   COLUMN_NAME = N'ShowInternalNotes' )
BEGIN
   ALTER TABLE [dbo].[WBDataViewIDO]
   ADD [ShowInternalNotes] [ListYesNoType] NOT NULL 
       CONSTRAINT [DF_WBDataViewIDO_ShowInternalNotes] DEFAULT(0)
       CONSTRAINT [CK_WBDataViewIDO_ShowInternalNotes] CHECK ([ShowInternalNotes] IN (0,1))
END
  
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewIDO'
              AND   COLUMN_NAME = N'ShowExternalNotes' )
BEGIN       
   ALTER TABLE [dbo].[WBDataViewIDO]
   ADD [ShowExternalNotes] [ListYesNoType] NOT NULL 
       CONSTRAINT [DF_WBDataViewIDO_ShowExternalNotes] DEFAULT(0)
       CONSTRAINT [CK_WBDataViewIDO_ShowExternalNotes] CHECK ([ShowExternalNotes] IN (0,1))
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataView'
              AND   COLUMN_NAME = N'IsSystemRecord' )
BEGIN
   ALTER TABLE [dbo].[WBDataView]
   ADD [IsSystemRecord] [ListYesNoType] NOT NULL 
   CONSTRAINT [DF_WBDataView_IsSystemRecord] DEFAULT(0)
   CONSTRAINT [CK_WBDataView_IsSystemRecord] CHECK ([IsSystemRecord] IN (0,1))
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewIDO'
              AND   COLUMN_NAME = N'IsSystemRecord' )
BEGIN   
   ALTER TABLE [dbo].[WBDataViewIDO]
   ADD [IsSystemRecord] [ListYesNoType] NOT NULL 
   CONSTRAINT [DF_WBDataViewIDO_IsSystemRecord] DEFAULT(0)
   CONSTRAINT [CK_WBDataViewIDO_IsSystemRecord] CHECK ([IsSystemRecord] IN (0,1))
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewColumn'
              AND   COLUMN_NAME = N'IsSystemRecord' )
BEGIN
   ALTER TABLE [dbo].[WBDataViewColumn]
   ADD [IsSystemRecord] [ListYesNoType] NOT NULL 
   CONSTRAINT [DF_WBDataViewColumn_IsSystemRecord] DEFAULT(0)
   CONSTRAINT [CK_WBDataViewColumn_IsSystemRecord] CHECK ([IsSystemRecord] IN (0,1))
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataView'
              AND   COLUMN_NAME = N'ReportOrientation' )
BEGIN
   ALTER TABLE [dbo].[WBDataView]
   ADD [ReportOrientation] [ReportOrientationType] NOT NULL 
   CONSTRAINT [DF_WBDataView_ReportOrientation] DEFAULT(N'L')
   CONSTRAINT [CK_WBDataView_ReportOrientation] CHECK ([ReportOrientation] IN (N'L',N'P'))
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewLayout'
              AND   COLUMN_NAME = N'ReportOrientation' )
BEGIN
   ALTER TABLE [dbo].[WBDataViewLayout]
   ADD [ReportOrientation] [ReportOrientationType] NULL 
   CONSTRAINT [CK_WBDataViewLayout_ReportOrientation] CHECK ([ReportOrientation] IN (N'L',N'P'))
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataView'
              AND   COLUMN_NAME = N'CaptionOverride' )
BEGIN
   ALTER TABLE [dbo].[WBDataView]
   ADD [CaptionOverride] [NameType] NULL 
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewLayout'
              AND   COLUMN_NAME = N'CaptionOverride' )
BEGIN   
   ALTER TABLE [dbo].[WBDataViewLayout]
   ADD [CaptionOverride] [NameType] NULL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
          AND   TABLE_NAME = N'WBDataView'
          AND   COLUMN_NAME = N'AccessAs' )
BEGIN
   ALTER TABLE [dbo].[WBDataView]
   DROP COLUMN [AccessAs]
END
