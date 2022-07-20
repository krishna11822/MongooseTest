SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* $Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.10_EventHandler.sql 1     8/02/17 1:08p Jmorris $ */
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
*   (c) COPYRIGHT 2016 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*
* R.Shilts 10-Feb-2017
* Issue 224315- add event AssignUserToLicenseModule
*
*
*/

-- Send e-mail message
DECLARE @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D RowPointerType
SET @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D = '6F9605FA-AD8E-4FDE-8881-1898C610AC5D'
DECLARE @MaxSeq_6F9605FA_AD8E_4FDE_8881_1898C610AC5D EventSequenceType
SELECT @MaxSeq_6F9605FA_AD8E_4FDE_8881_1898C610AC5D = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'GenericSendEmail'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'GenericSendEmail', @MaxSeq_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, N'Core', NULL, NULL, NULL, 1, 0, 0, NULL, NULL, @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, 1, 1, 0, NULL, 0, N'Send e-mail message', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D
END
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, 10, 12, N'SETVARVALUES(
   AttachmentNum=1,
   NumAttachments=DBFUNCTION("dbo.NumEntries", E(AttachmentFileList), ",")
   )
', 'E09252C9-7080-4DA2-98BB-53C009C8D17E', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, 15, 5, N'CONDITION(V(NumAttachments) = 0)
DEST(100)
', '79547FDD-08B2-42F5-876A-7AB1BAEEB04D', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, 20, 12, N'SETVARVALUES(
   AttachmentFileVar=DBFUNCTION("dbo.Entry", V(AttachmentNum), E(AttachmentFileList), ","),
   AttachmentNameVar=DBFUNCTION("dbo.Entry", V(AttachmentNum), E(AttachmentNameList), ","),
   AttachmentDocTypeVar=DBFUNCTION("dbo.Entry", V(AttachmentNum), E(AttachmentDocTypeList), ","),
   AttachmentNum=1+V(AttachmentNum)
   )
', 'F9E2733C-9F6E-4FF6-967F-3BD22C0A2F9D', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, 30, 28, N'DOCACTION(ATTACH)
DOCTYPE(V(AttachmentDocTypeVar))
FILENAME(V(AttachmentFileVar))
ATTACHMENTNAME(V(AttachmentNameVar))
', '98AFB10C-B383-4233-B7FA-B16A2B42ACDD', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, 40, 5, N'CONDITION(V(AttachmentNum)<=V(NumAttachments))
DEST(20)
', '95C7E618-B064-4F81-BB5A-24D4C1B38AF1', NULL, NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_6F9605FA_AD8E_4FDE_8881_1898C610AC5D, 100, 26, N'CONDITION(TRUE)  TO(E(EmailTo))  REPLYTO(E(EmailReplyTo))  CC(E(EmailCc)) BCC(E(EmailBcc))  SUBJECT(E(EmailSubject))  BODY(E(EmailMessage)) HTMLFORMAT(E(EmailHTMLFormat) = "TRUE")', '1DA5CB84-EBD5-469F-82AB-4460A78744DD', N'Send e-mail message', NULL, NULL, NULL)
   
GO
   
-- Event Handler for send e-mail message with attachments

