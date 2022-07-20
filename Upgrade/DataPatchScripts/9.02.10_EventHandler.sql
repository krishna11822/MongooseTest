SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/DataPatchScripts/9.02.10_EventHandler.sql 4     2/29/16 5:27p Jmorris $ */
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

-- Send e-mail message
DECLARE @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D RowPointerType
SET @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D = '6F9605FA-AD8E-4FDE-8881-1898C610AC5D'
DECLARE @MaxSeq_6F9605FA_AD8E_4FDE_8881_1898C610AC5D EventSequenceType
SELECT @MaxSeq_6F9605FA_AD8E_4FDE_8881_1898C610AC5D = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'GenericSendEmail'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'GenericSendEmail', @MaxSeq_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, N'Core', NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 1, 1, 0, NULL, 0, N'Send e-mail message', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D
END
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 10, 12, N'SETVARVALUES(
   AttachmentNum=1,
   NumAttachments=DBFUNCTION("dbo.NumEntries", E(AttachmentFileList), ",")
   )
', 'E09252C9-7080-4DA2-98BB-53C009C8D17E', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 15, 5, N'CONDITION(V(NumAttachments) = 0)
DEST(100)
', '79547FDD-08B2-42F5-876A-7AB1BAEEB04D', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 20, 12, N'SETVARVALUES(
   AttachmentFileVar=DBFUNCTION("dbo.Entry", V(AttachmentNum), E(AttachmentFileList), ","),
   AttachmentNameVar=DBFUNCTION("dbo.Entry", V(AttachmentNum), E(AttachmentNameList), ","),
   AttachmentDocTypeVar=DBFUNCTION("dbo.Entry", V(AttachmentNum), E(AttachmentDocTypeList), ","),
   AttachmentNum=1+V(AttachmentNum)
   )
', 'F9E2733C-9F6E-4FF6-967F-3BD22C0A2F9D', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 30, 28, N'DOCACTION(ATTACH)
DOCTYPE(V(AttachmentDocTypeVar))
FILENAME(V(AttachmentFileVar))
ATTACHMENTNAME(V(AttachmentNameVar))
', '98AFB10C-B383-4233-B7FA-B16A2B42ACDD', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 40, 5, N'CONDITION(V(AttachmentNum)<=V(NumAttachments))
DEST(20)
', '95C7E618-B064-4F81-BB5A-24D4C1B38AF1', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 100, 26, N'CONDITION(TRUE)  TO(E(EmailTo))  REPLYTO(E(EmailReplyTo))  CC(E(EmailCc)) BCC(E(EmailBcc))  SUBJECT(E(EmailSubject))  BODY(E(EmailMessage)) HTMLFORMAT(E(EmailHTMLFormat) = "TRUE")', '1DA5CB84-EBD5-469F-82AB-4460A78744DD', N'Send e-mail message', NULL, NULL, NULL)
   
GO
   
-- Event Handler for send e-mail message with attachments

DECLARE @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F RowPointerType
SET @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F = '78D548B1-E7F4-412C-9618-843A4C9F863F'
DECLARE @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F EventSequenceType
SELECT @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'GenericNotifyWithAttachments'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'GenericNotifyWithAttachments', @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F, N'Core', NULL, NULL, NULL, 1, 1, 0, 'F38D0708-DCD8-4AD2-95F5-DFE0389B027B', '0FA4BC38-FDEA-4217-B3BB-72D40B245C84', '78D548B1-E7F4-412C-9618-843A4C9F863F', 1, 1, 0, NULL, 0, N'Send e-mail message with attachments', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F
END
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('78D548B1-E7F4-412C-9618-843A4C9F863F', 10, 22, N'METHOD("EventSpawnEventAttachmentsSp")
PARMS("ObjectSentEmail", E(RowPointer), EVENTSTATEID(), "False")
', '1A05D909-EAA1-40F5-9DDB-AB6797588735', N'Attach attachments as event attachments', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('78D548B1-E7F4-412C-9618-843A4C9F863F', 20, 27, N'IDO("ObjectSentEmails")
PROPERTIES("BccList, CcList, HtmlFormat, Message, RowPointer, Sent, SentDate, SentFrom, TableRowPointer, Subject,ToList")
FILTER(SUBSTITUTE("RowPointer = ''{0}''", E(RowPointer)))
SET(R(SentEmail) = RESULT)
', '7B56AAFE-CE56-4C8E-B897-309C97104106', N'Get Email to send in result set', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('78D548B1-E7F4-412C-9618-843A4C9F863F', 30, 26, N'CONDITION(TRUE)
TO(P(SentEmail, 1, "ToList"))
CC(P(SentEmail, 1, "CcList"))
BCC(P(SentEmail, 1, "BccList"))
REPLYTO(P(SentEmail, 1, "SentFrom"))
SUBJECT(P(SentEmail, 1, "Subject"))
HTMLFORMAT(P(SentEmail, 1, "HtmlFormat")="1")
BODY(P(SentEmail, 1, "Message"))
ATTACH(ALL)
', '7791637B-2A64-45B6-9C1A-4F91B91DAAD9', N'Send email with attachments', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('78D548B1-E7F4-412C-9618-843A4C9F863F', 40, 15, N'COLLECTION(SentEmail)
ROW(1)
ACTION(UPDATE)
SETPROPVALUES("Sent" = "1", "SentDate" = CURDATETIME())
OPTIMISTICLOCKING(FALSE)
COMMIT(TRUE)
', '776665F7-08DB-4995-9F3F-07B7D537B3EB', N'Update sent flag and date', NULL, NULL, NULL)