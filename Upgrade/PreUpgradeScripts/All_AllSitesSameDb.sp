SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AllSitesSameDb]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[AllSitesSameDb]
GO

--  This function returns a 1 if all the non external sites are in the same database as this.

/* $Header: ApplicationDB\PreTableObjects\AllSitesSameDb.sp 10.8.0.0 10/29/2018 13:51:49 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/AllSitesSameDb.sp $
 *
 * CoreDev 1 RS5905 Djohnson Fri Mar 08 12:33:17 2013
 * RS5905
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.AllSitesSameDb ()  RETURNS ListYesNoType
AS
BEGIN
DECLARE
  @Flag     ListYesNoType
, @ParmSite SiteType
, @Db       OSLocationType

SET @Flag = 1

IF EXISTS (SELECT 1
  FROM site s1
  LEFT OUTER JOIN intranet i1 ON
    s1.intranet_name = i1.intranet_name
  WHERE ISNULL(i1.IsExternal, 0) = 0
  AND s1.app_db_name != db_name())
   SET @Flag = 0

RETURN @Flag
END

GO
