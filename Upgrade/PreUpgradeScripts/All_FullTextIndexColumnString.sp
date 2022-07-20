SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.FullTextIndexColumnString') IS NOT NULL
   DROP FUNCTION dbo.FullTextIndexColumnString
GO
--  This table function returns the column names separated by commas of the
--  full-text index on the input table name.
/* $Header: ApplicationDB\PreTableObjects\FullTextIndexColumnString.sp 10.8.0.0 10/29/2018 13:51:49 */
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

CREATE FUNCTION dbo.FullTextIndexColumnString (
   @TableName SYSNAME
) RETURNS LongListType
AS
BEGIN
DECLARE
   @String LongListType

SET @String = ''
SELECT
   @String = @String +   
   CASE
      WHEN @String = '' THEN
         ''
      ELSE
         ', '
   END + scol.name
FROM sys.fulltext_index_columns sfic
   inner join sys.fulltext_indexes sfi ON sfi.object_id = sfic.object_id
   inner join sys.tables st ON st.object_id = sfi.object_id
   inner join sys.columns scol ON scol.object_id = st.object_id
                              and scol.column_id = sfic.column_id
WHERE st.name = @TableName

RETURN @String
END
GO