DECLARE @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F RowPointerType
SET @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F = '78D548B1-E7F4-412C-9618-843A4C9F863F'
DECLARE @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F EventSequenceType
SELECT @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'GenericNotifyWithAttachments'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'GenericNotifyWithAttachments', @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F, N'Core', NULL, NULL, NULL, 1, 1, 0, NULL, NULL, @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 1, 1, 0, NULL, 0, N'Send e-mail message with attachments', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F
END
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 10, 22, N'METHOD("EventSpawnEventAttachmentsSp")
PARMS("ObjectSentEmail", E(RowPointer), EVENTSTATEID(), "False")
', '1A05D909-EAA1-40F5-9DDB-AB6797588735', N'Attach attachments as event attachments', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 20, 27, N'IDO("ObjectSentEmails")
PROPERTIES("BccList, CcList, HtmlFormat, Message, RowPointer, Sent, SentDate, SentFrom, TableRowPointer, Subject,ToList")
FILTER(SUBSTITUTE("RowPointer = ''{0}''", E(RowPointer)))
SET(R(SentEmail) = RESULT)
', '7B56AAFE-CE56-4C8E-B897-309C97104106', N'Get Email to send in result set', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES(@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 30, 26, N'CONDITION(TRUE)
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
   VALUES(@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 40, 15, N'COLLECTION(SentEmail)
ROW(1)
ACTION(UPDATE)
SETPROPVALUES("Sent" = "1", "SentDate" = CURDATETIME())
OPTIMISTICLOCKING(FALSE)
COMMIT(TRUE)
', '776665F7-08DB-4995-9F3F-07B7D537B3EB', N'Update sent flag and date', NULL, NULL, NULL)

GO


-- Event Handler for New Data Maintenance Wizard

DECLARE @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F RowPointerType
SET @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F = 'E70B3E38-D312-4D47-9D33-630F7D3D63E0'
DECLARE @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F EventSequenceType
SELECT @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'GenericNotifyWithAttachments'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F)
   INSERT INTO EventHandler (EventName, Sequence, AccessAs, Synchronous, Transactional, Overridable, Active, RowPointer, Description)
      VALUES (N'ProcessNewDataMaintenance', @MaxSeq_78D548B1_E7F4_412C_9618_843A4C9F863F, 'Core', 1, 0, 1, 1, @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F,
         N'P: ProcessID, IdoProject, UserID')
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F
END

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 10, 27, N'IDO("TmpStagingNewDataMaintenances")
PROPERTIES("ProcessID, DataType, PropertyScale, LabelStringID, PropertyLength, Name, PrimaryKey, PropertyClass, Required, TableIDOName, ColumnDataType, DefaultValue")
FILTER(SUBSTITUTE("ProcessID = N''{0}''", E(ProcessID)))
ORDERBY(E(SortOrder))
SET(R(Batch) = RESULT)', N'query the batch')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 11, 11, N'CONDITION(ROWS(Batch) <= 0)
RESULT(MESSAGE("E=NoRowsDefinedForNewDataMaintenanceToProcess"))', N'verify at least 1 row in batch')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 20, 14, N'IDO("SqlTables")
PROPERTIES("table_name")
FILTER(SUBSTITUTE("table_name = N''{0}''", P(Batch, 1, "TableIDOName")))
SET(RV(ExistingTableName) = "table_name")', N'see if the table exists')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 21, 14, N'IDO("IdoCollections")
PROPERTIES("CollectionName")
FILTER(SUBSTITUTE("CollectionName = N''{0}''", P(Batch, 1, "TableIDOName")))
SET(RV(ExistingIDOName) = "CollectionName")', N'see if the IDO exists')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 22, 11, N'CONDITION(LEN(V(ExistingTableName)) > 0)
RESULT(MESSAGE("E=TableAlreadyExists"))', N'fail if the table exists')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 23, 11, N'CONDITION(LEN(V(ExistingIDOName)) > 0)
RESULT(MESSAGE("E=IDOAlreadyExists"))', N'fail if the IDO exists')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 40, 15, N'IDO("SqlTables")
ACTION(INSERT)
SETPROPVALUES("table_name" = E(TableName), "table_schema" = "dbo", "object_id" = V(nullvalue), "DerSource" = "ndmw", "DerIsSiteSplit" = E(SiteSplit) )', N'insert the table')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 50, 12, N'SETVARVALUES(BatchRowIndex = "0", PrimaryKeyColumns = "")', N'set column loop counter')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 51, 12, N'SETVARVALUES(SiteRefColumn = "")', N'initialize site ref column name variable')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 60, 12, N'SETVARVALUES(BatchRowIndex = 1 + V(BatchRowIndex), ColumnNullable = V(nullvalue))', N'increment batch row counter')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 70, 5, N'CONDITION(V(BatchRowIndex) > ROWS(Batch))
DEST(120)', N'go on to the ido if columns done')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 80, 12, N'CONDITION(P(Batch, V(BatchRowIndex), "Required") <> "1")
SETVARVALUES(ColumnNullable = "YES")', N'set column nullable var')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 90, 15, N'IDO("SqlColumns")
ACTION(INSERT)
SETPROPVALUES("columnName" = P(Batch, V(BatchRowIndex), "Name"), "tableName" = E(TableName), "tableSchema" = "dbo", "dataType" = P(Batch, V(BatchRowIndex), "ColumnDataType"), "decimalPos" = P(Batch, V(BatchRowIndex), "PropertyScale"), "UBDecPosUsed" = "0", "dataLength" = P(Batch, V(BatchRowIndex), "PropertyLength"), "UBLengthUsed" = "0", "isNullable" = V(ColumnNullable), "defaultValue" = V(nullvalue), "systemDataType" = V(nullvalue), "derShadowColumnName" = V(nullvalue))', N'insert the column')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 100, 12, N'CONDITION(P(Batch, V(BatchRowIndex), "PrimaryKey") = "1")
SETVARVALUES(PrimaryKeyColumns = SUBSTITUTE("{0}{1}{2}", V(PrimaryKeyColumns), V(Comma), P(Batch, V(BatchRowIndex), "Name")), Comma = ",")', N'maybe add to primary key list')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 110, 6, N'DEST(60)', N'back to top of column loop')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 120, 21, N'IDO("SqlTables")
METHOD("GenerateFrameworkDataForNDMW")
PARMS("dbo",E(TableName),RE(Infobar46), E(ViewName))', N'create mongoose system columns')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 130, 5, N'CONDITION(LEN(V(PrimaryKeyColumns)) <= 0)
DEST(300)', N'skip primary key if we don''t have any')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 131, 21, N'IDO("SqlTables")
METHOD("GetDefaultSiteColumnName")
PARMS(RV(SiteRefColumn))', N'get site ref column name value')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 140, 12, N'CONDITION(E(SiteSplit)= "1")
SETVARVALUES(PrimaryKeyColumns = SUBSTITUTE("{0}{1}{2}", V(PrimaryKeyColumns), V(Comma), V(SiteRefColumn)), Comma = ",")', N'Set SiteRef PK if it SiteSplit')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 150, 21, N'IDO("SqlTables")
METHOD("SqlPrimaryKeyModifySp")
PARMS(E(TableName), V(PrimaryKeyColumns), "1", RV(PrimaryKeyResult))', N'maybe create the primary key')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 200, 12, N'SETVARVALUES(IDONAME = E(TABLENAME))', N'set initial IDO name')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 210, 5, N'CONDITION(E(SiteSplit) <> "1")
DEST(300)', N'branch for site split logic')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 220, 21, N'IDO("AppTables")
METHOD("CreateViewsOverMultiSiteTablesSp")
PARMS(E(TableName), E(TableName), RV(Infobar210))', N'generate view')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 230, 12, N'SETVARVALUES(IDONAME = E(VIEWNAME))', N'Change IDO name to View name')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 300, 21, N'IDO("IdoCollections")
METHOD("IdoCollectionCreateSp")
PARMS(V(IDONAME), E(IdoProject), E(IDODescription), E(UserID), V(nullvalue), "0", "o" + V(IDOName), V(nullvalue), RV(InsertMessage))', N'create the ido')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 310, 21, N'IDO("IdoTables")
METHOD("IdoTableCreateSp")
PARMS(V(IDOName), V(IDOName), E(TableAlias), "3", "0", V(nullvalue), RV(IdoTableResult))', N'add the primary base table for the ido')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 320, 12, N'SETVARVALUES(BatchRowIndex = "0")', N'set the prop loop counter')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 330, 12, N'SETVARVALUES(BatchRowIndex = 1+V(BatchRowIndex))', N'increment the prop loop counter')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 340, 5, N'CONDITION(V(BatchRowIndex) > ROWS(Batch))
DEST(600)', N'go to finish if we are done')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 350, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), P(Batch, V(BatchRowIndex), "Name"), P(Batch, V(BatchRowIndex), "Name"), RV(PropertyInsertResult))', N'insert the property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 360, 5, N'CONDITION(P(Batch, V(BatchRowIndex), "PropertyClass") <> V(NullValue))
DEST(400)', N'check if property class is defined')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 370, 15, N'IDO("IdoProperties")
ACTION(UPDATE)
SETPROPVALUES("CollectionName" = V(IDOName), "PropertyName" = P(Batch, V(BatchRowIndex), "Name"), "DataType" = P(Batch, V(BatchRowIndex), "DataType"), "DataLength" = P(Batch, V(BatchRowIndex), "PropertyLength"), "DataDecimalPos" = P(Batch, V(BatchRowIndex), "PropertyScale"), "DefaultValue" = P(Batch, V(BatchRowIndex), "DefaultValue"), "LabelStringID" = P(Batch, V(BatchRowIndex), "LabelStringID"), "DevelopmentFlag" = "1", "PropertyClass" = P(Batch, V(BatchRowIndex), "PropertyClass"))', N'add property atts (no property class)')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 380, 6, N'DEST(330)', N'loop back')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 400, 14, N'IDO("IdoPropertyClasses")
PROPERTIES("EffectiveDataType, EffectiveDataLength, EffectiveDataDecimalPos, EffectiveDefaultValue, EffectiveColumnDataType, EffectiveIsRequired, EffectiveLabelStringID")
FILTER(SUBSTITUTE("ClassName = N''{0}''", P(Batch, V(BatchRowIndex), "PropertyClass")))
SET(RV(PCDataType) = "EffectiveDataType", RV(PCDataLength) = "EffectiveDataLength", RV(PCDataDecimalPos) = "EffectiveDataDecimalPos", RV(PCDefaultValue) = "EffectiveDefaultValue", RV(PCColumnDataType) = "EffectiveColumnDataType", RV(PCIsRequired) = "EffectiveIsRequired", RV(PCLabelStringID) = "EffectiveLabelStringID")', N'load property class data')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 410, 12, N'CONDITION(TRUE)
SETVARVALUES(DefDataType = P(Batch, V(BatchRowIndex), "DataType"),
 DefColumnDataType = P(Batch, V(BatchRowIndex), "ColumnDataType"),
 DefDataLength = P(Batch, V(BatchRowIndex), "PropertyLength"),
 DefDataDecimalPos = P(Batch, V(BatchRowIndex), "PropertyScale"),
 DefDefaultValue = P(Batch, V(BatchRowIndex), "DefaultValue"),
 DefLabelStringID = P(Batch, V(BatchRowIndex), "LabelStringID") )', N'set initial variables')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 420, 12, N'CONDITION(V(DefDataType) = V(PCDataType))
