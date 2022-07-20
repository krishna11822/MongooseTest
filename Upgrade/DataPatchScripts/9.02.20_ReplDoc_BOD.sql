/*$Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.02.20_ReplDoc_BOD.sql 11    9/20/17 4:29p Jmorris $ */
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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'BOD'
DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'BOD'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'BOD' 
DELETE FROM ReplDocInbound WHERE DocumentName = 'BOD'  
DELETE FROM ReplDocAttribute WHERE DocumentName = 'BOD' 
DELETE FROM ReplDocElement WHERE DocumentName = 'BOD'  
DELETE FROM ReplDocument WHERE DocumentName = 'BOD';

ENABLE TRIGGER ALL ON ReplDocOutbound;
ENABLE TRIGGER ALL ON ReplDocInbound;
ENABLE TRIGGER ALL ON ReplDocAttribute;
ENABLE TRIGGER ALL ON ReplDocElement;
ENABLE TRIGGER ALL ON ReplDocument;
ENABLE TRIGGER ALL ON ReplDocOutboundFilter;

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'BOD',--DocumentName
   NULL,--SupplementaryIDOName
   NULL,--SupplementaryFilter
   NULL,--SupplementaryCustomLoadMethod
   NULL,--SupplementaryInsUpdDelOverride
   N'Confirmation',--DocumentationClass
   N'Core',--AccessAs
   N'b45fe358-bf94-4524-a7b8-0e800b633780'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
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
   N'a31583e5-23c7-4aea-ae1a-8f07c9241fc4',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
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
   N'fb12f8cd-40c9-45f9-9b5f-bcfde4b46dbe',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
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
   N'a41b13a7-0193-49ed-9c60-e38510dfe851',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
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
   N'967e6381-510b-4729-8ebb-736e8201fe7c',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   50,--ElementSequence
   N'BODVERB()BODNOUN()/ApplicationArea/BODID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P7)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Macro: NIDID(DerBODID)?BOD&verb=Confirm',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'83e93b5b-0810-4c34-a71f-139c7fc1924f',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
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
   N'e77dd918-eb52-4af5-bf0b-0288c599654a',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
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
   N'4c907bea-f55d-43a8-86c3-110dba1cb576',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   80,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalApplicationArea/Sender/LogicalID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P1)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing Logical ID from failed BOD''s ApplicationArea',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'f3786b07-ce59-4c0d-93c0-4dcd2d3d9dea',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   90,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalApplicationArea/Sender/ComponentID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P2)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing Component ID from failed BOD''s ApplicationArea',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'26917b36-9f2f-43b6-8a5f-2e0a11b5d435',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   100,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalApplicationArea/Sender/TaskID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P3)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing Task ID from failed BOD''s ApplicationArea',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'17fb6b26-e26e-4316-aba7-2745f1237ce2',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   110,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalApplicationArea/Sender/ReferenceID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P4)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing Reference ID from failed BOD''s ApplicationArea',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'04597029-79f2-42aa-b7da-6daba7b59350',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   120,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalApplicationArea/Sender/ConfirmationCode',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P5)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing Confirmation Code from failed BOD''s ApplicationArea',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'10133ebf-60e2-4927-9540-f16fe659ddcc',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   130,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalApplicationArea/CreationDateTime',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P6)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing Creation Date and Time from failed BOD''s ApplicationArea',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'99fd39cf-e313-4cab-a408-56318b3b8a3a',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   140,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalApplicationArea/BODID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P7)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing BODID from failed BOD''s ApplicationArea',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'b155e66d-7a91-4c9f-b053-4a8faabca436',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   150,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODFailureMessage/ErrorProcessMessage/Description',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P8)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Parameter containing error message about failed BOD transmission',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'112553df-b875-478e-b195-3d5abc6b4b43',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   160,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalBOD',--BODTagName
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
   N'88455265-9b26-4e62-9a7a-4f701fb6c926',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   170,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalBOD/MessageHeader',--BODTagName
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
   N'340992d0-fa2a-4b75-b0bb-320517de9267',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   180,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalBOD/MessageHeader/MessageHeaderProperty',--BODTagName
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
   N'438fecdd-d5ae-4116-8068-754500c29e37',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   190,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalBOD/MessageHeader/MessageHeaderProperty/NameValue',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'P(P10)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Element that contains name value pairs. It also includes a data type, unit of measure code, and currencyID.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'41f6140f-405b-4471-a6ed-7e3a20ffb5f4',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'BOD',--DocumentName
   200,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/OriginalBOD/MessageContent',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'CDATA()P(P11)',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'This is defined as a string type, but the data should be a base 64 encoded string wrapped with a CDATA wrapper.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'ef006363-da8d-4889-9564-c119e2861808',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'BOD',--DocumentName
   N'releaseID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'9.2',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'a31583e5-23c7-4aea-ae1a-8f07c9241fc4',--ElementRowPointer
   N'bade0a00-1a5f-4944-95f1-82923c053304'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'BOD',--DocumentName
   N'versionID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'2.6.3',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'a31583e5-23c7-4aea-ae1a-8f07c9241fc4',--ElementRowPointer
   N'c826a34e-abea-474f-ba80-56f50e378b8e'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'BOD',--DocumentName
   N'xmlns',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2',--ValueExpression
   N'Declare the XML namespace',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'a31583e5-23c7-4aea-ae1a-8f07c9241fc4',--ElementRowPointer
   N'123d78fe-b2c0-4098-acc2-7823da49479d'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'BOD',--DocumentName
   N'xmlns:xsi',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://www.w3.org/2001/XMLSchema-instance',--ValueExpression
   N'Declare the XML namespace for the schema instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'a31583e5-23c7-4aea-ae1a-8f07c9241fc4',--ElementRowPointer
   N'7973950c-0da4-472b-a780-e3fe80e756cb'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'BOD',--DocumentName
   N'xsi:schemaLocation',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2 C:/tool2/Infor/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',--ValueExpression
   N'Associate an XML schema document that has a target namespace with an instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'a31583e5-23c7-4aea-ae1a-8f07c9241fc4',--ElementRowPointer
   N'052fe028-55c5-4142-80fe-a0024b367c85'--RowPointer
)

INSERT INTO ReplDocOutbound
(DocumentName,AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName,BODNoun,BODVerb,ActiveForManualRequest,KeyListSource,KeyList,DocumentationGenerationEvents,AccessAs,EligibleForBackgroundManualRequest,CreateDate,RecordDate,RowPointer)
VALUES (
   N'BOD',--DocumentName
   N'SP!',--AppliesToIDOName
   N'Invoke',--AppliesToIDOAction
   N'TriggerBODConfirmSp',--AppliesToIDOMethodName
   N'BOD',--BODNoun
   N'Confirm',--BODVerb
   0,--ActiveForManualRequest
   NULL,--KeyListSource
   NULL,--KeyList
   N'SyteLine could not process a BOD sent from another system because of validation or other errors',--DocumentationGenerationEvents
   N'Core',--AccessAs
   0,--EligibleForBackgroundManualRequest
   N'20150521 10:42:58.513',--CreateDate
   N'20150521 10:42:58.513',--RecordDate
   N'7f2e4562-cb98-415c-8140-ff33d6f78aa3'--RowPointer
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


