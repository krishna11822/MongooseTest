/*$Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.00_ReplDoc_SecurityRoleMaster.sql 5     9/20/17 4:30p Jmorris $ */
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
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
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
Disable Trigger ALL on ReplDocOutbound;
Disable Trigger ALL on ReplDocInbound;
Disable Trigger ALL on ReplDocAttribute;
Disable Trigger ALL on ReplDocElement;
Disable Trigger ALL on ReplDocument;
Disable Trigger ALL on ReplDocOutboundFilter;


DECLARE @ReplDocOutbound_Save TABLE (
  AppliesToIDOName       CollectionNameType
, AppliesToIDOAction     CollectionActionType
, AppliesToIDOMethodName MethodNameType
, LastManualPublishDate  DateTimeType
, primary key (AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName)
)
DELETE FROM @ReplDocOutbound_Save
INSERT @ReplDocOutbound_Save 
   SELECT 
     rdo.AppliesToIDOName
   , rdo.AppliesToIDOAction
   , rdo.AppliesToIDOMethodName
   , rdo.LastManualPublishDate
FROM ReplDocOutbound as rdo WHERE DocumentName = 'SecurityRoleMaster'

Delete f from ReplDocOutboundFilter f join ReplDocOutbound o on f.ReplDocOutboundRowPointer = o.RowPointer where o.DocumentName = 'SecurityRoleMaster' and f.AccessAs = 'Core';
Delete From ReplDocOutbound Where DocumentName = 'SecurityRoleMaster';
Delete From ReplDocInbound Where DocumentName = 'SecurityRoleMaster';
Delete From ReplDocAttribute Where DocumentName = 'SecurityRoleMaster';
Delete From ReplDocElement Where DocumentName = 'SecurityRoleMaster';
Delete From ReplDocument Where DocumentName = 'SecurityRoleMaster';

Enable Trigger ALL on ReplDocOutbound;
Enable Trigger ALL on ReplDocInbound;
Enable Trigger ALL on ReplDocAttribute;
Enable Trigger ALL on ReplDocElement;
Enable Trigger ALL on ReplDocument;
Enable Trigger ALL on ReplDocOutboundFilter;

