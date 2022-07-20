/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S001_ido.Tables.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

CREATE VIEW dbo.IdoCollectionRulesView
AS
SELECT
  r.CollectionName
, r.PropertyList
, r.ReferencedBy
, r.RefPropertyList
, r.DeleteAction
, r.Filter
, r.MessageObjectName
, r.DevelopmentFlag
, r.InWorkflow
, r.NoteExistsFlag
, r.RecordDate
, r.RowPointer
, r.CreatedBy
, r.UpdatedBy
, r.CreateDate
FROM ido.CollectionRules r
INNER JOIN UserNameView u ON 1=1
WHERE EXISTS
(
  SELECT *
  FROM ido.CollectionRules r2 INNER JOIN ido.Collections c ON r2.CollectionName = c.CollectionName AND r2.DevelopmentFlag = c.DevelopmentFlag
  WHERE r.CollectionName = r2.CollectionName AND r.RowPointer = r2.RowPointer AND r.DevelopmentFlag = r2.DevelopmentFlag
  AND 1 = (CASE WHEN c.LockBy = u.UserName THEN r2.DevelopmentFlag ELSE r2.DevelopmentFlag + 1 END)
)
