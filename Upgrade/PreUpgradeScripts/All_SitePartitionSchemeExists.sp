SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.SitePartitionSchemeExists') IS NOT NULL
   DROP FUNCTION dbo.SitePartitionSchemeExists
GO

/* $Header: ApplicationDB\PreTableObjects\SitePartitionSchemeExists.sp 10.8.0.0 10/29/2018 13:51:49 */
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


/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/SitePartitionSchemeExists.sp $
 *
 * CoreDev 1 RS5905 Jray Thu May 16 15:16:58 2013
 * RS5905: determine existence of Site Partition Scheme
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.SitePartitionSchemeExists (
   @PSitePartitionScheme NVARCHAR(25) = N'SitePScheme'
) RETURNS ListYesNoType
AS
BEGIN
DECLARE
   @SitePSchemeExists ListYesNoType

SET @SitePSchemeExists = CASE
                              WHEN EXISTS (SELECT 1 FROM sys.partition_schemes WHERE name =  @PSitePartitionScheme)
                                 THEN 1
                              ELSE 0
                           END

RETURN @SitePSchemeExists
END
GO