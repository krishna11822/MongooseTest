SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DefaultToLocalSite]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[DefaultToLocalSite]
GO

--  Takes an input site and returns the local site if it is NULL.  Otherwise
-- returns the original site.

/* $Header: ApplicationDB\PreTableObjects\DefaultToLocalSite.sp 10.8.0.0 10/29/2018 13:51:49 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/DefaultToLocalSite.sp $
 *
 * CoreDev 6 181390 Djohnson Wed Jan 21 14:19:53 2015
 * Can we make dbo.DefaultToLocalSite() faster by using CONTEXT_INFO, instead of retrieving the parms row?
 * Issue 181390 - use GetSiteContext as an RTRIMed CONTEXT_INFO replacement.
 *
 * CoreDev 5 rs4588 Dahn Mon Mar 08 08:04:27 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 4 rs3953 Dahn Tue Aug 26 16:45:48 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 3 rs3953 Vlitmano Mon Aug 18 15:53:41 2008
 * Changed a Copyright header information(RS3959)
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.DefaultToLocalSite (
  @Site SiteType
) RETURNS SiteType
AS
BEGIN
DECLARE
  @NewSite SiteType

SET @NewSite = @Site
IF @Site IS NULL
   SET @NewSite = dbo.GetSiteContext()

RETURN @NewSIte

END

GO


