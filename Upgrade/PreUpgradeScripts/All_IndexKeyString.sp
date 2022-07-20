SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.IndexKeyString') IS NOT NULL
   DROP FUNCTION dbo.IndexKeyString
GO
--  This table function returns the column names separated by commas of the
-- input index name.
/* $Header: ApplicationDB\PreTableObjects\IndexKeyString.sp 10.8.0.0 10/29/2018 13:51:49 */

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
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/IndexKeyString.sp $
 *
 * CoreDev 4 188583 Jray Tue Dec 16 13:46:53 2014
 * CopyASite process fails when there are noteheader rows in the source db pointing to tables that do not exist
 * Issue 188583: Modify to bracket column names to eliminate issue with keywords
 *
 * CoreDev 3 181074 Jray Thu Jun 26 17:19:51 2014
 * SL8 to SL9 Upgrade Fails
 * Issue 181074: Add support for non-unique indexes with included columns
 *
 * CoreDev 2 rs4588 Dahn Mon Mar 08 08:05:43 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 1 126801 Djohnson Thu Jan 14 10:36:07 2010
 * Issue #126801 - Moving from SL to Core as they are needed by TableScriptSp.
 *
 * SL8.01 10 rs3953 Vlitmano Tue Aug 26 10:53:56 2008
 * RS3953 - Changed a Copyright header?
 *
 * SL8.01 9 rs3953 Vlitmano Mon Aug 18 14:17:36 2008
 * RS3953 - Changed a Copyright from
 * 'Copyright ? 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries. All rights reserved. The word and design marks set forth herein are trademarks and/or registered trademarks of 		Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries. All rights reserved. All other trademarks listed herein are the property of their respective owners.'
 *    to
 * 'Copyright ? 2007 Infor. All rights reserved. The word and design marks set forth herein are trademarks and/or registered trademarks of Infor and/or related affiliates and subsidiaries. All rights reserved. All other trademarks listed herein are the property of their respective owners. www.infor.com.'
 *
 * SL8.00 8 RS2968 nkaleel Fri Feb 23 08:02:31 2007
 * changing copyright information(RS2968)
 *
 * SL8.00 7 RS2968 prahaladarao.hs Thu Jul 13 01:04:03 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 6 RS2968 prahaladarao.hs Tue Jul 11 02:16:26 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.IndexKeyString (
  @IndexName SYSNAME
, @TableName SYSNAME
) RETURNS LongListType
AS
BEGIN
DECLARE
  @String LongListType

SET @String = ''
SELECT
  @String = @String +   
  CASE WHEN sk.keyno = 1
   THEN ''
   ELSE ','
  END + '[' + COL_NAME(si.id, sk.colid) + ']' +
CASE WHEN indexkey_property(
   OBJECT_ID(@TableName), si.indid, sk.keyno, 'isdescending') = 1 THEN ' DESC'
  ELSE '' END
FROM sysindexes AS si
INNER JOIN sysindexkeys AS sk ON
  sk.id = si.id
AND sk.indid = si.indid
WHERE si.name = @IndexName
AND si.id = OBJECT_ID(@TableName)
AND sk.keyno > 0
ORDER BY sk.keyno

RETURN @String
END
GO

