if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 20)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (20, N'Report output obfuscation')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 21)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (21, N'Objects metadata linkage')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 23)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (23, N'IDO checkout disabled')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 24)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (24, N'Keep successful event states')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 26)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (26, N'Persist WinStudio metadata cache')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 30)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (30, N'Collection read mode')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 31)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (31, N'Report paper size')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 34)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (34, N'TaskMan options')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 35)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (35, N'Enable audit logging')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 36)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (36, N'WinStudio max record cap')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 38)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (38, N'Client minutes to ping session')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 39)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (39, N'WinStudio max record cap')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 43)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (43, N'ION pulse interface')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 51)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (51, N'Service AES Originator')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 53)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (53, N'Site Reference Column Name')

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 72)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (72, N'Unprocessed Task Timeout (ms)')


