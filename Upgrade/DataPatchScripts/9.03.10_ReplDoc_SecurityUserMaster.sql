/*$Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.10_ReplDoc_SecurityUserMaster.sql 1     8/02/17 1:08p Jmorris $ */
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
FROM ReplDocOutbound as rdo WHERE DocumentName = 'SecurityUserMaster' and AccessAs = 'Core'

Delete f from ReplDocOutboundFilter f join ReplDocOutbound o on f.ReplDocOutboundRowPointer = o.RowPointer where o.DocumentName = 'SecurityUserMaster' and f.AccessAs = 'Core';
Delete From ReplDocOutbound Where DocumentName = 'SecurityUserMaster' and AccessAs = 'Core';
Delete From ReplDocInbound Where DocumentName = 'SecurityUserMaster' and AccessAs = 'Core';
Delete From ReplDocAttribute Where DocumentName = 'SecurityUserMaster' and AccessAs = 'Core';
Delete From ReplDocElement Where DocumentName = 'SecurityUserMaster' and AccessAs = 'Core';
Delete From ReplDocument Where DocumentName = 'SecurityUserMaster' and AccessAs = 'Core';

Enable Trigger ALL on ReplDocOutbound;
Enable Trigger ALL on ReplDocInbound;
Enable Trigger ALL on ReplDocAttribute;
Enable Trigger ALL on ReplDocElement;
Enable Trigger ALL on ReplDocument;
Enable Trigger ALL on ReplDocOutboundFilter;

