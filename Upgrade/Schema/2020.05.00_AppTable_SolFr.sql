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

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtFormComponentGroups')
INSERT INTO AppTable ([TableName],
    [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
    [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
    [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
    [InheritorTableList],
    [ModuleName], [AppViewName], [SiteColumnName])
VALUES (N'FrtFormComponentGroups',
    NULL, NULL, 1, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    NULL,
    N'Core', NULL, NULL)

GO





