-- Add column intranet.XMLReportingURL
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'XMLReportingURL')
   ALTER TABLE [dbo].[intranet] ADD
      [XMLReportingURL] [dbo].[URLType] NULL
GO

-- Add column intranet.XMLReportingFolder
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'XMLReportingFolder')
   ALTER TABLE [dbo].[intranet] ADD
      [XMLReportingFolder] [dbo].[OSLocationType] NULL
GO

-- Add column intranet.XMLReportingDatasetURL
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'XMLReportingDatasetURL')
   ALTER TABLE [dbo].[intranet] ADD
      [XMLReportingDatasetURL] [dbo].[URLType] NULL
GO