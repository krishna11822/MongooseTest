/****** Object:  UserDefinedFunction [dbo].[GetSiteListByTableName]    Script Date: 08/28/2014 13:31:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.GetSiteListByTableName') IS NOT NULL
   DROP FUNCTION dbo.GetSiteListByTableName
GO

/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/PreUpgradeScripts/9.01_GetSiteListByTableName.sp 1     7/26/16 4:26p Jmorris $ */ 
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
/* $Archive: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/PreUpgradeScripts/9.01_GetSiteListByTableName.sp $
 *
 * CoreDev 6 190932 Lzhan Tue Apr 26 01:42:19 2016
 * The function, dbo.GetSiteListByTableName, should be obsoleted within SL9.01 as it exists in CoreDev (MG9.02)
 * Issue 190932: removed  redundant IF condition.
 *
 * CoreDev 5 190932 Lzhan Sun Apr 24 22:42:50 2016
 * The function, dbo.GetSiteListByTableName, should be obsoleted within SL9.01 as it exists in CoreDev (MG9.02)
 * Issue 190932: corrected sql syntax.
 *
 * CoreDev 4 190932 Lzhan Sun Apr 24 22:32:02 2016
 * The function, dbo.GetSiteListByTableName, should be obsoleted within SL9.01 as it exists in CoreDev (MG9.02)
 * Issue 190932: applied the changes from SyteLine application function, removed the function on the SyteLine application functions.
 *
 * CoreDev 3 190836 Nthurn Tue Feb 03 18:24:52 2015
 * Function dbo.GetSiteListByTableName() fails to output a Site for which an Intranet has never been assigned
 * Allow output of Sites that have no Intranet defined.  (Issue 190836)
 *
 * CoreDev 2 185664 Jmorris Mon Sep 29 14:22:27 2014
 * Existence checking error in GetSiteListByTableName
 * 185664 - incorrect existence checking
 *
 * CoreDev 1 RS6746 rzamoranos Thu Aug 28 17:58:59 2014
 * Pulled this from SL9 OH_App DB. Used in 9.01_PermissionsCoreFormsIDOs.sql DataPatchScript.
 *
 * SL9.00 3 175397 pcoate Thu Apr 03 17:03:03 2014
 * Create SL9 Initialized Database and Customer and Vendor Portal Groups missing Bootstrap and Account Authorizations
 * Issue 175397 - Made benign change to associate latest version with this issue.  I simply changed logic indentation.
 *
 * SL9.00 2 171616 Cliu Thu Apr 03 04:22:40 2014
 * Incorrect and missing forms in authorization groups
 * Issue:171616
 * Change to use a different method to determine whether or not an “mst*” table is shared 
 * 1.	For a non-master site that is not in the same db as the master site, an mst or mst_all object will be a view if it is shared
 * 2.	If the mst or mst_all object is a table and master site is specified for intranet associated with current site, then the IntranetSharedUserTable or IntranetSharedTable table can be checked to see if the mst or mst_all is shared.
 *
 * SL9.00 1 171616 Cliu Wed Mar 26 01:57:12 2014
 * Incorrect and missing forms in authorization groups
 * Issue:171616
 * Add a new function to return the list of sites to process.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION [dbo].[GetSiteListByTableName] (
  @TableName SYSNAME
)
RETURNS 
    @SiteSet TABLE (site  NVARCHAR(8))
AS
BEGIN
   -- a.Non-Shared table                                            returns all sites in parms_mst
   -- b.Shared table
   --    i.Master Site is contained within the application db       returns master site
   --    ii.Master Site is not contained within the application db  returns no sites

   DECLARE
     @ParmsSite   SiteType
   , @MasterSite  SiteType
   , @IntranetName   IntranetNameType

   SELECT TOP 1
        @ParmsSite    = parms_mst.site
      , @MasterSite   = intranet.MasterSite
      , @IntranetName = intranet.intranet_name
   FROM parms_mst WITH (READUNCOMMITTED)
   INNER JOIN site WITH (READUNCOMMITTED) ON 
      parms_mst.site = site.site
   INNER JOIN intranet WITH (READUNCOMMITTED) ON
      site.intranet_name = intranet.intranet_name
   
   IF @IntranetName IS NULL
   BEGIN
      INSERT INTO @SiteSet(site)
      SELECT
         site
      FROM parms_mst WITH (READUNCOMMITTED)
   END
   ELSE
   BEGIN
      IF NOT (@ParmsSite <> @MasterSite AND 
              NOT EXISTS (SELECT 1 FROM parms_mst WHERE site = @MasterSite) AND 
              OBJECTPROPERTY (OBJECT_ID(@TableName),'IsView') = 1)
      BEGIN
         INSERT INTO @SiteSet(site)
         SELECT
            DISTINCT CASE 
                        WHEN shared = 0 THEN site
                        WHEN shared = 1 AND EXISTS (SELECT 1 FROM parms_mst WHERE site = MasterSite) THEN MasterSite
                     END   
         FROM
            (   
            SELECT 
                 parms_mst.site
               , CASE 
                     WHEN ist.Shared = 1 OR isut.Shared = 1 THEN 1
                     ELSE 0
                 END AS shared
               , intranet.MasterSite 
            FROM parms_mst WITH (READUNCOMMITTED)
            INNER JOIN site WITH (READUNCOMMITTED) ON 
               parms_mst.site = site.site
            LEFT OUTER JOIN intranet WITH (READUNCOMMITTED) ON
               site.intranet_name = intranet.intranet_name  
            LEFT JOIN IntranetSharedTable ist WITH (READUNCOMMITTED) ON
               ist.intranet_name = site.intranet_name AND ist.TableName = @TableName
            LEFT JOIN IntranetSharedUserTable isut WITH (READUNCOMMITTED) ON
               isut.IntranetName = site.intranet_name AND isut.TableName = @TableName
            ) AS SiteTemp
      END
   END
   RETURN
END
GO