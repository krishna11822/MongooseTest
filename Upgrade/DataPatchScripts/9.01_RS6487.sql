SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'GenericNotifyWithAttachments')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'GenericNotifyWithAttachments', N'Core', 0, 0, 0, N'Sends a message with attachments')

-- Note: These statements copied verbatim from Init Data/EventHandler.sql!

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
GO


