SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[SchemaTablesView]'))
DROP VIEW [dbo].[SchemaTablesView]
GO
-- =================================================================================
-- Stored Procedure: SchemaTablesView
-- This view retrieves user table and view information for the current database.
-- The data is retrieved from the INFORMATION_SCHEMA.TABLES system view and is
-- filtered to exclude some internal-use-only tables.
-- =================================================================================
/* $Header: /Tools/SQLScripts/ApplicationDB/Views/SchemaTablesView.sql 14    4/03/14 3:04a Hdu $ */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Views/SchemaTablesView.sql $
 *
 * CoreDev 14 175488 Hdu Thu Apr 03 03:04:17 2014
 * SLTables view WHERE clause does not catch all SL tmp tables.
 * 175488:And condition: AND  tab.name NOT LIKE '%[_]tmp[_]%'
 *
 * CoreDev 13 164271 Pgross Tue Sep 17 09:02:15 2013
 * Error attempting to add table that begins with tt_
 * replaced tt restriction with a call to IsAppHandledRestrictedTable
 *
 * CoreDev 12 rs4588 Dahn Mon Mar 08 09:03:20 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 11 rs3953 Dahn Tue Aug 26 15:51:57 2008
 * changing copyright header (rs3953)
 *
 * $NoKeywords: $
 */
CREATE VIEW [dbo].[SchemaTablesView]
AS
SELECT
  [TABLE_NAME]
, [TABLE_TYPE]
FROM [INFORMATION_SCHEMA].[TABLES]
WHERE [TABLE_NAME] != 'dtproperties'
  AND [TABLE_NAME] NOT LIKE '%[_]all'
  AND [TABLE_NAME] NOT LIKE '%[_]committed'
  AND [TABLE_NAME] NOT LIKE '%[_]impacted'
  AND [TABLE_NAME] NOT LIKE 'tmp[_]%'
  AND [TABLE_NAME] NOT LIKE '%[_]dd'
  AND [TABLE_NAME] NOT LIKE '%[_]ii'
  AND [TABLE_NAME] NOT LIKE '%[_]tmp[_]%'
  AND [TABLE_NAME] NOT LIKE 'tempFormSync[_]%'
  AND dbo.IsAppHandledRestrictedTable([TABLE_NAME]) = 0
GO
