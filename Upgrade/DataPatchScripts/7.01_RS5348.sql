DECLARE @F213 varchar(50), @F214 varchar(50)

DECLARE @F404 varchar(50)

DECLARE @ID decimal

SET @F213 = 'ApplyDatabase'
SET @F214 = 'SqlDataTypes'

SET @F404 = 'SqlTableKeys'

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsEndUser')
IF @ID IS NOT NULL
BEGIN

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F213 AND ObjectType = 0 AND ObjectName2 = @F213 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F213, 0, @F213, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

END

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreIDOs')
IF @ID IS NOT NULL
BEGIN

IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @F404 AND ObjectType = 2 AND ObjectName2 = @F404 AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@F404, 2, @F404, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')
END

