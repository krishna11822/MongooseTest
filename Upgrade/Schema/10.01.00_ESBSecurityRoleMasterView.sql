SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ESBSecurityRoleMasterView]'))
DROP VIEW [dbo].[ESBSecurityRoleMasterView]
GO

/* $Header: /Tools/SQLScripts/ApplicationDB/Views/ESBSecurityRoleMasterView.sql $ */
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


/* $Archive: /Tools/SQLScripts/ApplicationDB/Views/ESBSecurityRoleMasterView.sql $
 *
 * Purpose: Return all "roles" - Mongoose GroupNames and ModuleNames
 *
 * RS-8305 & Issue 244696 R.Shilts 12-Apr-2018
 * Extend a 'Role' from original GroupName to include ModuleNames.
 * Note: this is assuming GroupNames are distinct from ModuleNames (also from ERA ReqSet 8305)
 *
 * RS-8305 R.Shilts 14-Mar-2018
 * "External Role Aliases" - retrieve an external group name too
 *
 * CoreDev 1 194897 Tcecere Thu May 28 14:35:10 2015
 * RS7309 - issue coding
 * Issue 194897 - Initial Code for ESBSecurityRoleMasterView
 *
 * $NoKeywords: $
 */
CREATE VIEW [dbo].[ESBSecurityRoleMasterView]
AS

-- Groups
SELECT 
   GN.GroupName AS 'DerBODID',
   GN.GroupName AS 'GroupName',
   GN.GroupDesc AS 'GroupDesc',
   COALESCE( ERA.ExternalRoleName, GN.GroupName) AS 'ExternalGroupName'        -- external role name
FROM GroupNames GN
LEFT OUTER JOIN ExternalRoleAlias ERA
ON (ERA.GroupName = GN.GroupName)
-- add Modules
UNION
SELECT 
   MN.ModuleName AS 'DerBODID',
   MN.ModuleName AS 'GroupName',
   COALESCE( MN.ModuleDescription, 'Module') AS 'GroupDesc',
   COALESCE( ERA.ExternalRoleName, MN.ModuleName) AS 'ExternalGroupName'        -- external role name
FROM Modules MN
LEFT OUTER JOIN ExternalRoleAlias ERA
ON (ERA.ModuleName = MN.ModuleName)

GO


