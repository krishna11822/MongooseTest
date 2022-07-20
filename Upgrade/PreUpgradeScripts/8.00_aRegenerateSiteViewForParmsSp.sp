SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('[dbo].[MG8.00_RegenerateSiteViewForParmsSp]') IS NOT NULL
    DROP PROCEDURE [dbo].[MG8.00_RegenerateSiteViewForParmsSp]
GO
/* $Header: /Tools/SQLScripts/Upgrade/PreUpgradeScripts/8.00_aRegenerateSiteViewForParmsSp.sp 2     8/23/16 3:31p Jmorris $ */

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

CREATE PROCEDURE dbo.[MG8.00_RegenerateSiteViewForParmsSp] (
  @TableName TableNameType
, @IncludeSiteRefFilter ListYesNoType = 1
, @MasterSite SiteType
, @Infobar   InfobarType OUTPUT
)
AS
BEGIN

DECLARE
    @Severity   INT = 0
  , @SQL        NVARCHAR(MAX)
  , @ViewName   TableNameType
  , @SiteColumn ColumnNameType
  , @IsView     tinyint = 0
  , @BaseTable  TableNameType = NULL
  , @Columns    NVARCHAR(MAX)

   IF @TableName like '%_all'
      SET @BaseTable = SUBSTRING(@TableName, 1, LEN(@TableName) - 4)

   SELECT
     @ViewName   = AppViewName
   , @SiteColumn = ISNULL(SiteColumnName, N'site_ref')
   FROM AppTable
   WHERE TableName = @TableName


   IF @ViewName IS NULL
   BEGIN
      EXEC @Severity = MsgAppSp 
       @Infobar OUTPUT
      , 'E=NoExist1'
      , '@AppTable'
      , '@AppTable.TableName'
      , @TableName
      RETURN @Severity
   END

   SET @SQL = N'IF OBJECT_ID(''@View'') IS NOT NULL DROP VIEW ' + @ViewName
   SET @SQL = REPLACE(@SQL, N'@View', @ViewName)
   EXECUTE (@SQL)

   --  If this is an _all with a matching base table and all sites are in the same db, just point
   -- to the base table.
   -- base table and the _all table, such as parms_mst and parms_mst_all.
   IF @BaseTable IS NOT NULL
   BEGIN
      SET @Columns = N''
      SELECT @Columns = @Columns + CASE WHEN @Columns = N'' THEN N'' ELSE N',' END + sc.name
      FROM sys.columns sc
      INNER JOIN sys.columns sc2 ON
        sc.name = sc2.name
      WHERE sc.object_id = object_id(@TableName)
      AND sc2.object_id = object_id(@BaseTable)
      SET @SQL = N'CREATE VIEW ' + @ViewName + N'
AS SELECT ' + @columns + N'
FROM ' + CASE WHEN dbo.AllSitesSameDb() = 1 THEN @BaseTable ELSE @TableName END
   END
   --  If this is an _all with a matching base table, then the view is a union of the data between the
   -- base table and the _all table, such as parms_mst and parms_mst_all.
--   IF @BaseTable IS NOT NULL
--   BEGIN
--      SET @Columns = N''
--      SELECT @Columns = @Columns + CASE WHEN @Columns = N'' THEN N'' ELSE N',' END + sc.name
--      FROM sys.columns sc
--      INNER JOIN sys.columns sc2 ON
--        sc.name = sc2.name
--      WHERE sc.object_id = object_id(@TableName)
--      AND sc2.object_id = object_id(@BaseTable)
--      SET @SQL = N'CREATE VIEW ' + @ViewName + N'
--AS SELECT ' + @columns + N'
--FROM ' + @TableName + N'
--UNION SELECT ' + @Columns + N'
--FROM ' + @BaseTable
--   END

   ELSE
   BEGIN
      SET @SQL = ' CREATE VIEW ' + @ViewName + N'
AS
SELECT *
FROM ' + @TableName
   END

   SELECT @IsView = 1
   FROM sys.views
   WHERE name = @TableName

IF @IncludeSiteRefFilter = 1 AND @IsView = 0
BEGIN
   IF @MasterSite IS NOT NULL AND LEN(@MasterSite) > 0
       SET @SQL = @SQL + N'
           WHERE ' + @SiteColumn + N' = ''' + @MasterSite + ''''
   ELSE 
       SET @SQL = @SQL + N'
           WHERE ' + @SiteColumn + N' = CAST(CONTEXT_INFO() AS NVARCHAR(8))'

END

   EXECUTE (@SQL)

   RETURN @Severity
END
GO
