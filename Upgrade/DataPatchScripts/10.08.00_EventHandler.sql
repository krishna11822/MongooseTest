SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'CF41C0EE-D2B0-4E78-B9B1-01D1769E6708'

IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP)
   INSERT INTO EventHandler (EventName, Sequence, AccessAs, Synchronous, Transactional, Overridable, Active, RowPointer, Description)
      VALUES ('ClearServiceSessions', 1, 'Core', 1, 1, 1, 1, @EHRP,
         N'Clears out old service sessions.')
         
   IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP)
   BEGIN
      INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
         VALUES (@EHRP, 10, 22, 'METHOD("ClearOldSessionsSp") PARMS("$service",RV(InfobarVar))',
            N'Clears out old service sessions.')

      INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
         VALUES (@EHRP, 20, 12, 'CONDITION(V(InfobarVar) > "")
SETPARMVALUES(InfobarParm=V(InfobarVar))',
            N'Preserves any error message')
   END
GO
