DECLARE @SiteList NVARCHAR(MAX)
DECLARE @SiteRef SiteType
SELECT @SiteList = COALESCE(@SiteList+',', '') + site
FROM dbo.GetSiteListByTableName('AccountAuthorizations_mst')

SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
   SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))
   EXEC [dbo].[SetSiteSp] @SiteRef, ''


DECLARE @ObjectName NVARCHAR(50)
DECLARE @ObjectName2 NVARCHAR(50)
DECLARE @ID decimal

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsEndUser')

IF @ID IS NOT NULL
BEGIN

SET @ObjectName = 'WBDataViewEditExpressionSummaries'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

END

-- Strip @SiteRef from the List
SET @SiteList = 
    SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList))

END