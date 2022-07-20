-- ====================================================
--  227364 : Delete unused table: user_class_record_assoc
-- ====================================================

-- ====================
--  user_class_record_assoc:
-- ====================
-- DROP TABLE

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[user_class_record_assoc]'),N'IsUserTable') = 1
   DROP TABLE [dbo].user_class_record_assoc
GO