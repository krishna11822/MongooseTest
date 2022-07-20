SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('[dbo].[CLM_ProcessUDTSp]', 'P') IS NOT NULL
 DROP PROCEDURE [dbo].[CLM_ProcessUDTSp]
GO

CREATE PROCEDURE [dbo].[CLM_ProcessUDTSp] (
  @udt SYSNAME                -- name of user defined datatype to list schema-bound dependencies
, @Infobar NVARCHAR(MAX) OUTPUT
)
AS

DECLARE @Severity INT = 0
DECLARE @TYPE NVARCHAR(20)
DECLARE @ANSIWarning NVARCHAR(100)
DECLARE @Counter INT = 1
DECLARE @STMT NVARCHAR(500)


--SET @ANSIWarning=N'SET ANSI_WARNINGS OFF ' + NCHAR(10) + N'GO ' + NCHAR(10)
SET @ANSIWarning=ISNULL(@ANSIWarning,N'')

IF OBJECT_ID('[dbo].[Tmp_CLMProcessUDT]','U') IS NOT NULL
 DROP TABLE [dbo].[Tmp_CLMProcessUDT]

CREATE TABLE [dbo].[Tmp_CLMProcessUDT] (
	 [UDT] NVARCHAR(150)
	,[TYPE] NVARCHAR(100)
	,[OBJECT_ID] INT NULL
	,[OBJECT_NAME] SYSNAME NULL
	,[CREATE_STMT] NVARCHAR(MAX)
	,[DROP_STMT] NVARCHAR(MAX)
	,[Seq_Add] INT DEFAULT (10)
	,[Seq_Drop] INT
	,[RowId] INT IDENTITY(1,1)
	,PRIMARY KEY CLUSTERED ([UDT],[TYPE],[RowId])
	)

--SAVE STORED PROCEDURES WITH UDT PARMS
	SET @TYPE='SPs'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT 
	 @udt
	,@TYPE
	,[sm].[object_id]
	,OBJECT_NAME([sm].[object_id])
	,@ANSIWarning + REPLACE([sm].[definition],N'','''''')
	,N'IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id])) +''') AND type in (N''P'', N''PC''))'
	+N' DROP PROCEDURE ' +  QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id]))
    ,9--[Seq_Drop]
	FROM sys.sql_modules [sm]
	WHERE [sm].[object_id] IN ( SELECT DISTINCT [o].[object_id]--Sps with UDT parm
								FROM sys.parameters [p]
								INNER JOIN sys.types [t1] ON [p].[user_type_id] = [t1].[user_type_id]
								INNER JOIN sys.objects [o] ON [p].[object_id] = [o].[object_id]
								WHERE [t1].[name] = @udt
								AND [o].[type] IN ('P','PC')
							  )

--END SAVE STORED PROCEDURES WITH UDT PARMS

--SAVE USER DEFINED FUNCTIONS WITH UDT PARMS
	SET @TYPE='FNC'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT 
	 @udt
	,@TYPE
	,[o].[object_id]
	,OBJECT_NAME([o].[object_id])
	,@ANSIWarning + REPLACE([sm].[definition],N'','''')
	,N'IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id])) +''') AND [type] in (N''FN'', N''IF'', N''TF''))'
	+N' DROP FUNCTION ' + QUOTENAME(OBJECT_SCHEMA_NAME([o].[object_id])) + N'.' + QUOTENAME([o].[name])
	,9--[Seq_Drop]
	FROM sys.objects [o] 
	INNER JOIN sys.sql_modules [sm] ON [sm].[object_id]=[o].[object_id]
	WHERE [o].[object_id] IN ( SELECT DISTINCT [o1].[object_id]
	                           FROM sys.parameters [p]
	                           INNER JOIN sys.types [t] ON [p].[user_type_id] = [t].[user_type_id]
	                           INNER JOIN sys.objects [o1] ON [p].[object_id] = [o1].[object_id]
	                           WHERE [t].[name] = @udt
	                           AND [o1].[type] IN ('FN','IF','TF')
							 )
--END SAVE USER DEFINED FUNCTIONS WITH UDT PARMS

