/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoMethodsView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW dbo.IdoMethodsView
AS
SELECT
  m.CollectionName
, m.MethodName
, m.MethodDesc
, m.MethodType
, m.StoredProcName
, m.DevelopmentFlag
, m.TxnFlag
, m.InWorkflow
, m.NoteExistsFlag
, m.RecordDate
, m.RowPointer
, m.CreatedBy
, m.UpdatedBy
, m.CreateDate
FROM ido.Methods m
INNER JOIN UserNameView u ON 1=1
WHERE EXISTS
(
  SELECT *
  FROM ido.Methods m2 INNER JOIN ido.Collections c ON m2.CollectionName = c.CollectionName AND m2.DevelopmentFlag = c.DevelopmentFlag
  WHERE m.CollectionName = m2.CollectionName AND m.MethodName = m2.MethodName AND m.DevelopmentFlag = m2.DevelopmentFlag
  AND 1 = (CASE WHEN c.LockBy = u.UserName THEN m2.DevelopmentFlag ELSE m2.DevelopmentFlag + 1 END)
)
