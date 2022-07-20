-- RS5081 introduced a feature called "Self-contained captions" applicable
-- to edit and combobox components. To turn it on, we reused a flag value
-- that was previously only used for static and grid column components.
-- Apparently, some edit and combobox components can have the flag turned
-- on for whatever reason, since previously we didn't pay attention to it
-- for those component types. Now those components all of a sudden will have
-- the Self-contained caption behavior turned on, so before upgrading to 8.03
-- we need to find them and turn off the flag. Component types affected are:
--
-- 1:  Edit
-- 2:  ComboBox
-- 3:  DropList
-- 26: DateCombo
-- 27: EnhancedCombo

UPDATE [FormComponents01]
  SET [Flags] ^= 0x40
  WHERE [Type] in (1, 2, 3, 26, 27) AND ([Flags] & 0x40) = 0x40

