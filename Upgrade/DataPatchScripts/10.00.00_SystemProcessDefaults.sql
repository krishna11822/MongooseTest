IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 60)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (60, N'Framework Event Max. Recursion Depth')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 63)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (63, N'Round Robin Polling Interval (ms)')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 64)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (64, N'No del Group SecurityUserMaster BOD')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 65)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (65, N'No del Module SecurityUserMaster BOD')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 66)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (66, N'Round Robin Batch Size')

DECLARE @NewDefaultTypeDesc45 ShortDescType = N'Save record cap override'
IF (SELECT DefaultTypeDesc FROM DefaultTypes WHERE DefaultType = 45)
       <> @NewDefaultTypeDesc45
BEGIN
   UPDATE DefaultTypes
	SET DefaultTypeDesc = @NewDefaultTypeDesc45
	WHERE DefaultType = 45

   UPDATE d SET d.DefaultValue = 1 - DefaultValue
   FROM SystemProcessDefaults d
   WHERE d.DefaultType = 45

   UPDATE d SET d.DefaultValue = 1 - DefaultValue
   FROM UserProcessDefaults d
   WHERE d.DefaultType = 45
END
