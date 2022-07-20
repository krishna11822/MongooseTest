--  An issue with notes replication in a multisite in a database scenario caused the same note tokens 
-- to be used by records in different sites.  In these cases, new copies of the notes need to be created
-- and the NotesSiteMap needs a ToSite to track from/to and not just from for notes copied between sites.
-- In order to determine what the property ToSite is, the base table records are checked for site ref columns
-- and that value is used to create the new mappings.  The ToSite column will become part of the primary key
-- in the NotesSiteMap table, but the data has to be calculated first.  For this reason, the existing primary
-- key constraint is dropped and the new column is added as nullable.  After all the calculations are done,
-- the column is made mandatory and the primary key is recreated to include the new ToSite column.

IF OBJECT_ID('PK_NotesSiteMap') IS NOT NULL
ALTER TABLE NotesSiteMap DROP CONSTRAINT PK_NotesSiteMap
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[NotesSiteMap]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[NotesSiteMap]')
      AND [name] = N'ToSite')
ALTER TABLE NotesSiteMap ADD ToSite SiteType  NULL
GO
--  If there is only 1 site in this database, just set the ToSite to that value rather than looking at
-- individual tables.
IF (SELECT COUNT(*)
FROM  site
WHERE app_db_name = db_name() ) = 1
BEGIN
UPDATE NotesSiteMap
SET ToSite = (
SELECT TOP 1 site
FROM site
WHERE app_db_name = db_name())
END
ELSE -- Multisite database
BEGIN
CREATE TABLE #SystemNotesSwap (
  ObjectRowPointer uniqueidentifier NOT NULL,
  ToSite NVARCHAR(10) NULL)

DECLARE
  @TableName sysname
, @SiteColumn SYSNAME
, @DefaultSite SiteType
, @SQL NVARCHAR(max)
, @NoteHeaderToken TokenType
, @BaseTable SYSNAME

-- Get a default site to use for any cases where no answer is found.
SELECT TOP 1 @DefaultSite = site
FROM site
WHERE app_db_name = db_name()
IF @@ROWCOUNT = 0
   SELECT TOP 1 @DefaultSite = site
   FROM site

--  Find all the mapped system notes. Try and figure out the ToSite based on the
-- base table name and rowpointer.
INSERT INTO #SystemNotesSwap (ObjectRowPointer)
SELECT obn.RowPointer
FROM NotesSiteMap nsm
INNER JOIN ObjectNotes obn ON
  obn.SystemNoteToken = nsm.LocalNoteToken
WHERE nsm.TypeOfNote = 'S'

DECLARE SystemCrs CURSOR LOCAL STATIC FOR
SELECT DISTINCT nh.ObjectName
FROM NoteHeaders nh
INNER JOIN ObjectNotes obn ON
  obn.NoteHeaderToken = nh.NoteHeaderToken
INNER JOIN #SystemNotesSwap sns ON
  sns.ObjectRowPointer = obn.RowPointer
OPEN SystemCrs
WHILE 1=1
BEGIN
   FETCH SystemCrs INTO @TableName
   IF @@FETCH_STATUS <> 0
      BREAK

   SELECT @SiteColumn = SiteColumnName
   , @BaseTable = TableName
   FROM AppTable
   WHERE AppViewName = @TableName
   IF @@rowcount = 0
      CONTINUE

   SET @SQL = N'
update sns
set ToSite = xx.' + @SiteColumn + N'
from #SystemNotesSwap sns
inner join ObjectNotes obn on
  obn.RowPointer = sns.ObjectRowPointer
inner join ' + @BaseTable + N' xx on
  xx.RowPointer = obn.RefRowPointer
'
EXECUTE (@SQL)

END
CLOSE SystemCrs
DEALLOCATE SystemCrs

--  Any unfound sites are defaulted.
UPDATE #SystemNotesSwap
SET ToSite = @DefaultSite
WHERE ToSite IS NULL

CREATE TABLE #SystemNotesSwap2 ( 
   SystemNoteToken DECIMAL(11,0) NOT NULL,
   ToSite NVARCHAR(10) NOT NULL,
   NewSystemNoteRowPointer uniqueidentifier NOT NULL,
   RowCounter INT NOT NULL )

