IF  EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGPAAS')
BEGIN
   DELETE FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGPAAS'
END
