IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 63)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (63, N'Round Robin Polling Interval (ms)')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 64)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (64, N'No del Group SecurityUserMaster BOD')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 65)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (65, N'No del Module SecurityUserMaster BOD')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 66)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (66, N'Round Robin Batch Size')
