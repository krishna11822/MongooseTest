IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'IONMessagingErrors_mst'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'IONMessagingErrors_mst'
                AND   COLUMN_NAME = N'ReplicatedRowPointer')
BEGIN
   ALTER TABLE [dbo].[IONMessagingErrors_mst]
   ADD
     [ReplicatedRowPointer] [dbo].[RowPointerType] NULL
   CREATE INDEX [IX_IONMessagingErrors_mst_ReplicatedRowPointer] ON IONMessagingErrors_mst(ReplicatedRowPointer, SiteRef)

     EXEC dbo.SchemaAdditionalTasksSp 'IONMessagingErrors_mst', 'IONMessagingErrors_mst', NULL, 'Core'
END
GO
