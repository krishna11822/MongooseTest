Declare
   @SiteList  NVARCHAR(max),
   @SiteRef   SiteType,
   @Infobar   InfoBarType
-- Build the list of Sites in this Database
SELECT @SiteList = COALESCE(@SiteList+',', '') + site FROM parms_mst
SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
   SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))    
   EXEC [dbo].[SetSiteSp] @SiteRef, @Infobar OUTPUT

   -- INSERT YOUR CODE HERE

DECLARE @ReplDocOutbound_Save TABLE (
  AppliesToIDOName       CollectionNameType
, AppliesToIDOAction     CollectionActionType
, AppliesToIDOMethodName MethodNameType
, LastManualPublishDate  DateTimeType
, PRIMARY KEY (AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName)
)
DELETE FROM @ReplDocOutbound_Save
INSERT @ReplDocOutbound_Save 
   SELECT 
     rdo.AppliesToIDOName
   , rdo.AppliesToIDOAction
   , rdo.AppliesToIDOMethodName
   , rdo.LastManualPublishDate
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'SecurityUserMaster2'
AND rdo.AccessAs = 'Core'
DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityUserMaster2'
AND o.AccessAs = 'Core'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityUserMaster2'  AND AccessAs = 'Core'
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityUserMaster2'  AND AccessAs = 'Core'
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityUserMaster2'  AND AccessAs = 'Core'
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityUserMaster2'  AND AccessAs = 'Core'
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityUserMaster2' AND AccessAs = 'Core'

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'SecurityUserMaster2',--DocumentName
   N'ESBSecurityUserMaster2',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   NULL,--SupplementaryCustomLoadMethod
   N'UPD(HandleIncomingBod(BODVERB(),BODXML(),MESSAGE))',--SupplementaryInsUpdDelOverride
   N'Master Data',--DocumentationClass
   N'Core',--AccessAs
   N'571f85b6-24a6-49d3-8c39-5635890f8f98'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster2',--DocumentName
   10,--ElementSequence
   N'BODVERB()BODNOUN()',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'97363567-f368-4c15-8026-e98c13ac9d3c',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster2',--DocumentName
   N'releaseID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'9.2',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'97363567-f368-4c15-8026-e98c13ac9d3c',--ElementRowPointer
   N'da5942b8-d142-4211-9c91-3e34945e9df3'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster2',--DocumentName
   N'versionID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'2.6.3',--ValueExpression
   N'Placeholder',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'97363567-f368-4c15-8026-e98c13ac9d3c',--ElementRowPointer
   N'4a19711c-9e03-4f0d-87fd-61a0df11534c'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster2',--DocumentName
   N'xmlns',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2',--ValueExpression
   N'Placeholder',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'97363567-f368-4c15-8026-e98c13ac9d3c',--ElementRowPointer
   N'82247db8-3b2d-464c-8b5a-7cbfc8e50bb9'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster2',--DocumentName
   N'xmlns:xsi',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://www.w3.org/2001/XMLSchema-instance',--ValueExpression
   N'Placholder',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'97363567-f368-4c15-8026-e98c13ac9d3c',--ElementRowPointer
   N'8fd627c2-a8af-41cc-b731-384e17c51e16'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster2',--DocumentName
   N'xsi:schemaLocation',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',--ValueExpression
   N'Placeholder',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'97363567-f368-4c15-8026-e98c13ac9d3c',--ElementRowPointer
   N'958d9070-3d23-4afc-b2a8-1313832253e1'--RowPointer
)



   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

