/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoTablesView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW IdoTablesView
AS
SELECT
  t.CollectionName
, t.TableName
, t.TableAlias
, t.TableType
, t.JoinType
, t.JoinText
, t.DevelopmentFlag
, t.InWorkflow
, t.NoteExistsFlag
, t.RecordDate
, t.RowPointer
, t.CreatedBy
, t.UpdatedBy
, t.CreateDate
FROM ido.Tables t
INNER JOIN UserNameView u ON 1=1
WHERE EXISTS
(
  SELECT *
  FROM ido.Tables t2 INNER JOIN ido.Collections c ON t2.CollectionName = c.CollectionName AND t2.DevelopmentFlag = c.DevelopmentFlag
  WHERE t.CollectionName = t2.CollectionName AND t.TableAlias = t2.TableAlias AND t.DevelopmentFlag = t2.DevelopmentFlag
  AND 1 = (CASE WHEN c.LockBy = u.UserName THEN t2.DevelopmentFlag ELSE t2.DevelopmentFlag + 1 END)
)
