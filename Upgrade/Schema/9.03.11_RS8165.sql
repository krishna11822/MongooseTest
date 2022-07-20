SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[BGTaskHistory_mst]')
      AND [name] = N'ServerName')
   ALTER TABLE [dbo].[BGTaskHistory_mst] ADD
      [ServerName] [dbo].[OSMachineNameType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[BGTaskHistory_mst]')
      AND [name] = N'LogicalFolderName')
   ALTER TABLE [dbo].[BGTaskHistory_mst] ADD
      [LogicalFolderName] [dbo].[AuthorizationObjectNameType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[BGTaskHistory_mst]')
      AND [name] = N'FileServerPath')
   ALTER TABLE [dbo].[BGTaskHistory_mst] ADD
      [FileServerPath] [dbo].[OSLocationType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServer]'), N'IsUserTable') = 1
   AND (SELECT DOMAIN_NAME FROM [information_schema].[columns]
      WHERE [TABLE_NAME] = N'FileServer'
      AND [COLUMN_NAME] = N'SharedPath') <> N'OSLocationType'
   ALTER TABLE [dbo].[FileServer] ALTER COLUMN
      [SharedPath] [dbo].[OSLocationType] NULL
GO

DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     N'BGTaskHistory_mst'
   , N'BGTaskHistory_mst'
   , @Infobar OUTPUT
   , N'Core'
   , N'SiteRef'