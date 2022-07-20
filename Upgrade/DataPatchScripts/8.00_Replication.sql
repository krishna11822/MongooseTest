
if exists (select 1 from sys.triggers where name = 'rep_object_categoryIup')
alter table rep_object_category disable trigger rep_object_categoryIup
update ucc
set object_name = apt.TableName
from rep_object_category ucc
inner join AppTable apt on
  apt.AppViewName = ucc.object_name
WHERE ucc.object_type = 1

update ucc
set to_object_name = apt.TableName
from rep_object_category ucc
inner join AppTable apt on
  apt.AppViewName = ucc.to_object_name
WHERE ucc.object_type = 1
AND ucc.category NOT LIKE 'EXTFIN%'

if exists (select 1 from sys.triggers where name = 'rep_object_categoryIup')
alter table rep_object_category enable trigger rep_object_categoryIup