INSERT INTO #SystemNotesSwap2 (SystemNoteToken, ToSite, RowCounter, NewSystemNoteRowPointer)
SELECT LocalNoteToken, ToSite, ROW_NUMBER() OVER (PARTITION BY LocalNoteToken ORDER BY ToSite), NEWID()
FROM (SELECT DISTINCT nsm.LocalNoteToken, sns.ToSite
FROM notessitemap nsm
INNER JOIN ObjectNotes obn ON
  nsm.LocalNoteToken = obn.SystemNoteToken
INNER JOIN #SystemNotesSwap sns ON
  sns.ObjectRowPointer = obn.RowPointer
WHERE nsm.TypeOfNote = 'S') AS x

DELETE #SystemNotesSwap2 -- First row will stay the same.  All other rows must be duplicated in notes table and NotesSiteMap table.
WHERE RowCounter = 1

--  If there are multiple sites using the system note, then the system note is duplicated and a new mapping to the new note created.
INSERT INTO SystemNotes (NoteContent, NoteDesc, RowPointer)
SELECT sn.NoteContent, sn.NoteDesc, sw2.NewSystemNoteRowPointer
FROM #SystemNotesSwap2 sw2
INNER JOIN SystemNotes sn ON
  sn.SystemNoteToken = sw2.SystemNoteToken

UPDATE obn
SET SystemNoteToken = snt.SystemNoteToken
FROM ObjectNotes obn
INNER JOIN #SystemNotesSwap sn ON
  sn.ObjectRowPointer = obn.RowPointer
INNER JOIN #SystemNotesSwap2 sw2 ON
  sw2.SystemNoteToken = obn.SystemNoteToken
AND sw2.ToSite = sn.ToSite
INNER JOIN SystemNotes snt ON
  snt.RowPointer = sw2.NewSystemNoteRowPointer


INSERT INTO NotesSiteMap(FromSite, FromNoteToken, LocalNoteToken, TypeOfNote)
SELECT nsp.FromSite, nsp.FromNoteToken, snt.SystemNoteToken, 'S'
FROM NotesSiteMap nsp
INNER JOIN #SystemNotesSwap2 sw2 ON
  sw2.SystemNoteToken = nsp.LocalNoteToken
INNER JOIN SystemNotes snt ON
  snt.RowPointer = sw2.NewSystemNoteRowPointer
WHERE nsp.TypeOfNote = 'S'

-- That was fun.  Now let's duplicate the System note logic for user notes.
DELETE #SystemNotesSwap2 
DELETE #SystemNotesSwap

INSERT INTO #SystemNotesSwap (ObjectRowPointer)
SELECT obn.RowPointer
FROM NotesSiteMap nsm
INNER JOIN ObjectNotes obn ON
  obn.UserNoteToken = nsm.LocalNoteToken
WHERE nsm.TypeOfNote = 'U'

DECLARE SystemCrs CURSOR LOCAL STATIC FOR
SELECT DISTINCT nh.ObjectName
FROM NoteHeaders nh
INNER JOIN ObjectNotes obn ON
  obn.NoteHeaderToken = nh.NoteHeaderToken
INNER JOIN #SystemNotesSwap sns ON
  sns.ObjectRowPointer = obn.RowPointer
OPEN SystemCrs
WHILE 1=1
BEGIN
   FETCH SystemCrs INTO @TableName
   IF @@FETCH_STATUS <> 0
      BREAK

   SELECT @SiteColumn = SiteColumnName
   , @BaseTable = TableName
   FROM AppTable
   WHERE AppViewName = @TableName
   IF @@rowcount = 0
      CONTINUE

   SET @SQL = N'
UPDATE sns
SET ToSite = xx.' + @SiteColumn + N'
FROM #SystemNotesSwap sns
INNER JOIN ObjectNotes obn ON
  obn.RowPointer = sns.ObjectRowPointer
INNER JOIN ' + @BaseTable + N' xx ON
  xx.RowPointer = obn.RefRowPointer
'
EXECUTE (@SQL)

END
CLOSE SystemCrs
DEALLOCATE SystemCrs

UPDATE #SystemNotesSwap
SET ToSite = @DefaultSite
WHERE ToSite IS NULL

INSERT INTO #SystemNotesSwap2 (SystemNoteToken, ToSite, RowCounter, NewSystemNoteRowPointer)
SELECT LocalNoteToken, ToSite, ROW_NUMBER() OVER (PARTITION BY LocalNoteToken ORDER BY ToSite), NEWID()
FROM (SELECT DISTINCT nsm.LocalNoteToken, sns.ToSite
FROM NotesSiteMap nsm
INNER JOIN ObjectNotes obn ON
  nsm.LocalNoteToken = obn.UserNoteToken
INNER JOIN #SystemNotesSwap sns ON
  sns.ObjectRowPointer = obn.RowPointer
WHERE nsm.TypeOfNote = 'U') AS x

