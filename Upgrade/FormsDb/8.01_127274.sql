--  If somebody put statistics on this column, drop it.  It does not need to be
-- recreated.
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
where stc.object_id = object_id('PropertyDefaults02')
and sc.name = 'HelpFileName'
IF @Statname IS NOT NULL
BEGIN
   SET @SQL = N'DROP STATISTICS PropertyDefaults02.' + @Statname
   EXECUTE (@SQL)
END

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PropertyDefaults02]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'HelpFileName' 
   AND OBJECT_NAME(id) = N'PropertyDefaults02')
ALTER TABLE [dbo].[PropertyDefaults02]
  ALTER COLUMN [HelpFileName] NVARCHAR(MAX) NULL
GO

