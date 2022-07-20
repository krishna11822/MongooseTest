SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Collections table upgrade script
-- Steps:
-- 1. Drop Unique constraint on ItemName.
-- 2. Drop ItemName column.
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/8.00_0010_RS4561.sql 1     8/21/13 2:03p Jmorris $ */
/*
Copyright © 2011 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

-- ItemName is obsolete and the column is being dropped from the IDOCollections table

IF EXISTS (SELECT 1 FROM [dbo].[sysobjects]
	WHERE [name] = 'UQ_Collections'
	AND [xtype] = 'UQ'
	AND [parent_obj] = OBJECT_ID (N'[dbo].[Collections]'))
	ALTER TABLE [dbo].[Collections] DROP CONSTRAINT [UQ_Collections]
GO	

IF EXISTS (SELECT 1 FROM [dbo].[syscolumns]
	WHERE [id] = OBJECT_ID (N'[dbo].[Collections]')
	AND [name] = N'ItemName')
	ALTER TABLE [dbo].[Collections] DROP COLUMN ItemName
GO