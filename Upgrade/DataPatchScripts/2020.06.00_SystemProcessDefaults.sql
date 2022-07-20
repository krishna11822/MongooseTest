IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 76)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (76, N'Enable Inbound BOD Prioritization')

IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 54)
INSERT SystemProcessDefaults(DefaultType,DefaultValue, NoteExistsFlag, InWorkflow )
VALUES (54,'1', 0, 0)
ELSE IF EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 54 AND DefaultValue = '0')
UPDATE SystemProcessDefaults
SET DefaultValue = '1'
WHERE DefaultType = 54 AND DefaultValue = '0'

IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 55)
INSERT SystemProcessDefaults(DefaultType,DefaultValue, NoteExistsFlag, InWorkflow )
VALUES (55,'mongoose_', 0, 0)
ELSE IF EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 55 AND (DefaultValue = 'MGCore_' OR DefaultValue = 'mongoose') )
UPDATE SystemProcessDefaults
SET DefaultValue = 'mongoose_'
WHERE DefaultType = 55 AND (DefaultValue = 'MGCore_' OR DefaultValue = 'mongoose')