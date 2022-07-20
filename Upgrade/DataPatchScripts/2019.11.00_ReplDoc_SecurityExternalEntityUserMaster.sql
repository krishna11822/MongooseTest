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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'SecurityExternalEntityUserMaster'
AND rdo.AccessAs = 'Core'
DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityExternalEntityUserMaster'
AND o.AccessAs = 'Core'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityExternalEntityUserMaster' AND AccessAs = 'Core'

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'ESBSecurityExternalEntityUserMaster',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   NULL,--SupplementaryCustomLoadMethod
   N'UPD(LoadESBExternalEntityUserMasterSp(WorkstationLogin,P2,Status, UserName, EmailAddress, ExternalEntity, MESSAGE))',--SupplementaryInsUpdDelOverride
   NULL,--DocumentationClass
   N'Core',--AccessAs
   N'0f88cca9-9a15-4c70-8378-a08e83d3b836'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
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
   N'7c45b8a4-7687-4f84-8743-b9adc582253e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
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
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field plus General Parameters form, Site field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'f076a23b-7ee1-4371-9143-9ec5553ea0ed',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
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
   N'616ddf1b-2425-47aa-8e05-7ee1599e9627',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
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
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'215cfa36-f9c0-4f3e-b37f-48f226187eed',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   50,--ElementSequence
   N'BODVERB()BODNOUN()/ApplicationArea/BODID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'NIDID(UserId)?BODNOUN()&verb=BODVERB()',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Users User ID field not show on Users Form',--DocumentationNotes
   N'UserNames.UserID',--DocumentationSchema
   N'Core',--AccessAs
   N'49f64bca-d257-447f-8887-dd11b82a2820',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
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
   N'3f38afd2-1fc5-4d8e-acba-3405942b76d2',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   70,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/AccountingEntityID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'PARMS(localSite.site)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'f0725772-bf17-4413-8847-e90e85ed4a6e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   80,--ElementSequence
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
   N'adabe5fc-4b46-44a5-a31d-d759fc28db7e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   90,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs',--BODTagName
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
   N'7700803b-8fdb-4c8a-b9ce-3604235ac948',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   100,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'BODID',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Double GUID - storing as the BOD-ID for the moment',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'8582837f-b3d9-480e-b8f7-99267e91e039',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   130,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/Code',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'Status',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User form  User Login StatusActive          = 0 = EnabledLocked Out = 1 = DisabledDisabled      = 2 = Disabled',--DocumentationNotes
   N'Username.Status',--DocumentationSchema
   N'Core',--AccessAs
   N'811ec6cc-802b-4d46-8f9e-b2b65f7f347e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   150,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserGUID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'WorkstationLogin',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'GUID for user (Workstation Login)',--DocumentationNotes
   N'Usernames.WorkstationLogin',--DocumentationSchema
   N'Core',--AccessAs
   N'ebc2b7df-abea-4ce7-b0e3-a7f909eeadbf',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   200,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/EMailAddress',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'EmailAddress',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Form Primary Email Address',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'abb95e92-4eb5-4d19-a6dc-eeb895ca9acd',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   210,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserName',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'UserName',--IDOPropertyName
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
   N'48bebc87-39e9-4e06-b3ca-20b69635696d',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   220,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalEntityMaster/EntityCode',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ExternalEntity',--IDOPropertyName
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
   N'b19d88e4-5938-45e5-98a1-4ad719b6e507',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   230,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalEntityUserRole',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityExternalEntityUserRole',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   N'UPD(LoadESBExternalEntityUserMasterRolesSp(WorkstationLogin, ExternalGroupName, GroupDesc, ExternalEntity, LogicalId, MESSAGE))',--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'415ed929-2935-45f2-8a99-d6989de6e222',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   240,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalEntityUserRole/IDs',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityExternalEntityUserRole.ExternalGroupName',--IDOPropertyName
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
   N'af7800e3-5446-40a8-ac26-5f510da8fa05',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   250,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalEntityUserRole/Code',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityExternalEntityUserRole.GroupDesc',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   N'UPD(LoadESBExternalEntityUserMasterRolesSp(WorkstationLogin, ExternalGroupName, GroupDesc, ExternalEntity, LogicalId, MESSAGE))',--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'b73a3660-2ebd-47fb-8428-a9c403979e83',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'releaseID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'9.2',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'7c45b8a4-7687-4f84-8743-b9adc582253e',--ElementRowPointer
   N'950f552a-77d6-4ed2-a17e-0b2a7cbff76e'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'versionID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'2.6.3',--ValueExpression
   N'Default ''2.6.3''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'7c45b8a4-7687-4f84-8743-b9adc582253e',--ElementRowPointer
   N'58a4592e-a356-4fcc-ad10-fb9bd3c3f222'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'xmlns',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2',--ValueExpression
   N'Declare the XML namespace',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'7c45b8a4-7687-4f84-8743-b9adc582253e',--ElementRowPointer
   N'ab099c19-ff2f-4304-8061-635f25928b74'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'xmlns:xsi',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://www.w3.org/2001/XMLSchema-instance',--ValueExpression
   N'Declare the XML namespace for the schema instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'7c45b8a4-7687-4f84-8743-b9adc582253e',--ElementRowPointer
   N'01b80768-a946-49c6-9a52-5355bd739d39'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'xsi:schemaLocation',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',--ValueExpression
   N'Associate an XML schema document that has a target namespace with an instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'7c45b8a4-7687-4f84-8743-b9adc582253e',--ElementRowPointer
   N'4ac7ec1e-c205-4ced-a4f2-96e46bc57fb2'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'actionCode',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'P(P2)',--ValueExpression
   N'Add or Change',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'adabe5fc-4b46-44a5-a31d-d759fc28db7e',--ElementRowPointer
   N'b1d6b858-6765-4414-958e-3ca4574f435a'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'lid',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'FROMLOGICALID()',--ValueExpression
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'8582837f-b3d9-480e-b8f7-99267e91e039',--ElementRowPointer
   N'67b2179d-b7e2-4b0d-ba13-b81bee4e63e7'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'variationID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'VARIATIONID()',--ValueExpression
   N'Macro: VARIATIONID(); Incremental value',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'8582837f-b3d9-480e-b8f7-99267e91e039',--ElementRowPointer
   N'21f73c8a-b577-492b-80a5-18a344d43fe0'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'listID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'Security User Status',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'811ec6cc-802b-4d46-8f9e-b2b65f7f347e',--ElementRowPointer
   N'50dc43a7-0c31-41b0-bb2c-50a6887510f9'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'lid',--AttributeName
   N'PropertyTag',--ValueSourceType
   0,--IncludeForNullValuedElement
   N'ESBSecurityExternalEntityUserRole.LogicalId',--IDOPropertyName
   NULL,--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'af7800e3-5446-40a8-ac26-5f510da8fa05',--ElementRowPointer
   N'c8dbce01-3f0d-41e8-ac85-34a6a96fb3fc'--RowPointer
)


INSERT INTO ReplDocInbound
(DocumentName,BODNoun,BODVerb,AccessAs,CreateDate,RecordDate)
VALUES (
   N'SecurityExternalEntityUserMaster',--DocumentName
   N'SecurityExternalEntityUserMaster',--BODNoun
   N'Sync',--BODVerb
   N'Core',--AccessAs
   N'20191107 21:50:36.673',--CreateDate
   N'20191107 21:50:36.673'--RecordDate
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

