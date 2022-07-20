SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'use_IONAPI_for_ION_transfers')
   ALTER TABLE [dbo].[intranet] ADD
      [use_IONAPI_for_ION_transfers] [dbo].[ListYesNoType] 
      CONSTRAINT [DF_intranet_UseIONAPIForIONTransfers] DEFAULT 0 NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'IONAPI_server_ID')
   ALTER TABLE [dbo].[intranet] ADD
      [IONAPI_server_ID] [dbo].[SequenceType] 
      CONSTRAINT [DF_intranet_IONAPIServerID] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
      WHERE [name]= N'CK_intranet_UseIONAPIForIONTransfers'
      AND [type] = 'C' 
      AND [parent_object_id] = OBJECT_ID(N'[dbo].[intranet]'))
   ALTER TABLE [dbo].[intranet] 
  ADD CONSTRAINT [CK_intranet_UseIONAPIForIONTransfers] 
    CHECK ( use_IONAPI_for_ION_transfers BETWEEN 0 and 1 )
GO

/* Miscellaneous Setup */ 

DECLARE @TableName 	TableNameType
DECLARE @Infobar 	InfobarType
DECLARE @ModuleName	SYSNAME
DECLARE @SiteColumn 	SYSNAME

SET @TableName = N'intranet'
SET @Infobar = NULL
SET @ModuleName = N'Core'
SET @SiteColumn = NULL

EXECUTE [dbo].[SchemaAdditionalTasksSp] @TableName, @TableName, @Infobar, @ModuleName, @SiteColumn

GO
