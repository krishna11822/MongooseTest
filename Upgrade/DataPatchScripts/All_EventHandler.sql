-- =============================================================
--? Issue:?? 170970
--? Notes:?  Avoid creating unnecessary EventOutputParameters after TaskListCheck
-- =============================================================
DECLARE @EHRP uniqueidentifier
-- Note: This statement copied verbatim from Init Data/EventHandler.sql!
SET @EHRP = 'DF0657B7-ADD1-4426-8423-A4E33FCBB814'

IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP)
BEGIN
   INSERT INTO EventHandler (EventName, Sequence, AccessAs, Synchronous, Transactional, Overridable, Active, RowPointer, Description)
      VALUES ('TaskListCheck', 1, 'Core', 1, 1, 1, 1, @EHRP,
         N'Reminds users of their tasks and appts.')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 10, 22, 'METHOD("CheckAndFireTaskListSp") PARMS(RV(InfobarVar))',
         N'Reminds users of their tasks and appts.')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 20, 12, 'CONDITION(V(InfobarVar) > "")
SETPARMVALUES(InfobarParm=V(InfobarVar))',
         N'Preserves any error message')
         
END

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence=10)
   -- Note: This statement copied verbatim from Init Data/EventHandler.sql!
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 10, 22, 'METHOD("CheckAndFireTaskListSp") PARMS(RV(InfobarVar))',
         N'Reminds users of their tasks and appts.')
ELSE
	UPDATE EventAction 
	SET Parameters ='METHOD("CheckAndFireTaskListSp") PARMS(RV(InfobarVar))'
	WHERE EventHandlerRowPointer = @EHRP
	AND Sequence=10

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence=20)
   -- Note: This statement copied verbatim from Init Data/EventHandler.sql!
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 20, 12, 'CONDITION(V(InfobarVar) > "")
SETPARMVALUES(InfobarParm=V(InfobarVar))',
         N'Preserves any error message')
ELSE
	UPDATE EventAction 
	SET Parameters ='CONDITION(V(InfobarVar) > "")
SETPARMVALUES(InfobarParm=V(InfobarVar))'
	WHERE EventHandlerRowPointer = @EHRP
	AND Sequence=20

GO


-- =============================================================
-- Issues: 194275 (New Data Maintenance Wizard)
-- =============================================================
DECLARE @EHRP uniqueidentifier
-- Note: This statement copied verbatim from Init Data/EventHandler.sql!
SET @EHRP = 'E70B3E38-D312-4D47-9D33-630F7D3D63E0'


-- Issue:?194275 (RS6620)
-- Notes:?9.01_RS6620.sql now deletes and re-inserts all Actions due to major rewrite/resequencing!

GO



 
-- =============================================================
--? Issue:?174284
--  GenericSendEmail -- allow attachments & ReplyTo
-- =============================================================
 
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
   VALUES('6F9605FA-AD8E-4FDE-8881-1898C610AC5D', 100, 26, N'CONDITION(TRUE)  TO(E(EmailTo))  REPLYTO(E(EmailReplyTo))  CC(E(EmailCc))  SUBJECT(E(EmailSubject))  BODY(E(EmailMessage)) HTMLFORMAT(E(EmailHTMLFormat) = "TRUE")', '1DA5CB84-EBD5-469F-82AB-4460A78744DD', N'Send e-mail message', NULL, NULL, NULL)
 
GO



