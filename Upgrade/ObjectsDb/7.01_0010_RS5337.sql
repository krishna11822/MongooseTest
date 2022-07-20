SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- RS5337 Objects Database upgrade script
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_0010_RS5337.sql 1     8/21/13 2:03p Jmorris $ */
/*
Copyright © 2012 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** A D D    C O L U M N **/

IF NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
	            WHERE [id] = OBJECT_ID (N'[dbo].[Collections]')
	              AND [name] = N'LabelStringID')
   ALTER TABLE [dbo].[Collections] ADD
      [LabelStringID]        [nvarchar](50)     NULL
GO
