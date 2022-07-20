/*$Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.10_ReplDoc_SecurityPermissionMaster.sql 1     8/02/17 1:08p Jmorris $ */
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
FROM ReplDocOutbound as rdo WHERE DocumentName = 'SecurityPermissionMaster' and AccessAs = 'Core'

Delete f from ReplDocOutboundFilter f join ReplDocOutbound o on f.ReplDocOutboundRowPointer = o.RowPointer where o.DocumentName = 'SecurityPermissionMaster' and f.AccessAs = 'Core';
Delete From ReplDocOutbound Where DocumentName = 'SecurityPermissionMaster' and AccessAs = 'Core';
Delete From ReplDocInbound Where DocumentName = 'SecurityPermissionMaster' and AccessAs = 'Core';
Delete From ReplDocAttribute Where DocumentName = 'SecurityPermissionMaster' and AccessAs = 'Core';
Delete From ReplDocElement Where DocumentName = 'SecurityPermissionMaster' and AccessAs = 'Core';
Delete From ReplDocument Where DocumentName = 'SecurityPermissionMaster' and AccessAs = 'Core';

Enable Trigger ALL on ReplDocOutbound;
Enable Trigger ALL on ReplDocInbound;
Enable Trigger ALL on ReplDocAttribute;
Enable Trigger ALL on ReplDocElement;
Enable Trigger ALL on ReplDocument;
Enable Trigger ALL on ReplDocOutboundFilter;

Insert Into ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'ESBSecurityPermissionsMasterViews',
   N'DerBODID=FP(P1)',
   NULL,
   NULL,
   NULL,
   N'Core',
   N'f2143afe-a930-4109-9f00-03d36a3d2d71'
)

Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
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
   N'82934a6c-a9dc-4cb8-9c2c-3790695d93de',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
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
   NULL,
   NULL,
   N'Core',
   N'd80826b8-6015-4a7e-8cf1-5e9b0d6f8674',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
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
   NULL,
   NULL,
   N'Core',
   N'006e6f66-c34e-46df-9712-71a6bd7a244e',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
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
   NULL,
   NULL,
   N'Core',
   N'3f44fde9-159c-44a7-bb97-882fb4cee142',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
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
   NULL,
   NULL,
   N'Core',
   N'5918f298-6f28-444a-ad5a-70cba05fde61',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   60,
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/TenantID',
   N'Literal',
   NULL,
   N'FROMSITEINTRANET()',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Core',
   N'8c30b1df-db1a-4f01-8830-0cf0a098ce60',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
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
   NULL,
   NULL,
   N'Core',
   N'0f763c8e-920e-40c3-b287-b83cab6b4153',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   80,
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
   N'c2a25957-57ae-4567-8b0c-7b25bb17c836',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   90,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs',
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
   N'899b8a5e-66ad-4979-8c6d-2c1e9a82f882',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
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
   N'Document ID',
   NULL,
   N'Core',
   N'9d90dbbc-5712-4cae-a38a-d6451fad1ba2',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   110,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/LastModificationDateTime',
   N'PropertyTag',
   N'CreateDate',
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
   N'a2ac23de-b259-4585-9356-70a4e4657a66',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   115,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Description',
   N'PropertyTag',
   N'ObjectName1',
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
   N'c59831ae-ee55-480f-b4e1-7a6d27ee2422',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   120,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status',
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
   N'c25497e4-2369-469c-ac72-cf649e48e36c',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   130,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/Code',
   N'Literal',
   N'DerStatus',
   N'Enabled',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User form  User Login StatusActive          = 0 = EnabledLocked Out = 1 = DisabledDisabled      = 2 = Disabled',
   N'UserNames.status',
   N'Core',
   N'52a6c682-b577-499e-a821-793b5cce0b58',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   140,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/EffectiveDateTime',
   N'PropertyTag',
   N'RecordDate',
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
   N'11e51d3c-179e-4a1f-a130-3f7ccc751dbe',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   145,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Name',
   N'PropertyTag',
   N'ObjectName1',
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
   N'778181f8-b624-4cd9-b67b-4e817f6bfae0',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   150,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/PermissionDetails',
   N'PropertyTag',
   N'ESBSecurityPermissionsPivotViews',
   NULL,
   0,
   N'DerBODID=DerBODID',
   N'Status=''Enabled''',
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Core',
   N'b4dd7e12-2cc7-45a0-8ca2-5ef136fac53b',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   160,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/PermissionDetails/PropertyCode',
   N'PropertyTag',
   N'ESBSecurityPermissionsPivotViews.Privilage',
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
   N'ea39acfe-c7cc-41c8-8104-ef7d9d00aa75',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityPermissionMaster',
   170,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/PermissionDetails/Description',
   N'PropertyTag',
   N'ESBSecurityPermissionsPivotViews.Privilage',
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
   N'60ab5df2-44a2-44cb-a9d3-0b89a92fb3cc',
   NULL
)

Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'releaseID',
   N'Literal',
   0,
   NULL,
   N'9.2',
   NULL,
   NULL,
   N'Core',
   N'82934a6c-a9dc-4cb8-9c2c-3790695d93de',
   N'80781e2a-bcb4-4434-87d5-026518d6e488'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'xmlns',
   N'Literal',
   0,
   NULL,
   N'http://schema.infor.com/InforOAGIS/2',
   NULL,
   NULL,
   N'Core',
   N'82934a6c-a9dc-4cb8-9c2c-3790695d93de',
   N'3625eeef-6d21-44ce-875a-b396455d2ba6'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'xmlns:xsi',
   N'Literal',
   0,
   NULL,
   N'http://www.w3.org/2001/XMLSchema-instance',
   NULL,
   NULL,
   N'Core',
   N'82934a6c-a9dc-4cb8-9c2c-3790695d93de',
   N'7acc63cf-49dc-4a80-af3c-e18f241cf7d3'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'xsi:schemaLocation',
   N'Literal',
   0,
   NULL,
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',
   NULL,
   NULL,
   N'Core',
   N'82934a6c-a9dc-4cb8-9c2c-3790695d93de',
   N'e0e61e6b-a9cb-4ba3-9d81-6a0f92d7b431'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'actionCode',
   N'Literal',
   0,
   NULL,
   N'P(P2)',
   N'Action Code Add or Replace',
   NULL,
   N'Core',
   N'c2a25957-57ae-4567-8b0c-7b25bb17c836',
   N'452cd5af-84a8-4081-a830-fbe0734b0af0'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'accountingEntity',
   N'Literal',
   0,
   NULL,
   N'PARMS(localSite.site)',
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',
   NULL,
   N'Core',
   N'9d90dbbc-5712-4cae-a38a-d6451fad1ba2',
   N'845063f2-0e06-467a-b848-87984bf51ea0'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'lid',
   N'Literal',
   0,
   NULL,
   N'FROMLOGICALID()',
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field
',
   NULL,
   N'Core',
   N'9d90dbbc-5712-4cae-a38a-d6451fad1ba2',
   N'44af9e62-f1dc-48ef-904a-39f1cd8be798'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'variationID',
   N'Literal',
   0,
   NULL,
   N'VARIATIONID()',
   N'Macro: VARIATIONID(); Incremental value
