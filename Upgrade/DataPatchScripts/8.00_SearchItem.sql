
update ucc
set TableName = apt.TableName
from SearchItem ucc
inner join AppTable apt on
  apt.AppViewName = ucc.TableName

