DECLARE
   @SiteList  NVARCHAR(MAX),
   @SiteRef   SiteType,
   @Infobar   InfobarType,
   @ID decimal

-- Build the list of Sites in this Database
SELECT @SiteList = COALESCE(@SiteList+',', '') + site
FROM dbo.GetSiteListByTableName('AccountAuthorizations')

SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
	SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))

	EXEC [dbo].[SetSiteSp] @SiteRef, @Infobar OUTPUT

        SET @ID = NULL
        SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreIDOs')
	IF @ID IS NOT NULL
	BEGIN
		-- ============================================================
		--  Issue #: 147600
		-- ============================================================
		DECLARE @F715  varchar(50)
        SET @F715 = 'TimeZoneDatas'

		IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations_mst WHERE ObjectName1 = @F715 AND ObjectType = 2 AND ObjectName2 = @F715 AND UserFlag = 0 AND Id = @ID AND SiteRef = @SiteRef)
		INSERT INTO AccountAuthorizations
		(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
		VALUES (@F715, 2, @F715, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
        END

        SET @ID = NULL
	SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsEndUser')
	IF @ID IS NOT NULL
	BEGIN
		-- ============================================================
		--  Issue #: 147600
		-- ============================================================
		DECLARE @F1  varchar(50)
		SET @F1 = 'TaskList'

		IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations_mst WHERE ObjectName1 = @F1 AND ObjectType = 0 AND ObjectName2 = @F1 AND UserFlag = 0 AND Id = @ID AND SiteRef = @SiteRef)
		INSERT INTO AccountAuthorizations
		(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
		VALUES (@F1, 0, @F1, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
			 
		-- ============================================================
		--  RS #: 6746
		-- ============================================================
		DECLARE @F2  varchar(50)
			  , @F3  varchar(50)

		SET @F2 = 'ReportOptions'
		SET @F3 = 'UsernameGridCol'

		IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations_mst WHERE ObjectName1 = @F2 AND ObjectType = 0 AND ObjectName2 = @F2 AND UserFlag = 0 AND Id = @ID AND SiteRef = @SiteRef)
		INSERT AccountAuthorizations
		(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
		VALUES (@F2, 0, @F2, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

		IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations_mst WHERE ObjectName1 = @F2 AND ObjectType = 1 AND ObjectName2 = @F3 AND UserFlag = 0 AND Id = @ID AND SiteRef = @SiteRef)
		INSERT AccountAuthorizations
		(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, CreatedBy, UpdatedBy)
		VALUES (@F2, 1, @F3, 0, @ID, 0, 'sa', 'sa')

	END

   SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsAdmin')
   IF @ID IS NOT NULL
   BEGIN
      -- ============================================================
      --  RS #: 6267
      -- ============================================================
      DECLARE @F4 varchar(50)
      SET @F4 = 'WBDataSearchSourceSets' 
      DECLARE @F714 varchar(50) = 'TimeZoneData'

      IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations_mst WHERE ObjectName1 = @F4 AND ObjectType = 0 AND ObjectName2 = @F4 AND UserFlag = 0 AND Id = @ID AND SiteRef = @SiteRef)
      INSERT AccountAuthorizations
      (ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
      VALUES (@F4, 0, @F4, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

      IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations_mst WHERE ObjectName1 = @F714 AND ObjectType = 0 AND ObjectName2 = @F714 AND UserFlag = 0 AND Id = @ID AND SiteRef = @SiteRef)
      INSERT AccountAuthorizations
      (ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
      VALUES (@F714, 0, @F714, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
   END

		-- Strip @SiteRef from the List
		SET @SiteList = 
		SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList));

END
GO