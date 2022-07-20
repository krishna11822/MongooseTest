SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/8.00_01_UserDefinedDataTypes.sql 1     8/21/13 2:03p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'CurrentDateType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[CurrentDateType] FROM [datetime] NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'FlagNyType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[FlagNyType] FROM [tinyint] NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'GenericDateType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[GenericDateType] FROM [datetime] NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'InfobarType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[InfobarType] FROM [nvarchar](2800) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'RowPointerType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[RowPointerType] FROM [uniqueidentifier] NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UsernameType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[UsernameType] FROM [nvarchar](30) NULL
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'GroupnameType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[GroupnameType] FROM [nvarchar](30) NULL
GO
