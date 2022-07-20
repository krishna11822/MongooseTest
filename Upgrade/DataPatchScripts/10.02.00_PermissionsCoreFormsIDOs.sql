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

--then developer group

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsDeveloper')
IF @ID IS NOT NULL
BEGIN
SET @ObjectName = 'LogMonitor'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 2 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 2, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
END


--then the admin group

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsAdmin')
IF @ID IS NOT NULL
BEGIN
SET @ObjectName = 'LogMonitor'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 2 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 2, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
END

--then the appbuilder admin group

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'APPBUILDER-Administrator')
IF @ID IS NOT NULL
BEGIN
SET @ObjectName = 'IONAPIServers'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
END

-- Strip @SiteRef from the List
SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList))

END

GO

