/* $Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.01_IDOFilters.sql 1     8/28/14 2:19a rzamoranos $ */
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
/* $Archive: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.01_IDOFilters.sql $
 *
 *
 */
 
-- ============================================================
--  RS #: 6746
-- ============================================================

DECLARE @ID  decimal
	   ,@F1  varchar(50)
	   ,@F2  varchar(50)
	   ,@F3  varchar(50)

SET @F1 = 'ReportOptions'
SET @F2 = 'CoreFormsEndUser'
SET @F3 = '(Username = dbo.UserNameSp())'

SET @ID = (SELECT GroupId from GroupNames where GroupName = @F2)
IF @ID IS NOT NULL
BEGIN
	IF NOT EXISTS (SELECT 1 FROM IDOFilter WHERE CollectionName = @F1 AND GroupName = @F2 AND Filter = @F3 AND UserName IS NULL)
	INSERT IDOFilter
	([CollectionName],[GroupName],[Filter],[CreatedBy],[UpdatedBy])
	VALUES (@F1, @F2, @F3, 'sa', 'sa')
END