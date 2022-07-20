SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/DataPatchScripts/9.02.00_EventHandler.sql 4     11/03/15 3:44p Jmorris $ */
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
*                                                             *
*************************************************************** 
*/

-- Send an Alert to ION
DECLARE @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8 RowPointerType
SET @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8 = 'EF2404C5-4679-4D93-9A9F-E26542CBE6D8'
DECLARE @MaxSeq_EF2404C5_4679_4D93_9A9F_E26542CBE6D8 EventSequenceType
SELECT @MaxSeq_EF2404C5_4679_4D93_9A9F_E26542CBE6D8 = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'GenericSendPulseAlertBOD'
 
IF EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8)
   DELETE EventHandler WHERE RowPointer = @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'GenericSendPulseAlertBOD', @MaxSeq_EF2404C5_4679_4D93_9A9F_E26542CBE6D8, N'Core', NULL, NULL, NULL, 1, 0, 0, 'B3F98CFE-2522-4322-824E-C86687EA49A6', 'E8564000-3B4F-47DE-A667-901F08BE6748', @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8, 1, 1, 0, NULL, 0, N'Send an alert to ION', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8
END
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_EF2404C5_4679_4D93_9A9F_E26542CBE6D8, 10, 29, N'BODNOUN("PulseAlert")  BODVERB("Process")  BODXML(''<ProcessPulseAlert xmlns="http://schema.infor.com/InforOAGIS/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schema.infor.com/InforOAGIS/2 http://schema.infor.com/2.9.0/InforOAGIS/BODs/Developer/ProcessPulseAlert.xsd" releaseID="9.2"><ApplicationArea><Sender><LogicalID>FROMLOGICALID()</LogicalID><ComponentID>erp</ComponentID><ConfirmationCode>OnError</ConfirmationCode><AuthorizationID /></Sender><CreationDateTime>BODCURDATETIME()</CreationDateTime><BODID>TNIDID(PARMS(localSite.site))?BODNOUN()&amp;verb=BODVERB()</BODID></ApplicationArea><DataArea><Process><TenantID>TENANTID()</TenantID><AccountingEntityID>PARMS(localSite.site)</AccountingEntityID><ActionCriteria><ActionExpression actionCode="Add" /></ActionCriteria></Process><PulseAlert><Description languageID="en-us">IF(E(MessageDescription) = "", E(MessageBody), E(MessageDescription))</Description><AlertDetail sequence="1"><PulseDocumentReference sequence="1" type="PulseAlert"><DocumentID><ID accountingEntity="PARMS(localSite.site)" lid="FROMLOGICALID()" /></DocumentID></PulseDocumentReference><TreeNode sequence="1"><ID>1</ID><NodeName>Message</NodeName><TreeNodeParameter><Name>Message 1</Name><Value>E(MessageBody)</Value><DataType listID="PulseDatatypes">STRING</DataType></TreeNodeParameter></TreeNode></AlertDetail><DistributionPerson><PersonReference><IDs><ID>E(UserEmail)</ID></IDs></PersonReference></DistributionPerson></PulseAlert></DataArea></ProcessPulseAlert>'')  BODXMLNAME("ProcessPulseAlert.xml")  BODATTRS("//ProcessPulseAlert[1]/DataArea[1]/PulseAlert[1]/Description[1]" = IF(E(MessageDescription) = "", E(MessageBody), E(MessageDescription)), "//ProcessPulseAlert[1]/DataArea[1]/PulseAlert[1]/AlertDetail[1]/TreeNode[1]/TreeNodeParameter[1]/Name[1]" = E(MessageSubject), "//ProcessPulseAlert[1]/DataArea[1]/PulseAlert[1]/AlertDetail[1]/TreeNode[1]/TreeNodeParameter[1]/Value[1]" = E(MessageBody), "//ProcessPulseAlert[1]/DataArea[1]/PulseAlert[1]/DistributionPerson[1]/PersonReference[1]/IDs[1]/ID[1]" = E(UserEmail))','A4792696-2077-45F0-967E-7AB5854B2DF0', N'Send an alert to ION')
 