SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

DECLARE @SiteList NVARCHAR(MAX)
DECLARE @SiteRef SiteType
SELECT @SiteList = COALESCE(@SiteList+',', '') + site
FROM dbo.GetSiteListByTableName('AccountAuthorizations_mst')

SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
   SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))
   EXEC [dbo].[SetSiteSp] @SiteRef, ''

DECLARE @ObjectName sysname
DECLARE @ID decimal

--then core ido group
SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreIDOs')
IF @ID IS NOT NULL
BEGIN
   SET @ObjectName = 'TABLE!user_class_record_assoc'
   IF EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 2 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
	DELETE FROM AccountAuthorizations
	WHERE ObjectName1 = @ObjectName AND ObjectType = 2 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID
END

-- Strip @SiteRef from the List
SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList))

END

GO

