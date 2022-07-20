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

