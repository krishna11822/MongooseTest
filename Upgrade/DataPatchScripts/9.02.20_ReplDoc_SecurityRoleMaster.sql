/*$Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.02.20_ReplDoc_SecurityRoleMaster.sql 11    9/20/17 4:29p Jmorris $ */
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
*   (c) COPYRIGHT 2015 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                  	         *
***************************************************************
*/ 
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
DISABLE TRIGGER ALL ON ReplDocOutbound;
DISABLE TRIGGER ALL ON ReplDocInbound;
DISABLE TRIGGER ALL ON ReplDocAttribute;
DISABLE TRIGGER ALL ON ReplDocElement;
DISABLE TRIGGER ALL ON ReplDocument;
DISABLE TRIGGER ALL ON ReplDocOutboundFilter;


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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'SecurityRoleMaster'
DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityRoleMaster'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityRoleMaster' 
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityRoleMaster'  
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityRoleMaster'
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityRoleMaster' 
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityRoleMaster';

ENABLE TRIGGER ALL ON ReplDocOutbound;
ENABLE TRIGGER ALL ON ReplDocInbound;
ENABLE TRIGGER ALL ON ReplDocAttribute;
ENABLE TRIGGER ALL ON ReplDocElement;
ENABLE TRIGGER ALL ON ReplDocument;
ENABLE TRIGGER ALL ON ReplDocOutboundFilter;

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'ESBSecurityRoleMasterViews',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   N'CLM_ESBSecurityRoleMasterSp(P(P1))',--SupplementaryCustomLoadMethod
   NULL,--SupplementaryInsUpdDelOverride
   N'Master Data',--DocumentationClass
   N'Core',--AccessAs
   N'4a6cdde2-cf7e-4335-8e08-41367faaacec'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
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
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
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
   N'fd7d1ea0-0491-4222-81cf-f44769d834df',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
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
   N'Default to ''erp''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'9bc7938e-5182-474a-96b3-f3d1d617d0b9',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
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
   N'2ce22a51-4d24-4f14-b0ed-47c1bf7362c8',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
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
   N'8ea23e42-6ce2-4f07-840d-3b068bcac635',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
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
   N'6544bcbe-8604-4cc2-b557-5ea34772cfef',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
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
   N'd7d4f617-d2bb-49ef-bc46-d8146278f384',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   80,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/ActionCriteria/ActionExpression',--BODTagName
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
   N'cf2cc45a-4e76-4ebf-9e52-7d3e54553272',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   90,--ElementSequence
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
   N'9a4cd0b6-723e-464d-8d6d-ca979c2a23aa',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   100,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'DerBODID',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Groups form Group Name',--DocumentationNotes
   N'GroupNames.GroupName',--DocumentationSchema
   N'Core',--AccessAs
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   110,--ElementSequence
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
   N'3b32864c-33e8-4022-9833-5621e7e95736',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   120,--ElementSequence
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
   N'815dddf2-b99c-4ce0-89b7-e7e14b5f08f0',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   130,--ElementSequence
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
   N'56070b5e-c0b7-45fd-a21b-bfd9828704b9',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   140,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/Code',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'DerBODID',--IDOPropertyName
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
   N'a687cfd4-6a2a-4949-b016-bd17e2a7b18f',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'releaseID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   NULL,--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',--ElementRowPointer
   N'ed223eac-bf58-417f-a18d-d999b8c9a5d5'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'xmlns',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2',--ValueExpression
   N'Declare the XML namespace',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',--ElementRowPointer
   N'c7b0f987-b25a-493e-859d-4c4be18ac9f4'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'xmlns:xsi',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://www.w3.org/2001/XMLSchema-instance',--ValueExpression
   N'Declare the XML namespace for the schema instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',--ElementRowPointer
   N'1696a35f-5b20-42df-b121-e73248315b60'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'xsi:schemaLocation',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',--ValueExpression
   N'Associate an XML schema document that has a target namespace with an instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',--ElementRowPointer
   N'885e9bf3-c95a-404f-abfe-399cdefdb42d'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'actionCode',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'P(P2)',--ValueExpression
   N'Set to ''Add'' or ''Change''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'9a4cd0b6-723e-464d-8d6d-ca979c2a23aa',--ElementRowPointer
   N'9203d969-9f89-478d-aa35-0fca811b7197'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'accountingEntity',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(localSite.site)',--ValueExpression
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',--ElementRowPointer
   N'fb3be5b1-4864-474f-8b9e-ec5df3a6ef0b'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'lid',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'FROMLOGICALID()',--ValueExpression
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',--ElementRowPointer
   N'529557b0-6d84-4579-8c82-1d115621c021'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'variationID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'VARIATIONID()',--ValueExpression
   N'Macro: VARIATIONID(); Incremental value',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',--ElementRowPointer
   N'3f01fbae-b178-413e-9c45-b9f70bd2e82c'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'languageID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(LocalSite.LanguageID)',--ValueExpression
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'815dddf2-b99c-4ce0-89b7-e7e14b5f08f0',--ElementRowPointer
   N'17aae033-6dd4-4772-98a0-476dd73bf951'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'lisID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'GenericStatus',--ValueExpression
   N'listID = ''GenericStatus''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'56070b5e-c0b7-45fd-a21b-bfd9828704b9',--ElementRowPointer
   N'6daa9c5b-769b-436b-a792-f1018dbf33eb'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'languageID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(LocalSite.LanguageID)',--ValueExpression
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'a687cfd4-6a2a-4949-b016-bd17e2a7b18f',--ElementRowPointer
   N'c60d7f68-9eab-42a3-b5df-3ccc0dfc062e'--RowPointer
)

INSERT INTO ReplDocOutbound
(DocumentName,AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName,BODNoun,BODVerb,ActiveForManualRequest,KeyListSource,KeyList,DocumentationGenerationEvents,AccessAs,EligibleForBackgroundManualRequest,CreateDate,RecordDate,RowPointer)
VALUES (
   N'SecurityRoleMaster',--DocumentName
   N'SP!',--AppliesToIDOName
   N'Invoke',--AppliesToIDOAction
   N'TriggerSecurityRoleMasterSyncSp',--AppliesToIDOMethodName
   N'SecurityRoleMaster',--BODNoun
   N'Sync',--BODVerb
   1,--ActiveForManualRequest
   N'ESBSecurityRoleMasterView',--KeyListSource
   N'GroupName',--KeyList
   NULL,--DocumentationGenerationEvents
   N'Core',--AccessAs
   0,--EligibleForBackgroundManualRequest
   N'20150701 10:43:05.713',--CreateDate
   N'20150701 10:43:23.690',--RecordDate
   N'49f8323d-43af-4781-bf0c-62f45eb7041c'--RowPointer
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


