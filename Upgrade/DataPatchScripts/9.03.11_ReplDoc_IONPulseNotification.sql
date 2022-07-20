/*$Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.11_ReplDoc_IONPulseNotification.sql 2     9/15/17 1:34p Jmorris $ */
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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'IONPulseNotification' AND AccessAs = 'Core'

DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'IONPulseNotification' 
DELETE FROM ReplDocOutbound WHERE DocumentName = 'IONPulseNotification' AND AccessAs = 'Core';
DELETE FROM ReplDocInbound WHERE DocumentName = 'IONPulseNotification' AND AccessAs = 'Core';
DELETE FROM ReplDocAttribute WHERE DocumentName = 'IONPulseNotification' 
DELETE FROM ReplDocElement WHERE DocumentName = 'IONPulseNotification' 
DELETE FROM ReplDocument WHERE DocumentName = 'IONPulseNotification' AND AccessAs = 'Core';

ENABLE TRIGGER ALL ON ReplDocOutbound;
ENABLE TRIGGER ALL ON ReplDocInbound;
ENABLE TRIGGER ALL ON ReplDocAttribute;
ENABLE TRIGGER ALL ON ReplDocElement;
ENABLE TRIGGER ALL ON ReplDocument;
ENABLE TRIGGER ALL ON ReplDocOutboundFilter;

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'IONPulseNotification',--DocumentName
   N'ESBPulseNotificationViews',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   N'CLM_ESBPulseNotificationSp (P(P1), P(P2), P(P3), P(P4))',--SupplementaryCustomLoadMethod
   NULL,--SupplementaryInsUpdDelOverride
   NULL,--DocumentationClass
   N'Core',--AccessAs
   N'6849905f-d5f9-4e72-81cf-e4b8c09bdba8'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
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
   N'b72eb0c4-87e7-4632-b6e4-93a6f2d3e741',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
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
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'199a246d-b6f9-412c-9a0d-918e48237ef1',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   30,--ElementSequence
   N'BODVERB()BODNOUN()/ApplicationArea/Sender/ComponentID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'ERP',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'999b5017-c1d7-489a-a227-bdac7411bfb9',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
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
   N'5e775ad5-a929-4815-9445-9181d6e6b0c3',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
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
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'61e4dfa8-67e0-4fc2-b20d-e3803fb4833d',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   60,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/TenantID',--BODTagName
   N'Literal',--ValueSourceType
   NULL,--IDOPropertyName
   N'FROMSITEINTRANET()',--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   NULL,--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'dbb9ff3b-b235-4002-a472-a816129738c6',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
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
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'4aceb14f-5bde-4ff2-b31f-0ded6a75abd1',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
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
   N'684eb9d7-b208-4835-b77a-50f13314bf89',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   90,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()Header/DocumentID',--BODTagName
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
   N'0877bc7c-9a7f-4eb5-9643-766f1a600026',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   100,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()Header/DocumentID/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'RowPointer',--IDOPropertyName
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
   N'364990b9-af2e-400b-9323-f948a7b0357c',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   110,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()Header/CreationDateTime',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'CreateDate',--IDOPropertyName
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
   N'e7c433c1-0f7c-4005-bf23-77f954c095d1',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   120,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()Header/LastModificationDateTime',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'RecordDate',--IDOPropertyName
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
   N'4537e42b-dcb1-4815-b607-a3fbd61be4e1',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   130,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()Header/Description',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'Subject',--IDOPropertyName
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
   N'cc98b82e-3eac-4a1d-9360-d120aa5f9426',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   140,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/Parameter',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationPropertyViews',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   N'CLM_ESBPulseNotificationPropertiesSp (P(MessageVariables), P(LanguageCode))',--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'49718d71-cc56-47fe-95cf-35ab8abeef05',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   150,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/Parameter/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationPropertyViews.ID',--IDOPropertyName
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
   N'1987d640-8a37-4b21-a04a-a528e273414a',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   160,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/Parameter/Name',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationPropertyViews.Name',--IDOPropertyName
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
   N'5c6fad21-4166-4daa-9ccd-cfa199daaaff',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   170,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/Parameter/Value',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationPropertyViews.Value',--IDOPropertyName
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
   N'54528749-6354-4a78-852b-ef1756e9c193',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   180,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/Parameter/DataType',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationPropertyViews.DataType',--IDOPropertyName
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
   N'6ff1879f-87d2-49f5-b78e-daa2ea2af056',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   190,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/DistributionPerson',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationDistributionViews',--IDOPropertyName
   NULL,--ValueExpression
   0,--IsToLogicalId
   NULL,--SubColLinkBy
   NULL,--SubColFilter
   NULL,--SubColInsUpdDelOverride
   N'CLM_ESBPulseNotificationDistributionSp ( P (ToUser))',--SubColCustomLoadMethod
   NULL,--DynamicSubcollectionIDOName
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'7724bb13-6c4f-4e68-90bb-0fc5611aba0a',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   200,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/DistributionPerson/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationDistributionViews.UserID',--IDOPropertyName
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
   N'c365f83b-13d1-4449-a8d7-a9be55a6e0a7',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   210,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/DistributionPerson/PersonReference/IDs/ID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationDistributionViews.UserID',--IDOPropertyName
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
   N'51b579bc-8b58-4d13-97ef-3d0d264e88bd',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'IONPulseNotification',--DocumentName
   220,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODNOUN()/BODNOUN()/DistributionPerson/Name',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'ESBPulseNotificationDistributionViews.UserDesc',--IDOPropertyName
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
   N'47b3d78d-8270-4835-8e19-75c8a6b4676b',--RowPointer
   NULL--ExclusionPropertyName
)


INSERT INTO ReplDocOutbound
(DocumentName,AppliesToIDOName,AppliesToIDOAction,AppliesToIDOMethodName,BODNoun,BODVerb,ActiveForManualRequest,KeyListSource,KeyList,DocumentationGenerationEvents,AccessAs,EligibleForBackgroundManualRequest,CreateDate,RecordDate,RowPointer)
VALUES (
   N'IONPulseNotification',--DocumentName
   N'SP!',--AppliesToIDOName
   N'Invoke',--AppliesToIDOAction
   N'TriggerPulseNotificationSyncSp',--AppliesToIDOMethodName
   N'PulseNotification',--BODNoun
   N'Process',--BODVerb
   0,--ActiveForManualRequest
   NULL,--KeyListSource
   NULL,--KeyList
   NULL,--DocumentationGenerationEvents
   N'Core',--AccessAs
   0,--EligibleForBackgroundManualRequest
   N'20120622 11:59:08.427',--CreateDate
   N'20120622 11:59:08.443',--RecordDate
   N'6a282bd3-8c3d-496e-9353-7d4adc03621c'--RowPointer
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

