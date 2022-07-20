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


IF NOT EXISTS (SELECT 1 FROM DefaultTypes WHERE DefaultType = 19)
insert into DefaultTypes (DefaultType, DefaultTypeDesc, AllowUserDfltFlag)
values (19, N'Non Unicode Literal', 0)
GO

DECLARE @F211 varchar(50), @F212 varchar(50)

DECLARE @F401 varchar(50), @F402 varchar(50), @F403 varchar(50)
DECLARE @F627 varchar(50), @F628 varchar(50), @F629 varchar(50)
DECLARE @F630 varchar(50)

DECLARE @ID decimal

SET @F211 = 'IdoLinkedDatabases'
SET @F212 = 'IdoLinkTable'

SET @F401 = 'IdoLinkedTables'
SET @F402 = 'IdoLinkedDatabases'
SET @F403 = 'IdoLinkedColumns'

SET @F627 = 'TABLE!LongRowPointerMap'
SET @F628 = 'TABLE!IdoLinkedColumn'
SET @F629 = 'TABLE!IdoLinkedTable'
SET @F630 = 'TABLE!IdoLinkedDatabase'

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsEndUser')
IF @ID IS NOT NULL
BEGIN

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F211 AND ObjectType = 0 AND ObjectName2 = @F211 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F211, 0, @F211, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F212 AND ObjectType = 0 AND ObjectName2 = @F212 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F212, 0, @F212, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

END

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreIDOs')
IF @ID IS NOT NULL
BEGIN

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F401 AND ObjectType = 2 AND ObjectName2 = @F401 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F401, 2, @F401, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F402 AND ObjectType = 2 AND ObjectName2 = @F402 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F402, 2, @F402, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F403 AND ObjectType = 2 AND ObjectName2 = @F403 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F403, 2, @F403, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F627 AND ObjectType = 2 AND ObjectName2 = @F627 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F627, 2, @F627, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F628 AND ObjectType = 2 AND ObjectName2 = @F628 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F628, 2, @F628, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F629 AND ObjectType = 2 AND ObjectName2 = @F629 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F629, 2, @F629, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F630 AND ObjectType = 2 AND ObjectName2 = @F630 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F630, 2, @F630, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

END
