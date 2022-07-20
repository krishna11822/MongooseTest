IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassNames]') AND type IN (N'U'))
DROP TABLE [dbo].[ClassNames]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassNames2]') AND type IN (N'U'))
DROP TABLE [dbo].[ClassNames2]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[save_props]') AND type IN (N'U'))
DROP TABLE [dbo].[save_props]
GO

