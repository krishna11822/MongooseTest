DECLARE 
 @ServerName SYSNAME
,@DbName SYSNAME
,@SiteRef nvarchar(8)
,@DbType NVARCHAR(1)

,@SQL NVARCHAR(MAX)
,@SQLParms NVARCHAR(MAX)

,@TargetServerName SYSNAME=N'<SQLINSTANCE>'
,@TargetDbName SYSNAME=N'<SQLDBNAME>'

,@TokenSeed DECIMAL(11,0)=1
,@TokenInc DECIMAL(11,0)
,@MaxTokenSeed DECIMAL(11,0)=0
,@TokenCeiling DECIMAL(11,0)=1000000
,@Seq INT
,@RowCount INT
,@Infobar NVARCHAR(1000)

DECLARE @DbList TABLE (
 [ServerName] SYSNAME
,[DbName] SYSNAME
,[Seq] INT IDENTITY(1,1)
)

DECLARE @RecordCounts TABLE ([TableName] SYSNAME,[Count] INT,[State] NVARCHAR(20))

INSERT INTO @DbList ([ServerName],[DbName])
VALUES
 (N'<SOURCELIST>',N'<SOURCELIST>')
 
INSERT INTO @RecordCounts ([TableName],[Count],[State])
SELECT QUOTENAME(DB_NAME())+N'.[dbo.[NoteHeaders]',COUNT(1),'Before' FROM NoteHeaders
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[SpecificNotes]',COUNT(1),'Before' FROM SpecificNotes
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[UserNotes]',COUNT(1),'Before' FROM UserNotes
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[SystemNotes]',COUNT(1),'Before' FROM SystemNotes
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[ObjectNotes]',COUNT(1),'Before' FROM ObjectNotes
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[ClassNotes]',COUNT(1),'Before' FROM ClassNotes
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[NotesSiteMap]',COUNT(1),'Before' FROM NotesSiteMap

ALTER TABLE [dbo].[SystemNotes] DISABLE TRIGGER ALL
ALTER TABLE [dbo].[UserNotes] DISABLE TRIGGER ALL
ALTER TABLE [dbo].[SpecificNotes] DISABLE TRIGGER ALL
ALTER TABLE [dbo].[ClassNotes] DISABLE TRIGGER ALL
ALTER TABLE [dbo].[ObjectNotes] DISABLE TRIGGER ALL
ALTER TABLE [dbo].[NotesSiteMap] DISABLE TRIGGER ALL

SET IDENTITY_INSERT [dbo].[SystemNotes] OFF
SET IDENTITY_INSERT [dbo].[UserNotes] OFF
SET IDENTITY_INSERT [dbo].[SpecificNotes] OFF
SET IDENTITY_INSERT [dbo].[ClassNotes] OFF
SET IDENTITY_INSERT [dbo].[ObjectNotes] OFF

DECLARE SourceDbsCrs CURSOR LOCAL SCROLL STATIC READ_ONLY
FOR 
SELECT 
 [ServerName]
,[DbName]
,[Seq]
FROM @DbList
WHERE 1=1
ORDER BY [Seq]

OPEN SourceDbsCrs

--Determine the highest Token value, pad it to the next million, use it to add source db's token values to ensure uniqueness
--target db
 SELECT @MaxTokenSeed=CEILING(MAX(ISNULL(SpecificNoteToken,0))/@TokenCeiling)*@TokenCeiling
   FROM [dbo].[SpecificNotes]
  
  IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed

   SELECT @MaxTokenSeed=CEILING(MAX(ISNULL(UserNoteToken,0))/@TokenCeiling)*@TokenCeiling
   FROM [dbo].[UserNotes]
  
   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed

   SELECT @MaxTokenSeed=CEILING(MAX(ISNULL(ClassNoteToken,0))/@TokenCeiling)*@TokenCeiling
   FROM [dbo].[ClassNotes]
   
   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed

   SELECT @MaxTokenSeed=CEILING(MAX(ISNULL(ObjectNoteToken,0))/@TokenCeiling)*@TokenCeiling
   FROM [dbo].[ObjectNotes]

   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed   

   SELECT @MaxTokenSeed=CEILING(MAX(ISNULL(SystemNoteToken,0))/@TokenCeiling)*@TokenCeiling
   FROM [dbo].[SystemNotes]

   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed  

