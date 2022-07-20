-- =============================================================================================
--  RS 5322 (Asterisk as required indicator):
-- =============================================================================================

if NOT EXISTS(SELECT 1 from DefaultTypes where DefaultType = 44)
insert into DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (44, N'Asterisk as required indicator')

GO