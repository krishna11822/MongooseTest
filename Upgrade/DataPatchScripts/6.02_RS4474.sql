
if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 40)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (40, N'Default script language.')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 41)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (41, N'Allow script language selection.')

