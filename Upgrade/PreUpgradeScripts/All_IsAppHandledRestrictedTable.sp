SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.IsAppHandledRestrictedTable') IS NOT NULL
    DROP FUNCTION dbo.IsAppHandledRestrictedTable
GO
/* $Header: ApplicationDB\PreTableObjects\IsAppHandledRestrictedTable.sp 10.8.0.0 10/29/2018 13:51:49 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/IsAppHandledRestrictedTable.sp $
 *
 * CoreDev 2 RS7915 Exia Fri Feb 17 04:21:03 2017
 * RS7915
 * Call App_IsAppHandledRestrictedTable if exists
 *
 * CoreDev 1 164271 Pgross Tue Sep 17 09:00:11 2013
 * Error attempting to add table that begins with tt_
 * hook to allow the developer to restrict tables
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.IsAppHandledRestrictedTable (
   @TableName SYSNAME
)
RETURNS ListYesNoType
BEGIN
   DECLARE @ReturnValue ListYesNoType
   SET @ReturnValue = 0
   IF OBJECT_ID('dbo.App_IsAppHandledRestrictedTable') IS NOT NULL
      SELECT @ReturnValue = dbo.App_IsAppHandledRestrictedTable(@TableName)

   RETURN @ReturnValue 
END
GO
