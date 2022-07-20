UPDATE AppTable
SET IgnoreInsert = 0
, IgnoreUpdate = 0
WHERE TableName in (N'ProductInfo', N'ProductSchemaInfo', N'ProductSchemaObjectInfo')
GO
