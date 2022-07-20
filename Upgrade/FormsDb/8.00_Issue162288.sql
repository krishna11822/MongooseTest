DECLARE
  @Statname sysname
, @SQL NVARCHAR(MAX)
select @Statname = st.name
from sys.stats_columns stc
inner join sys.columns sc on
  sc.object_id = stc.object_id
inner join sys.stats st on
  st.object_id = stc.object_id
AND st.stats_id = stc.stats_id
and stc.column_id = sc.column_id
where stc.object_id = object_id('variables')
and sc.name = 'Value3'

IF @Statname IS NOT NULL
BEGIN
   SET @SQL = N'DROP STATISTICS variables.' + @Statname
   EXECUTE (@SQL)
END

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[variables]'), N'IsUserTable') = 1 
   AND EXISTS (SELECT 1 FROM [sys].[columns] 
      WHERE [object_id] = OBJECT_ID(N'[dbo].[variables]') 
      AND [name] = N'Value3 ') 

ALTER TABLE variables ALTER COLUMN Value3 NVARCHAR(MAX) NULL
GO