--SAVE TABLE FUNCTIONS UDT COLUMNS
	SET @TYPE='FNC'
		
	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT  
	 @udt
	,@TYPE
	,[o].[object_id]
	,OBJECT_NAME([o].[object_id])
	,@ANSIWarning + REPLACE([sm].[definition],N'','''')
	,N'IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id])) +''') AND [type] in (N''IF'', N''TF''))'
	+N' DROP FUNCTION ' + QUOTENAME(OBJECT_SCHEMA_NAME([o].[object_id])) + N'.' + QUOTENAME([o].[name])
	,9--[Seq_Drop]
	FROM sys.objects [o] 
	INNER JOIN sys.sql_modules [sm] ON [sm].[object_id]=[o].[object_id]
	WHERE [o].[object_id] IN ( SELECT DISTINCT [o1].[object_id]
	                           FROM sys.all_columns [c] 
	                           INNER JOIN sys.types [t] ON [t].[user_type_id] = [c].[user_type_id]
	                           INNER JOIN sys.objects [o1] ON [o1].[object_id] = [c].[object_id]
	                           WHERE [t].[name] = @udt
	                           AND [o1].[type] IN ('IF','TF')
							 )
	AND [o].[object_id] NOT IN (SELECT object_id from Tmp_CLMProcessUDT)
--END SAVE TABLE FUNCTIONS UDT COLUMNS

--SAVE VIEWS
	SET @TYPE='VW'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT 
	 @udt
	,@TYPE
	,[o].[object_id]
	,OBJECT_NAME([o].[object_id])
	,@ANSIWarning + REPLACE([sm].[definition],N'','''')
	,N'IF EXISTS (SELECT 1 FROM sys.views WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id])) +'''))'
	+N' DROP VIEW ' + QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id]))
	,11--[Seq_Drop]
	FROM sys.objects [o]
	INNER JOIN sys.sql_modules AS [sm] ON [sm].[object_id] = [o].[object_id]
	WHERE [o].[object_id] IN ( 	SELECT DISTINCT [v].[object_id]
								FROM sys.views [v]
								INNER JOIN sys.columns [c] ON [c].[object_id]=[v].[object_id]
								INNER JOIN sys.types [t] ON [t].[user_type_id]=[c].[user_type_id]
								WHERE [t].[name]=@udt
							)
--END SAVE VIEWS

--SAVE VIEW TRIGGERS
	SET @TYPE='VWTRG'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT 
	 @udt
	,@TYPE
	,[sm].[object_id]
	,OBJECT_NAME([sm].[object_id])
	,@ANSIWarning + REPLACE([sm].[definition],N'','''')
	,N'IF EXISTS (SELECT 1 FROM sys.triggers WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id])) +'''))'
	+N' DROP TRIGGER ' + QUOTENAME(OBJECT_SCHEMA_NAME([sm].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([sm].[object_id]))
	,10--[Seq_Drop]
	FROM sys.objects [o]
	INNER JOIN sys.sql_modules AS [sm] ON [sm].[object_id] = [o].[object_id]
	WHERE [o].[object_id] IN ( 	SELECT DISTINCT [tr].[object_id]
								FROM sys.views [v]
								INNER JOIN sys.columns [c] ON [c].[object_id]=[v].[object_id]
								INNER JOIN sys.types [t] ON [t].[user_type_id]=[c].[user_type_id]
								INNER JOIN sys.triggers [tr] ON [tr].[parent_id]=[v].[object_id]
								WHERE [t].[name]=@udt
							)
--END SAVE VIEW TRIGGERS

--SAVE COMPUTED COLUMNS
	SET @TYPE=N'CMP'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT DISTINCT
	  @udt
	, @TYPE
	,[c].[object_id]
	,OBJECT_NAME([c].[object_id])
	, N'IF OBJECTPROPERTY(OBJECT_ID(N'''+ QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([c].[object_id])) + N'''), N''IsUserTable'') = 1 AND NOT EXISTS (SELECT 1 FROM [sys].[columns] WHERE [object_id] = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id]))+ N'.' + QUOTENAME(OBJECT_NAME([c].[object_id])) + N''') AND [name] = N''' + QUOTENAME([c].[name]) + N''')'
	+ N' ALTER TABLE '
	+ QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id]))
	+ N'.' + QUOTENAME(OBJECT_NAME([c].[object_id]))
	+ N' ADD ' + QUOTENAME([c].[name])
	+ N' AS ' + [c].[definition]
	, N'IF OBJECTPROPERTY(OBJECT_ID(N'''+ QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([c].[object_id])) + N'''), N''IsUserTable'') = 1 AND EXISTS (SELECT 1 FROM [sys].[columns] WHERE [object_id] = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id]))+ N'.' + QUOTENAME(OBJECT_NAME([c].[object_id])) + N''') AND [name] = N''' + [c].[name] + N''')'
	+ N' ALTER TABLE '
	+ QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id]))
	+ N'.' + QUOTENAME(OBJECT_NAME([c].[object_id]))
	+ N' DROP COLUMN ' + QUOTENAME([c].[name])
	,1--[Seq_Drop]
	FROM sys.computed_columns [c]
	INNER JOIN sys.types [t] ON [c].[user_type_id]=[t].[user_type_id]
	WHERE [t].[name]=@udt
