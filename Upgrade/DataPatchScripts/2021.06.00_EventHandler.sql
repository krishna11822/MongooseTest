-- ClearServiceSessions
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'CF41C0EE-D2B0-4E78-B9B1-01D1769E6708'

UPDATE EventAction 
SET ActionType = 21
, Parameters = 'IDO("EventTriggers") METHOD("ClearOldSessionsSp") PARMS("", RV(InfobarVar))'
WHERE EventHandlerRowPointer = @EHRP
AND Sequence = 10
GO
