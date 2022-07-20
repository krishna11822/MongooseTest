
update ucc
set MessageDesc = apt.TableName
from AuditLogTypes ucc
inner join AppTable apt on
  apt.AppViewName = ucc.MessageDesc
where Category = 'D'

