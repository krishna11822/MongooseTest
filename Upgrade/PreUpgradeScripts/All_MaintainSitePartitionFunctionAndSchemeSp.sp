SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.MaintainSitePartitionFunctionAndSchemeSp') IS NOT NULL
   DROP PROCEDURE dbo.MaintainSitePartitionFunctionAndSchemeSp
GO

/* $Header: ApplicationDB\Stored Procedures\MaintainSitePartitionFunctionAndSchemeSp.sp 10.1.0.1 03/30/2018 14:27:36 */
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

-- Just call the shorter named stored procedure.
/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/MaintainSitePartitionFunctionAndSchemeSp.sp $
 *
 * CoreDev 2 RS5077 Djohnson Fri Aug 01 17:10:03 2014
 * RS5077 - guts of code moved to stored procedure with a name short enough for Oracle (<= 30).
 *
 * CoreDev 1 RS5905 Jray Thu May 16 16:59:59 2013
 * RS5905: Sp to handle creating site partition function and scheme, if necessary, or to alter them to support a new site
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.MaintainSitePartitionFunctionAndSchemeSp (
   @PSite SiteType = NULL
 , @PAddSite ListYesNoType --  '0' -> Remove Site; '1' -> Add Site -- At this time, only Add Site is supported
)
AS
-- Check for existence of Generic External Touch Point routine 
IF OBJECT_ID(N'dbo.EXTGEN_MaintainSitePartitionFunctionAndSchemeSp') IS NOT NULL  
BEGIN  
   DECLARE @EXTGEN_SpName sysname  
   SET @EXTGEN_SpName = N'dbo.EXTGEN_MaintainSitePartitionFunctionAndSchemeSp'  
   -- Invoke the ETP routine, passing in (and out) this routine's parameters: 
   EXEC @EXTGEN_SpName
      @PSite
    , @PAddSite

   -- ETP routine must take over all desired functionality of this standard routine: 
   RETURN 0 
END 
-- End of Generic External Touch Point code

DECLARE
   @Severity INT

EXEC @Severity = dbo.MaintSitePartitFuncAndSchemeSp
   @PSite
 , @PAddSite

RETURN @Severity
GO
