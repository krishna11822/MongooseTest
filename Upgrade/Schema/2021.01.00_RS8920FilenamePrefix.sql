IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'ActiveBGTasks_mst'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ActiveBGTasks_mst'
                AND   COLUMN_NAME = N'TaskProfileParms')
BEGIN
   ALTER TABLE [dbo].[ActiveBGTasks_mst]
   ADD
      [TaskProfileParms] [dbo].[VeryLongListType] NULL

   EXEC dbo.SchemaAdditionalTasksSp 'ActiveBGTasks_mst', 'ActiveBGTasks_mst', NULL, 'Core'
END
GO 

--declare @padding1 nchar(255) = ' xxx'
--print LEN(RTRIM(@Padding1)) 


DECLARE @CopyPadding TABLE (RowPointer RowPointerType)

WHILE 1=1
BEGIN

   INSERT INTO @CopyPadding (RowPointer)
   SELECT TOP 500 RowPointer
   FROM ActiveBGTasks_mst
   WHERE LEN(RTRIM(Padding1)) > 0
   AND [TaskProfileParms] IS NULL

   IF @@ROWCOUNT = 0
      BREAK

   BEGIN TRAN

   UPDATE a
   SET [TaskProfileParms] = RTRIM(Padding1)
   FROM ActiveBGTasks_mst a
   INNER JOIN @CopyPadding cp
      ON a.RowPointer = cp.RowPointer

   DELETE @CopyPadding
   COMMIT TRAN
   WAITFOR DELAY '00:00:01'
END

GO