SETVARVALUES(DefDataType = V(nullvalue))', N'define data type')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 421, 12, N'CONDITION(V(DefColumnDataType) = V(PCColumnDataType))
SETVARVALUES(DefColumnDataType = V(nullvalue))', N'define column (SQL) data type')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 422, 12, N'CONDITION(V(DefDataLength) = V(PCDataLength))
SETVARVALUES(DefDataLength = V(nullvalue))', N'define data length')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 423, 12, N'CONDITION(V(DefDataDecimalPos) = V(PCDataDecimalPos))
SETVARVALUES(DefDataDecimalPos = V(nullvalue))', N'define decimal position (scale)')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 424, 12, N'CONDITION(V(DefDefaultValue) = V(PCDefaultValue))
SETVARVALUES(DefDefaultValue = V(nullvalue))', N'define default value')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 425, 12, N'CONDITION(V(DefLabelStringID) = V(PCLabelStringID))
SETVARVALUES(DefLabelStringID = V(nullvalue))', N'define label string ID')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 490, 15, N'IDO("IdoProperties")
ACTION(UPDATE)
SETPROPVALUES("CollectionName" = V(IDOName), "PropertyName" = P(Batch, V(BatchRowIndex), "Name"), "DataType" = V(DefDataType), "ColumnDataType" = V(DefColumnDataType), "DataLength" = V(DefDataLength), "DataDecimalPos" = V(DefDataDecimalPos), "DefaultValue" = V(DefDefaultValue), "LabelStringID" = V(DefLabelStringID), "DevelopmentFlag" = "1", "PropertyClass" = P(Batch, V(BatchRowIndex), "PropertyClass"))', N'update with Property class defined')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 500, 5, N'CONDITION(E(KeepStg) = "1")
DEST(360)', N'skip batch delete if we are keeping')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 510, 15, N'IDO("TmpStagingNewDataMaintenances")
ACTION(DELETE)
SETPROPVALUES("ProcessID" = E(ProcessID), "Name" = P(Batch, V(BatchRowIndex), "Name"))', N'delete the staging data row')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 520, 6, N'DEST(330)', N'top of property loop')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 600, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "NoteExistsFlag", "NoteExistsFlag", RV(PropertyInsertResult))', N'add the NoteExists framework property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 601, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "CreatedBy", "CreatedBy", RV(PropertyInsertResult))', N'add the CreatedBy framework property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 602, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "UpdatedBy", "UpdatedBy", RV(PropertyInsertResult))', N'add the UpdatedBy framework property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 603, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "CreateDate", "CreateDate", RV(PropertyInsertResult))', N'add the CreateDate framework property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 604, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "RecordDate", "RecordDate", RV(PropertyInsertResult))', N'add the RecordDate framework property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 605, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "RowPointer", "RowPointer", RV(PropertyInsertResult))', N'add the RowPointer framework property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 606, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "InWorkflow", "InWorkflow", RV(PropertyInsertResult))', N'add the InWorkFlow framework property')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 620, 5, N'CONDITION(E(IDOTablesXml) = "")
DEST(625)', N'Branch if no IdoTables to be created')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 621, 21, N'IDO("IdoTables")
METHOD("CreateTableFromDataTable")
PARMS(E(IDOTablesXml), RV(IDOTablesXmlResult))', N'add any Ido Tables')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 625, 5, N'CONDITION(E(IDOSubCollectionPropertiesXml) = "")
DEST(700)', N'branch if no subCollection properties')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 626, 21, N'IDO("IdoProperties")
METHOD("CreatePropertyFromDataTable")
PARMS(E(IDOSubCollectionPropertiesXml), RV(IDOSubCollectionPropertiesXmlResult))', N'add any Ido SubCollection properties')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 700, 5, N'CONDITION(E(GenerateScripts) = "0")
DEST(1000)', N'branch if generating SQL scripts')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 710, 5, N'CONDITION(E(UDTNames) = "")
DEST(730)', N'if no UDTs, go on to script table')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 720, 21, N'IDO("TmpStagingNewDataMaintenances")
METHOD("UDTScriptSp")
PARMS(E(UDTNames), "dbo", RV(UDTScript))', N'write UDT script')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 730, 21, N'IDO("TmpStagingNewDataMaintenances")
METHOD("TableScriptStringSp")
PARMS(P(Batch, 1, "TableIDOName"), "dbo", RV(TableScript))', N'write Create Table script')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 800, 12, N'CONDITION(1 = 1)
SETPARMVALUES(ScriptString = SUBSTITUTE( "{0}  {1}", V(UDTScript),V(TableScript)))', N'Concatenate the script strings')

   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP_78D548B1_E7F4_412C_9618_843A4C9F863F, 1000, 10, N'RESULT(MESSAGE("E=TableAndIDOCreated"))', N'finish')


