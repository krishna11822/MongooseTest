SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.DataTypeString') IS NOT NULL
   DROP FUNCTION dbo.DataTypeString
GO

/* $Header: ApplicationDB\PreTableObjects\DataTypeString.sp 10.8.0.0 10/29/2018 13:51:49 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/DataTypeString.sp $
 *
 * CoreDev 8 218084 Djohnson Tue Aug 09 11:49:10 2016
 * On click of  [Regenerate Replication Triggers] button error message dialog displayed.
 * Issue #218084 - previous issue on sql injection code broke datatype.
 *
 * CoreDev 7 166802 Djohnson Mon Aug 12 09:20:21 2013
 * The function DataTypeString returns a length of -1 for types that have MAX
 * Issue #166802 - if -1 length, change to max.
 *
 * CoreDev 6 rs4588 Dahn Mon Mar 08 08:04:26 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 5 rs3953 Dahn Tue Aug 26 16:45:47 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 4 rs3953 Vlitmano Mon Aug 18 15:53:41 2008
 * Changed a Copyright header information(RS3959)
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.DataTypeString (
  @Domain    SYSNAME
, @Type      SYSNAME
, @Length    INT
, @Precision INT
, @Scale     INT
) RETURNS LongListType
AS
BEGIN
DECLARE
  @String LongListType

IF @Domain IS NOT NULL
   SET @String = QUOTENAME(@Domain)
ELSE
BEGIN
   IF @Type IN ('varchar', 'nvarchar', 'char', 'nchar', 'binary', 'varbinary')
   BEGIN
      SET @String = QUOTENAME(@Type) + '(' + REPLACE(CAST(@Length AS NVARCHAR(4)), '-1', 'MAX') + ')'
   END
   ELSE IF @Type IN ('numeric', 'decimal')
   BEGIN
      SET @String = QUOTENAME(@Type) + '(' + CAST(@Precision AS NVARCHAR(4)) + 
',' + CAST(@Scale AS NVARCHAR(4)) + ')'
   END
   ELSE
      SET @String = @Type
END
RETURN @String

END
GO


