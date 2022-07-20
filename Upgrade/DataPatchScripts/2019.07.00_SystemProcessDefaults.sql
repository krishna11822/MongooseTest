IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 71)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (71, N'Datalake Prefix')

IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 71)
INSERT SystemProcessDefaults(DefaultType,DefaultValue, NoteExistsFlag, InWorkflow )
VALUES (71,'Mongoose', 0, 0)