--do same thing for source dbs....
FETCH FIRST FROM SourceDbsCrs INTO
	 @ServerName
	,@DbName
	,@Seq
WHILE @@FETCH_STATUS = 0
BEGIN --CURSOR LOOP
 
   SET @SQL=N'SELECT @pMaxTokenSeed=CEILING(MAX(ISNULL(SpecificNoteToken,0))/@pTokenCeiling)*@pTokenCeiling ' +
            N'FROM' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) + '.[dbo].[SpecificNotes]'
   EXEC sp_executeSQL @SQL,N'@pTokenCeiling DECIMAL(11,0),@pMaxTokenSeed DECIMAL(11,0) OUTPUT',@pTokenCeiling=@TokenCeiling,@pMaxTokenSeed=@MaxTokenSeed OUTPUT
   
   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed

   SET @SQL=N'SELECT @pMaxTokenSeed=CEILING(MAX(ISNULL(UserNoteToken,0))/@pTokenCeiling)*@pTokenCeiling ' +
            N'FROM' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) + '.[dbo].[UserNotes]'
   EXEC sp_executeSQL @SQL,N'@pTokenCeiling DECIMAL(11,0),@pMaxTokenSeed DECIMAL(11,0) OUTPUT',@pTokenCeiling=@TokenCeiling,@pMaxTokenSeed=@MaxTokenSeed OUTPUT
   
   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed

   SET @SQL=N'SELECT @pMaxTokenSeed=CEILING(MAX(ISNULL(ClassNoteToken,0))/@pTokenCeiling)*@pTokenCeiling ' +
            N'FROM' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) + '.[dbo].[ClassNotes]'
   EXEC sp_executeSQL @SQL,N'@pTokenCeiling DECIMAL(11,0),@pMaxTokenSeed DECIMAL(11,0) OUTPUT',@pTokenCeiling=@TokenCeiling,@pMaxTokenSeed=@MaxTokenSeed OUTPUT
   
   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed

   SET @SQL=N'SELECT @pMaxTokenSeed=CEILING(MAX(ISNULL(ObjectNoteToken,0))/@pTokenCeiling)*@pTokenCeiling ' +
            N'FROM' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) + '.[dbo].[ObjectNotes]'
   EXEC sp_executeSQL @SQL,N'@pTokenCeiling DECIMAL(11,0),@pMaxTokenSeed DECIMAL(11,0) OUTPUT',@pTokenCeiling=@TokenCeiling,@pMaxTokenSeed=@MaxTokenSeed OUTPUT

   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed   

   SET @SQL=N'SELECT @pMaxTokenSeed=CEILING(MAX(ISNULL(SystemNoteToken,0))/@pTokenCeiling)*@pTokenCeiling ' +
            N'FROM' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) + '.[dbo].[SystemNotes]'
   EXEC sp_executeSQL @SQL,N'@pTokenCeiling DECIMAL(11,0),@pMaxTokenSeed DECIMAL(11,0) OUTPUT',@pTokenCeiling=@TokenCeiling,@pMaxTokenSeed=@MaxTokenSeed OUTPUT

   IF @MaxTokenSeed>@TokenSeed
      SET @TokenSeed=@MaxTokenSeed
	
  FETCH NEXT FROM SourceDbsCrs INTO
	 @ServerName
	,@DbName
	,@Seq

END--CURSOR LOOP

IF ISNULL(@TokenSeed,0)=0
 RAISERROR(N'Cannot proceed - TokenSeed value not determined',16,1) WITH NOWAIT
 

FETCH FIRST FROM SourceDbsCrs INTO
	 @ServerName
	,@DbName
	,@Seq