--END SAVE COMPUTED COLUMNS

--SAVE FK CONSTRAINTS
	SET @TYPE='FK'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT
	      @udt     
	    , @TYPE
		, [fk].[object_id]
		, OBJECT_NAME([fk].[object_id])
		, N'IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([fk].[object_id])) + ''') AND parent_object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id])) + '''))'
		+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id]))
		+ N' WITH NOCHECK'
		+ N' ADD CONSTRAINT ' + QUOTENAME(OBJECT_NAME([fk].[object_id]))
		+ N' FOREIGN KEY '
		+ N'( '
		+ (SELECT STUFF(((	SELECT N',[' + COL_NAME([fc1].[parent_object_id],[fc1].[parent_column_id]) + N']'  --comma separated string of columns
								FROM sys.foreign_keys [fk1]
								INNER JOIN sys.foreign_key_columns [fc1] ON [fc1].[constraint_object_id] = [fk1].[object_id]
								WHERE [fk1].[parent_object_id] = [fc].[parent_object_id]
								AND [fk1].[name] = OBJECT_NAME([fk].[object_id])
								ORDER BY [fc1].[constraint_column_id]
								FOR XML PATH (''),TYPE).value('.[1]', 'nvarchar(max)')),1,1,'')
			)
		+ N') REFERENCES ' + QUOTENAME(OBJECT_SCHEMA_NAME([fc].[referenced_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fc].[referenced_object_id])) 
		+ N' ('
		+ (SELECT STUFF(((	SELECT N',[' + COL_NAME([fc2].[referenced_object_id],[fc2].[referenced_column_id]) + N']' --comma separated string of columns
								FROM sys.foreign_keys [fk2]
								INNER JOIN sys.foreign_key_columns [fc2] ON [fc2].[constraint_object_id] = [fk2].[object_id]
								WHERE [fk2].[parent_object_id] = [fc].[parent_object_id]
								and [fk2].[name] = OBJECT_NAME([fk].[object_id])
								FOR XML PATH (''),TYPE).value('.[1]', 'nvarchar(max)')),1,1,'')
			)
		+ N')'
		, N'IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([fk].[object_id])) + ''') AND parent_object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id])) + '''))'
		+ N' ALTER TABLE '
		+ QUOTENAME(OBJECT_SCHEMA_NAME([fk].[parent_object_id])) + '.' + QUOTENAME(OBJECT_NAME([fk].[parent_object_id]))
		+ N' DROP CONSTRAINT ' + QUOTENAME(OBJECT_NAME([fk].[object_id]))
		,2--[Seq_Drop]
		FROM sys.foreign_keys [fk]
		INNER JOIN sys.objects [o] on [fk].[parent_object_id] = [o].[object_id]
		INNER JOIN sys.foreign_key_columns [fc] ON [fc].[constraint_object_id] = [fk].[object_id]
		INNER JOIN sys.columns [refc] ON [refc].[column_id] = [fc].[referenced_column_id] AND [refc].[object_id] = [fc].[referenced_object_id]
		INNER JOIN sys.columns [c] ON [c].[column_id] = [fc].[parent_column_id] AND [c].[object_id] = [fc].[parent_object_id]
		INNER JOIN sys.types [t] ON [t].[user_type_id] = [refc].[user_type_id] 
		INNER JOIN sys.types [t2] ON [t2].[user_type_id] = [c].[user_type_id] 
		WHERE [o].[name] not in ('dtproperties','sysdiagrams')  -- not true user tables
		AND ([t].[name] = @udt OR [t2].[name] = @udt) 
--END SAVE FK CONSTRAINTS

--SAVE DF CONSTRAINTS WITH UDT
	SET @TYPE='DF'

	--Get default constraints of columns matching UDT
	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop],[Seq_Add])
	SELECT 
	      @udt
	    , @TYPE
		,[df].[object_id]
		,OBJECT_NAME([df].[object_id])
		, N'IF NOT EXISTS (SELECT 1 FROM sys.default_constraints [df1] INNER JOIN sys.columns [c1] ON 1=1 AND [c1].[object_id]=[df1].[parent_object_id] AND [c1].[column_id] = [df1].[parent_column_id] WHERE OBJECT_NAME([df1].[parent_object_id])=''' + OBJECT_NAME([df].[parent_object_id]) + ''' AND [c1].[name]=''' + [c].[name] + ''')'
		+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([df].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([df].[parent_object_id]))
		+ N' WITH NOCHECK '
		+ N' ADD CONSTRAINT ' + QUOTENAME([df].[name]) + N' DEFAULT ' + [df].[definition]
		+ N' FOR ' + QUOTENAME([c].[name])
		, N'IF EXISTS (SELECT 1 FROM sys.default_constraints [df1] INNER JOIN sys.columns [c1] ON 1=1 AND [c1].[object_id]=[df1].[parent_object_id] AND [c1].[column_id] = [df1].[parent_column_id] WHERE OBJECT_NAME([df1].[parent_object_id])=''' + OBJECT_NAME([df].[parent_object_id]) + ''' AND [c1].[name]=''' + [c].[name] + ''')'
		+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([df].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([df].[parent_object_id]))
		+ N' DROP CONSTRAINT ' + QUOTENAME([df].[name])
		,3--[Seq_Drop]
		,10--[Seq_Add]
	FROM sys.default_constraints [df]
	INNER JOIN sys.columns [c] ON 1=1 AND [c].[object_id]=[df].[parent_object_id] AND [c].[column_id] = [df].[parent_column_id]
	INNER JOIN sys.types [t] ON 1=1 AND [t].[user_type_id] = [c].[user_type_id]
	WHERE 1=1
	AND [t].[name] = @udt

	--Get default constraints whose columns use implicit datatypes having functions with UDT
	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT 
	      @udt
	    , @TYPE
		, [df].[object_id]
		, OBJECT_NAME([df].[object_id])
		, N'IF NOT EXISTS (SELECT 1 FROM sys.default_constraints [df1] INNER JOIN sys.columns [c1] ON 1=1 AND [c1].[object_id]=[df1].[parent_object_id] AND [c1].[column_id] = [df1].[parent_column_id] WHERE OBJECT_NAME([df1].[parent_object_id])=''' + OBJECT_NAME([df].[parent_object_id]) + ''' AND [c1].[name]=''' + [c].[name] + ''')'
		+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([df].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([df].[parent_object_id]))
		+ N' WITH NOCHECK '
		+ N' ADD CONSTRAINT ' + QUOTENAME([df].[name]) + N' DEFAULT ' + [df].[definition]
		+ N' FOR ' + QUOTENAME([c].[name])
		, N'IF EXISTS (SELECT 1 FROM sys.default_constraints [df1] INNER JOIN sys.columns [c1] ON 1=1 AND [c1].[object_id]=[df1].[parent_object_id] AND [c1].[column_id] = [df1].[parent_column_id] WHERE OBJECT_NAME([df1].[parent_object_id])=''' + OBJECT_NAME([df].[parent_object_id]) + ''' AND [c1].[name]=''' + [c].[name] + ''')'
		+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([df].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([df].[parent_object_id]))
		+ N' DROP CONSTRAINT ' + QUOTENAME([df].[name])
		,3--[Seq_Drop]
	FROM sys.default_constraints [df]
	INNER JOIN sys.columns [c] ON 1=1 AND [c].[object_id]=[df].[parent_object_id] AND [c].[column_id] = [df].[parent_column_id]
	INNER JOIN sys.types [t] ON 1=1 AND [t].[user_type_id] = [c].[user_type_id] AND [t].[is_user_defined]=0
	INNER JOIN [dbo].[Tmp_CLMProcessUDT] [tmp] ON CHARINDEX(N'[dbo].'+ QUOTENAME([tmp].[OBJECT_NAME]),[df].[definition])>0 AND [tmp].[TYPE]=N'FNC'
	WHERE 1=1
--END SAVE DF CONSTRAINTS WITH UDT

--SAVE PK,UQ CONSTRAINTS WITH THE UDT
	SET @TYPE='PK_UQ'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT
	      @udt 
	    , @TYPE
		, [kc].[object_id]
		, OBJECT_NAME([kc].[object_id])
		, N'IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'''+ QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id])) +''') AND [name] = N''' + OBJECT_NAME([kc].[object_id]) +''')'
		+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id]))
		+ N' WITH NOCHECK '
		+ N' ADD CONSTRAINT ' + QUOTENAME(OBJECT_NAME([kc].[object_id]))
		+ CASE [kc].[type] WHEN N'PK' THEN N' PRIMARY KEY' WHEN N'UQ' THEN N' UNIQUE' END
		+ CASE INDEXPROPERTY([kc].[parent_object_id],OBJECT_NAME([kc].[object_id]),'IsClustered') WHEN 1 THEN N' CLUSTERED'
			ELSE N' NONCLUSTERED'
			END
		+ N' ('
		+ (SELECT STUFF((( SELECT N', [' +  COL_NAME([kc].[parent_object_id],[ic].[column_id]) + N']' +  CASE [ic].[is_descending_key] WHEN 0 THEN N'' ELSE N'DESC' END
								FROM sys.indexes [i1]
								INNER JOIN sys.index_columns [ic] ON [i1].[object_id] = [ic].[object_id] AND [i1].[index_id] = [ic].[index_id]
								WHERE [i1].[object_id] = [kc].[parent_object_id]
								AND [i1].[name] = OBJECT_NAME([kc].[object_id])
								ORDER BY [ic].[key_ordinal]
								FOR XML PATH (''),TYPE).value('.[1]', 'nvarchar(max)')),1,1,'')
			)
		+ N')'
	   ,N'IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N'''+ QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id])) +''') AND [name] = N''' + OBJECT_NAME([kc].[object_id]) +''')'
	   +N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id])) 
	   +N' DROP CONSTRAINT ' + QUOTENAME(OBJECT_NAME([kc].[object_id]))
	   ,4--[Seq_Drop]
	FROM 
		sys.key_constraints [kc]
	WHERE 1=1
	AND [kc].[name] IN ( SELECT [i].[name]
							FROM sys.indexes [i]
							INNER JOIN sys.index_columns ic ON 1=1 AND [ic].[object_id] = [i].[object_id]	AND [ic].[index_id] = [i].[index_id]
							INNER JOIN sys.columns c ON 1=1 AND c.object_id=ic.object_id AND c.column_id = ic.column_id
							INNER JOIN sys.objects [o1] ON [o1].[object_id] = [c].[object_id] AND [o1].[type] NOT IN ('IF','TF')--not a table value function
							INNER JOIN sys.types t ON 1=1 AND [t].[user_type_id] = [c].[user_type_id]
							WHERE 1=1
							AND [t].name = @UDT
						)
	ORDER BY QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id]))
			,QUOTENAME(OBJECT_NAME([kc].[parent_object_id]))
--END SAVE PK,UQ CONSTRAINTS WITH THE UDT

--SAVE CK CONSTRAINTS WITH THE UDT
	SET @TYPE='CK'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT
	  @udt
	, @TYPE
	, [kc].[object_id]
	, OBJECT_NAME([kc].[object_id])
	, N'IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[object_id])) + ''') AND parent_object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id])) + '''))'
	+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id]))
	+ N' WITH NOCHECK' +
	+ N' ADD CONSTRAINT ' + QUOTENAME(OBJECT_NAME([kc].[object_id]))
	+ N' CHECK (' + [kc].[definition] + N')'
	, N'IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[object_id])) + ''') AND parent_object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id])) + '''))'
	+ N' ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME([kc].[parent_object_id])) + N'.' + QUOTENAME(OBJECT_NAME([kc].[parent_object_id]))
	+ N' DROP CONSTRAINT ' + QUOTENAME(OBJECT_NAME([kc].[object_id]))
	,7--[Seq_Drop]
	FROM sys.check_constraints [kc]
	INNER JOIN sys.objects [o] ON [kc].[parent_object_id] = [o].[object_id]
	INNER JOIN sys.columns [c] ON [kc].[parent_column_id] = [c].[column_id] AND [kc].[parent_object_id] = [c].[object_id]
	INNER JOIN sys.types [t] ON [c].[user_type_id] = [t].[user_type_id]
	WHERE  [o].[name] NOT IN ('dtproperties','sysdiagrams')  -- not true user tables
	AND [t].[name] = @udt
--END SAVE CK CONSTRAINTS WITH THE UDT

--SAVE INDEXES WITH THE UDT
	SET @TYPE='IX'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT DISTINCT
	     @udt
	    ,@TYPE
		,[i].[object_id]
		,QUOTENAME([i].[name])
		, N'IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([i].[object_id])) + '.' + QUOTENAME(OBJECT_NAME([i].[object_id])) +''') AND [name] = N''' + [i].[name] + ''')'
	    + N' CREATE ' 
		+ CASE INDEXPROPERTY([i].[object_id],[i].[name],'IsUnique')
			WHEN 1 THEN N' UNIQUE'
			ELSE N' '
			END
		+ CASE INDEXPROPERTY([i].[object_id],[i].[name],'IsClustered')
			WHEN 1 THEN N' CLUSTERED'
			ELSE N' NONCLUSTERED'
			END
		+ N' INDEX ' 
		+ QUOTENAME([i].[name]) 
		+ N' ON '
		+ QUOTENAME(OBJECT_SCHEMA_NAME([i].[object_id])) + '.' + QUOTENAME(OBJECT_NAME([i].[object_id]))
		+ N' ('
		+ (SELECT STUFF(((   SELECT N', [' +  COL_NAME([i1].[object_id],[ic1].[column_id]) + N']' +  CASE [ic1].[is_descending_key] WHEN 1 THEN ' DESC' ELSE N' ' END
								FROM sys.indexes [i1]
								INNER JOIN sys.index_columns [ic1]
								ON [i1].[object_id] = [ic1].[object_id] and [i1].[index_id] = [ic1].[index_id]
								WHERE [i1].[object_id] = [i].[object_id]
								AND [i1].[name] = [i].[name]
								AND [ic1].[is_included_column]=0
								ORDER BY [ic1].[key_ordinal]
								FOR XML PATH (''),TYPE).value('.[1]', 'nvarchar(max)')),1,1,'')
			)
		+ ')'
		+ ISNULL(N' INCLUDE (' +		(SELECT STUFF(((   SELECT N', [' +  COL_NAME([i1].[object_id],[ic1].[column_id]) + N']' +  CASE [ic1].[is_descending_key] WHEN 1 THEN ' DESC' ELSE N' ' END
						FROM sys.indexes [i1]
						INNER JOIN sys.index_columns [ic1]
						ON [i1].[object_id] = [ic1].[object_id] and [i1].[index_id] = [ic1].[index_id]
						WHERE [i1].[object_id] = [i].[object_id]
						AND [i1].[name] = [i].[name]
						AND [ic1].[is_included_column]=1
						ORDER BY [ic1].[key_ordinal]
						FOR XML PATH (''),TYPE).value('.[1]', 'nvarchar(max)')),1,1,'')
						) + N')'
				,'')
	, N'IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID(N''' + QUOTENAME(OBJECT_SCHEMA_NAME([i].[object_id])) + '.' + QUOTENAME(OBJECT_NAME([i].[object_id])) +''') AND [name] = N''' + [i].[name] + ''')'
	+ N' DROP INDEX ' + QUOTENAME([i].[name]) + N' ON ' + QUOTENAME(OBJECT_SCHEMA_NAME([i].[object_id])) + N'.' + QUOTENAME(OBJECT_NAME([i].[object_id]))
	,5--[Seq_Drop]
	FROM sys.indexes [i]
	INNER JOIN sys.index_columns [ic] on [i].[object_id] = [ic].[object_id] and [i].[index_id] = [ic].[index_id]
	INNER JOIN sys.columns [c] ON [ic].[column_id] = [c].[column_id] AND [i].[object_id] = [c].[object_id]
	INNER JOIN sys.types [t] ON [c].[user_type_id] = [t].[user_type_id]
	INNER JOIN sys.objects [o] ON [o].[object_id] = [i].[object_id]
	WHERE 1=1
	AND [o].[name] NOT IN ('dtproperties','sysdiagrams')  -- not true user tables
	AND [i].[is_primary_key] = 0
	AND [i].[is_unique_constraint] = 0
	AND [t].[name]=@udt
--END SAVE INDEXES WITH THE UDT

--SAVE STATS WITH UDT
	SET @TYPE='ST'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_ID],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop])
	SELECT DISTINCT 
	   @udt
	  ,@TYPE
	, [s].[object_id]
	 ,QUOTENAME([s].[name])
	, N'IF NOT EXISTS (SELECT 1 FROM sys.stats WHERE name = ''' + [s].[name] + ''')'
	+ N' CREATE STATISTICS ' + QUOTENAME([s].[name]) + N' ON '
	+ QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id]))
	+ N'.' + QUOTENAME(OBJECT_NAME([c].[object_id]))
	+ N' (' + QUOTENAME([c].[name]) + N')'
	, N'IF EXISTS (SELECT 1 FROM sys.stats WHERE name = ''' + [s].[name] + ''')'
	+ N' DROP STATISTICS '
		+ QUOTENAME(OBJECT_SCHEMA_NAME([c].[object_id]))
		+ N'.' + QUOTENAME(OBJECT_NAME([c].[object_id]))
		+ N'.' + QUOTENAME([s].[name])
	,6--[Seq_Drop]
	FROM sys.stats [s] 
	INNER JOIN sys.stats_columns [sc] ON 1=1
		AND [sc].[object_id] = [s].[object_id] 
		AND [sc].[stats_id] = [s].[stats_id]
	INNER JOIN sys.columns [c] ON 1=1
		AND [c].[object_id] = [sc].[object_id] 
		AND [c].[column_id] = [sc].[column_id]
	INNER JOIN sys.partitions [par] ON 1=1
		AND [par].[object_id] = [s].[object_id]
	INNER JOIN sys.objects [obj] ON 1=1
		AND [par].[object_id] = [obj].[object_id]
	INNER JOIN sys.types [t] ON 1=1
		AND [c].[user_type_id] = [t].[user_type_id]
	WHERE 1=1
	AND OBJECTPROPERTY([s].[object_id],'IsUserTable') = 1
	AND [s].[user_created] = 1
	AND [t].[name]=@udt
--END SAVE STATS WITH UDT

--Determine dependencies
    DECLARE @references TABLE (
	[object]				sysname NOT NULL,
	[referenced_object]		sysname NOT NULL,
	PRIMARY KEY CLUSTERED	([object], [referenced_object])
	)
	DECLARE @sequenced_objects TABLE (
	 [RowID] INT NOT NULL
    ,[Sort] INT DEFAULT(0)
	,[Seq_Add] INT IDENTITY(1,1)
	,[ObjectId] INT
	)

	INSERT INTO @references ([object], [referenced_object])
	SELECT DISTINCT
	 SCHEMA_NAME([obj].[schema_id])+N'.'+[obj].[name]
	,SCHEMA_NAME([ref].[schema_id])+N'.'+[ref].[name]
	FROM sys.sql_expression_dependencies AS [dep]
	INNER JOIN sys.objects AS [obj] ON [obj].[object_id]=[dep].[referencing_id]
	INNER JOIN sys.objects AS [ref] ON [ref].[object_id]=[dep].[referenced_id]
	WHERE [dep].[referenced_database_name] IS NULL
	AND [obj].[object_id] IN (SELECT DISTINCT [t].[OBJECT_ID] 
								FROM [dbo].[Tmp_CLMProcessUDT] AS [t]
							  );
	WITH rcte ([object], [referenced_object], [level])
	AS 
	(
		SELECT DISTINCT --anchor
			[object]
		,[object] AS [referenced_object]
		,0 AS [level]
		FROM @references
	UNION ALL
		SELECT --recursion
			[rcte].[object]
		,[ref].[referenced_object]
		,[rcte].[level]+1
		FROM [rcte]
		INNER JOIN @references AS [ref] ON 1=1
		AND [rcte].[referenced_object]=[ref].[object]
		AND [rcte].[object]<>[ref].[referenced_object] -- avoid circular (infinite) references
		AND [ref].[object]<>[ref].[referenced_object]  -- skip self-referencing relations
		WHERE [level]<10
	), [cte]
	AS (
		SELECT TOP 99999999999
			MAX([rcte].[level]) AS [Level]
		, [rcte].[object]
		FROM [rcte]
		GROUP BY [rcte].[object]
	)
	INSERT INTO @sequenced_objects ([RowID],[Sort],[ObjectId])
	SELECT 
		[t1].[RowId]
       ,CASE [so].[TYPE] WHEN N'TF' THEN 6--give table value functions priority
	                     WHEN N'IF' THEN 7--give in-line functions priority
						 WHEN N'FN' THEN 5--give scalar functions priority
	    ELSE 99
		END
	   ,OBJECT_ID([cte].[object])
	FROM [cte]
	INNER JOIN sys.objects [so] ON [so].[object_id]=OBJECT_ID([cte].[object])
	INNER JOIN  [dbo].[Tmp_CLMProcessUDT] AS [t1]
		ON [t1].[object_id] = OBJECT_ID([cte].[object])
	ORDER BY [cte].[level]
	OPTION (MAXRECURSION 0) 

	--Update seq for dependencies
		UPDATE [t]
		SET [Seq_Add]=[so].[Seq_Add]
		FROM [dbo].[Tmp_CLMProcessUDT] [t]
		INNER JOIN @sequenced_objects [so] ON [so].[RowId]=[t].[RowId]

		UPDATE [t]
		SET [Seq_Add]=CASE [so].[TYPE] WHEN N'PK' THEN 3--give primary keys priority
								   WHEN N'F'  THEN 4--give foreign keys priority
							 ELSE [t].[Seq_Add]
				  END
		FROM [dbo].[Tmp_CLMProcessUDT] [t]
		INNER JOIN sys.objects [so] ON [so].[object_id]=[t].[object_id]

	--give priority to views over multisite tables
	IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AppTable]'), N'IsUserTable') = 1
	AND EXISTS (SELECT 1 FROM [sys].[columns]
                WHERE [object_id] = OBJECT_ID(N'[dbo].[AppTable]')
                AND [name] = N'AppViewName'
	           )
	 BEGIN
	   SET @STMT=N'UPDATE [t] ' +
	            N'SET [Seq_Add]= 1 ' +
	            N'FROM [dbo].[Tmp_CLMProcessUDT] AS [t] ' +
				N'INNER JOIN [AppTable] AS [a] ON OBJECT_ID([a].[AppViewName])= [t].[object_id]'
	   
	   EXEC @Severity = sp_executesql @STMT
	 END

--TABLES: SCRIPT COLUMN CHANGES
	SET @TYPE='COLUMN'

	INSERT INTO [dbo].[Tmp_CLMProcessUDT] ([UDT],[TYPE],[OBJECT_NAME],[CREATE_STMT],[DROP_STMT],[Seq_Drop],[Seq_Add])
	SELECT
		@udt
		,@TYPE
		,QUOTENAME([b].[TABLE_SCHEMA]) + N'.' + QUOTENAME([b].[TABLE_NAME]) + N'.' + QUOTENAME([b].[COLUMN_NAME])
		,N'ALTER TABLE ' + QUOTENAME([b].[TABLE_SCHEMA]) + N'.' + QUOTENAME([b].[TABLE_NAME]) + N' ' +
		N'ALTER COLUMN ' + QUOTENAME([b].[COLUMN_NAME]) + N' ' + @udt +
		CASE [b].[IS_NULLABLE]
				WHEN 'NO' THEN N' NOT NULL'
				ELSE N' NULL' 
		END
		,N'ALTER TABLE ' + QUOTENAME(TABLE_SCHEMA) + N'.' + QUOTENAME(TABLE_NAME) + N' ' +
		N'ALTER COLUMN ' + QUOTENAME(COLUMN_NAME) + N' ' + DATA_TYPE +
		CASE WHEN DATA_TYPE LIKE(N'%CHAR') THEN N'(' + CASE WHEN CHARACTER_MAXIMUM_LENGTH=-1 THEN N'max' ELSE LTRIM(CHARACTER_MAXIMUM_LENGTH) END + N')'
				WHEN DATA_TYPE IN(N'NUMERIC',N'DECIMAL') THEN '(' + LTRIM(NUMERIC_PRECISION) + N',' + LTRIM(NUMERIC_SCALE) + N')'
				ELSE N'' END +
		CASE IS_NULLABLE
				WHEN 'NO' THEN N' NOT NULL'
				ELSE N' NULL' END
		,8--[Seq_Drop]
		,0--[Seq_Add]
	FROM INFORMATION_SCHEMA.COLUMNS [b]
	INNER JOIN sys.tables [t] --skip views
	ON [b].[table_name] = [t].[name]
	WHERE [b].[domain_name] = @UDT
--END TABLES: SCRIPT COLUMN CHANGES

SELECT 
	 [UDT]
	,[TYPE]
	,[OBJECT_ID]
	,[OBJECT_NAME]
	,[CREATE_STMT]
	,[DROP_STMT]
	,[Seq_Add]
	,[Seq_Drop]
	,[RowId]
FROM [dbo].[Tmp_CLMProcessUDT]
ORDER BY [Seq_Drop]

IF OBJECT_ID('[dbo].[Tmp_CLMProcessUDT]','U') IS NOT NULL
 DROP TABLE [dbo].[Tmp_CLMProcessUDT]

RETURN @Severity

GO