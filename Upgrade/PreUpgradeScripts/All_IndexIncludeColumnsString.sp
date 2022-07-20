SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.IndexIncludeColumnString') IS NOT NULL
   DROP FUNCTION dbo.IndexIncludeColumnString
GO
/* $Header: ApplicationDB\PreTableObjects\IndexIncludeColumnsString.sp 10.8.0.0 10/29/2018 13:51:49 */
/*
***************************************************************
*             	                                               *
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/IndexIncludeColumnsString.sp $
 *
 * CoreDev 2 189006 cqdayrit Fri Sep 18 04:46:11 2015
 * Modify to bracket column names to eliminate issue with keywords
 * 189006 - add bracket to eliminate issue with keywords
 *
 * CoreDev 1 181074 Jray Thu Jun 26 17:19:55 2014
 * SL8 to SL9 Upgrade Fails
 * Issue 181074: Add support for index included columns
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.IndexIncludeColumnString (
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
  CASE WHEN @String = ''
   THEN ''
   ELSE ', '
  END + 
  '[' + COL_NAME(sic.object_id, sic.column_id) + ']'
FROM sys.index_columns sic
INNER JOIN sys.indexes si
   ON si.object_id = sic.object_id
  AND si.index_id = sic.index_id
WHERE si.object_id = OBJECT_ID(@TableName)
  AND si.name = @IndexName
  AND sic.is_included_column = 1
ORDER BY index_column_id

RETURN @String
END
GO
