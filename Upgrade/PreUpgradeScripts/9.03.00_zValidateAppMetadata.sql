DECLARE 
  @Severity     INT
, @Infobar      InfobarType
, @Infobar2     InfobarType
, @Prefix       NextKeyPrefixListType
, @Generator    LongListType
, @Length       NextKeyLengthExprType
, @PreGenerate  LongListType
, @PostGenerate LongListType
, @AddlParms    LongListType
, @AddlKeys     LongListType
, @Partition    LongListType
, @TableName    TableNameType
, @MasterError  NVARCHAR(MAX)

SET @Severity = 0
SET @MasterError = N''

DECLARE AppColumnIupCrs CURSOR LOCAL STATIC
FOR SELECT
  apc.NextkeyPrefix
, apc.NextkeyGenerator
, apc.NextkeyLength
, apc.NextkeyPreGenerate
, apc.NextkeyPostGenerate
, apc.RegisterNewKeyAddlParms
, apc.NextkeyAddlKeys
, apc.NextkeyPartitionCondition
, apc.TableName
FROM AppColumn apc
WHERE NextkeyPrefix IS NOT NULL
OR apc.NextkeyGenerator IS NOT NULL
OR apc.NextkeyLength IS NOT NULL
OR apc.NextkeyPostGenerate IS NOT NULL
OR apc.RegisterNewKeyAddlParms IS NOT NULL
OR apc.NextkeyAddlKeys IS NOT NULL
OR apc.NextkeyPartitionCondition IS NOT NULL
OR apc.NextkeyPreGenerate IS NOT NULL

OPEN AppColumnIupCrs
WHILE 1=1
BEGIN
   FETCH AppColumnIupCrs INTO
     @Prefix
   , @Generator
   , @Length
   , @PreGenerate
   , @PostGenerate
   , @AddlParms
   , @AddlKeys
   , @Partition
   , @TableName

   IF @@FETCH_STATUS <> 0
      BREAK

   EXEC @Severity = dbo.ValidateNextKeyRecordSp
     @Prefix       = @Prefix
   , @Generator    = @Generator
   , @Length       = @Length
   , @PostGenerate = @PostGenerate
   , @AddlParms    = @AddlParms
   , @AddlKeys     = @AddlKeys
   , @Partition    = @Partition
   , @TableName    = @TableName
   , @Infobar      = @Infobar2 OUTPUT

   IF @Severity <> 0
   BEGIN
      EXEC MsgAppSp @Infobar OUTPUT
       , 'I=TableName'
       , @TableName
      EXEC MsgAppSp @Infobar OUTPUT
       , 'E=Msg'
       , @Infobar2
      SET @MasterError = @MasterError + N'
' + @Infobar
      SET @Infobar = NULL
      SET @Infobar2 = NULL
   END

   IF @PreGenerate IS NOT NULL
   BEGIN
      EXEC @Severity = MsgAppSp @Infobar2 OUTPUT
      , N'E=NextKeyPregenerator'
      EXEC MsgAppSp @Infobar OUTPUT
       , 'I=TableName'
       , @TableName
      EXEC MsgAppSp @Infobar OUTPUT
       , 'E=Msg'
       , @Infobar2
      SET @MasterError = @MasterError + N'
' + @Infobar
      SET @Infobar = NULL
      SET @Infobar2 = NULL
   END



END
CLOSE AppColumnIupCrs
DEALLOCATE AppColumnIupCrs

DECLARE
  @UpdateAllWhen        LongListType
, @UpdateRecordDateWhen LongListType 
, @UpdateCode           VeryLongListType

DECLARE AppTableIupCrs CURSOR LOCAL STATIC
FOR SELECT
  apt.Update_AllWhen
, apt.UpdateRecordDateWhen
, apt.TableName
FROM AppTable apt
WHERE apt.Update_AllWhen IS NOT NULL
OR apt.UpdateRecordDateWhen IS NOT NULL

OPEN AppTableIupCrs
WHILE 1=1
BEGIN
   FETCH AppTableIupCrs INTO
     @UpdateAllWhen
   , @UpdateRecordDateWhen
   , @TableName

   IF @@FETCH_STATUS <> 0
      BREAK

   IF @UpdateAllWhen IS NOT NULL
   BEGIN
      EXEC @Severity = dbo.MakeUpdateWhenSp
        @UpdateList = @UpdateAllWhen
      , @UpdateCode = @UpdateCode OUTPUT
      , @Infobar    = @Infobar2 OUTPUT

      IF @Severity <> 0
      BEGIN
         EXEC MsgAppSp @Infobar OUTPUT
          , 'I=TableName'
          , @TableName
         EXEC MsgAppSp @Infobar OUTPUT
          , 'E=Msg'
          , @Infobar2
         SET @MasterError = @MasterError + N'
' + @Infobar
        SET @Infobar = NULL
        SET @Infobar2 = NULL
      END
   END

   IF @UpdateRecordDateWhen IS NOT NULL
   BEGIN
      EXEC @Severity = dbo.MakeUpdateWhenSp
        @UpdateList = @UpdateRecordDateWhen
      , @UpdateCode = @UpdateCode OUTPUT
      , @Infobar    = @Infobar2 OUTPUT

      IF @Severity <> 0
      BEGIN
         EXEC MsgAppSp @Infobar OUTPUT
          , 'I=TableName'
          , @TableName
         EXEC MsgAppSp @Infobar OUTPUT
          , 'E=Msg'
          , @Infobar2

         SET @MasterError = @MasterError + N'
' + @Infobar

        SET @Infobar = NULL
        SET @Infobar2 = NULL
      END
   END
END
CLOSE AppTableIupCrs
DEALLOCATE AppTableIupCrs

IF LEN(@MasterError) > 0
BEGIN
    EXEC RaiseErrorSp @MasterError, @Severity, 3
END
