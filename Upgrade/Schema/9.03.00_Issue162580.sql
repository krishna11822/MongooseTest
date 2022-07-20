IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[MGDataSources]'),N'IsUserTable') = 1
 DROP TABLE [dbo].[MGDataSources]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[MGDataSourceMaps]'),N'IsUserTable') = 1
 DROP TABLE [dbo].[MGDataSourceMaps]
GO