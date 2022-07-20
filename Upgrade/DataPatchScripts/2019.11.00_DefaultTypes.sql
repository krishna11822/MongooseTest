-- MSF-258261
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 75)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (75, N'Inbound SUM Assign Admin License')

IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 75)
INSERT SystemProcessDefaults(DefaultType,DefaultValue, NoteExistsFlag, InWorkflow )
VALUES (75,'1', 0, 0)
