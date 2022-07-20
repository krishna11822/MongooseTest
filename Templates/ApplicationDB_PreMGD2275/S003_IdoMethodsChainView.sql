SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON 
GO

IF object_id('dbo.IdoMethodsChainView') IS NOT NULL
   DROP VIEW dbo.IdoMethodsChainView
GO

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
*   (c) COPYRIGHT 2012 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/


/* $Archive: /Tools/SQLScripts/ApplicationDB/Views/IdoMethodsChainView.sql $
 *
 * CoreDev 1 238807 Gmalakar Mon Mar 12 10:29:07 2012
 * Issue 238807: Methods view through IDO inheritance chain.
 *
 * $NoKeywords: $
 */
CREATE VIEW dbo.IdoMethodsChainView
AS
SELECT
         c.[BaseCollectionName]
	,c.[CollectionName]
	,imv.[MethodName]
	,imv.[MethodType]
	,imv.[StoredProcName]
	,imv.[MethodDesc]
	,imv.[RecordDate]
	,imv.[CreateDate]
	,imv.[RowPointer]
FROM dbo.CollectionHierarchy() c
INNER JOIN IdoMethodsView imv ON
  imv.CollectionName = c.CollectionName
GO
