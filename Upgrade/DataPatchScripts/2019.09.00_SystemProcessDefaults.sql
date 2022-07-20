
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 73)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (73, N'Ignore LogicalID in SUM SecurityRole')


IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 73)
INSERT SystemProcessDefaults(DefaultType,DefaultValue, NoteExistsFlag, InWorkflow )
VALUES (73,'1', 0, 0)

GO
