-- ============================================================
--  Issue #: 172962
--  Notes:   RS6523
-- ============================================================
if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 47)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (47, N'User inactivity threshold')

-- =============================================================
--  RS #:   3184
--  Notes:  Runtime form changes
-- =============================================================
if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 48)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (48, N'Allow saving form runtime changes')

-- =============================================================
--  RS #:   6505
--  Notes:  Browser inactivity screen lock minutes
-- =============================================================
if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 49)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (49, N'Browser inactivity lock minutes')

GO