WHILE @@FETCH_STATUS = 0
BEGIN --CURSOR LOOP

	SET @TokenInc= @Seq * @TokenSeed

	SET @Infobar=N'Processing Token Increment: ' + CAST(@TokenInc AS NVARCHAR) +N' for ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName)
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	--insert unique NoteHeaders compared to Target
	SET @SQL=N'INSERT INTO [dbo].[NoteHeaders] ([ObjectName],[NoteFlag],[NoteExistsFlag],[CreatedBy],[UpdatedBy],[CreateDate],[RecordDate],[RowPointer],[InWorkflow]) '
	        +N'SELECT [nhs].[ObjectName],[nhs].[NoteFlag],[nhs].[NoteExistsFlag],[nhs].[CreatedBy],[nhs].[UpdatedBy],[nhs].[CreateDate],[nhs].[RecordDate],[nhs].[RowPointer],[nhs].[InWorkflow] '
	        +N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) + N'.[dbo].[NoteHeaders] [nhs] '
            +N'LEFT OUTER JOIN [dbo].[NoteHeaders] [nhm] ON 1=1 '
            +N'AND [nhm].[ObjectName]=[nhs].[ObjectName] '
            +N'AND [nhm].[NoteFlag]=[nhs].[NoteFlag] '
            +N'WHERE [nhm].[ObjectName] IS NULL '
			+N'SET @pRowCount=@@ROWCOUNT '
    EXEC sp_executeSQL @SQL,N'@pRowCount INT OUTPUT',@pRowCount=@RowCount OUTPUT

	INSERT INTO @RecordCounts([TableName],[Count],[State]) SELECT QUOTENAME(@DbName)+N'.[dbo].[NoteHeaders]',@RowCount,N'Moved'

	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') [dbo].[NoteHeaders] moved to Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	SET IDENTITY_INSERT [dbo].[SystemNotes] ON
	SET @SQL=N'INSERT INTO [dbo].[SystemNotes] ([SystemNoteToken],[NoteContent],[NoteDesc],[NoteExistsFlag],[CreatedBy],[UpdatedBy],[CreateDate],[RecordDate],[RowPointer],[InWorkflow])'
	        +N'SELECT [a].[SystemNoteToken] + CAST(@pTokenInc AS DECIMAL(11,0)),[a].[NoteContent],[a].[NoteDesc],[a].[NoteExistsFlag],[a].[CreatedBy],[a].[UpdatedBy],[a].[CreateDate],[a].[RecordDate],NEWID(),[a].[InWorkflow] '
			+N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[SystemNotes] [a] '
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pTokenInc DECIMAL(11,0),@pRowCount INT OUTPUT',@pTokenInc=@TokenInc,@pRowCount=@RowCount OUTPUT
	SET IDENTITY_INSERT [dbo].[SystemNotes] OFF
	
	INSERT INTO @RecordCounts([TableName],[Count],[State]) SELECT QUOTENAME(@DbName)+N'.[dbo].[SystemNotes]',@RowCount,N'Moved'

	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') [dbo].[SystemNotes] moved to Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	SET IDENTITY_INSERT [dbo].[UserNotes] ON
	SET @SQL=N'INSERT INTO [dbo].[UserNotes] ([UserNoteToken],[UserName],[NoteContent],[NoteDesc],[NoteExistsFlag],[CreatedBy],[UpdatedBy],[CreateDate],[RecordDate],[RowPointer],[InWorkflow])'
	        +N'SELECT [a].[UserNoteToken] + CAST(@pTokenInc AS DECIMAL(11,0)),[a].[UserName],[a].[NoteContent],[a].[NoteDesc],[a].[NoteExistsFlag],[a].[CreatedBy],[a].[UpdatedBy],[a].[CreateDate],[a].[RecordDate],NEWID(),[a].[InWorkflow] '
			+N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[UserNotes] [a] '
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pTokenInc DECIMAL(11,0),@pRowCount INT OUTPUT',@pTokenInc=@TokenInc,@pRowCount=@RowCount OUTPUT
	SET IDENTITY_INSERT [dbo].[UserNotes] OFF
	
	INSERT INTO @RecordCounts([TableName],[Count],[State]) SELECT QUOTENAME(@DbName)+N'.[dbo].[UserNotes]',@RowCount,N'Moved'
	
	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') [dbo].[UserNotes] moved to Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	SET IDENTITY_INSERT [dbo].[SpecificNotes] ON
	SET @SQL=N'INSERT INTO [dbo].[SpecificNotes] ([SpecificNoteToken],[NoteContent],[NoteDesc],[NoteExistsFlag],[CreatedBy],[UpdatedBy],[CreateDate],[RecordDate],[RowPointer],[InWorkflow])'
	        +N'SELECT [a].[SpecificNoteToken] + CAST(@pTokenInc AS DECIMAL(11,0)),[a].[NoteContent],[a].[NoteDesc],[a].[NoteExistsFlag],[a].[CreatedBy],[a].[UpdatedBy],[a].[CreateDate],[a].[RecordDate],NEWID(),[a].[InWorkflow] '
			+N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[SpecificNotes] [a] '
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pTokenInc DECIMAL(11,0),@pRowCount INT OUTPUT',@pTokenInc=@TokenInc,@pRowCount=@RowCount OUTPUT
	SET IDENTITY_INSERT [dbo].[SpecificNotes] OFF
	
	INSERT INTO @RecordCounts([TableName],[Count],[State]) SELECT QUOTENAME(@DbName)+N'.[dbo].[SpecificNotes]',@RowCount,N'Moved'
	
	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') [dbo].[SpecificNotes] moved to Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	SET IDENTITY_INSERT [dbo].[ClassNotes] ON
	SET @SQL=N'INSERT INTO [dbo].[ClassNotes] ([ClassNoteToken],[NoteHeaderToken],[NoteType],[SystemNoteToken],[UserNoteToken],[NoteExistsFlag],[CreatedBy],[UpdatedBy],[CreateDate],[RecordDate],[RowPointer],[InWorkflow]) '
	        +N'SELECT [a].[ClassNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)),[b].[NoteHeaderToken],[a].[NoteType],[a].[SystemNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)),[a].[UserNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)),[a].[NoteExistsFlag],[a].[CreatedBy],[a].[UpdatedBy],[a].[CreateDate],[a].[RecordDate],NEWID(),[a].[InWorkflow] '
			+N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[ClassNotes] [a] '
			+N'INNER JOIN ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[NoteHeaders] [c] ON 1=1 '
			+N'AND [c].[NoteHeaderToken] = [a].[NoteHeaderToken] '
			+N'INNER JOIN [dbo].[NoteHeaders] [b] ON 1=1 '
			+N'AND [b].[ObjectName] = [c].[ObjectName] '
			+N'AND [b].[NoteFlag] = [c].[NoteFlag] '
			+N'AND ([UserNoteToken] IN (SELECT [UserNoteToken] FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[UserNotes]) '
			+N'  OR [UserNoteToken] IS NULL '
			+N') '
			+N'AND ([SystemNoteToken] IN (SELECT [SystemNoteToken] FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[SystemNotes]) '
			+N'  OR [SystemNoteToken] IS NULL '
			+N') '
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pTokenInc DECIMAL(11,0),@pRowCount INT OUTPUT',@pTokenInc=@TokenInc,@pRowCount=@RowCount OUTPUT
	SET IDENTITY_INSERT [dbo].[ClassNotes] OFF
	
	INSERT INTO @RecordCounts([TableName],[Count],[State]) SELECT QUOTENAME(@DbName)+N'.[dbo].[ClassNotes]',@RowCount,N'Moved'
	
	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') [dbo].[ClassNotes] moved to Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	SET IDENTITY_INSERT [dbo].[ObjectNotes] ON
	SET @SQL=N'INSERT INTO [dbo].[ObjectNotes] ([ObjectNoteToken],[NoteHeaderToken],[RefRowPointer],[NoteType],[SystemNoteToken],[UserNoteToken],[SpecificNoteToken],[NoteExistsFlag],[CreatedBy],[UpdatedBy],[CreateDate],[RecordDate],[RowPointer],[InWorkflow]) '
	        +N'SELECT [a].[ObjectNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)),[b].[NoteHeaderToken],[a].[RefRowPointer],[a].[NoteType],[a].[SystemNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)),[a].[UserNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)),[a].[SpecificNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)),[a].[NoteExistsFlag],[a].[CreatedBy],[a].[UpdatedBy],[a].[CreateDate],[a].[RecordDate],NEWID(),[a].[InWorkflow] '
			+N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[ObjectNotes] [a] '
			+N'INNER JOIN ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[NoteHeaders] [c] ON 1=1 '
			+N'AND [c].[NoteHeaderToken] = [a].[NoteHeaderToken] '
			+N'INNER JOIN [dbo].[NoteHeaders] [b] ON 1=1 '
			+N'AND [b].[ObjectName] = [c].[ObjectName] '
			+N'AND [b].[NoteFlag] = [c].[NoteFlag] '
			+N'AND ([UserNoteToken] IN (SELECT [UserNoteToken] FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[UserNotes]) '
			+N'  OR [UserNoteToken] IS NULL '
			+N') '
			+N'AND ([SystemNoteToken] IN (SELECT [SystemNoteToken] FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[SystemNotes]) '
			+N'  OR [SystemNoteToken] IS NULL '
			+N') '
			+N'AND ([SpecificNoteToken] IN (SELECT [SpecificNoteToken] FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[SpecificNotes]) '
			+N'  OR [SpecificNoteToken] IS NULL '
			+N') '
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pTokenInc DECIMAL(11,0),@pRowCount INT OUTPUT',@pTokenInc=@TokenInc,@pRowCount=@RowCount OUTPUT
	SET IDENTITY_INSERT [dbo].[ObjectNotes] OFF
	
	INSERT INTO @RecordCounts([TableName],[Count],[State]) SELECT QUOTENAME(@DbName)+N'.[dbo].[ObjectNotes]',@RowCount,N'Moved'
	
	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') [dbo].[ObjectNotes] moved to Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	--Insert NotesSiteMap records as-is and update the token later below.
	SET @SQL=N'INSERT INTO [dbo].[NotesSiteMap] ([FromSite],[FromNoteToken],[LocalNoteToken],[TypeOfNote],[RecordDate],[RowPointer],[CreatedBy],[UpdatedBy],[CreateDate],[InWorkflow],[ToSite])'
	        +N'SELECT [a].[FromSite],[a].[FromNoteToken],[a].[LocalNoteToken],[a].[TypeOfNote],[a].[RecordDate],NEWID(),[a].[CreatedBy],[a].[UpdatedBy],[a].[CreateDate],[a].[InWorkflow],[a].[ToSite] '
			+N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[dbo].[NotesSiteMap] [a] '
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pRowCount INT OUTPUT',@pRowCount=@RowCount OUTPUT
	
	INSERT INTO @RecordCounts([TableName],[Count],[State]) SELECT QUOTENAME(@DbName)+N'.[dbo].[NotesSiteMap]',@RowCount,N'Moved'

	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') [dbo].[NotesSiteMap] moved to Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''TRUNCATE TABLE [dbo].[NotesSiteMap]'''
    EXEC sp_executeSQL @SQL
	SET @Infobar=N'            TRUNCATE TABLE [dbo].[NotesSiteMap]'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''TRUNCATE TABLE [dbo].[ObjectNotes]'''
    EXEC sp_executeSQL @SQL
	SET @Infobar=N'            TRUNCATE TABLE [dbo].[ObjectNotes]'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''TRUNCATE TABLE [dbo].[ClassNotes]'''
    EXEC sp_executeSQL @SQL
	SET @Infobar=N'            TRUNCATE TABLE [dbo].[ClassNotes]'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ObjectNotesFk1'''') IS NOT NULL ALTER TABLE [dbo].[ObjectNotes] DROP CONSTRAINT [ObjectNotesFk1]'''
    EXEC sp_executeSQL @SQL

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ObjectNotesFk2'''') IS NOT NULL ALTER TABLE [dbo].[ObjectNotes] DROP CONSTRAINT [ObjectNotesFk2]'''
    EXEC sp_executeSQL @SQL

	SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ObjectNotesFk3'''') IS NOT NULL ALTER TABLE [dbo].[ObjectNotes] DROP CONSTRAINT [ObjectNotesFk3]'''
    EXEC sp_executeSQL @SQL

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ObjectNotesFk4'''') IS NOT NULL ALTER TABLE [dbo].[ObjectNotes] DROP CONSTRAINT [ObjectNotesFk4]'''
    EXEC sp_executeSQL @SQL

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ObjectNotesFk5'''') IS NOT NULL ALTER TABLE [dbo].[ObjectNotes] DROP CONSTRAINT [ObjectNotesFk5]'''
    EXEC sp_executeSQL @SQL

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ClassNotesFk1'''') IS NOT NULL ALTER TABLE [dbo].[ClassNotes] DROP CONSTRAINT [ClassNotesFk1]'''
    EXEC sp_executeSQL @SQL

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ClassNotesFk2'''') IS NOT NULL ALTER TABLE [dbo].[ClassNotes] DROP CONSTRAINT [ClassNotesFk2]'''
    EXEC sp_executeSQL @SQL

	SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ClassNotesFk3'''') IS NOT NULL ALTER TABLE [dbo].[ClassNotes] DROP CONSTRAINT [ClassNotesFk3]'''
    EXEC sp_executeSQL @SQL

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''IF OBJECT_ID(''''ClassNotesFk4'''') IS NOT NULL ALTER TABLE [dbo].[ClassNotes] DROP CONSTRAINT [ClassNotesFk4]'''
    EXEC sp_executeSQL @SQL

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''TRUNCATE TABLE [dbo].[SystemNotes]'''
    EXEC sp_executeSQL @SQL
	SET @Infobar=N'            TRUNCATE TABLE [dbo].[SystemNotes]'
	RAISERROR(@Infobar,0,1) WITH NOWAIT
 
    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''TRUNCATE TABLE [dbo].[SpecificNotes]'''
    EXEC sp_executeSQL @SQL
	SET @Infobar=N'            TRUNCATE TABLE [dbo].[SpecficNotes]'
	RAISERROR(@Infobar,0,1) WITH NOWAIT
   
    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''TRUNCATE TABLE [dbo].[UserNotes]'''
    EXEC sp_executeSQL @SQL
	SET @Infobar=N'            TRUNCATE TABLE [dbo].[UserNotes]'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

    SET @SQL=N'EXEC ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) +N'.[sys].[sp_executeSQL] N''TRUNCATE TABLE [dbo].[NoteHeaders]'''
    EXEC sp_executeSQL @SQL
	SET @Infobar=N'            TRUNCATE TABLE [dbo].[NotesHeaders]'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

  FETCH NEXT FROM SourceDbsCrs INTO
	 @ServerName
	,@DbName
	,@Seq

END--CURSOR LOOP

FETCH FIRST FROM SourceDbsCrs INTO
 @ServerName
,@DbName
,@Seq

SET @Infobar=N'Updating: NotesSiteMap'
RAISERROR(@Infobar,0,1) WITH NOWAIT

DECLARE @SiteList NVARCHAR(MAX)

WHILE @@FETCH_STATUS = 0
BEGIN
    --Get list of sites in source db
	SET @SiteList = NULL
    SET @SQL=N'SELECT @pSiteList=COALESCE(@pSiteList+N'','', N'''') + N'''''''' + [p].[site] + N'''''''' ' + 
             N'FROM ' + QUOTENAME(@ServerName) + N'.' + QUOTENAME(@DbName) + N'.[dbo].[parms_mst] [p] '
	EXEC sp_executeSQL @SQL,N'@pSiteList NVARCHAR(MAX) OUTPUT',@pSiteList=@SiteList OUTPUT

	SET @Infobar=N'Updating NotesSiteMap for Sites: ' + @SiteList
	RAISERROR(@Infobar,0,1) WITH NOWAIT
	
	SET @SiteList=N'(' + @SiteList + N')'

	SET @TokenInc= @Seq * @TokenSeed

	SET @SQL=N'UPDATE [NotesSiteMap] SET [FromNoteToken] = [FromNoteToken] + CAST(@pTokenInc AS DECIMAL(11,0))  '
	        +N'WHERE [FromSite] IN ' + @SiteList + N' ' +
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pTokenInc DECIMAL(11,0),@pRowCount INT OUTPUT',@pTokenInc=@TokenInc,@pRowCount=@RowCount OUTPUT
	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') FromNoteToken  for Sites in ' + @SiteList + N' updated on Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	SET @SQL=N'UPDATE [NotesSiteMap] SET [LocalNoteToken] = [LocalNoteToken]+CAST(@pTokenInc AS DECIMAL(11,0)) '
	        +N'WHERE [ToSite] IN ' + @SiteList + N' ' +
			+N'SET @pRowCount=@@ROWCOUNT '
	EXEC sp_executeSQL @SQL,N'@pTokenInc DECIMAL(11,0),@pRowCount INT OUTPUT',@pTokenInc=@TokenInc,@pRowCount=@RowCount OUTPUT
	SET @Infobar=N'            (' + CAST(@RowCount AS NVARCHAR) + N') LocalNoteToken for Sites in ' + @SiteList + N' updated on Target'
	RAISERROR(@Infobar,0,1) WITH NOWAIT

	FETCH NEXT FROM SourceDbsCrs INTO
	 @ServerName
	,@DbName
	,@Seq

END --CURSOR LOOP

CLOSE SourceDbsCrs
DEALLOCATE SourceDbsCrs

ALTER TABLE [dbo].[SystemNotes] ENABLE TRIGGER ALL
ALTER TABLE [dbo].[UserNotes] ENABLE TRIGGER ALL
ALTER TABLE [dbo].[SpecificNotes] ENABLE TRIGGER ALL
ALTER TABLE [dbo].[ClassNotes] ENABLE TRIGGER ALL
ALTER TABLE [dbo].[ObjectNotes] ENABLE TRIGGER ALL
ALTER TABLE [dbo].[NotesSiteMap] ENABLE TRIGGER ALL

INSERT INTO @RecordCounts ([TableName],[Count],[State])
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[NoteHeaders]',COUNT(1),'After' FROM [dbo].[NoteHeaders]
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[SpecificNotes]',COUNT(1),'After' FROM [dbo].[SpecificNotes]
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[UserNotes]',COUNT(1),'After' FROM [dbo].[UserNotes]
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[SystemNotes]',COUNT(1),'After' FROM [dbo].[SystemNotes]
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[ObjectNotes]',COUNT(1),'After' FROM [dbo].[ObjectNotes]
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[ClassNotes]',COUNT(1),'After' FROM [dbo].[ClassNotes]
UNION
SELECT QUOTENAME(DB_NAME())+N'.[dbo].[NotesSiteMap]',COUNT(1),'After' FROM [dbo].[NotesSiteMap]

DECLARE RecordCrs CURSOR LOCAL SCROLL STATIC READ_ONLY
FOR 
SELECT 
 [TableName]
,[Count]
,[State]
FROM @RecordCounts
ORDER BY [TableName],[State] DESC

OPEN RecordCrs
DECLARE @Table SYSNAME
DECLARE @State NVARCHAR(20)
DECLARE @Count SYSNAME
FETCH FIRST FROM RecordCrs INTO
 @Table
,@Count
,@State

SET @Infobar = '';

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Infobar = @Table + ' ' + @Count + ' ' + @State
    RAISERROR(@Infobar,0,1) WITH NOWAIT
	FETCH NEXT FROM RecordCrs INTO
	@Table
    ,@Count
    ,@State
END

CLOSE RecordCrs
DEALLOCATE RecordCrs