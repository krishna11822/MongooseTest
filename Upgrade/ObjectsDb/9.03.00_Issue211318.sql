IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PropertyClassAttrs]'),N'IsUserTable') = 1
 DROP TABLE [dbo].[PropertyClassAttrs]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PropertyClassAttrsHistory]'),N'IsUserTable') = 1
 DROP TABLE [dbo].[PropertyClassAttrsHistory]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[MGCore_Collections]'),N'IsUserTable') = 1
 DROP TABLE [dbo].[MGCore_Collections]
GO