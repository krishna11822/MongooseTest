SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PrimaryOrUniqueKeyString]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[PrimaryOrUniqueKeyString]
GO

/* $Header: ApplicationDB\PreTableObjects\PrimaryOrUniqueKeyString.sp 10.8.0.0 10/29/2018 13:51:49 */

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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/PrimaryOrUniqueKeyString.sp $
 *
 * CoreDev 7 167882 Jray Fri Sep 06 16:53:52 2013
 * Modifications needed to ConvertTableToMultiSiteTableSp
 * Issue 167882: Added brackets around column_name to eliminate issues related to columns that have names matching SQL reserved words.
 *
 * CoreDev 6 152074 Djohnson Fri Aug 10 14:50:47 2012
 * Filter function dbo.PrimaryOrUniqueKeyString by 'dbo' schema
 * Issue #152074 - hard code to the dbo schema.
 *
 * CoreDev 5 rs4588 Dahn Mon Mar 08 08:06:03 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 4 rs3953 Dahn Tue Aug 26 16:49:32 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 3 rs3953 Vlitmano Mon Aug 18 15:56:53 2008
 * Changed a Copyright header information(RS3959)
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.PrimaryOrUniqueKeyString (
  @ConstraintName SYSNAME
) RETURNS LongListType
AS
BEGIN
DECLARE
  @String LongListType

SET @String = ''
SELECT
  @String = @String +
  CASE WHEN ordinal_position = 1
    THEN ''
    ELSE ', '
  END + '[' + column_name + ']'
FROM information_schema.key_column_usage AS isk
INNER JOIN information_schema.table_constraints AS ist ON
  ist.table_name = isk.table_name
AND ist.constraint_name = isk.constraint_name
AND ist.constraint_schema = isk.constraint_schema
AND ist.constraint_name = @ConstraintName
AND ist.constraint_schema = N'dbo'
ORDER BY isk.ordinal_position

RETURN @String
END

GO