Insert Into ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
Values (
   N'SecurityUserMaster',
   N'ESBSecurityUserMasterViews',
   NULL,
   N'CLM_ESBSecurityUserMasterSp(P(P1))',
   N'UPD(LoadESBSecurityUserMasterSp(WorkstationLogin,P2,Status,GivenName,FamilyName,UserName,EmailAddress,MESSAGE))',
   N'Master Data',
   N'Core',
   N'e264ba08-0211-4b10-9473-20b851cc5c3b'
)

Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field plus General Parameters form, Site field',
   NULL,
   N'Core',
   N'50b7f39a-154a-4611-8e2d-beb8edc33ed6',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'2ec78518-7336-46d3-9f7d-664124207d62',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'88b45f49-ee14-41a9-93e2-77021f5d2132',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   50,
   N'BODVERB()BODNOUN()/ApplicationArea/BODID',
   N'Literal',
   NULL,
   N'NIDID(UserId)?BODNOUN()&verb=BODVERB()',
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Users User ID field not show on Users Form',
   N'UserNames.UserID',
   N'Core',
   N'32684f9c-c400-4860-af74-685917198399',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'4fef46eb-07d1-4f36-b9c6-cdfe33a4d550',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'6bfa457e-0f4b-465f-aee8-c294654d991d',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'd9c0a82f-35ef-4c3a-a71f-ebade9a4a46e',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'b2ae9efc-dbe9-40ca-a9dd-0aa9fe07be96',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   100,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/IDs/ID',
   N'PropertyTag',
   N'WorkstationLogin',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Form Workstation Domain/ID',
   N'Usernames.WorkstationLogin',
   N'Core',
   N'2ae55793-924d-45f0-99d6-d415f374657c',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   110,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/DocumentDateTime',
   N'PropertyTag',
   N'RefCreateDate',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Creation Date of Record',
   N'usernames.createdate',
   N'Core',
   N'2e4ff980-2969-4a01-b46f-2e877013cd48',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
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
   N'1197617d-5cf6-47ba-8be3-8ad5a2969e1b',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   130,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/Code',
   N'PropertyTag',
   N'Status',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User form  User Login StatusActive          = 0 = EnabledLocked Out = 1 = DisabledDisabled      = 2 = Disabled',
   N'Username.Status',
   N'Core',
   N'ae863833-31dc-44e7-94dd-bb1080cd7b27',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   140,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/Status/EffectiveDateTime',
   N'PropertyTag',
   N'RefCreateDate',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'Creation Date of Record',
   N'usernames.createdate',
   N'Core',
   N'c8d1caae-64cc-4892-b640-482ab4b9a0d8',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   150,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/GivenName',
   N'PropertyTag',
   N'GivenName',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Form User Description  Parsed first word before space.',
   N'Usernames.UserDesc',
   N'Core',
   N'a2c5bde3-f8d5-47c1-87df-c30f09c4330e',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   160,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/FamilyName',
   N'PropertyTag',
   N'FamilyName',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Form User Description  Parsed second word after space.',
   N'Usernames.UserDesc',
   N'Core',
   N'b9b79e27-f104-4f73-aa9a-3a8ba8f3aa98',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   170,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/DistinguishedName',
   N'PropertyTag',
   N'UserName',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Form User ID',
   N'usernames.Username',
   N'Core',
   N'8fdf7f5a-214b-411d-87ed-4fb3975e661f',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   180,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/EMailAddress',
   N'PropertyTag',
   N'EmailAddress',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Form Primary Email Address',
   N'useremail.EmailAddress',
   N'Core',
   N'39011eac-60ce-4576-9dc8-25bc12a2bb89',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   190,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityRole',
   N'PropertyTag',
   N'ESBSecurityUserMasterSecurityRoleViews',
   NULL,
   0,
   NULL,
   NULL,
   N'UPD(LoadESBSecurityUserMasterSecurityRolesSp(WorkstationLogin,GroupName,Message))',
   N'CLM_ESBSecurityUserMasterSecurityRoleSp(P(P1))',
   NULL,
   NULL,
   NULL,
   N'Core',
   N'428a56eb-56ad-482d-9cf9-e5025dceb793',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   200,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityRole/ID',
   N'PropertyTag',
   N'ESBSecurityUserMasterSecurityRoleViews.GroupName',
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
   N'ee003ac0-7680-4dff-8ecc-db602b9f5088',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   210,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/SecurityRole/Description',
   N'PropertyTag',
   N'ESBSecurityUserMasterSecurityRoleViews.GroupDesc',
   NULL,
   0,
   NULL,
   NULL,
   N'UPD(LoadESBSecurityUserMasterSecurityRolesSp(WorkstationLogin,GroupName,Message)',
   NULL,
   NULL,
   N'Groups form Group Description',
   N'GroupNames.GroupDesc',
   N'Core',
   N'bb592772-6f92-47a5-85ae-0e19f476e5b6',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   220,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserArea/SecurityPermission',
   N'PropertyTag',
   N'ESBSecurityPermissionsMasterViews',
   NULL,
   0,
   N'WorkstationLogin=WorkstationLogin',
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Security Permission',
   N'Security',
   N'Core',
   N'822ec2b1-2fbb-4e70-ad68-10f6f69178de',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   230,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserArea/SecurityPermission/ID',
   N'PropertyTag',
   N'ESBSecurityPermissionsMasterViews.DerBODID',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Security Permission',
   N'Security',
   N'Core',
   N'848cde43-1fd6-482e-b3c7-c63fbc87ed84',
   NULL
)
Insert Into ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
Values (
   N'SecurityUserMaster',
   240,
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/UserArea/SecurityPermission/Description',
   N'PropertyTag',
   N'ESBSecurityPermissionsMasterViews.ObjectName1',
   NULL,
   0,
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   N'User Security Permission Description',
   N'Security',
   N'Core',
   N'd0ef9fa0-5543-4332-af52-ec091d403e42',
   NULL
)

Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'lid',
   N'Literal',
   0,
   NULL,
   N'FROMLOGICALID()',
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',
   NULL,
   N'Core',
   N'd2ca9479-d987-4170-8dab-0fe49136b6f7',
   N'0f260751-7d71-4b0c-a6eb-4aef09ddbf65'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'releaseID',
   N'Literal',
   0,
   NULL,
   N'9.2',
   NULL,
   NULL,
   N'Core',
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',
   N'c6521327-87fd-47cf-96e7-d3dc05fac06f'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'versionID',
   N'Literal',
   0,
   NULL,
   N'2.6.3',
   N'Default ''2.6.3''',
   NULL,
   N'Core',
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',
   N'fac67106-6a22-4d57-bd8a-bdd1d9bb8b4f'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'xmlns',
   N'Literal',
   0,
   NULL,
   N'http://schema.infor.com/InforOAGIS/2',
   N'Declare the XML namespace',
   NULL,
   N'Core',
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',
   N'fe5b3a31-b1e5-4853-8854-92091ed636c8'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'xmlns:xsi',
   N'Literal',
   0,
   NULL,
   N'http://www.w3.org/2001/XMLSchema-instance',
   N'Declare the XML namespace for the schema instance document',
   NULL,
   N'Core',
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',
   N'2a77e342-d186-4285-b471-a633c59176de'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'xsi:schemaLocation',
   N'Literal',
   0,
   NULL,
   N'http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/trunk/InforOAGIS/BODs/Developer/BODVERB()BODNOUN().xsd',
   N'Associate an XML schema document that has a target namespace with an instance document',
   NULL,
   N'Core',
   N'c4503c7f-457a-4edd-93bf-226729d9cf93',
   N'0c34275c-a928-45f9-8958-e68ab3025b64'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'actionCode',
   N'Literal',
   0,
   NULL,
   N'P(P2)',
   N'Set to ''Add'' or ''Change''',
   NULL,
   N'Core',
   N'd9c0a82f-35ef-4c3a-a71f-ebade9a4a46e',
   N'5488d90c-19e1-4c97-99fc-a2cddfb65c91'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'lid',
   N'Literal',
   0,
   NULL,
   N'FROMLOGICALID()',
   N'Macro: FROMLOGICALID(); Sites/Entities form, Logical ID field',
   NULL,
   N'Core',
   N'2ae55793-924d-45f0-99d6-d415f374657c',
   N'893391fb-f7b6-4ac1-aed4-a5f3fcc843eb'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'variationID',
   N'Literal',
   0,
   NULL,
   N'VARIATIONID()',
   N'Macro: VARIATIONID(); Incremental value',
   NULL,
   N'Core',
   N'2ae55793-924d-45f0-99d6-d415f374657c',
   N'9bca30f7-8e1f-44c7-a083-530fa7d722e8'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'listID',
   N'Literal',
   0,
   NULL,
   N'Security User Status',
   NULL,
   NULL,
   N'Core',
   N'ae863833-31dc-44e7-94dd-bb1080cd7b27',
   N'bb83babd-f3c6-4ed9-86d7-e347688bb683'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'languageID',
   N'Literal',
   1,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'a2c5bde3-f8d5-47c1-87df-c30f09c4330e',
   N'bd11aeae-70b5-49c3-af09-f66eee7b6299'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'languageID',
   N'Literal',
   1,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'b9b79e27-f104-4f73-aa9a-3a8ba8f3aa98',
   N'a376f0fa-9106-4854-a182-8a1589facb7d'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'accountingEntity',
   N'Literal',
   0,
   NULL,
   N'PARMS(localSite.site)',
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',
   NULL,
   N'Core',
   N'ee003ac0-7680-4dff-8ecc-db602b9f5088',
   N'2eaad059-0591-48c5-97fc-556ca0e9285d'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'accountingEntity',
   N'Literal',
   0,
   NULL,
   N'PARMS(localSite.site)',
   N'Macro: PARMS(localSite.site); General Parameters form, Site field',
   NULL,
   N'Core',
   N'848cde43-1fd6-482e-b3c7-c63fbc87ed84',
   N'0e0f2cd1-e70c-4301-a550-4abee91cda10'
)
Insert Into ReplDocAttribute
(DocumentName,AttributeName,ValueSourceType,IncludeForNullValuedElement,IDOPropertyName,ValueExpression,DocumentationNotes,DocumentationSchema,AccessAs,ElementRowPointer,RowPointer)
Values (
   N'SecurityUserMaster',
   N'languageID',
   N'Literal',
   1,
   NULL,
   N'PARMS(LocalSite.LanguageID)',
   N'Macro: PARMS(LocalSite.LanguageID); Sites/Entities form, Language field',
   NULL,
   N'Core',
   N'd0ef9fa0-5543-4332-af52-ec091d403e42',
   N'd2d3b081-def8-4a28-8df4-41eca5f56c29'
)

Insert Into ReplDocOutbound
(DocumentName,AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName,BODNoun,BODVerb,ActiveForManualRequest,KeyListSource,KeyList,DocumentationGenerationEvents,AccessAs,EligibleForBackgroundManualRequest,CreateDate,RecordDate,RowPointer)
Values (
   N'SecurityUserMaster',
   N'SP!',
   N'Invoke',
   N'TriggerSecurityUserMasterProcessSp',
   N'SecurityUserMaster',
   N'Process',
   1,
   N'ESBSecurityUserMasterView',
   N'UserId',
   NULL,
   N'Core',
   0,
   N'20161122 11:37:46.573',
   N'20161122 11:37:46.587',
   N'd2dbfced-331a-4076-882f-86237a5b5fdb'
)


Insert Into ReplDocInbound
(DocumentName,BODNoun,BODVerb,AccessAs,CreateDate,RecordDate)
Values (
   N'SecurityUserMaster',
   N'SecurityUserMaster',
   N'Sync',
   N'Core',
   N'20161122 11:37:46.580',
   N'20161122 11:37:46.580'
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

