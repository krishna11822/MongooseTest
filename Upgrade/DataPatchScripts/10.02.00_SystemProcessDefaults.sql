-- Issue 245256 - change names of two process defaults
IF EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 64)
   UPDATE DefaultTypes SET DefaultTypeDesc=N'Keep Groups in SecurityUserMaster' WHERE DefaultType = 64
ELSE
   INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (64, N'Keep Groups in SecurityUserMaster')

IF EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 65)
   UPDATE DefaultTypes SET DefaultTypeDesc=N'Keep Modules in SecurityUserMaster' WHERE DefaultType = 65
ELSE
   INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (65, N'Keep Modules in SecurityUserMaster')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 68)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (68, N'DateTime in Client Time Zone')
