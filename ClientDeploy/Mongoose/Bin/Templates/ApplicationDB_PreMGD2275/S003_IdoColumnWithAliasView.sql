/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoColumnWithAliasView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright ? 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW dbo.IdoColumnWithAliasView
AS
WITH ColumnSchema (TableName, ColumnName, OrdinalPosition, DataType, DataLength, DataDecimalPos, ColumnDataType)
AS
(
  SELECT
    TABLE_NAME
  , COLUMN_NAME
  , ORDINAL_POSITION
  , dbo.MongooseTypeFromSqlType(DATA_TYPE)
  , CASE
      WHEN DATA_TYPE IN (N'text', N'char', N'varchar', N'sysname') THEN CHARACTER_MAXIMUM_LENGTH
      WHEN DATA_TYPE IN (N'ntext', N'nchar', N'nvarchar')          THEN CHARACTER_MAXIMUM_LENGTH
      WHEN DATA_TYPE IN (N'numeric', N'decimal')                   THEN NUMERIC_PRECISION
      ELSE NULL
    END
  , CASE
      WHEN DATA_TYPE IN (N'numeric', N'decimal') THEN NUMERIC_SCALE
      ELSE NULL
    END
  , COALESCE(DOMAIN_NAME, DATA_TYPE)
  FROM INFORMATION_SCHEMA.COLUMNS
)
SELECT
  t.CollectionName
, ColumnSchema.TableName
, ColumnSchema.ColumnName
, ColumnSchema.OrdinalPosition
, TableAlias
, TableAlias + '.' + ColumnSchema.ColumnName AS ColumnWithAlias
, TableType
, JoinType
, JoinText
, t.DevelopmentFlag
, ColumnSchema.DataType
, ColumnSchema.DataLength
, ColumnSchema.DataDecimalPos
, ColumnSchema.ColumnDataType
FROM ido.Tables t 
INNER JOIN IdoCollectionsView icv ON
icv.CollectionName = t.CollectionName
LEFT OUTER JOIN IdoAllTablesView iat ON
  iat.SRC_TABLE_NAME = t.TableName
AND iat.TABLE_TYPE = 'BASE TABLE'
INNER JOIN ColumnSchema ON ColumnSchema.TableName = t.TableName 
OR ColumnSchema.TableName = iat.TABLE_NAME
WHERE icv.OutriggerProfile IS NULL
UNION
SELECT icv.CollectionName, ilt.TableName, ilc.ColumnName,  ROW_NUMBER() OVER( PARTITION BY ilt.TableName ORDER BY ilt.TableName, ilc.ColumnName ASC) AS OrdinalPosition
, idt.TableAlias, idt.TableAlias + N'.' + ilc.ColumnName AS ColumnWithAlias, idt.TableType
, idt.JoinType, idt.JoinText, icv.DevelopmentFlag
, CASE ilc.PropertyDataType 
WHEN 'xml' THEN 'String'
WHEN 'int' THEN 'Long Integer'
WHEN 'decimal' THEN 'Decimal'
WHEN 'timestamp' THEN 'String'
WHEN 'varbinary' THEN 'Binary'
WHEN 'text' THEN 'String'
WHEN 'smallint' THEN 'Short Integer'
WHEN 'varchar' THEN 'String'
WHEN 'datetime' THEN 'Date'
WHEN 'numeric' THEN 'Decimal'
WHEN 'uniqueidentifier' THEN 'GUID'
WHEN 'tinyint' THEN 'Short Integer'
WHEN 'nchar' THEN 'String'
WHEN 'float' THEN 'Float'
WHEN 'date' THEN 'Date'
WHEN 'char' THEN 'String'
WHEN 'bigint' THEN 'Long Integer'
WHEN 'ntext' THEN 'String'
WHEN 'nvarchar' THEN 'String'
WHEN 'bit' THEN 'Byte'
END
, ilc.PropertyLength, ilc.PropertyScale, ilc.PropertyDataType
FROM IdoCollectionsView icv
INNER JOIN IdoLinkedDatabase ild ON
  ild.ProfileName = icv.OutriggerProfile
INNER JOIN IdoLinkedTable ilt ON
  ilt.IdoLinkDatabase = ild.IdoLinkDatabase
INNER JOIN IdoTablesView idt ON
  idt.CollectionName = icv.CollectionName
AND idt.TableName = ilt.TableName
INNER JOIN IdoLinkedColumn ilc ON
  ilc.IdoLInkDatabase = ilt.IdoLinkDatabase
AND ilc.TableName = ilt.TableName

