SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.MaintSitePartitFuncAndSchemeSp') IS NOT NULL
   DROP PROCEDURE dbo.MaintSitePartitFuncAndSchemeSp
GO

/* $Header: ApplicationDB\Stored Procedures\MaintSitePartitFuncAndSchemeSp.sp 10.8.0.0 10/25/2018 15:27:49 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/MaintSitePartitFuncAndSchemeSp.sp $
 * CoreDev 3 248905 DJohnson Thu Oct 25 2018
 * Add dbo. schema to path where missing.
 *
 * CoreDev 2 248405 DJohnson Thu Oct 04 2018
 * Add dbo. schema to path where missing.
 *
 * CoreDev 1 RS5077 Djohnson Fri Aug 01 16:36:23 2014
 * Shortened names (30 or less) for existing procedures.
 *
 * CoreDev 1 RS5905 Jray Thu May 16 16:59:59 2013
 * RS5905: Sp to handle creating site partition function and scheme, if necessary, or to alter them to support a new site
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.MaintSitePartitFuncAndSchemeSp (
   @PSite SiteType = NULL
 , @PAddSite ListYesNoType --  '0' -> Remove Site; '1' -> Add Site -- At this time, only Add Site is supported
)
AS
SET @PSite = dbo.DefaultToLocalSite(@PSite)

-- Check for existence of Generic External Touch Point routine 
IF OBJECT_ID(N'dbo.EXTGEN_MaintSitePartitFuncAndSchemeSp') IS NOT NULL  
BEGIN  
   DECLARE @EXTGEN_SpName sysname  
   SET @EXTGEN_SpName = N'dbo.EXTGEN_MaintSitePartitFuncAndSchemeSp'  
   -- Invoke the ETP routine, passing in (and out) this routine's parameters: 
   EXEC @EXTGEN_SpName
      @PSite
    , @PAddSite

   -- ETP routine must take over all desired functionality of this standard routine: 
   RETURN 0 
END 
-- End of Generic External Touch Point code

DECLARE
   @SQL NVARCHAR(MAX) = NULL
 , @SQLParms NVARCHAR(MAX) = NULL
 , @SitePartitionFunction NVARCHAR(13) = N'SitePFunction'
 , @SitePartitionScheme NVARCHAR(11) = N'SitePScheme'
 , @SitePFunctionExists ListYesNoType
 , @SitePSchemeExists ListYesNoType
 , @CurrentDeadlockPriority int

SET @SitePFunctionExists = dbo.SitePartitionFunctionExists(@SitePartitionFunction)
SET @SitePSchemeExists = dbo.SitePartitionSchemeExists(@SitePartitionScheme)

IF @PAddSite = 1 -- Add a Site (I.e. Create for new site OR Split to prepare for another site)
BEGIN
   -- If Site Partition Scheme exists (then Site Partition Function will exist)
   -- Split a partition to add a site

   SELECT @CurrentDeadlockPriority = deadlock_priority FROM sys.dm_exec_sessions
   WHERE session_id = @@SPID
   SET DEADLOCK_PRIORITY 10

   IF @SitePSchemeExists = 1
   BEGIN
      -- Specify Filegroup for new partition
      SET @SQL = N'ALTER PARTITION SCHEME [SitePScheme] NEXT USED [PRIMARY]'
      EXEC sys.sp_executesql @SQL
      
      -- Split site partition function to add partition for new site
      SET @SQLParms = N'@PSite SiteType'
      SET @SQL = N'ALTER PARTITION FUNCTION [SitePFunction]() SPLIT RANGE (@PSite)'
      EXEC sys.sp_executesql
         @statement = @SQL
       , @params    = @SQLParms
       , @PSite     = @PSite    
   END
   ELSE -- Site Partition Scheme did not exist
   BEGIN
      -- If Site Partition Function does not exist, create it with new site
      IF @SitePFunctionExists = 0
      BEGIN
         SET @SQLParms = N'@PSite SiteType'
         SET @SQL = N'CREATE PARTITION FUNCTION [SitePFunction](NVARCHAR(8)) AS RANGE LEFT FOR VALUES (@PSite)'
         EXEC sys.sp_executesql
            @statement = @SQL
          , @params    = @SQLParms
          , @PSite     = @PSite
      END
      ELSE
      BEGIN
         -- Split site partition function to add partition for new site
         SET @SQLParms = N'@PSite SiteType'
         SET @SQL = N'ALTER PARTITION FUNCTION [SitePFunction]() SPLIT RANGE (@PSite)'
         EXEC sys.sp_executesql
            @statement = @SQL
          , @params    = @SQLParms
          , @PSite     = @PSite 
      END
      -- Create Site Partition Scheme
      SET @SQL = N'CREATE PARTITION SCHEME [SitePScheme] AS PARTITION [SitePFunction] ALL TO ([PRIMARY])'
      EXEC sys.sp_executesql @SQL
   END
   SET DEADLOCK_PRIORITY @CurrentDeadlockPriority
END

SET @SQL = NULL

RETURN 0
GO
