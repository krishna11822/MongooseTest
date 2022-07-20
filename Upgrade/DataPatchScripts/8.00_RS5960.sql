if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 45)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (45, N'Disable record cap override save')
