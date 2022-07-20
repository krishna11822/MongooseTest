IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[ObjectBuildMessagesFk2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ObjectBuildMessages]'))
ALTER TABLE [dbo].[ObjectBuildMessages] DROP CONSTRAINT [ObjectBuildMessagesFk2]
GO
IF COL_LENGTH('ObjectMainMessages','AccessAs') IS NOT NULL
       EXEC sp_executesql N'DELETE FROM ObjectMainMessages WHERE AccessAs = ''Core'''
ELSE 
       DELETE FROM ObjectMainMessages

DELETE FROM ObjectBuildMessages 

ALTER TABLE ApplicationMessages disable trigger all
IF COL_LENGTH('ApplicationMessages','AccessAs') IS NOT NULL
       EXEC sp_executesql N'DELETE FROM ApplicationMessages WHERE AccessAs = ''Core'''
ELSE
       DELETE FROM ApplicationMessages
ALTER TABLE ApplicationMessages enable trigger all

GO



