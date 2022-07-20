/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoCollectionsView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW dbo.IdoCollectionsView
AS
-- Note that this view will only include records that are either
-- not checked out or that are checked out by the current user.
SELECT
  svr.AccessAs
, col.CollectionName
, col.ServerName
, col.CollectionDesc
, col.LockBy
, col.RevisionNo
, col.RevisionDate
, col.DevelopmentFlag
, col.CustomAssemblyName
, col.ExtClassNamespace
, col.ExtClassName
, col.Extends
, col.ReplaceFlag
, col.InWorkflow
, col.NoteExistsFlag
, col.RecordDate
, col.RowPointer
, col.CreatedBy
, col.UpdatedBy
, col.CreateDate
, col.LabelStringID
, col.OutriggerProfile
, col.QuoteTableAliases
FROM ido.Collections col INNER JOIN ido.Servers svr ON col.ServerName = svr.ServerName
INNER JOIN UserNameView u ON 1=1
WHERE 1 = (CASE WHEN col.LockBy = u.UserName THEN col.DevelopmentFlag ELSE col.DevelopmentFlag + 1 END)
