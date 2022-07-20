/* $Header: ApplicationDB\DataPatchScripts\ReplDoc_SecurityUserMaster.sql 10.1.0.1 03/30/2018 14:27:22 */
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
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'SecurityUserMaster' AND AccessAs = 'Core'

DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityUserMaster' AND f.AccessAs = 'Core';
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityUserMaster' AND AccessAs = 'Core';
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityUserMaster' AND AccessAs = 'Core';
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityUserMaster' AND AccessAs = 'Core';
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityUserMaster' AND AccessAs = 'Core';
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityUserMaster' AND AccessAs = 'Core';

ENABLE TRIGGER ALL ON ReplDocOutbound;
ENABLE TRIGGER ALL ON ReplDocInbound;
ENABLE TRIGGER ALL ON ReplDocAttribute;
ENABLE TRIGGER ALL ON ReplDocElement;
ENABLE TRIGGER ALL ON ReplDocument;
ENABLE TRIGGER ALL ON ReplDocOutboundFilter;

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'ESBSecurityUserMasterViews',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   N'CLM_ESBSecurityUserMasterSp(P(P1))',--SupplementaryCustomLoadMethod
   N'UPD(LoadESBSecurityUserMasterSp(WorkstationLogin,P2,Status,GivenName,FamilyName,UserName,EmailAddress,UserAlias,MESSAGE))',--SupplementaryInsUpdDelOverride
   N'Master Data',--DocumentationClass
   N'Core',--AccessAs
   N'e264ba08-0211-4b10-9473-20b851cc5c3b'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'50b7f39a-154a-4611-8e2d-beb8edc33ed6',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'2ec78518-7336-46d3-9f7d-664124207d62',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'88b45f49-ee14-41a9-93e2-77021f5d2132',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'32684f9c-c400-4860-af74-685917198399',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'4fef46eb-07d1-4f36-b9c6-cdfe33a4d550',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'6bfa457e-0f4b-465f-aee8-c294654d991d',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'd9c0a82f-35ef-4c3a-a71f-ebade9a4a46e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'b2ae9efc-dbe9-40ca-a9dd-0aa9fe07be96',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   100,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'WorkstationLogin',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Form Workstation Domain/ID',--DocumentationNotes
   N'Usernames.WorkstationLogin',--DocumentationSchema
   N'Core',--AccessAs
   N'2ae55793-924d-45f0-99d6-d415f374657c',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   110,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/DocumentDateTime',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'RefCreateDate',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Creation Date of Record',--DocumentationNotes
   N'usernames.createdate',--DocumentationSchema
   N'Core',--AccessAs
   N'2e4ff980-2969-4a01-b46f-2e877013cd48',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   120,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status',--BODTagName
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
   N'1197617d-5cf6-47ba-8be3-8ad5a2969e1b',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'ae863833-31dc-44e7-94dd-bb1080cd7b27',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   140,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/EffectiveDateTime',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'RefCreateDate',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Creation Date of Record',--DocumentationNotes
   N'usernames.createdate',--DocumentationSchema
   N'Core',--AccessAs
   N'c8d1caae-64cc-4892-b640-482ab4b9a0d8',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   150,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Name',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'UserDesc',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Form User Description',--DocumentationNotes
   N'Usernames.UserDesc',--DocumentationSchema
   N'Core',--AccessAs
   N'41a89cb4-ace3-4fbe-8297-c686efb8f64a',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   160,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/GivenName',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'GivenName',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Form User Description  Parsed first word before space.',--DocumentationNotes
   N'Usernames.UserDesc',--DocumentationSchema
   N'Core',--AccessAs
   N'a2c5bde3-f8d5-47c1-87df-c30f09c4330e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   170,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/FamilyName',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'FamilyName',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Form User Description  Parsed second word after space.',--DocumentationNotes
   N'Usernames.UserDesc',--DocumentationSchema
   N'Core',--AccessAs
   N'b9b79e27-f104-4f73-aa9a-3a8ba8f3aa98',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   180,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserAlias',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'UserAlias',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Form User Description  Parsed second word after space.',--DocumentationNotes
   N'Usernames.UserDesc',--DocumentationSchema
   N'Core',--AccessAs
   N'95bf24b2-2c7b-4446-a503-6b8a5e04d0ba',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   190,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/DistinguishedName',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'UserName',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Form User ID',--DocumentationNotes
   N'usernames.Username',--DocumentationSchema
   N'Core',--AccessAs
   N'8fdf7f5a-214b-411d-87ed-4fb3975e661f',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
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
   N'useremail.EmailAddress',--DocumentationSchema
   N'Core',--AccessAs
   N'39011eac-60ce-4576-9dc8-25bc12a2bb89',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   210,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityRole',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityUserMasterSecurityRoleViews',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   N'UPD(LoadESBSecurityUserMasterSecurityRolesSp(WorkstationLogin,GroupName,Message))',--SubColInsUpdDelOverride
   N'CLM_ESBSecurityUserMasterSecurityRoleSp(P(P1))',--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'428a56eb-56ad-482d-9cf9-e5025dceb793',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   220,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityRole/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityUserMasterSecurityRoleViews.GroupName',--IDOPropertyName
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
   N'ee003ac0-7680-4dff-8ecc-db602b9f5088',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   230,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityRole/Description',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityUserMasterSecurityRoleViews.GroupDesc',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   N'UPD(LoadESBSecurityUserMasterSecurityRolesSp(WorkstationLogin,GroupName,Message)',--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Groups form Group Description',--DocumentationNotes
   N'GroupNames.GroupDesc',--DocumentationSchema
   N'Core',--AccessAs
   N'bb592772-6f92-47a5-85ae-0e19f476e5b6',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   240,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserArea/SecurityPermission',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityPermissionsMasterViews',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   N'WorkstationLogin=WorkstationLogin',--SubColLinkBy
   NULL,--SubColFilter
   N'UPD(LoadESBSp())',--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Security Permission',--DocumentationNotes
   N'Security',--DocumentationSchema
   N'Core',--AccessAs
   N'822ec2b1-2fbb-4e70-ad68-10f6f69178de',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   250,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserArea/SecurityPermission/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityPermissionsMasterViews.DerBODID',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Security Permission',--DocumentationNotes
   N'Security',--DocumentationSchema
   N'Core',--AccessAs
   N'848cde43-1fd6-482e-b3c7-c63fbc87ed84',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMaster',--DocumentName
   260,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserArea/SecurityPermission/Description',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityPermissionsMasterViews.ObjectName1',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'User Security Permission Description',--DocumentationNotes
   N'Security',--DocumentationSchema
   N'Core',--AccessAs
   N'd0ef9fa0-5543-4332-af52-ec091d403e42',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'lid',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'FROMLOGICALID()',--ValueExpression
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'd2ca9479-d987-4170-8dab-0fe49136b6f7',--ElementRowPointer
   N'0f260751-7d71-4b0c-a6eb-4aef09ddbf65'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'releaseID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'9.2',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',--ElementRowPointer
   N'c6521327-87fd-47cf-96e7-d3dc05fac06f'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'versionID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'2.6.3',--ValueExpression
   N'Default ''2.6.3''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',--ElementRowPointer
   N'fac67106-6a22-4d57-bd8a-bdd1d9bb8b4f'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'xmlns',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2',--ValueExpression
   N'Declare the XML namespace',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',--ElementRowPointer
   N'fe5b3a31-b1e5-4853-8854-92091ed636c8'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'xmlns:xsi',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://www.w3.org/2001/XMLSchema-instance',--ValueExpression
   N'Declare the XML namespace for the schema instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',--ElementRowPointer
   N'2a77e342-d186-4285-b471-a633c59176de'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'xsi:schemaLocation',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',--ValueExpression
   N'Associate an XML schema document that has a target namespace with an instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',--ElementRowPointer
   N'0c34275c-a928-45f9-8958-e68ab3025b64'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'actionCode',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'P(P2)',--ValueExpression
   N'Set to ''Add'' or ''Change''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'd9c0a82f-35ef-4c3a-a71f-ebade9a4a46e',--ElementRowPointer
   N'5488d90c-19e1-4c97-99fc-a2cddfb65c91'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'lid',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'FROMLOGICALID()',--ValueExpression
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'2ae55793-924d-45f0-99d6-d415f374657c',--ElementRowPointer
   N'893391fb-f7b6-4ac1-aed4-a5f3fcc843eb'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'variationID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'VARIATIONID()',--ValueExpression
   N'Macro: VARIATIONID(); Incremental value',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'2ae55793-924d-45f0-99d6-d415f374657c',--ElementRowPointer
   N'9bca30f7-8e1f-44c7-a083-530fa7d722e8'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'listID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'Security User Status',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'ae863833-31dc-44e7-94dd-bb1080cd7b27',--ElementRowPointer
   N'bb83babd-f3c6-4ed9-86d7-e347688bb683'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'languageID',--AttributeName
   N'Literal',--ValueSourceType
   1,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(LocalSite.LanguageID)',--ValueExpression
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'a2c5bde3-f8d5-47c1-87df-c30f09c4330e',--ElementRowPointer
   N'bd11aeae-70b5-49c3-af09-f66eee7b6299'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'languageID',--AttributeName
   N'Literal',--ValueSourceType
   1,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(LocalSite.LanguageID)',--ValueExpression
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'b9b79e27-f104-4f73-aa9a-3a8ba8f3aa98',--ElementRowPointer
   N'a376f0fa-9106-4854-a182-8a1589facb7d'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'accountingEntity',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(localSite.site)',--ValueExpression
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'ee003ac0-7680-4dff-8ecc-db602b9f5088',--ElementRowPointer
   N'2eaad059-0591-48c5-97fc-556ca0e9285d'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'accountingEntity',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(localSite.site)',--ValueExpression
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'848cde43-1fd6-482e-b3c7-c63fbc87ed84',--ElementRowPointer
   N'0e0f2cd1-e70c-4301-a550-4abee91cda10'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'languageID',--AttributeName
   N'Literal',--ValueSourceType
   1,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'PARMS(LocalSite.LanguageID)',--ValueExpression
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'd0ef9fa0-5543-4332-af52-ec091d403e42',--ElementRowPointer
   N'd2d3b081-def8-4a28-8df4-41eca5f56c29'--RowPointer
)

