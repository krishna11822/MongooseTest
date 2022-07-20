SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.GetSiteDate2') IS NOT NULL
   DROP FUNCTION dbo.GetSiteDate2
GO

/* $Header: ApplicationDB\PreTableObjects\GetSiteDate2.sp 10.8.0.0 10/29/2018 13:51:49 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/GetSiteDate2.sp $
 *
 * CoreDev 9 185911 Djohnson Fri Oct 03 17:14:03 2014
 * TimeZone sqlclr - can it be gotten rid of?
 * Issue #185911 - use pure TSQL TimeZoneConvert2 function.
 *
 * CoreDev 8 rs4588 Dahn Mon Mar 08 08:05:36 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 7 rs3953 Dahn Tue Aug 26 16:49:16 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 6 rs3953 Vlitmano Mon Aug 18 15:56:30 2008
 * Changed a Copyright header information(RS3959)
 *
 * SL8.00 12 RS2968 nkaleel Thu Feb 08 04:21:34 2007
 * changing copyright information
 *
 * SL8.00 11 RS2968 prahaladarao.hs Thu Jul 13 01:03:36 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 10 RS2968 prahaladarao.hs Tue Jul 11 01:59:31 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * SL8.00 9 92282 djohnson Mon Jan 30 15:10:51 2006
 * Change GetSiteDate2 to use dirty reads
 * Issue #92282 - GetSiteDate2 blocks on site table.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.GetSiteDate2 (
  @Date CurrentDateType) RETURNS datetime
AS
BEGIN
DECLARE
  @Severity       INT
, @ServerTimeZone VARCHAR(500) -- MUST NOT BE UNICODE FOR XP
, @ToTimeZone     VARCHAR(500) -- MUST NOT BE UNICODE FOR XP
, @OutDate        CurrentDateType
, @ErrorSp        SYSNAME
, @RowCount       INT

SET @OutDate = @Date

SELECT
  @ToTimeZone = site.time_zone
, @ServerTimeZone = parms.server_time_zone
FROM parms WITH (READUNCOMMITTED)
INNER JOIN site WITH (READUNCOMMITTED) ON
  site.site = parms.site
WHERE parm_key = 0
SELECT @RowCount = @@ROWCOUNT  -- Could be an empty database during migration

--  If the server time zone is not set, time zone conversion is not possible.
-- A SQL server restart will set the time zone.  While this information could
-- be calculated at this time, it will be much faster for the system overall
-- to error out now and force the right data to be loaded.
IF @ServerTimeZone IS NULL AND @RowCount > 0
BEGIN
   SET @ErrorSp = dbo.MsgAppFunctionSp(
     NULL, 'E=NoExist1' , '@parms.server_time_zone' , '@parms.server_time_zone'
    , @ServerTimeZone, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT
    , DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)
   EXEC @ErrorSp
END

IF @ServerTimeZone IS NOT NULL AND @ToTimeZone IS NOT NULL
  AND (@ServerTimeZone <> @ToTimeZone) AND @Date IS NOT NULL
   SET @OutDate = dbo.TimeZoneConvert2(@OutDate, @ServerTimeZone, @ToTImeZone)

RETURN @OutDate
END

GO