',
   NULL,
   N'Core',
   N'9d90dbbc-5712-4cae-a38a-d6451fad1ba2',
   N'd75ecfbf-b021-407e-8130-0a4f147763e8'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'languageID',
   N'Literal',
   0,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'c59831ae-ee55-480f-b4e1-7a6d27ee2422',
   N'43b2e2bd-a3f0-41bd-9347-8fdb9431c863'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'listID',
   N'Literal',
   0,
   NULL,
   N'Security User Status',
   N'Default "Security User Status"
',
   NULL,
   N'Core',
   N'52a6c682-b577-499e-a821-793b5cce0b58',
   N'bd2babb6-f671-4dc3-84b5-55f0c77ce742'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'languageID',
   N'Literal',
   0,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'778181f8-b624-4cd9-b67b-4e817f6bfae0',
   N'e4043cce-39df-4ebc-8721-0d01908a5c47'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'listID',
   N'Literal',
   0,
   NULL,
   N'Property Code',
   NULL,
   NULL,
   N'Core',
   N'ea39acfe-c7cc-41c8-8104-ef7d9d00aa75',
   N'42a9f784-100f-4064-ae9e-f4d97bd588c5'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'languageID',
   N'Literal',
   0,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'60ab5df2-44a2-44cb-a9d3-0b89a92fb3cc',
   N'c94f4b20-dcd8-4e7c-a420-7c8ab747742e'
)

Insert Into ReplDocOutbound
(DocumentName,AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName,BODNoun,BODVerb,ActiveForManualRequest,KeyListSource,KeyList,DocumentationGenerationEvents,AccessAs,EligibleForBackgroundManualRequest,CreateDate,RecordDate,RowPointer)
Values (
   N'SecurityPermissionMaster',
   N'SP!',
   N'Invoke',
   N'TriggerSecurityPermissionMasterSyncSp',
   N'SecurityPermissionMaster',
   N'Sync',
   1,
   N'ESBSecurityPermissionsMasterView',
   N'DerBODID',
   NULL,
   N'Core',
   1,
   N'20161122 11:37:44.263',
   N'20161122 11:37:44.270',
   N'1d60a341-7576-47c5-9489-df51c95ad4a6'
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

