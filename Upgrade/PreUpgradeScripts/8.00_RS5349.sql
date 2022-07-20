--RS5349
--Drop Obsolete Triggers from wb_ tables prior to renaming tables
DECLARE @Name NVARCHAR(500)
, @Sql NVARCHAR(500)

DECLARE crsTriggerDrop CURSOR LOCAL STATIC FOR
SELECT name 
FROM sysobjects
WHERE name LIKE 'wb[_]%'
AND xtype = 'TR'

OPEN crsTriggerDrop

WHILE 1=1
BEGIN
   FETCH crsTriggerDrop
   INTO @Name
   
   IF @@FETCH_STATUS <> 0
      BREAK
      
   SET @Sql = 'DROP TRIGGER ' + @Name
   EXEC sp_executesql @Sql
END
CLOSE crsTriggerDrop
DEALLOCATE crsTriggerDrop