-- Event to assign admin licence module to user
DECLARE @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF RowPointerType
SET @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF = 'D946FCAF-944C-414C-AD87-03F9843D23AF'
DECLARE @MaxSeq_D946FCAF_944C_414C_AD87_03F9843D23AF EventSequenceType
SELECT @MaxSeq_D946FCAF_944C_414C_AD87_03F9843D23AF = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'AssignUserToAdminLicenseModule'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'AssignUserToAdminLicenseModule', @MaxSeq_D946FCAF_944C_414C_AD87_03F9843D23AF, N'Core', NULL, NULL, NULL, 1, 0, 0, '0CA4F893-048A-41F6-8170-9193CAD04FBC', 'E495D802-6718-44A7-86FF-F524DAB57260', @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 1, 1, 0, NULL, 0, N'Event to assign admin licence module', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF
END
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 10, 14, N'IDO("SystemProcessDefaults")
PROPERTIES("DefaultValue")
FILTER("DefaultType=57")
SET(RV(AdminLicenseModuleName) = "DefaultValue")
','8D1821A8-2941-452A-B012-EF0FDF035ABA', N'Load row from SystemProcessDefaults')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 20, 12, N'CONDITION(V(AdminLicenseModuleName) = "")
SETVARVALUES(AdminLicenseModuleName = "MGCoreTrans")
','28312874-C993-4785-A14B-088C7A1A7AFF', N'Get the license module to set')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 30, 14, N'IDO("UserNames")
PROPERTIES("UserId")
FILTER(SUBSTITUTE("Username={0}", FE(UsernameParm)))
SET(RV(UserIdV) = "UserId")
','C473462B-60F3-4C20-AF7A-4EE0F084162C', N'Get Userid from UserName')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 40, 5, N'CONDITION(V(UserIdV) = "")
DEST(80)
','D2C5B580-1FA1-4C9D-95F4-95A682913F10', N'if userid does not exit finish it')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 50, 14, N'IDO("UserModules")
PROPERTIES("UserId")
FILTER(SUBSTITUTE("UserId= {0} AND ModuleName = {1}", FV(UserIdV), FV(AdminLicenseModuleName)))
SET(RV(ModuleUserIdV) = "UserId")
','2E6E53A1-EF82-4254-94BF-1A13843B7825', N'Check if userid exists in UsersModule')
 

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 60, 5, N'CONDITION(V(ModuleUserIdV) <> "")
DEST(80)','EFD543DE-CC08-4588-B087-1255919B3440', N'Finish if record exists')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 70, 15, N'IDO("UserModules")
ACTION(INSERT)
SETPROPVALUES("UserId" = V(UserIdV), "ModuleName" = V(AdminLicenseModuleName))
','8E5EA813-C4DD-4DDD-BCC5-ED829AE99977', N'Insert Module Name')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 80, 10, NULL,'7C4DD777-EB6D-4F3F-BD24-C056A0C6A837', N'Finish it')

