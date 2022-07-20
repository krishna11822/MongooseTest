
if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 42)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (42, N'NUMSORTCHAR numeric pad.')

GO