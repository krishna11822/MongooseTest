SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--  Issue 248519: AppTable 'AuditLog' should have IgnoreInsert flag set to 0 (but was not in some init data versions)
DECLARE 
  @Infobar  InfobarType

SET @Infobar = NULL

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'AuditLog'
   AND IgnoreInsert = 1)
BEGIN

   UPDATE dbo.AppTable
   SET 
     IgnoreInsert = 0
   WHERE TableName = N'AuditLog'

   EXEC dbo.TriggerIupCodeWrapperSp
         @StartingTableName = N'AuditLog'
       , @EndingTableName   = N'AuditLog'
       , @Infobar           = @Infobar OUTPUT

END                  

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ServicePollingQueue')
BEGIN
   DELETE AppTable WHERE TableName = N'ServicePollingQueue'
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
   EXEC dbo.TriggerIupCodeWrapperSp
         @StartingTableName = N'ServicePollingQueue'
       , @EndingTableName   = N'ServicePollingQueue'
       , @Infobar           = @Infobar OUTPUT
END
GO
