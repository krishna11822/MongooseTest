SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- PurgeHistoryData
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'BA3AF188-0658-4583-83C6-3B7D5A598281'

IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP)
BEGIN
   INSERT INTO EventHandler (EventName, Sequence, AccessAs, Synchronous, Transactional, Overridable, Active, RowPointer, Description)
   VALUES ('PurgeHistoryData', 1, 'Core', 1, 1, 1, 1, @EHRP, N'Purge History Data By Parameter.')
END         
IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP)
BEGIN
    INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
	VALUES (@EHRP, 10, 22, 'METHOD("PurgeHistoryDataSp")
	PARMS("$service", E(PurgeDBMethodToCall), E(DaysOld), RV(InfobarVar))', N'Call PurgeHistoryDataSp with parameters.')

    INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
	VALUES (@EHRP, 20, 12, 'CONDITION(V(InfobarVar) > "")
	SETPARMVALUES(InfobarParm=V(InfobarVar))', N'Preserves any message')
END
GO