DELETE #SystemNotesSwap2 -- First row will stay the same.  All other rows must be duplicated in notes table and NotesSiteMap table.
WHERE RowCounter = 1

INSERT INTO UserNotes (Username, NoteContent, NoteDesc, RowPointer)
SELECT sn.Username, sn.NoteContent, sn.NoteDesc, sw2.NewSystemNoteRowPointer
FROM #SystemNotesSwap2 sw2
INNER JOIN UserNotes sn ON
  sn.UserNoteToken = sw2.SystemNoteToken

UPDATE obn
SET UserNoteToken = snt.UserNoteToken
FROM ObjectNotes obn
INNER JOIN #SystemNotesSwap sn ON
  sn.ObjectRowPointer = obn.RowPointer
INNER JOIN #SystemNotesSwap2 sw2 ON
  sw2.SystemNoteToken = obn.UserNoteToken
AND sw2.ToSite = sn.ToSite
INNER JOIN UserNotes snt ON
  snt.RowPointer = sw2.NewSystemNoteRowPointer

INSERT INTO NotesSiteMap(FromSite, FromNoteToken, LocalNoteToken, TypeOfNote)
SELECT nsp.FromSite, nsp.FromNoteToken, snt.UserNoteToken, 'U'
FROM NotesSiteMap nsp
INNER JOIN #SystemNotesSwap2 sw2 ON
  sw2.SystemNoteToken = nsp.LocalNoteToken
INNER JOIN UserNotes snt ON
  snt.RowPointer = sw2.NewSystemNoteRowPointer
WHERE nsp.TypeOfNote = 'U'

DROP TABLE #SystemNotesSwap2 
DROP TABLE #SystemNotesSwap

-- System and user shared notes have been handled.  The next section is for specific notes.  A specific note
-- should only be tied to a single record.  If it is tied to multiple records that is indicative of a data
-- problem, which the stored procedures in this issue address.
CREATE TABLE #SpecificNotesSwap ( 
   FromSite NVARCHAR(10) NOT NULL, 
   FromNoteToken decimal(11,0) NOT NULL, 
   SpecificNoteToken decimal(11,0) NOT NULL, 
   RefRowPointer uniqueidentifier NOT NULL,
   ObjectNoteToken decimal(11,0) NOT NULL,
   NewNoteRowPointer uniqueidentifier NOT NULL,
   RowNumber INT NOT NULL )
INSERT INTO #SpecificNotesSwap (FromSite, FromNoteToken, SpecificNoteToken, RefRowPointer, ObjectNoteToken, NewNoteRowPointer, RowNumber)
SELECT nsm.FromSite, nsm.FromNoteToken, nsm.LocalNoteToken, obn.RefRowPointer, obn.ObjectNoteToken, NEWID(), ROW_NUMBER() OVER (PARTITION BY obn.SpecificNoteToken ORDER BY SpecificNoteToken)
FROM notessitemap nsm
INNER JOIN ObjectNotes obn ON
  nsm.LocalNoteToken = obn.SpecificNoteToken
WHERE nsm.TypeOfNote = 'P'

--  A single note is not a problem.  Only if multiple records on a note are found is there data to be fixed.
DELETE #SpecificNotesSwap
WHERE RowNumber = 1

--  Create new specific notes and point the object notes records to the new specific note records.
INSERT INTO SpecificNotes(NoteContent, NoteDesc, RowPointer)
SELECT sn.NoteContent, sn.NoteDesc, sns.NewNoteRowPointer
FROM #SpecificNotesSwap sns
INNER JOIN SpecificNotes sn ON
  sn.SpecificNoteToken = sns.SpecificNoteToken

UPDATE obn
SET SpecificNoteToken = sn.SpecificNoteToken
FROM ObjectNotes obn
INNER JOIN #SpecificNotesSwap sns ON
  sns.ObjectNoteToken = obn.ObjectNoteToken
INNER JOIN SpecificNotes sn ON
  sn.RowPointer = sns.NewNoteRowPointer

--  NotesSiteMap needs new records to match the new notes.
INSERT INTO NotesSiteMap (FromSite, FromNoteToken, LocalNoteToken, TypeOfNote)
SELECT FromSite, FromNoteToken, sn.SpecificNoteToken, 'P'
FROM #SpecificNotesSwap sns
INNER JOIN SpecificNotes sn ON
  sn.RowPointer = sns.NewNoteRowPointer

