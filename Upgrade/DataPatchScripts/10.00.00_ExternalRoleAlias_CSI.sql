/* RS-8305 "External Role Aliases"
 * Default values to emulate legacy "prefix" concept
 * Reference old Jira: COMPANYON-16061 (https://jira.infor.com/browse/COMPANYON-16061)
 */

----------------------------------------------------
-- Mongoose standard GROUPS
----------------------------------------------------
IF EXISTS(SELECT 1 FROM [GroupNames] WHERE [GroupName] = N'CoreFormsAdmin')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-UG-CoreFormsAdmin')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [GroupName] = N'CoreFormsAdmin')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [GroupName]) VALUES (N'MONGOOSE-UG-CoreFormsAdmin', N'CoreFormsAdmin')
END

IF EXISTS(SELECT 1 FROM [GroupNames] WHERE [GroupName] = N'CoreFormsDeveloper')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-UG-CoreFormsDeveloper')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [GroupName] = N'CoreFormsDeveloper')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [GroupName]) VALUES (N'MONGOOSE-UG-CoreFormsDeveloper', N'CoreFormsDeveloper')
END

IF EXISTS(SELECT 1 FROM [GroupNames] WHERE [GroupName] = N'CoreFormsEndUser')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-UG-CoreFormsEndUser')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [GroupName] = N'CoreFormsEndUser')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [GroupName]) VALUES (N'MONGOOSE-UG-CoreFormsEndUser', N'CoreFormsEndUser')
END

IF EXISTS(SELECT 1 FROM [GroupNames] WHERE [GroupName] = N'CoreIDOs')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-UG-CoreIDOs')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [GroupName] = N'CoreIDOs')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [GroupName]) VALUES (N'MONGOOSE-UG-CoreIDOs', N'CoreIDOs')
END


----------------------------------------------------
-- Mongoose standard LICENSE MODULES
----------------------------------------------------
IF EXISTS(SELECT 1 FROM [Modules] WHERE [ModuleName] = N'MGCoreAutomation')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGCoreAutomation')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGCoreAutomation')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGCoreAutomation', N'MGCoreAutomation')
END

IF EXISTS(SELECT 1 FROM [Modules] WHERE [ModuleName] = N'MGCoreTrans')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGCoreTrans')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGCoreTrans')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGCoreTrans', N'MGCoreTrans')
END

IF EXISTS(SELECT 1 FROM [Modules] WHERE [ModuleName] = N'MGDataViews')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGDataViews')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGDataViews')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGDataViews', N'MGDataViews')
END

IF EXISTS(SELECT 1 FROM [Modules] WHERE [ModuleName] = N'MGDeveloper')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGDeveloper')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGDeveloper')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGDeveloper', N'MGDeveloper')
END

IF EXISTS(SELECT 1 FROM [Modules] WHERE [ModuleName] = N'MGUserCreatedForms')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGUserCreatedForms')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGUserCreatedForms')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGUserCreatedForms', N'MGUserCreatedForms')
END

IF EXISTS(SELECT 1 FROM [Modules] WHERE [ModuleName] = N'MGUserCreatedIDOs')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGUserCreatedIDOs')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGUserCreatedIDOs')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGUserCreatedIDOs', N'MGUserCreatedIDOs')
END

IF EXISTS(SELECT 1 FROM [Modules] WHERE [ModuleName] = N'MGAppBuilder')
BEGIN
   IF  NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ExternalRoleName] = N'MONGOOSE-LM-MGAppBuilder')
   AND NOT EXISTS(SELECT 1 FROM [ExternalRoleAlias] WHERE [ModuleName] = N'MGAppBuilder')
      INSERT INTO [ExternalRoleAlias]  ([ExternalRoleName], [ModuleName]) VALUES (N'MONGOOSE-LM-MGAppBuilder', N'MGAppBuilder')
END

   