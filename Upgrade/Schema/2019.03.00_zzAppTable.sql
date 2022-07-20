IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'LicenseSessionUsageTracking')
INSERT INTO AppTable ([TableName],
    [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
    [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
    [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
    [InheritorTableList],
    [ModuleName], [AppViewName], [SiteColumnName])
VALUES (N'LicenseSessionUsageTracking',
    NULL, NULL, 1, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    NULL,
    N'Core', NULL, NULL)

GO

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'LicenseObjectUsageTracking')
INSERT INTO AppTable ([TableName],
    [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
    [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
    [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
    [InheritorTableList],
    [ModuleName], [AppViewName], [SiteColumnName])
VALUES (N'LicenseObjectUsageTracking',
    NULL, NULL, 1, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    NULL,
    N'Core', NULL, NULL)

GO


