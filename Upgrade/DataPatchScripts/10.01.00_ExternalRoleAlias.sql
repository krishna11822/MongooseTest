/* Issue 244980 - R.Shilts  26-Apr-2018
 * No longer require the ModuleNames.ModuleName to exist before assigning here.
 * This requires an extra check whenever we dereference a module (to make sure it really exists), but 
 * it solves the chicken-egg problem for license modules.
 */

----------------------------------------------------
-- Mongoose standard LICENSE MODULES
-- No check to see if it's really in the ModuleName table.
----------------------------------------------------
IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGCoreAutomation')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGCoreAutomation')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGCoreAutomation', N'MGCoreAutomation')
END

IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGCoreTrans')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGCoreTrans')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGCoreTrans', N'MGCoreTrans')
END

IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGDataViews')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGDataViews')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGDataViews', N'MGDataViews')
END

IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGDeveloper')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGDeveloper')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGDeveloper', N'MGDeveloper')
END

IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGUserCreatedForms')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGUserCreatedForms')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGUserCreatedForms', N'MGUserCreatedForms')
END

IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGUserCreatedIDOs')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGUserCreatedIDOs')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGUserCreatedIDOs', N'MGUserCreatedIDOs')
END

IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGPAAS')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGPAAS')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGPAAS', N'MGPAAS')
END

IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGAppBuilder')
AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGAppBuilder')
BEGIN
   INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGAppBuilder', N'MGAppBuilder')
END

