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
FROM ReplDocOutbound AS rdo WHERE DocumentName = 'SecurityUserMasterAcknowledgeIn'
DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityUserMasterAcknowledgeIn'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityUserMasterAcknowledgeIn' 
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityUserMasterAcknowledgeIn' 
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityUserMasterAcknowledgeIn' 
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityUserMasterAcknowledgeIn' 
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityUserMasterAcknowledgeIn'

INSERT INTO ReplDocument
(DocumentName,SupplementaryIDOName,SupplementaryFilter,SupplementaryCustomLoadMethod,SupplementaryInsUpdDelOverride,DocumentationClass,AccessAs,RowPointer)
VALUES (
   N'SecurityUserMasterAcknowledgeIn',--DocumentName
   N'ESBSecurityUserMasterViews',--SupplementaryIDOName
   NULL,--SupplementaryFilter
   NULL,--SupplementaryCustomLoadMethod
   N'UPD(LoadESBSecurityUserAckSp(WorkstationLogin,BODID,MESSAGE))',--SupplementaryInsUpdDelOverride
   NULL,--DocumentationClass
   N'Core',--AccessAs
   N'02609942-2b29-4426-96d4-ccb370116aa8'--RowPointer
)

INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMasterAcknowledgeIn',--DocumentName
   10,--ElementSequence
   N'BODVERB()BODNOUN()/DataArea/BODVERB()/OriginalApplicationArea/BODID',--BODTagName
   N'PropertyTag',--ValueSourceType
   N'BODID',--IDOPropertyName
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
   N'e398d486-8c87-4060-bc3a-7e4617beb657',--RowPointer
   NULL--ExclusionPropertyName
)
INSERT INTO ReplDocElement
(DocumentName,ElementSequence,BODTagName,ValueSourceType,IDOPropertyName,ValueExpression,IsToLogicalId,SubColLinkBy,SubColFilter,SubColInsUpdDelOverride,SubColCustomLoadMethod,DynamicSubcollectionIDOName,DocumentationNotes,DocumentationSchema,AccessAs,RowPointer,ExclusionPropertyName)
VALUES (
   N'SecurityUserMasterAcknowledgeIn',--DocumentName
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
   NULL,--DocumentationNotes
   NULL,--DocumentationSchema
   N'Core',--AccessAs
   N'2fe70fcc-5365-42c0-bc29-d4d57141c7b9',--RowPointer
   NULL--ExclusionPropertyName
)



INSERT INTO ReplDocInbound
(DocumentName,BODNoun,BODVerb,AccessAs,CreateDate,RecordDate)
VALUES (
   N'SecurityUserMasterAcknowledgeIn',--DocumentName
   N'SecurityUserMaster',--BODNoun
   N'Acknowledge',--BODVerb
   N'Core',--AccessAs
   N'20190425 12:26:56.860',--CreateDate
   N'20190425 12:26:56.860'--RecordDate
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

