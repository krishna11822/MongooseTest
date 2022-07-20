/* $Header: /Tools/SQLScripts/ApplicationDB/Views/EventActionStateView.sql 2     3/06/07 2:51p Djohnson $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

CREATE VIEW RootCollectionsView AS
WITH CollectionsAll ( CollectionName, StartName, Extends, ColLevel )
AS
( 
SELECT CollectionName, CollectionName, Extends, 0 from ido.Collections c 
INNER JOIN UserNameView u ON 1=1
  where 1 = CASE WHEN c.LockBy = u.UserName THEN c.DevelopmentFlag ELSE c.DevelopmentFlag + 1 END
UNION ALL
SELECT c.CollectionName, c2.StartName, c.Extends, ColLevel + 1
FROM ido.Collections c
INNER JOIN CollectionsAll c2 ON
  c2.Extends = c.CollectionName
INNER JOIN UserNameView u ON 1=1
  WHERE 1 = CASE WHEN c.LockBy = u.UserName 
     THEN c.DevelopmentFlag ELSE c.DevelopmentFlag + 1 END
)
SELECT * from CollectionsAll
