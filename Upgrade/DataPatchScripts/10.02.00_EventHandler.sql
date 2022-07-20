-- RS-8322
-- Added the one event action to two events

-- Event to assign admin licence module to user
DECLARE @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF RowPointerType
SET @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF = 'D946FCAF-944C-414C-AD87-03F9843D23AF'
 
IF NOT EXISTS (SELECT * FROM [dbo].[EventAction] WHERE ([Sequence] = 35) AND (EventHandlerRowPointer = @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF) )
BEGIN
   INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
      VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 35, 21, N'IDO("UserModules")
   METHOD("UserModulesDeleteForUserSp")
   PARMS(V(UserIdV))
   ','CB8873B8-BEA4-4767-A5C6-78FBAA93A520', N'remove rows marked for delete')
END 


-- Event to assign named license module to named user
DECLARE @EHRP_187D7817_A429_456D_A07E_9707A4CC710F RowPointerType
SET @EHRP_187D7817_A429_456D_A07E_9707A4CC710F = '187D7817-A429-456D-A07E-9707A4CC710F'

IF NOT EXISTS (SELECT * FROM [dbo].[EventAction] WHERE ([Sequence] = 35) AND (EventHandlerRowPointer = @EHRP_187D7817_A429_456D_A07E_9707A4CC710F) )
BEGIN
   INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
      VALUES(@EHRP_187D7817_A429_456D_A07E_9707A4CC710F, 35, 21, N'IDO("UserModules")
   METHOD("UserModulesDeleteForUserSp")
   PARMS(V(UserIdV))
   ','19A142B1-5590-4A52-A30B-903F2764BCF5', N'remove rows marked for delete')
END

GO

-- Issue 245725 
-- Assign Random Password To User
DECLARE @EHRP_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6 RowPointerType
SET @EHRP_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6 = '63BE1DC5-B040-486F-B5C1-C83DF98FE4E6'
DECLARE @MaxSeq_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6 EventSequenceType
SELECT @MaxSeq_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6 = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'AssignRandomPasswordToUser'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'AssignRandomPasswordToUser', @MaxSeq_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6, N'Core', NULL, NULL, NULL, 1, 0, 0, '95835D9C-DF62-4DDB-A1C5-55DC6A2BB626', '229260AC-97B3-467E-A027-F7103D3A88E6', '63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 1, 1, 0, NULL, 0, N'Assign random encrypted password to user', 0, NULL, NULL, NULL, NULL)
 
IF EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6)
BEGIN
   DELETE eava FROM EventAction ea INNER JOIN EventActionVariableAccess eava ON EventActionRowPointer = ea.RowPointer WHERE EventHandlerRowPointer = @EHRP_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6
   DELETE EventAction WHERE EventHandlerRowPointer = @EHRP_63BE1DC5_B040_486F_B5C1_C83DF98FE4E6
END
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 10, 14, N'IDO("UserNames")
PROPERTIES("UserId, UserPassword")
FILTER(SUBSTITUTE("Username={0}", FE(UsernameParm)))
SET(RV(UserIdV) = "UserId")
', 'A7F9D8E4-C8AC-482C-BC9E-FADA6C2D6475', N'Load row for UsernameParm', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 20, 5, N'CONDITION(V(UserIdV) = "")
DEST(109)', 'B603A33D-DE50-4B48-8694-6464AF7353FA', N'If no row found, finish', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 30, 21, N'IDO("UserNames")
METHOD("GetRandomPassword")
PARMS(RV(randomPwd))
', 'F58D83FD-17B2-4323-B13A-8062C439A02C', N'Call IDO method to get random password', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 40, 5, N'CONDITION(V(randomPwd) = "")
DEST(109)
', 'CF1D2280-C9C3-4640-AA41-810914CA2AF1', N'Password is empty, finish', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 50, 27, N'IDO("UserNames")
PROPERTIES("UserId, UserPassword")
DISTINCT(FALSE)
FILTER(SUBSTITUTE("Username={0}", FE(UsernameParm)))
SET(R(PWDToUpdate) = RESULT)
', '27E19464-F73D-42D6-B5B1-FE832E415A00', N'Load Collection for UsernameParm', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 60, 15, N'COLLECTION(PWDToUpdate)
ROW(1)
ACTION(UPDATE)
SETPROPVALUES("UserPassword" = V(randomPwd))
OPTIMISTICLOCKING(FALSE)
COMMIT(TRUE)
', '308D6EF8-BCC7-4E0A-BA25-89992D8B4ACC', N'Update user password', NULL, NULL, NULL)
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
   VALUES('63BE1DC5-B040-486F-B5C1-C83DF98FE4E6', 109, 10, NULL, 'CD95716B-F568-4E21-BE95-29599DB4153E', N'Finish', NULL, NULL, NULL)
 
GO


