/* $Header: /Tools/SQLScripts/ApplicationDB/Functions/CollectionHierarchy.sp 1     6/08/15 2:05p Nthurn $ */
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
*   (c) COPYRIGHT 2015 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/CollectionHierarchy.sp $ */
-- Travel all the way up a chain of replacing IDOs, and then back down the chain of extending IDOs so that all the IDOs involved
-- in a chain are represented.

CREATE FUNCTION dbo.CollectionHierarchy()
RETURNS @CollHierarchy TABLE 
(
  BaseCollectionName NVARCHAR(80) NOT NULL
, CollectionName NVARCHAR(80) NOT NULL
, CollectionLevel INT NOT NULL
, primary key (BaseCollectionName, CollectionLevel)
)

AS
BEGIN
WITH CollChain (
  [BaseCollectionName]
, [ClimbCollName]
, [CollectionName]
, [CLevel]
)
AS (
SELECT
  [CollectionName]
, [Extends]
, [CollectionName]
, 0 -- [CLevel]
FROM IdoCollectionsView
UNION ALL
SELECT 
  cc.[BaseCollectionName]
, icv.[Extends]
, icv.[CollectionName]
, cc.[CLevel] - 1
FROM CollChain cc
INNER JOIN IdoCollectionsView icv ON
  cc.CollectionName = icv.Extends
AND icv.ReplaceFlag = 1
)
INSERT INTO @CollHierarchy (BaseCollectionName, CollectionName, CollectionLevel)
SELECT BaseCollectionName, CollectionName, CLevel
FROM CollChain

;WITH CollChain2 (
  [BaseCollectionName]
, [ClimbCollName]
, [CollectionName]
, [CLevel]
)
AS (
SELECT
  cc.[BaseCollectionName]
, icv.[Extends]
, cc.[BaseCollectionName]
, 1 -- [CLevel]
FROM @CollHierarchy cc
INNER JOIN IdoCollectionsView icv ON
  icv.CollectionName = cc.BaseCollectionName
WHERE cc.BaseCollectionName = cc.CollectionName
AND CollectionLevel = 0
AND icv.Extends IS NOT NULL
UNION ALL
SELECT 
  cc.[BaseCollectionName]
, icv.[Extends]
, icv.[CollectionName]
, cc.[CLevel] + 1
FROM CollChain2 cc
INNER JOIN IdoCollectionsView icv ON
  cc.ClimbCollName = icv.CollectionName
WHERE icv.Extends IS NOT NULL
)
INSERT INTO @CollHierarchy (BaseCollectionName, CollectionName, CollectionLevel)
SELECT BaseCollectionName, ClimbCollName, CLevel
FROM CollChain2
WHERE ClimbCollName IS NOT NULL

RETURN
END
