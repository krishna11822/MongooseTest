SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF OBJECT_ID('GetSiteContext') is not null
   DROP FUNCTION GetSiteContext
GO
/* $Header: ApplicationDB\PreTableObjects\GetSiteContext.sp 10.8.0.0 10/29/2018 13:51:49 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/GetSiteContext.sp $
 *
 * CoreDev 2 181390 Djohnson Wed Jan 21 14:19:54 2015
 * Issue 181390 - use GetSiteContext as an RTRIMed CONTEXT_INFO replacement.
 *
 * CoreDev 1 176344 Jray Wed Mar 19 16:32:43 2014
 * RegenerateSiteViewsSp fails when attempting to use it in conjunction with a schema change that impacts the parms table.
 * Issue176344: Created a new function to obtain site from CONTEXT_INFO() to support RegenerateSiteViewSp
 *
 * $NoKeywords: $
 */
CREATE FUNCTION [dbo].[GetSiteContext] (
) RETURNS NVARCHAR(8)
AS
BEGIN
   DECLARE
      @Site SiteType

   SELECT @Site = RTRIM(CAST(CONTEXT_INFO() AS NVARCHAR(8)))

RETURN @Site
END
GO