INSERT INTO ReplDocOutbound
(DocumentName,AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName,BODNoun,BODVerb,ActiveForManualRequest,KeyListSource,KeyList,DocumentationGenerationEvents,AccessAs,EligibleForBackgroundManualRequest,CreateDate,RecordDate,RowPointer)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'SP!',--AppliesToIDOName
   N'Invoke',--AppliesToIDOAction
   N'TriggerSecurityUserMasterProcessSp',--AppliesToIDOMethodName
   N'SecurityUserMaster',--BODNoun
   N'Process',--BODVerb
   1,--ActiveForManualRequest
   N'ESBSecurityUserMasterView',--KeyListSource
   N'UserId',--KeyList
   NULL,--DocumentationGenerationEvents
   N'Core',--AccessAs
   0,--EligibleForBackgroundManualRequest
   N'20171130 08:24:29.190',--CreateDate
   N'20171130 08:46:06.877',--RecordDate
   N'd2dbfced-331a-4076-882f-86237a5b5fdb'--RowPointer
)

INSERT INTO ReplDocInbound
(DocumentName,BODNoun,BODVerb,AccessAs,CreateDate,RecordDate)
VALUES (
   N'SecurityUserMaster',--DocumentName
   N'SecurityUserMaster',--BODNoun
   N'Sync',--BODVerb
   N'Core',--AccessAs
   N'20171130 08:24:29.203',--CreateDate
   N'20171130 08:46:06.890'--RecordDate
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

