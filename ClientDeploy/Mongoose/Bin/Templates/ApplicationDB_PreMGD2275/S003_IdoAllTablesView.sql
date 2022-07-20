CREATE VIEW IdoAllTablesView
AS
	SELECT 
		  IST.TABLE_NAME AS TABLE_NAME
		  , IST.TABLE_TYPE AS TABLE_TYPE
		  , CASE WHEN ILT.TableName IS NULL THEN IST.TABLE_NAME ELSE ILT.TableName END  AS SRC_TABLE_NAME
		  , ILT.ProfileName AS PROFILE_NAME
		  , ILT.CollectionName AS LINKED_COLLECTION_NAME
		  , ILT.TableAlias AS LINKED_TABLE_ALIAS
	FROM IdoSchemaTablesView IST
	LEFT OUTER JOIN
	(
		  SELECT IL.TableName, IL.ViewName, ILD.ProfileName, IDT.CollectionName, IDT.TableAlias
		  FROM IdoLinkedTable IL
		  INNER JOIN IdoLinkedDatabase ILD ON
			ILD.IdoLinkDatabase = IL.IdoLinkDatabase
			--LEFT OUTER JOIN IDOCollectionsView ICV ON
			--ILD.ProfileName = ICV.OutriggerProfile
		  LEFT OUTER JOIN IDO.Tables IDT
		  ON IL.TableName = IDT.TableName --AND ICV.CollectionName = IDT.CollectionName
	  ) ILT
	  ON IST.TABLE_NAME = ILT.ViewName AND IST.TABLE_TYPE = 'VIEW'

