declare @cmd varchar(4000)
declare cmds cursor for 
select 'drop table [' + Table_Name + ']'
from INFORMATION_SCHEMA.TABLES
where Table_Name like 'tempFormSync_%' and Table_Type like 'BASE TABLE'

open cmds
while 1=1
begin
    fetch cmds into @cmd
    if @@fetch_status != 0 break
    exec(@cmd)
end
close cmds;
deallocate cmds

GO

declare @cmd varchar(4000)
declare cmds cursor for 
select 'drop view [' + Table_Name + ']'
from INFORMATION_SCHEMA.TABLES
where Table_Name like 'tempFormSync_%' and Table_Type like 'VIEW'

open cmds
while 1=1
begin
    fetch cmds into @cmd
    if @@fetch_status != 0 break
    exec(@cmd)
end
close cmds;
deallocate cmds