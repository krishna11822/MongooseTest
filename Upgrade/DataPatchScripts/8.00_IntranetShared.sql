
update ucc
set TableName = apt.TableName
from IntranetSharedTable ucc
inner join AppTable apt on
  apt.AppViewName = ucc.TableName

update ucc
set TableName = apt.TableName
from IntranetSharedUserTable ucc
inner join AppTable apt on
  apt.AppViewName = ucc.TableName

update ucc
set TableName = apt.TableName
from IntranetSharedUserTableDefault ucc
inner join AppTable apt on
  apt.AppViewName = ucc.TableName

