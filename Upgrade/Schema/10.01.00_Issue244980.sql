/* 
* Issue 244980 - R.Shilts  26-Apr-2018
* Table:  ExternalRoleAliases
*         Remove foreign key constraint on Group and Module tables.
*
*/
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'ExternalRoleAlias'
           AND   CONSTRAINT_NAME = 'FK_ExternalRoleAlias_Group')
BEGIN
   ALTER TABLE [dbo].[ExternalRoleAlias]
   DROP CONSTRAINT [FK_ExternalRoleAlias_Group]
END


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'ExternalRoleAlias'
           AND   CONSTRAINT_NAME = 'FK_ExternalRoleAlias_Module')
BEGIN
   ALTER TABLE [dbo].[ExternalRoleAlias]
   DROP CONSTRAINT [FK_ExternalRoleAlias_Module]
END


GO
