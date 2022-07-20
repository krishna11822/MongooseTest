SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/8.00_00_Collation.sql 1     8/21/13 2:03p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
DECLARE @CommandString nvarchar(max)

-- Build the command string to alter the current database collation.
SET @CommandString = 'ALTER DATABASE ' +  DB_NAME() + ' COLLATE SQL_Latin1_General_CP1_CI_AS;'

-- Execute the command.
EXEC sp_executesql @CommandString
GO
