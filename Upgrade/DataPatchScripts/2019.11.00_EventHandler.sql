
-- LazyDeleteLicenseModuleExecute
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'AD26C162-85FA-4224-9B08-15AF500F197E'

IF NOT EXISTS (SELECT 1 FROM [dbo].[EventHandler] WHERE [RowPointer] = @EHRP)
BEGIN
   INSERT [dbo].[EventHandler] ([EventName],[Sequence],[AccessAs],[AppliesToObjects],[Chrono],[KeepWithEventHandler],[Synchronous],[Transactional],[IgnoreFailure],
         [RowPointer], [EventInitialStateRowPointer],[InitialEventActionRowPointer],
         [Overridable],[Active],[Obsolete],[AppliesToInitiators],[Suspend],
         [Description],[EditableByWizard],[Purpose],[TriggeringProperty],[MethodToCall],[AppliesToSites])
      VALUES(N'LazyDeleteLicenseModuleExecute', 1, N'Core', NULL, NULL, NULL, 1, 0, 0, 
         @EHRP, 'D25238D6-C7E8-4093-8E39-74DE802B9A45', 'FF996E76-C401-471E-8150-B4E2F1EFEE31', 
         1, 1, 0, NULL, 0, 
         N'Execute the user-modules lazy delete', 0, NULL, NULL, NULL, NULL)
END

IF EXISTS (SELECT 1 FROM [dbo].[EventAction] WHERE [EventHandlerRowPointer] = @EHRP)
BEGIN
   DELETE eava FROM [dbo].[EventAction] ea INNER JOIN [dbo].[EventActionVariableAccess] eava ON [EventActionRowPointer] = ea.[RowPointer] WHERE [EventHandlerRowPointer] = @EHRP
   DELETE [dbo].[EventAction] WHERE [EventHandlerRowPointer] = @EHRP
END

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
   VALUES(@EHRP, 10, 14, N'IDO("UserNames")
PROPERTIES("UserId")
FILTER(SUBSTITUTE("Username={0}", FE(UsernameParm)))
SET(RV(UserIdV) = "UserId")
','F588C1FD-3365-4419-8491-54C119528978', N'Load row for UsernameParm')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
VALUES(@EHRP, 20, 5, N'CONDITION(V(UserIdV) = "")
DEST(99)
','72F23949-44DE-405D-8C26-E646A6112978', N'If userid does not exist, finish')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description])
VALUES(@EHRP, 30, 21, N'IDO("UserModules")
METHOD("UserModulesDeleteForUserSp")
PARMS(V(UserIdV))
','8D08D7E9-7B82-4677-AEED-F275597B74ED', N'remove rows marked for delete')

INSERT [dbo].[EventAction] ([EventHandlerRowPointer],[Sequence],[ActionType],[Parameters],[RowPointer],[Description],[PayloadAccess],[ModifiedPayloadAccess],[UnmodifiedPayloadAccess])
VALUES(@EHRP, 99, 10, NULL, 'B7A6C6AD-CE58-4D08-A124-E90BA54DB9F4', N'Finish', NULL, NULL, NULL)

GO
