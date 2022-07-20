/*$Header: /FormControl/Mongoose/Forms/ReplDocScriptGenerator.sql 12    9/20/17 12:25p tblosser $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2019 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                  	         *
***************************************************************
*/ 

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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'SecurityExternalEntityRoleMaster'
AND rdo.AccessAs = 'Core'
DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityExternalEntityRoleMaster'
AND o.AccessAs = 'Core'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityExternalEntityRoleMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityExternalEntityRoleMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityExternalEntityRoleMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityExternalEntityRoleMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityExternalEntityRoleMaster' AND AccessAs = 'Core'

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'ESBSecurityExternalEntityRoleMaster',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   NULL,--SupplementaryCustomLoadMethod
   N'UPD(LoadESBExternalEntityRoleMasterSp(ExternalGroupName, RoleCode, P2, GroupDesc, P2, ExternalEntity, MESSAGE))',--SupplementaryInsUpdDelOverride
   N'Master Data',--DocumentationClass
   N'Core',--AccessAs
   N'f0f96a34-1dc0-4d5e-a4db-758e89fafa3a'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
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
   N'490f182f-be3e-44c3-9ec7-b2e0832aaf39',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   20,--ElementSequence
   N'BODVERB()BODNOUN()/ApplicationArea/Sender/LogicalID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'FROMLOGICALID()',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field, plus General Parameters form, Site field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'c35e88d6-012b-436e-998b-1de49a01a9d4',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   30,--ElementSequence
   N'BODVERB()BODNOUN()/ApplicationArea/Sender/ComponentID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'erp',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'c284cfa9-43b6-4061-a43c-48330484086b',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   40,--ElementSequence
   N'BODVERB()BODNOUN()/ApplicationArea/CreationDateTime',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'BODCURDATETIME()',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Macro: BODCURDATETIME(); Date/time when BOD was created',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'12a4ce15-bbac-4f40-9322-b62d276f3d3a',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   50,--ElementSequence
   N'BODVERB()BODNOUN()/ApplicationArea/BODID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'NIDID(DerBODID)?BODNOUN()&verb=BODVERB()',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Macro: LNIDID(DocumentID)?ReceiveDelivery&verb=Sync',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'60938fde-c062-41a2-a421-cce63cc7d766',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   60,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/TenantID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'TENANTID()',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Macro: TENANTID(); Process Defaults form, Tenant ID process default value',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'0b9d2720-8c03-4e6d-8e04-587ff77926e6',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   70,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/ActionCriteria/ActionExpression',--BODTagName
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
   N'e500825a-f1d4-4c84-9b70-0d5855bf6a1d',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   80,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ExternalGroupName',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'inbound full ''ID''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'02cd4bad-d0b8-4c62-bbf0-5ad3cebd7cf7',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   81,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Code',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'RoleCode',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Alias - External Group Name',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'933c9c38-4584-479f-87ae-ad1d2cddcedb',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   90,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/DocumentDateTime',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'BODCURDATETIME()',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Macro: BODCURDATETIME(); Date/time when BOD was created',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'8a4d4bbf-f7b2-4c82-83b0-9d04d5e80a77',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   100,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Description',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'GroupDesc',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Groups Form Group Description',--DocumentationNotes
   N'GroupNames.GroupDesc',--DocumentationSchema
   N'Core',--AccessAs
   N'17f94ae6-6e6a-4ccc-b950-6f762e41b520',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   120,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/Code',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'Open',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'dd561b5a-2512-46da-8a8a-9e854c179f8e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   130,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalEntityMaster/IDs/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ExternalEntity',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parent External Entity',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'1b8423d9-8fe7-4786-b2b6-d9e3ba8bdf57',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'releaseID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   NULL,--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'490f182f-be3e-44c3-9ec7-b2e0832aaf39',--ElementRowPointer
   N'8c85bee9-7b57-41a1-ba4e-8db8b39af4ce'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'xmlns',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2',--ValueExpression
   N'Declare the XML namespace',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'490f182f-be3e-44c3-9ec7-b2e0832aaf39',--ElementRowPointer
   N'1bcc710f-6547-429e-95d1-f171e4114d51'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'xmlns:xsi',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://www.w3.org/2001/XMLSchema-instance',--ValueExpression
   N'Declare the XML namespace for the schema instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'490f182f-be3e-44c3-9ec7-b2e0832aaf39',--ElementRowPointer
   N'20eb0b35-c43a-482f-bc57-6eb22c8bf62a'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'xsi:schemaLocation',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',--ValueExpression
   N'Associate an XML schema document that has a target namespace with an instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'490f182f-be3e-44c3-9ec7-b2e0832aaf39',--ElementRowPointer
   N'74ebdc8d-98e2-4dd1-aaf3-1725d7a6968f'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'actionCode',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'P(P2)',--ValueExpression
   N'Set to ''Add'' or ''Replace''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'e500825a-f1d4-4c84-9b70-0d5855bf6a1d',--ElementRowPointer
   N'590f0c6b-fd78-4221-ad23-2e8a0a1cba2b'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'accountingEntity',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(localSite.site)',--ValueExpression
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'02cd4bad-d0b8-4c62-bbf0-5ad3cebd7cf7',--ElementRowPointer
   N'2f03ceb1-7652-4c54-80b6-98ba769eb1a7'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'lid',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'FROMLOGICALIDWITHOVERRIDE()',--ValueExpression
   N'Macro: FROMLOGICALIDWITHOVERRIDE(); Sites/Entities form, Logical ID field with possible override from ProcessDefaults.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'02cd4bad-d0b8-4c62-bbf0-5ad3cebd7cf7',--ElementRowPointer
   N'2f5a48d2-b961-4707-bca1-04deb38b5b4d'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'variationID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'VARIATIONID()',--ValueExpression
   N'Macro: VARIATIONID(); Incremental value',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'02cd4bad-d0b8-4c62-bbf0-5ad3cebd7cf7',--ElementRowPointer
   N'c98a0510-12a8-40d2-b1d2-e7e253c5eced'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'languageID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(LocalSite.LanguageID)',--ValueExpression
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'933c9c38-4584-479f-87ae-ad1d2cddcedb',--ElementRowPointer
   N'df1a0b53-8391-496d-897e-77e63c14ca47'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'languageID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(LocalSite.LanguageID)',--ValueExpression
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'17f94ae6-6e6a-4ccc-b950-6f762e41b520',--ElementRowPointer
   N'10168988-aa76-4813-8068-9c3f35b82722'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'listID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'Generic Status',--ValueExpression
   N'listID = ''Generic Status''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'dd561b5a-2512-46da-8a8a-9e854c179f8e',--ElementRowPointer
   N'272c1349-85c9-4e5e-9d6a-6672eb2650ce'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'lid',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'FROMLOGICALIDWITHOVERRIDE()',--ValueExpression
   N'Macro: FROMLOGICALIDWITHOVERRIDE(); Sites/Entities form, Logical ID field with possible override from ProcessDefaults.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'1b8423d9-8fe7-4786-b2b6-d9e3ba8bdf57',--ElementRowPointer
   N'4193bdd6-b2b4-4b97-8f3e-9f4f745717c9'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'variationID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'VARIATIONID()',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'1b8423d9-8fe7-4786-b2b6-d9e3ba8bdf57',--ElementRowPointer
   N'c9045bd7-af38-438b-8016-edda95368bd0'--RowPointer
)


INSERT INTO ReplDocInbound
(DocumentName,BODNoun,BODVerb,AccessAs,CreateDate,RecordDate)
VALUES (
   N'SecurityExternalEntityRoleMaster',--DocumentName
   N'SecurityExternalEntityRoleMaster',--BODNoun
   N'Sync',--BODVerb
   N'Core',--AccessAs
   N'20191107 17:25:21.063',--CreateDate
   N'20191107 17:25:21.063'--RecordDate
)

UPDATE ReplDocOutbound 
   SET
      ReplDocOutbound.LastManualPublishDate = rdo_save.LastManualPublishDate
   FROM
      @ReplDocOutbound_Save rdo_save
   INNER JOIN ReplDocOutbound ON
     rdo_save.AppliesToIDOName       = ReplDocOutbound.AppliesToIDOName AND
     rdo_save.AppliesToIDOAction     = ReplDocOutbound.AppliesToIDOAction AND
     rdo_save.AppliesToIDOMethodName = ReplDocOutbound.AppliesToIDOMethodName

