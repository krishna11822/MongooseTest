Declare @Site SiteType

IF OBJECT_ID('dbo.parms_mst') IS NOT NULL 
BEGIN
	SELECT
	@Site = site
	FROM parms_mst
	WHERE parm_key = 0
END
ELSE
BEGIN
	SELECT
	@Site = site
	FROM parms
	WHERE parm_key = 0
END

DECLARE @Infobar InfobarType
SET @Infobar = NULL
EXEC SetSiteSp @Site, @Infobar=@Infobar OUTPUT
GO


DECLARE @ID decimal
DECLARE @F639 SYSNAME
DECLARE @F640 SYSNAME
DECLARE @F641 SYSNAME
DECLARE @F642 SYSNAME


SET @F640 = 'IdoEditInlineList'
SET @F641 = 'IdoEditValidators'

SET @F639 = 'ViewManagement'
SET @F642 = 'ReplDocScriptGenerator'

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsDeveloper')
IF @ID IS NOT NULL
BEGIN
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F640 AND ObjectType = 0 AND ObjectName2 = @F640 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F640, 0, @F640, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F641 AND ObjectType = 0 AND ObjectName2 = @F641 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F641, 0, @F641, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
END

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsAdmin')
IF @ID IS NOT NULL
BEGIN
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F639 AND ObjectType = 0 AND ObjectName2 = @F639 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F639, 0, @F639, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F642 AND ObjectType = 0 AND ObjectName2 = @F642 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F642, 0, @F642, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
END
