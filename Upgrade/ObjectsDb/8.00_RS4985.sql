SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- RS4985  upgrade script
-- =================================================================================

/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/8.00_RS4985.sql 1     8/21/13 2:03p Jmorris $ */
/*
Copyright © 2012 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** A D D    C O L U M N S **/

IF NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
	            WHERE [id] = OBJECT_ID (N'[dbo].[Properties]')
	              AND [name] = N'InlineList')
   ALTER TABLE [dbo].[Properties] ADD
     [InlineList]           [nvarchar](MAX)    NULL
   , [Validators]           [nvarchar](MAX)    NULL
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
	            WHERE [id] = OBJECT_ID (N'[dbo].[PropertyClasses]')
	              AND [name] = N'InlineList')
   ALTER TABLE [dbo].[PropertyClasses] ADD
     [InlineList]           [nvarchar](MAX)    NULL
   , [Validators]           [nvarchar](MAX)    NULL
GO

-- Create CollectionRules table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollectionRules]') AND type IN (N'U'))
CREATE TABLE CollectionRules (
  CollectionName    NVARCHAR(80) NOT NULL
, DevelopmentFlag   INT NOT NULL
, PropertyList      NVARCHAR(400) NOT NULL
, ReferencedBy      NVARCHAR(80) NOT NULL
, RefPropertyList   NVARCHAR(400) NOT NULL
, DeleteAction      INT NOT NULL DEFAULT 0
, Filter            NVARCHAR(max) NULL
, MessageObjectName NVARCHAR(50) NULL
, CreatedBy         NVARCHAR(30) NOT NULL DEFAULT suser_sname()
, UpdatedBy         NVARCHAR(30) NOT NULL DEFAULT suser_sname()
, CreateDate        DATETIME NOT NULL DEFAULT getdate()
, RecordDate        DATETIME NOT NULL DEFAULT getdate()
, RowPointer        UNIQUEIDENTIFIER NOT NULL DEFAULT newid()
, NoteExistsFlag    TINYINT NOT NULL DEFAULT 0
, InWorkFlow        TINYINT NOT NULL DEFAULT 0
, DataRowversion    TIMESTAMP NOT NULL
, CONSTRAINT PK_CollectionRules PRIMARY KEY (RowPointer)
)
GO

-- Create index on CollectionRules.CollectionName/DevelopmentFlag
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CollectionRules]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[CollectionRules]')
   AND   [name] = N'IX_CollectionRules_Name_DevFlag')
   CREATE NONCLUSTERED INDEX [IX_CollectionRules_Name_DevFlag] ON [dbo].[CollectionRules]
      (
        [CollectionName]
      , [DevelopmentFlag]
      )
      WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CollectionRulesDel]'))
DROP TRIGGER [dbo].[CollectionRulesDel]
GO

/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2012 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[CollectionRulesDel]
ON [dbo].[CollectionRules]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CollectionRulesIup]'))
DROP TRIGGER [dbo].[CollectionRulesIup]
GO

/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2012 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[CollectionRulesIup]
ON [dbo].[CollectionRules]
FOR INSERT, UPDATE
AS

DECLARE
  @Severity   int
, @InsertFlag tinyint

IF EXISTS ( SELECT 1 FROM inserted )
  SELECT @Severity = 0
ELSE
  RETURN

SELECT
  @InsertFlag = CASE
    WHEN EXISTS ( SELECT 1 FROM deleted ) THEN 0
    ELSE 1
  END

/*============ PROCESSING SECTION ============*/
DECLARE
  @Today    GenericDateType
, @UserName UsernameType

SET @Today    = GETDATE()
SET @UserName = SUSER_SNAME()

IF @InsertFlag = 0
  UPDATE CollectionRules
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = CollectionRules.RowPointer
ELSE
  UPDATE CollectionRules
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = CollectionRules.RowPointer
GO
