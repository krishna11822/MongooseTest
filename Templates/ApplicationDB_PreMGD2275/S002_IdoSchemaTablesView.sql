-- =================================================================================
-- Stored Procedure: IdoSchemaTablesView
-- This view retrieves user table and view information for the current database.
-- The data is retrieved from the INFORMATION_SCHEMA.TABLES system view and is
-- filtered to exclude some internal-use-only tables.
-- Note that there is a similar view called SchemaTablesView which also includes
-- a filter on "_all" the "tmp_" tables.
-- =================================================================================
/* $Header: /Tools/Managed/BinDebug/Templates/ApplicationDB/S002_IdoSchemaTablesView.sql 1     8/23/07 6:52p Djohnson $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW IdoSchemaTablesView
AS
SELECT
  TABLE_NAME
, TABLE_TYPE
, ild.ProfileName
FROM INFORMATION_SCHEMA.TABLES t
LEFT OUTER JOIN IdoLinkedTable ilt
   ON ilt.ViewName = t.TABLE_NAME
LEFT OUTER JOIN IdoLinkedDatabase ild
   ON ild.IdoLinkDatabase = ilt.IdoLinkDatabase
WHERE TABLE_NAME != 'dtproperties'
  AND TABLE_NAME NOT LIKE '%[_]committed'
  AND TABLE_NAME NOT LIKE '%[_]impacted'
  AND TABLE_NAME NOT LIKE 'tt[_]%'
  AND TABLE_NAME NOT LIKE '%[_]dd'
  AND TABLE_NAME NOT LIKE '%[_]ii'
