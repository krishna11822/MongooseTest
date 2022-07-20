/* Remove all versions of the form. */
DECLARE @Name SYSNAME = 'ApplyDatabase'
DELETE FROM dbo.Forms  WHERE Name = @Name
DELETE FROM dbo.FormComponents01 WHERE FormID in (select id from forms where name = @name)
DELETE FROM dbo.FormComponents02 WHERE FormID in (select id from forms where name = @name)
DELETE FROM dbo.ActiveXComponentProperties WHERE FormID in (select id from forms where name = @name)
DELETE FROM FormEventHandlers  WHERE FormID in (select id from forms where name = @name)
DELETE FROM dbo.Variables  WHERE FormID in (select id from forms where name = @name)
DELETE FROM dbo.ActiveXScriptLines WHERE ScriptName = @name
DELETE FROM dbo.ActiveXScripts WHERE Name = @name
DELETE FROM FormComponentDragDropEvents WHERE FormID in (select id from forms where name = @name)
DELETE FROM dbo.DerivedFormOverrides  WHERE FormID in (select id from forms where name = @name)
DELETE FROM RuntimeChanges WHERE FormName = @Name
