SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.ReplicationFilters') IS NOT NULL
    DROP FUNCTION dbo.ReplicationFilters
GO
--  This routine returns the filter clause to use for replication.  Since a
-- table can be in different categories with different filters, the output
-- filter is an OR of all the category filters.

/* $Header: ApplicationDB\PreTableObjects\ReplicationFilters.sp 10.8.0.0 10/29/2018 13:51:49 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/ReplicationFilters.sp $
 *
 * CoreDev 6 rs4588 Dahn Mon Mar 08 08:06:15 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 5 rs3953 Dahn Tue Aug 26 16:49:54 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 4 rs3953 Vlitmano Mon Aug 18 15:57:10 2008
 * Changed a Copyright header information(RS3959)
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.ReplicationFilters (
  @SourceSite SiteType
, @TargetSite SiteType
, @TableName  SYSNAME
) RETURNS LongListType
AS
BEGIN
DECLARE
  @Filter LongListType

SET @Filter = ''
SELECT
  @Filter = @Filter + CASE WHEN roc.Filter IS NOT NULL THEN CASE WHEN @Filter <> '' THEN ' OR ' ELSE '' END +
'(' + roc.filter + ')' ELSE '' END
FROM rep_object_category AS roc
INNER JOIN rep_rule AS rr ON
  rr.source_site = @SourceSite
AND rr.target_site = ISNULL(@TargetSite, rr.target_site)
AND rr.category = roc.category
WHERE roc.object_name = @TableName
AND roc.object_type = 1 -- Tables, filters make sense only on tables.

SET @Filter = ISNULL(@Filter, '')

--  The entire set of OR'd values is surrounded by parenthesis so it can be
-- added to an existing where clause as a single AND value.

IF @Filter <> ''
    SET @Filter = '(' + @Filter + ')'
RETURN @Filter
END
GO

