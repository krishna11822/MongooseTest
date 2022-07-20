IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'SlovenianStrings')
INSERT INTO AppTable ([TableName],
    [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
    [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
    [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
    [InheritorTableList],
    [ModuleName], [AppViewName], [SiteColumnName])
VALUES (N'SlovenianStrings',
    NULL, NULL, 1, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    NULL,
    N'Core', NULL, NULL)

GO

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'LogMonitorPolicies')
INSERT INTO AppTable ([TableName],
    [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
    [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
    [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
    [InheritorTableList],
    [ModuleName], [AppViewName], [SiteColumnName])
VALUES (N'LogMonitorPolicies',
    NULL, NULL, 1, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    NULL,
    N'Core', NULL, NULL)

GO

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ServicePollingQueue')
INSERT INTO AppTable ([TableName],
    [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
    [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
    [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
    [InheritorTableList],
    [ModuleName], [AppViewName], [SiteColumnName])
VALUES (N'ServicePollingQueue',
    NULL, NULL, 0, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    NULL,
    N'Core', NULL, NULL)

GO

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'UserPreferences')
INSERT INTO AppTable ([TableName],
    [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
    [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
    [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
    [InheritorTableList],
    [ModuleName], [AppViewName], [SiteColumnName])
VALUES (N'UserPreferences',
    NULL, NULL, 1, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    NULL,
    N'Core', NULL, NULL)

GO



