/* $Header: /Tools/SQLScripts/ApplicationDB/Stored Procedures/ChangeSiteSp.sp 8     3/08/10 8:24a Dahn $ */
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

/* $Archive: $
 *
 * Core602 1 135937 Djohnson Tue Feb 01 08:38:27 2011
 * Inherited Properties not being returned preventing ability to link subcollections
 * Issue #135937 - a new view to go up the inheritance chain and get property names for IDOs.
 *
 * $NoKeywords: $
 */
CREATE VIEW IdoPropertiesChainView
AS
SELECT
  cc.BaseCollectionName
, cc.CollectionName
, cc.CollectionLevel
, p.CollectionName as PColl
, p.PropertyName
, p.PropertyClass
, p.PropertyType
, 'FORMAT(' + p.LabelStringID + ')' Caption
, CASE
   WHEN p.EffectiveDataType IN (N'Short Integer', N'Long Integer', N'Byte', N'Decimal', N'Float', N'Currency')
   THEN 1
   ELSE 0
  END IsNumeric
, CASE p.EffectiveDataType
   WHEN N'Date' THEN 1
   ELSE 0
  END IsDate
FROM IdoPropertiesView p
INNER JOIN dbo.CollectionHierarchy() cc ON
  p.CollectionName = cc.CollectionName
WHERE NOT EXISTS (SELECT 1
FROM ido.Properties p2
INNER JOIN dbo.CollectionHierarchy() cc2 ON
  p2.CollectionName = cc2.CollectionName
WHERE cc.BaseCollectionName = cc2.BaseCollectionName
AND p.PropertyName = p2.PropertyName
AND cc2.CollectionName < cc.CollectionName
)
