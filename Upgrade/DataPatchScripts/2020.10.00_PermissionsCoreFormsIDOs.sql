Declare
   @SiteList  NVARCHAR(max),
   @SiteRef   SiteType,
   @Infobar   InfoBarType
-- Build the list of Sites in this Database
SELECT @SiteList = COALESCE(@SiteList+',', '') + site FROM parms_mst
SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
   SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))    
   EXEC [dbo].[SetSiteSp] @SiteRef, @Infobar OUTPUT


   -- INSERT YOUR CODE HERE
   DECLARE @ObjectName NVARCHAR(50)
   DECLARE @ObjectName2 NVARCHAR(50)
   DECLARE @ID decimal


   SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsAdmin')
   IF @ID IS NOT NULL
   BEGIN
      SET @ObjectName = 'ExternalEntityMaster'
      IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
      INSERT AccountAuthorizations
      (ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
      VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

      SET @ObjectName = 'ExternalRoleAliasMaint'
      IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
      INSERT AccountAuthorizations
      (ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
      VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

   END

   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

GO