DROP TABLE #SpecificNotesSwap
CREATE TABLE #MasterMap (NoteHeaderToken DECIMAL(11,0) NOT NULL, RefRowPointer uniqueidentifier NOT NULL)
INSERT into #MasterMap (NoteHeaderToken, RefRowPointer)
SELECT obm.NoteHeaderToken, obm.RefRowPointer
FROM notessitemap nsm
INNER JOIN ObjectNotes obm ON
  obm.SystemNoteToken = nsm.LocalNoteToken
WHERE nsm.TypeOfNote = 'S'
UNION
SELECT obm.NoteHeaderToken, obm.RefRowPointer
FROM notessitemap nsm
INNER join ObjectNotes obm ON
  obm.UserNoteToken = nsm.LocalNoteToken
WHERE nsm.TypeOfNote = 'U'
UNION
SELECT obm.NoteHeaderToken, obm.RefRowPointer
FROM notessitemap nsm
INNER JOIN ObjectNotes obm ON
  obm.SpecificNoteToken = nsm.LocalNoteToken
WHERE nsm.TypeOfNote = 'P'

--  Loop through the different tables with notes on them and try to figure out what site the object
-- notes records are associated with.
DECLARE
  TableCrs CURSOR LOCAL STATIC FOR
SELECT DISTINCT nh.ObjectName, mm.NoteHeaderToken
FROM #MasterMap mm
INNER JOIN NoteHeaders nh ON
  nh.NoteHeaderToken = mm.NoteHeaderToken
OPEN TableCrs
WHILE 1=1
BEGIN
   FETCH TableCrs INTO @TableName, @NoteHeaderToken
   IF @@fetch_status <> 0
      BREAK
   SELECT @SiteColumn = SiteColumnName
   , @BaseTable = TableName
   FROM AppTable
   WHERE AppViewName = @TableName
   IF @@ROWCOUNT = 0
      CONTINUE

   SET @SQL = N'
UPDATE NotesSiteMap
SET ToSite = xx.' + @SiteColumn + N'
FROM NotesSiteMap nsm
INNER JOIN ObjectNotes obm ON
  obm.SpecificNoteToken = nsm.LocalNoteToken
INNER JOIN #MasterMap mm ON
  mm.RefRowPointer = obm.RefRowPointer
INNER JOIN ' + @BaseTable + N' xx ON
xx.RowPointer = obm.RefRowPointer
WHERE nsm.TypeOfNote = ''P''
'
-- select @SQL
EXECUTE (@SQL)

   SET @SQL = N'
UPDATE NotesSiteMap
SET ToSite = xx.' + @SiteColumn + N'
FROM NotesSiteMap nsm
INNER join ObjectNotes obm on
  obm.SystemNoteToken = nsm.LocalNoteToken
INNER JOIN #MasterMap mm ON
  mm.RefRowPointer = obm.RefRowPointer
INNER JOIN ' + @BaseTable + N' xx ON
xx.RowPointer = obm.RefRowPointer
WHERE nsm.TypeOfNote = ''S''
'
-- select @SQL
EXECUTE (@SQL)

   SET @SQL = N'
UPDATE NotesSiteMap
SET ToSite = xx.' + @SiteColumn + N'
FROM NotesSiteMap nsm
inner join ObjectNotes obm on
  obm.UserNoteToken = nsm.LocalNoteToken
INNER JOIN #MasterMap mm ON
  mm.RefRowPointer = obm.RefRowPointer
INNER JOIN ' + @BaseTable + N' xx ON
xx.RowPointer = obm.RefRowPointer
WHERE nsm.TypeOfNote = ''U''
'
-- select @SQL
EXECUTE (@SQL)

END
CLOSE TableCrs
DEALLOCATE TableCrs

EXECUTE (N'update NotesSiteMap
SET ToSite = ''' + @DefaultSite + N'''
WHERE ToSite IS NULL')

DROP TABLE #MasterMap 

END
GO
ALTER TABLE NotesSiteMap ALTER COLUMN ToSite SiteType NOT NULL
IF OBJECT_ID('PK_NotesSiteMap') IS NOT NULL
ALTER TABLE NotesSiteMap DROP CONSTRAINT PK_NotesSiteMap
GO
ALTER TABLE NotesSiteMap ADD CONSTRAINT PK_NotesSiteMap PRIMARY KEY (FromSite, FromNoteToken, TypeOfNote, ToSite)
GO
exec [dbo].[SchemaAdditionalTasksSp]
     'NotesSiteMap'--@PStartingTable TableNameType
   , 'NotesSiteMap' -- @PEndingTable TableNameType
   , ''
GO

