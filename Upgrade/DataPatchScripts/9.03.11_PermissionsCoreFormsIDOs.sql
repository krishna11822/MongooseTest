SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.11_PermissionsCoreFormsIDOs.sql 2     9/15/17 1:34p Jmorris $ */
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
DECLARE @SiteList NVARCHAR(MAX)
DECLARE @SiteRef SiteType
SELECT @SiteList = COALESCE(@SiteList+',', '') + site
FROM dbo.GetSiteListByTableName('AccountAuthorizations_mst')

SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
   SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))
   EXEC [dbo].[SetSiteSp] @SiteRef, ''

DECLARE @ID int, @ObjectName sysname
--SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsDeveloper')
--IF @ID IS NOT NULL
--BEGIN


--END
SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsAdmin')
IF @ID IS NOT NULL
BEGIN
   SET @ObjectName = 'ReportPaperSizes'
   IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
   INSERT AccountAuthorizations
   (ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
   VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

END


--SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreIDOs')
--IF @ID IS NOT NULL
--BEGIN


--END
      -- Strip @SiteRef from the List
    SET @SiteList = 
         SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList))

END

GO

-- ***************************************
-- Cloud Infor-SystemAdministrator admin group
-- Clone the associations to the Mongoose "CoreFormsAdmin" group
-- EXCEPT operator guards against inserting already present rows.
-- ***************************************
DECLARE @IDCFA decimal          -- group CoreFormsAdmin
DECLARE @IDISA decimal          -- group Infor-SystemAdministrator

SET @IDCFA = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsAdmin')
SET @IDISA = (SELECT GroupId from GroupNames where GroupName = 'Infor-SystemAdministrator')

IF (@IDCFA IS NOT NULL) AND (@IDISA IS NOT NULL)
BEGIN
INSERT INTO [AccountAuthorizations_mst]
   ([SiteRef]
   ,[ObjectName1]
   ,[ObjectType]
   ,[ObjectName2]
   ,[UserFlag]
   ,[Id]
   ,[ReadPrivilege]
   ,[UpdatePrivilege]
   ,[BulkUpdatePrivilege]
   ,[InsertPrivilege]
   ,[DeletePrivilege]
   ,[EditPrivilege]
   ,[ExecutePrivilege]
   ,[NoteExistsFlag]
   ,[CreatedBy]
   ,[UpdatedBy]
   )
     ( SELECT
      [SiteRef]
      ,[ObjectName1]
      ,[ObjectType]
      ,[ObjectName2]
      ,[UserFlag]
      ,@IDISA
      ,[ReadPrivilege]
      ,[UpdatePrivilege]
      ,[BulkUpdatePrivilege]
      ,[InsertPrivilege]
      ,[DeletePrivilege]
      ,[EditPrivilege]
      ,[ExecutePrivilege]
      ,[NoteExistsFlag]
      ,[CreatedBy]
      ,'sa'
   FROM [AccountAuthorizations_mst] xxx WHERE xxx.[Id] = @IDCFA
   AND NOT EXISTS (SELECT 1
   FROM [AccountAuthorizations_mst] yyy
   WHERE yyy.[Id] = @IDISA
   and xxx.ObjectName1 = yyy.ObjectName1
   AND xxx.ObjectType = yyy.ObjectType
   AND xxx.ObjectName2 = yyy.ObjectName2
   AND xxx.UserFlag = yyy.UserFlag
   AND xxx.SiteRef = yyy.SiteRef
   )
   )
END

GO
