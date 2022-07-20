IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 69)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (69, N'Report max record cap')

-- Default report max record cap from winstudio max record cap if it is set
IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 69)
AND EXISTS (SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 36)
INSERT INTO SystemProcessDefaults(DefaultType, DefaultValue, NoteExistsFlag, InWorkflow )
SELECT 69, DefaultValue, 0, 0
FROM SystemProcessDefaults
WHERE DefaultType = 36