-- Update for the ProcessNewDataMaintenance event for ReqSet 5926 
-- enhancements to New Data Maintenance Wizard

DECLARE @EHRP uniqueidentifier
SET @EHRP = 'E70B3E38-D312-4D47-9D33-630F7D3D63E0'

DELETE FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 120

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 400)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 400, 5, N'CONDITION(E(GenerateScripts) = "0")
DEST(800)', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 410)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 410, 5, N'CONDITION(E(UDTNames) = "")
DEST(430)', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 420)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 420, 21, N'IDO("TmpStagingNewDataMaintenances")
METHOD("UDTScriptSp")
PARMS(E(UDTNames), "dbo", RV(UDTScript))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 430)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 430, 21, N'IDO("TmpStagingNewDataMaintenances")
METHOD("TableScriptStringSp")
PARMS(P(Batch, 1, "TableIDOName"), "dbo", RV(TableScript))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 500)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 500, 12, N'CONDITION(1 = 1)
SETPARMVALUES(ScriptString = SUBSTITUTE( "{0}  {1}", V(UDTScript),V(TableScript)))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 800)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 800, 10, N'RESULT(MESSAGE("E=TableAndIDOCreated"))', N' ')


GO