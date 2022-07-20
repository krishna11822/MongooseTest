SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[site]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[site]')
      AND [name] = N'ReportOutputDirectory')
   ALTER TABLE [dbo].[site] ADD
      [ReportOutputDirectory] [dbo].[OSLocationType] NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[site]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[site]')
      AND [name] = N'TenantID')
   ALTER TABLE [dbo].[site] ADD
      [TenantID] [dbo].[ESBTenantIDType] NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'TenantID')
   ALTER TABLE [dbo].[intranet] ADD
      [TenantID] [dbo].[ESBTenantIDType] NULL