Insert Into ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'ESBSecurityRoleMasterViews',
   NULL,
   N'CLM_ESBSecurityRoleMasterSp(P(P1))',
   NULL,
   N'Master Data',
   N'Core',
   N'4a6cdde2-cf7e-4335-8e08-41367faaacec'
)

Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   10,
   N'BODVERB()BODNOUN()',
   N'Literal',
   NULL,
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Core',
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   20,
   N'BODVERB()BODNOUN()/ApplicationArea/Sender/LogicalID',
   N'Literal',
   NULL,
   N'FROMLOGICALID()',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field, plus General Parameters form, Site field',
   NULL,
   N'Core',
   N'fd7d1ea0-0491-4222-81cf-f44769d834df',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   30,
   N'BODVERB()BODNOUN()/ApplicationArea/Sender/ComponentID',
   N'Literal',
   NULL,
   N'erp',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Default to ''erp''',
   NULL,
   N'Core',
   N'9bc7938e-5182-474a-96b3-f3d1d617d0b9',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   40,
   N'BODVERB()BODNOUN()/ApplicationArea/CreationDateTime',
   N'Literal',
   NULL,
   N'BODCURDATETIME()',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Macro: BODCURDATETIME(); Date/time when BOD was created',
   NULL,
   N'Core',
   N'2ce22a51-4d24-4f14-b0ed-47c1bf7362c8',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   50,
   N'BODVERB()BODNOUN()/ApplicationArea/BODID',
   N'Literal',
   NULL,
   N'NIDID(DerBODID)?BODNOUN()&verb=BODVERB()',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Macro: LNIDID(DocumentID)?ReceiveDelivery&verb=Sync',
   NULL,
   N'Core',
   N'8ea23e42-6ce2-4f07-840d-3b068bcac635',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   60,
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/TenantID',
   N'Literal',
   NULL,
   N'TENANTID()',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Macro: TENANTID(); Process Defaults form, Tenant ID process default value',
   NULL,
   N'Core',
   N'6544bcbe-8604-4cc2-b557-5ea34772cfef',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   70,
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/AccountingEntityID',
   N'Literal',
   NULL,
   N'PARMS(localSite.site)',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',
   NULL,
   N'Core',
   N'd7d4f617-d2bb-49ef-bc46-d8146278f384',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   90,
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/ActionCriteria/ActionExpression',
   N'Literal',
   NULL,
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Core',
   N'9a4cd0b6-723e-464d-8d6d-ca979c2a23aa',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   100,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs/ID',
   N'PropertyTag',
   N'DerBODID',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Groups form Group Name',
   N'GroupNames.GroupName',
   N'Core',
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   110,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/DocumentDateTime',
   N'Literal',
   NULL,
   N'BODCURDATETIME()',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Macro: BODCURDATETIME(); Date/time when BOD was created',
   NULL,
   N'Core',
   N'3b32864c-33e8-4022-9833-5621e7e95736',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   120,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Description',
   N'PropertyTag',
   N'GroupDesc',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Groups Form Group Description',
   N'GroupNames.GroupDesc',
   N'Core',
   N'815dddf2-b99c-4ce0-89b7-e7e14b5f08f0',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   130,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/Code',
   N'Literal',
   NULL,
   N'Open',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Core',
   N'56070b5e-c0b7-45fd-a21b-bfd9828704b9',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   135,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Name',
   N'PropertyTag',
   N'GroupName',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Group Name',
   N'GroupNames.GroupName',
   N'Core',
   N'eebbdcbe-6602-48a7-8324-73f43e5bfc24',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   140,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityPermission',
   N'PropertyTag',
   N'ESBSecurityPermissionsMasterViews',
   NULL,
   0,
   N'GroupName=GroupName',
   NULL,
   NULL,
   NULL,
   NULL,
   N'Roll/Groups Security Permission',
   NULL,
   N'Core',
   N'48369e86-8c0d-477a-8d2e-aab68e2fca51',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   150,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityPermission/ID',
   N'PropertyTag',
   N'ESBSecurityPermissionsMasterViews.DerBODID',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Roll/Groups Security Permission ID',
   NULL,
   N'Core',
   N'fa7c8118-7c0b-41cd-9552-d5f73a890cd7',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityRoleMaster',
   160,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityPermission/Description',
   N'PropertyTag',
   N'ESBSecurityPermissionsMasterViews.ObjectName1',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Description',
   NULL,
   N'Core',
   N'7416278b-f313-4db4-bd92-83a848547f8e',
   NULL
)

Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'releaseID',
   N'Literal',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Core',
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',
   N'ed223eac-bf58-417f-a18d-d999b8c9a5d5'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'xmlns',
   N'Literal',
   0,
   NULL,
   N'http://schema.infor.com/InforOAGIS/2',
   N'Declare the XML namespace',
   NULL,
   N'Core',
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',
   N'c7b0f987-b25a-493e-859d-4c4be18ac9f4'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'xmlns:xsi',
   N'Literal',
   0,
   NULL,
   N'http://www.w3.org/2001/XMLSchema-instance',
   N'Declare the XML namespace for the schema instance document',
   NULL,
   N'Core',
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',
   N'1696a35f-5b20-42df-b121-e73248315b60'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'xsi:schemaLocation',
   N'Literal',
   0,
   NULL,
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',
   N'Associate an XML schema document that has a target namespace with an instance document',
   NULL,
   N'Core',
   N'80a8f611-8727-479c-8ccc-2ad85c13c6cb',
   N'885e9bf3-c95a-404f-abfe-399cdefdb42d'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'actionCode',
   N'Literal',
   0,
   NULL,
   N'P(P2)',
   N'Set to ''Add'' or ''Replace''',
   NULL,
   N'Core',
   N'9a4cd0b6-723e-464d-8d6d-ca979c2a23aa',
   N'9203d969-9f89-478d-aa35-0fca811b7197'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'accountingEntity',
   N'Literal',
   0,
   NULL,
   N'PARMS(localSite.site)',
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',
   NULL,
   N'Core',
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',
   N'fb3be5b1-4864-474f-8b9e-ec5df3a6ef0b'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'lid',
   N'Literal',
   0,
   NULL,
   N'FROMLOGICALID()',
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',
   NULL,
   N'Core',
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',
   N'529557b0-6d84-4579-8c82-1d115621c021'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'variationID',
   N'Literal',
   0,
   NULL,
   N'VARIATIONID()',
   N'Macro: VARIATIONID(); Incremental value',
   NULL,
   N'Core',
   N'3b436f5c-07ab-4c88-ac6f-829664abd412',
   N'3f01fbae-b178-413e-9c45-b9f70bd2e82c'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'languageID',
   N'Literal',
   0,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'815dddf2-b99c-4ce0-89b7-e7e14b5f08f0',
   N'17aae033-6dd4-4772-98a0-476dd73bf951'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'listID',
   N'Literal',
   0,
   NULL,
   N'Generic Status',
   N'listID = ''Generic Status''',
   NULL,
   N'Core',
   N'56070b5e-c0b7-45fd-a21b-bfd9828704b9',
   N'6daa9c5b-769b-436b-a792-f1018dbf33eb'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'languageID',
   N'Literal',
   0,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'eebbdcbe-6602-48a7-8324-73f43e5bfc24',
   N'94d8e943-2954-4de2-b5d8-2853de140470'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'accountingEntity',
   N'Literal',
   0,
   NULL,
   N'PARMS(localSite.site)',
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',
   NULL,
   N'Core',
   N'fa7c8118-7c0b-41cd-9552-d5f73a890cd7',
   N'63f65ab4-c2a6-411b-b44f-90b2ea100ace'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'languageID',
   N'Literal',
   0,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'7416278b-f313-4db4-bd92-83a848547f8e',
   N'8e287343-be26-43f7-81ad-20e876cfb64a'
)

Insert Into ReplDocOutbound
(DocumentName,AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName,BODNoun,BODVerb,ActiveForManualRequest,KeyListSource,KeyList,DocumentationGenerationEvents,AccessAs,EligibleForBackgroundManualRequest,CreateDate,RecordDate,RowPointer)
Values (
   N'SecurityRoleMaster',
   N'SP!',
   N'Invoke',
   N'TriggerSecurityRoleMasterSyncSp',
   N'SecurityRoleMaster',
   N'Sync',
   1,
   N'ESBSecurityRoleMasterView',
   N'GroupName',
   NULL,
   N'Core',
   0,
   N'20161122 11:37:41.080',
   N'20161122 11:37:41.087',
   N'0e007478-e717-4ec4-9b81-3692a028e895'
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

