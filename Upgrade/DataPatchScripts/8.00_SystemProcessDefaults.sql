update site
set ReportOutputDirectory = spd.DefaultValue
from site
inner join parms on
  parms.site = site.site
inner join SystemProcessDefaults spd ON
  spd.DefaultType = 33

update site
set TenantID = spd.DefaultValue
from site
inner join parms on
  parms.site = site.site
inner join SystemProcessDefaults spd ON
  spd.DefaultType = 37

delete SystemProcessDefaults where DefaultType in (33,37)

delete DefaultTypes
where DefaultType in (33, 37)

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 46)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (46, N'Logical IDs aliased in BOD')
