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
*   (c) COPYRIGHT 2020 INFOR.  ALL RIGHTS RESERVED.           *
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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'SecurityExternalUserMaster'
AND rdo.AccessAs = 'Core'
DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityExternalUserMaster'
AND o.AccessAs = 'Core'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityExternalUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityExternalUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityExternalUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityExternalUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityExternalUserMaster' AND AccessAs = 'Core'

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'ESBSecurityExternalEntityUserMaster',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   NULL,--SupplementaryCustomLoadMethod
   N'UPD(LoadESBExternalEntityUserMasterSp(WorkstationLogin,P2,Status, UserName, EmailAddress, ExternalEntity, MESSAGE))',--SupplementaryInsUpdDelOverride
   NULL,--DocumentationClass
   N'Core',--AccessAs
   N'd9d481e1-0cb6-47e4-8459-a78341c7b46a'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'240762cb-45db-454c-9459-1380229a0766',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'6f96ebe2-7277-4cfe-8dd5-ad43a7372236',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'd69a0f10-97e5-4874-a43d-a1da52430399',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'78cf6aca-a677-4608-a0a9-0d21cdab4d4e',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'c21bc443-1153-49f6-8b79-c7c51281c01b',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'd1940410-f3a9-494a-9935-e110e300add5',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'64df7ea5-48eb-438a-a03b-80ce4643e54f',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'e6fb0e6e-16e7-4bf1-b4d2-27836fe97327',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'4fece2fd-2c1d-4c6d-9fdb-a6581dae7717',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
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
   N'148d7d06-9ad8-4298-a03e-1f65add4538f',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   110,--ElementSequence
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
   N'fe9e3966-0c06-4b8c-9072-d07cc9d8fcc1',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   120,--ElementSequence
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
   N'c8a7ce43-9505-4881-ae3b-ec3903170500',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   130,--ElementSequence
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
   N'48ee3904-1d2c-44d4-9501-2cf8ca845a4a',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   140,--ElementSequence
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
   N'a27224c6-9275-44ab-8418-1b89b0e8c2b4',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   150,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalEntity/EntityCode',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ExternalEntity',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Code name for parent external entity.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'b5c09305-8953-4e96-9226-048e8c0477e7',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   160,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalRole',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityExternalEntityUserRole',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   N'UPD(LoadESBExternalEntityUserMasterRolesSp(WorkstationLogin, ExternalGroupName, GroupDesc, ExternalEntity, LogicalId, MESSAGE))',--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'This user has a set of security roles.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'61444c90-a7d0-499c-b570-b9bea7e6d14c',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   170,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalRole/IDs/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityExternalEntityUserRole.ExternalGroupName',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'Full name, but not really consistent with anything else.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'fa5c6eca-750c-4942-9f4b-56e24de5efd2',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   180,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityExternalRole/ExternalRoleCode',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBSecurityExternalEntityUserRole.GroupDesc',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   N'The security role code name. This maps to the Mongoose security group name.',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'31201c4e-e040-40fc-a204-8c7f4d9af520',--RowPointer
   NULL--ExclusionPropertyName
)

INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'releaseID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'9.2',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'240762cb-45db-454c-9459-1380229a0766',--ElementRowPointer
   N'27707c8d-12e1-4d77-ac37-20946e3c3a92'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'versionID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'2.6.3',--ValueExpression
   N'Default ''2.6.3''',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'240762cb-45db-454c-9459-1380229a0766',--ElementRowPointer
   N'1a2876eb-4663-4160-a8df-2c75bd5730b1'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'xmlns',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2',--ValueExpression
   N'Declare the XML namespace',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'240762cb-45db-454c-9459-1380229a0766',--ElementRowPointer
   N'488e36e0-940a-4901-ae58-f84aa4218b52'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'xmlns:xsi',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://www.w3.org/2001/XMLSchema-instance',--ValueExpression
   N'Declare the XML namespace for the schema instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'240762cb-45db-454c-9459-1380229a0766',--ElementRowPointer
   N'6cbe3b04-12fe-4261-a87b-a9f1f28f4e68'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'xsi:schemaLocation',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',--ValueExpression
   N'Associate an XML schema document that has a target namespace with an instance document',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'240762cb-45db-454c-9459-1380229a0766',--ElementRowPointer
   N'3c3a8f56-7b20-4013-894f-7bc7e5a23145'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'actionCode',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'P(P2)',--ValueExpression
   N'Add or Change',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'e6fb0e6e-16e7-4bf1-b4d2-27836fe97327',--ElementRowPointer
   N'ae462b31-a347-41d7-aa14-151ac911fc4a'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'lid',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'FROMLOGICALID()',--ValueExpression
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'148d7d06-9ad8-4298-a03e-1f65add4538f',--ElementRowPointer
   N'6115a6c6-a6d1-4504-bae9-64d8e683775d'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'variationID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'VARIATIONID()',--ValueExpression
   N'Macro: VARIATIONID(); Incremental value',--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'148d7d06-9ad8-4298-a03e-1f65add4538f',--ElementRowPointer
   N'5c755a4d-a01b-4791-b810-8b8b089fd0c5'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'listID',--AttributeName
   N'Literal',--ValueSourceType
   0,--IncludeForNullValuedElement
   NULL,--IDOPropertyName
   N'Security User Status',--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'fe9e3966-0c06-4b8c-9072-d07cc9d8fcc1',--ElementRowPointer
   N'5b693a04-3dbc-4e15-8778-e15a29b96a14'--RowPointer
)
INSERT INTO ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'lid',--AttributeName
   N'PropertyTag',--ValueSourceType
   0,--IncludeForNullValuedElement
   N'ESBSecurityExternalEntityUserRole.LogicalId',--IDOPropertyName
   NULL,--ValueExpression
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'fa5c6eca-750c-4942-9f4b-56e24de5efd2',--ElementRowPointer
   N'40e3b809-38d1-41cf-be0e-02a4772c8fb0'--RowPointer
)


INSERT INTO ReplDocInbound
(DocumentName,BODNoun,BODVerb,AccessAs,CreateDate,RecordDate)
VALUES (
   N'SecurityExternalUserMaster',--DocumentName
   N'SecurityExternalUserMaster',--BODNoun
   N'SYNC',--BODVerb
   N'Core',--AccessAs
   N'20200822 16:45:04.457',--CreateDate
   N'20200822 16:45:04.457'--RecordDate
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


   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

GO
