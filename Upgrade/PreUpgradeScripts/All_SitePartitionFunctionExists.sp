SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.SitePartitionFunctionExists') IS NOT NULL
   DROP FUNCTION dbo.SitePartitionFunctionExists
GO

/* $Header: ApplicationDB\PreTableObjects\SitePartitionFunctionExists.sp 10.8.0.0 10/29/2018 13:51:49 */
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


/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/SitePartitionFunctionExists.sp $
 *
 * CoreDev 1 RS5905 Jray Thu May 16 15:16:46 2013
 * RS5905: determine existence of Site Partition Function
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.SitePartitionFunctionExists (
   @PSitePartitionFunction NVARCHAR(25) = N'SitePFunction'
) RETURNS ListYesNoType
AS
BEGIN
DECLARE
   @SitePFunctionExists ListYesNoType

SET @SitePFunctionExists = CASE
                              WHEN EXISTS (SELECT 1 FROM sys.partition_functions WHERE name = @PSitePartitionFunction)
                                 THEN 1
                              ELSE 0
                           END

RETURN @SitePFunctionExists
END
GO
