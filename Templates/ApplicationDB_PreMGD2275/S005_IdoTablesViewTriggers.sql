EXECUTE ('IF EXISTS (SELECT 1 FROM sys.triggers where name = ''IdoTablesViewDel'')
DROP TRIGGER IdoTablesViewDel')

EXECUTE ('CREATE TRIGGER [dbo].[IdoTablesViewDel] ON [dbo].[IdoTablesView]
INSTEAD OF DELETE
AS
DELETE idt
FROM ido.Tables AS idt
INNER JOIN deleted AS dd ON
  idt.RowPointer= dd.RowPointer
RETURN
')
