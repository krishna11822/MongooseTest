SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/CreateViewsOverMultiSiteTablesSp.sp $
 *
 * CoreDev 7 RS5077 Djohnson Fri Aug 01 17:10:00 2014
 * RS5077 - guts of code moved to stored procedure with a name short enough for Oracle (<= 30).
 *
 * $NoKeywords: $
 */
IF OBJECT_ID('dbo.CreateViewsOverMultiSiteTablesSp') IS NOT NULL
    DROP PROCEDURE dbo.CreateViewsOverMultiSiteTablesSp
GO
/* $Header: ApplicationDB\Stored Procedures\CreateViewsOverMultiSiteTablesSp.sp 10.1.0.1 03/30/2018 14:27:36 */

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
--  Just a pass through to the shorter named procedure now.
/* $Archive: /Tools/SQLScripts/Upgrade/PreUpgradeScripts/CreateViewsOverMultiSiteTablesSp.sp $
 *
 *
 * $NoKeywords: $
 */

CREATE PROCEDURE [dbo].[CreateViewsOverMultiSiteTablesSp]
   @StartingTable TableNameType=NULL,     -- _mst table
   @EndingTable   TableNameType=NULL,     -- _mst table
   @Infobar       InfobarType OUTPUT
AS

-- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
IF OBJECT_ID(N'dbo.EXTGEN_CreateViewsOverMultiSiteTablesSp') IS NOT NULL
BEGIN
   DECLARE @EXTGEN_SpName sysname
   SET @EXTGEN_SpName = N'dbo.EXTGEN_CreateViewsOverMultiSiteTablesSp'
   -- Invoke the ETP routine, passing in (and out) this routine's parameters:
   DECLARE @EXTGEN_Severity int 
   EXEC @EXTGEN_Severity = @EXTGEN_SpName
        @StartingTable
      , @EndingTable
      , @Infobar OUTPUT

-- ETP routine can RETURN 1 to signal that the remainder of this standard routine should now proceed: 
 IF @EXTGEN_Severity <> 1 
  RETURN @EXTGEN_Severity 
 END 
 -- End of Generic External Touch Point code. 

DECLARE
   @Severity INT = 0

EXEC @Severity = dbo.CreateViewsOverMultiSiteTabsSp
  @StartingTable
, @EndingTable
, @Infobar OUTPUT

RETURN @Severity

GO

