EXECUTE ('IF EXISTS (SELECT 1 FROM sys.triggers where name = ''IdoCollectionRulesViewDel'')
DROP TRIGGER IdoCollectionRulesViewDel')

EXECUTE ('CREATE TRIGGER [dbo].[IdoCollectionRulesViewDel] ON [dbo].[IdoCollectionRulesView]
INSTEAD OF DELETE
AS
DELETE icr
FROM ido.CollectionRules AS icr
INNER JOIN deleted AS dd ON
  icr.RowPointer= dd.RowPointer
RETURN
')
