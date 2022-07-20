/*
 * 5/16/11 12:28 RKuhn RS4561 Remove ItemName column
 * 02/19/2016 - NThurn - RS7107 Added QuoteTableAliases column
 */

/*
Copyright © 2016 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW ido.Collections
AS
SELECT
  CollectionName
, ServerName
, CollectionDesc
, LockBy
, RevisionNo
, RevisionDate
, DevelopmentFlag
, CustomAssemblyName
, ExtClassNamespace
, ExtClassName
, Extends
, ReplaceFlag
, InWorkflow
, NoteExistsFlag
, RecordDate
, RowPointer
, CreatedBy
, UpdatedBy
, CreateDate
, LabelStringID
, OutriggerProfile
, QuoteTableAliases
FROM ToolsDev_600_Objects.dbo.Collections
