update ucc
set table_name = apt.TableName
from table_class ucc
inner join AppTable apt on
  apt.AppViewName = ucc.table_name

update ucc
set table_name = apt.TableName
from table_class_committed ucc
inner join AppTable apt on
  apt.AppViewName = ucc.table_name

update ucc
set table_name = apt.TableName
from table_class_impacted ucc
inner join AppTable apt on
  apt.AppViewName = ucc.table_name

--update ucc
--set table_name = apt.TableName
--from user_class_record_assoc ucc
--inner join AppTable apt on
--  apt.AppViewName = ucc.table_name

