SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

DECLARE @SiteList NVARCHAR(MAX)
DECLARE @SiteRef SiteType
SELECT @SiteList = COALESCE(@SiteList+',', '') + site
FROM dbo.GetSiteListByTableName('AccountAuthorizations_mst')

SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
   SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))
   EXEC [dbo].[SetSiteSp] @SiteRef, ''
 
DECLARE @ObjectName NVARCHAR(50)
DECLARE @ID decimal

-- developer group

SET @ID = (SELECT GroupId from GroupNames where GroupName = 'CoreFormsDeveloper')
IF @ID IS NOT NULL
BEGIN

SET @ObjectName = 'WSFormWizardCategories'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormExtension'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormRuntimeBuilderSelection'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardBase'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardCategoryTile'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicBase'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicBuildFromScratch'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicDetailOnly'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicGridDetail'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicGridOnly'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicMultiView'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicQuery'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicReport'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardClassicTile'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardExtend'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardNewDataBase'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardNewDataMaintenance'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardNewDataXmlToIdo'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardSelection'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSFormWizardTile'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdBase'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditAggregateBinding'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditAlphaNumericValidatorParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditBinaryValueAction'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditBindingTree'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditBrowserBindingSpec'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditCalendarSettings'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditChartSettings'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditCollectionAction'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditCollectionIDBinding'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditColor'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditCommaDelimitedListDlg'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditCommaDelimitedListEntryDlg'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditConditionalActionsAction'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditConditionalActionsCondition'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditConditionalActionsList'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditConditionalActionsValue'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditDataSourceCollection'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditDataViewSettings'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditDeviceTypes'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditDisplaySpec'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditDragDropEventList'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditEventHandlerGenericsBase'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditExpressionBinding'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditFilter'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditFilterBinding'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditFilterPropertyAttributes'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditFont'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditGaugeCriticalInputSettings'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditGaugeSettings'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditGenAppEventParm'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditGenAppEventParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditGenAppEventValidatorParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditInlineListEntries'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditInvokeUserControlParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditLinkBySpec'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditListSource'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditListValidatorParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditLoadCollectionEventHandlerParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditMessageText'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditMethodParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditOleMethodCall'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditOleValidatorParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditPrompt'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditPropertiesSpec'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditPropertyBinding'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditPropertySpec'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSetValuePair'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSetValuePairs'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSetValues'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSetValuesDlg'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoExpandableAreaParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoMessageDialogParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoRichTextEditorParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoSliderParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoSwapListParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoTicksColorSliderParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoTreeParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoWizardSliderParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoXiNewAccordionParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditSoHoXiTabsSubHeadingParameters'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditTimerAction'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditUserComponentParametersBase'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditUserControl'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditVariableBinding'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdEditWebAsset'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdExtendedFormDetails'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetAuditLogEntry'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetBackgroundTask'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetCollectionOptions'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetCommandLine'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetEventToGenerate'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetFormRunOptions'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetFormRunOptionsDlg'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetGeographicLocation'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetScriptNameAndParms'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetScriptNameAndParmsDlg'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGetWebContainerMessage'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdGoToExplorerFolder'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdLoadSaveOverrides'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdNewGlobalScriptName'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdResponsiveBreakpoint'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdSelectFilterDlg'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdSelectFormPage'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdSelectImage'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdSelectObject'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdSelectSecondaryCollection'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdSelectUpdInsDelPqSpec'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

SET @ObjectName = 'WSExpEdSetInlineScriptLanguage'
IF NOT EXISTS (SELECT 1 FROM AccountAuthorizations WHERE ObjectName1 = @ObjectName AND ObjectType = 0 AND ObjectName2 = @ObjectName AND UserFlag = 0 AND Id = @ID)
INSERT AccountAuthorizations
(ObjectName1, ObjectType, ObjectName2, UserFlag, Id, ReadPrivilege, UpdatePrivilege, BulkUpdatePrivilege, InsertPrivilege, DeletePrivilege, EditPrivilege, ExecutePrivilege, CreatedBy, UpdatedBy)
VALUES (@ObjectName, 0, @ObjectName, 0, @ID, 1, 1, 1, 1, 1, 1, 1, 'sa', 'sa')

END

-- Strip @SiteRef from the List
SET @SiteList = 
    SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList))

END

GO