GO

-- Event to assign named license module to user
DECLARE @EHRP_187D7817_A429_456D_A07E_9707A4CC710F RowPointerType
SET @EHRP_187D7817_A429_456D_A07E_9707A4CC710F = '187D7817-A429-456D-A07E-9707A4CC710F'
DECLARE @MaxSeq_187D7817_A429_456D_A07E_9707A4CC710F EventSequenceType
SELECT @MaxSeq_187D7817_A429_456D_A07E_9707A4CC710F = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'AssignUserToLicenseModule'

IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_187D7817_A429_456D_A07E_9707A4CC710F)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'AssignUserToLicenseModule', @MaxSeq_187D7817_A429_456D_A07E_9707A4CC710F, N'Core', NULL, NULL, NULL, 1, 0, 0, '005611B2-5470-4F9A-91D3-59FCD1284E9C', '424411C3-ABCE-4490-B113-AD9AE0B01FCD', @EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 1, 1, 0, NULL, 0, N'Assign UserID to license module', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_187D7817_A429_456D_A07E_9707A4CC710F)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_187D7817_A429_456D_A07E_9707A4CC710F
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_187D7817_A429_456D_A07E_9707A4CC710F
END

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 10, 12, N'SETVARVALUES(ModuleNameV = E(ModulenameParm))
','9D7702C5-847F-44AC-B014-CD57F76F958F', N'Shuffle Module Name')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 20, 14, N'IDO("UserNames")
PROPERTIES("UserId")
FILTER(SUBSTITUTE("Username={0}", FE(UsernameParm)))
SET(RV(UserIdV) = "UserId")
','F720E443-12DB-4E14-B15D-2A673BDB6E48', N'Get Userid from UserName')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 30, 5, N'CONDITION(V(UserIdV) = "")
DEST(99)
','67A5DD1E-5FBD-41D5-8441-22D85C670E6D', N'If userid does not exist, finish')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 40, 14, N'IDO("UserModules")
PROPERTIES("UserId")
FILTER(SUBSTITUTE("UserId= {0} AND ModuleName = {1}", FV(UserIdV), FV(ModulenameV)))
SET(RV(ModuleUserIdV) = "UserId")
','AD694259-08F4-4C85-9377-658914C7F573', N'Check if userid exists in UsersModule')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 50, 5, N'CONDITION(V(ModuleUserIdV) <> "")
DEST(99)
','4D772007-33D8-425F-A883-B0F45D579B87', N'Finish if record exists')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 60, 15, N'IDO("UserModules")
ACTION(INSERT)
SETPROPVALUES("UserId" = V(UserIdV), "ModuleName" = V(ModulenameV))
','0599415E-F9D5-40C4-BAAA-060DB47D268C', N'Insert Module Name')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 99, 10, NULL
,'3E9A7D86-FD84-4B24-A2FD-4FDBF0195ADF', N'Finish')

GO

