SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CollectionsIup]'))
DROP TRIGGER [dbo].[CollectionsIup]
GO

/*$Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_CollectionsIup.sql 1     6/11/12 4:01p Bcummings $ */
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
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

CREATE TRIGGER [dbo].[CollectionsIup]
ON [dbo].[Collections]
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

--  If an extends and replace is made on a collection that already has an extends and replace,
-- then change the extends on the new collection to be at the current bottom of the extends and
-- replace chain.  Only do this operation for inserted rows that have no duplicate with a different
-- development flag.  So do it for standard new collections from Winstudio, which will have no equivalent
-- development flag = 0 record.  Also do it for new collections with a development flag of 0 which have
-- no equivalent development flag = 1 record.  This should handle imports, loads, and Winstudio new collection
-- cases.
IF @InsertFlag = 1
BEGIN

;WITH BottomReplace (BaseCollectionName, CollectionName, Extends, LockBy, DevelopmentFlag, BaseDevelopmentFlag, CLevel)
AS
(
  SELECT ii.CollectionName, ii.CollectionName, ii.Extends, ISNULL(ii.LockBy, N''), ii.DevelopmentFlag, ii.DevelopmentFlag, 0
  FROM inserted ii
  WHERE 
  NOT EXISTS (SELECT 1
  FROM Collections c2
  WHERE c2.CollectionName = ii.CollectionName
  AND c2.DevelopmentFlag != ii.DevelopmentFlag)
  AND ii.ReplaceFlag = 1
UNION ALL
  SELECT br.BaseCollectionName, c3.Extends, c3.CollectionName, ISNULL(c3.LockBy, ''), c3.DevelopmentFlag, br.BaseDevelopmentFlag, br.CLevel + 1
  FROM BottomReplace br
  INNER JOIN inserted ii ON
    ii.CollectionName = br.BaseCollectionName
  AND ii.DevelopmentFlag = br.BaseDevelopmentFlag
  INNER JOIN Collections c3 ON
    c3.Extends = br.Extends
  AND ((c3.LockBy = ii.LockBy AND c3.DevelopmentFlag = 1 AND ii.DevelopmentFlag = 1) OR ( c3.DevelopmentFlag = 0))
  WHERE c3.ReplaceFlag = 1
  AND c3.CollectionName != ii.CollectionName
)
UPDATE c
SET Extends = (SELECT TOP 1 br.Extends
  FROM BottomReplace br
  WHERE ii.CollectionName = br.BaseCollectionName
  AND CLevel != 0
  ORDER BY br.CLevel DESC)
FROM Collections c
INNER JOIN inserted ii ON
  ii.CollectionName = c.CollectionName
WHERE NOT EXISTS (SELECT 1
FROM Collections c2
WHERE c.CollectionName = c2.CollectionName
AND c.DevelopmentFlag != c2.DevelopmentFlag)
AND EXISTS (SELECT 1
FROM BottomReplace br2
WHERE br2.BaseCollectionName = c.CollectionName
AND br2.CLevel = 1)

END -- @InsertFlag = 1

IF @InsertFlag = 0
  UPDATE Collections
  SET
    RecordDate = @Today
  , UpdatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = Collections.RowPointer
ELSE
  UPDATE Collections
  SET
    RecordDate = @Today
  , CreateDate = @Today
  , UpdatedBy  = @UserName
  , CreatedBy  = @UserName
  FROM inserted AS ii
  WHERE ii.RowPointer = Collections.RowPointer
GO




