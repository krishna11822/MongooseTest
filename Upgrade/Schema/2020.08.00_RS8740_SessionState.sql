-- RS 8740 CentralVendorMetadata

IF NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ConnectionInformation]')
      AND [name] = N'SessionState')
   ALTER TABLE [dbo].[ConnectionInformation] ADD
      [SessionState] [nvarchar](max) NULL
GO

