-- Event to assign admin licence module to user
DECLARE @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF RowPointerType
SET @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF = 'D946FCAF-944C-414C-AD87-03F9843D23AF'
DECLARE @MaxSeq_D946FCAF_944C_414C_AD87_03F9843D23AF EventSequenceType
SELECT @MaxSeq_D946FCAF_944C_414C_AD87_03F9843D23AF = ISNULL(MAX(Sequence), 0) + 1 FROM EventHandler WHERE EventName = N'AssignUserToAdminLicenseModule'
 
IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF)
INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],[EventInitialStateRowPointer],[InitialEventActionRowPointer],[RowPointer],[Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],[Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
   VALUES(N'AssignUserToAdminLicenseModule', @MaxSeq_D946FCAF_944C_414C_AD87_03F9843D23AF, N'Core', NULL, NULL, NULL, 1, 0, 0, '0CA4F893-048A-41F6-8170-9193CAD04FBC', 'E495D802-6718-44A7-86FF-F524DAB57260', @EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 1, 1, 0, NULL, 0, N'Event to assign admin license module', 0, NULL, NULL, NULL, NULL)
 
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
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 20, 14, N'IDO("UserNames")
PROPERTIES("UserId")
FILTER(SUBSTITUTE("Username={0}", FE(UsernameParm)))
SET(RV(UserIdV) = "UserId")
','C473462B-60F3-4C20-AF7A-4EE0F084162C', N'Get Userid from UserName')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 30, 5, N'CONDITION(V(UserIdV) = "")
DEST(70)
','D2C5B580-1FA1-4C9D-95F4-95A682913F10', N'if userid does not exit finish it')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 35, 21, N'IDO("UserModules")
METHOD("UserModulesDeleteForUserSp")
PARMS(V(UserIdV))
','CB8873B8-BEA4-4767-A5C6-78FBAA93A520', N'remove rows marked for delete')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 40, 14, N'IDO("UserModules")
PROPERTIES("UserId")
FILTER(SUBSTITUTE("UserId= {0} AND ModuleName = {1}", FV(UserIdV), FV(AdminLicenseModuleName)))
SET(RV(ModuleUserIdV) = "UserId")
','2E6E53A1-EF82-4254-94BF-1A13843B7825', N'Check if userid exists in UsersModule')
 

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 50, 5, N'CONDITION(V(ModuleUserIdV) <> "")
DEST(70)','EFD543DE-CC08-4588-B087-1255919B3440', N'Finish if record exists')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 60, 15, N'IDO("UserModules")
ACTION(INSERT)
SETPROPVALUES("UserId" = V(UserIdV), "ModuleName" = V(AdminLicenseModuleName))
','8E5EA813-C4DD-4DDD-BCC5-ED829AE99977', N'Insert Module Name')
 
INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP_D946FCAF_944C_414C_AD87_03F9843D23AF, 70, 10, NULL,'7C4DD777-EB6D-4F3F-BD24-C056A0C6A837', N'Finish it')

GO
