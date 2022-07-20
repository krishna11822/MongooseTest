SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/** Create User Defined Data Types **/
IF NOT EXISTS (SELECT 1 FROM sys.types st 
JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
WHERE st.name = N'ReplTransferTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ReplTransferTypeType] 
   FROM TINYINT
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st 
JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
WHERE st.name = N'IONTransferTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[IONTransferTypeType] 
   FROM TINYINT
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'ION_transfer_type')
   ALTER TABLE [dbo].[intranet] ADD
      [ION_transfer_type] [dbo].[IONTransferTypeType] 
      CONSTRAINT [DF_intranet_IONTransferType] DEFAULT 1 NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[rep_category]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[rep_category]')
      AND [name] = N'replication_transfer_type')
   ALTER TABLE [dbo].[rep_category] ADD
      [replication_transfer_type] [dbo].[ReplTransferTypeType] 
      CONSTRAINT [DF_rep_category_ReplTra] DEFAULT 1 NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]')
      AND [name] = N'ReplicationTransferType')
   ALTER TABLE [dbo].[ReplicatedRows3_mst] ADD
      [ReplicationTransferType] [dbo].[ReplTransferTypeType]
      CONSTRAINT [DF_ReplicatedRows_ReplTransfer] DEFAULT 1 NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
      WHERE [name]= N'CK_intranet_IONTransferType'
      AND [type] = 'C' 
      AND [parent_object_id] = OBJECT_ID(N'[dbo].[intranet]'))
   ALTER TABLE [dbo].[intranet] 
  ADD CONSTRAINT [CK_intranet_IONTransferType] 
    CHECK ( ION_Transfer_Type BETWEEN 1 and 2 )
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[rep_category]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
       WHERE [name]= N'CK_rep_category_ReplTra'
       AND [type] = 'C' 
       AND [parent_object_id] = OBJECT_ID(N'[dbo].[rep_category]'))
  ALTER TABLE [dbo].[rep_category] 
  ADD CONSTRAINT [CK_rep_category_ReplTra] 
  CHECK ( replication_transfer_type BETWEEN 1 and 3 )
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
       WHERE [name]= N'CK_ReplicatedRows_ReplTransfer'
       AND [type] = 'C' 
       AND [parent_object_id] = OBJECT_ID(N'[dbo].[ReplicatedRows3_mst]'))
  ALTER TABLE [dbo].[ReplicatedRows3_mst] 
  ADD CONSTRAINT [CK_ReplicatedRows_ReplTransfer] 
  CHECK ( ReplicationTransferType BETWEEN 1 and 3 )
GO



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value1')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value1 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value2')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value2 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value3')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value3 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value4')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value4 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value5')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value5 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value6')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value6 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value7')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value7 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value8')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value8 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value9')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value9 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value10')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value10 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value11')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value11 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value12')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value12 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value13')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value13 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value14')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value14 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value15')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value15 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value16')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value16 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value17')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value17 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value18')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value18 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value19')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value19 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value20')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value20 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value21')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value21 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value22')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value22 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value23')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value23 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value24')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value24 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value25')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value25 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value26')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value26 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value27')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value27 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value28')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value28 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value29')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value29 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value30')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value30 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value31')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value31 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value32')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value32 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value33')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value33 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value34')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value34 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value35')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value35 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value36')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value36 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value37')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value37 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value38')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value38 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value39')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value39 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value40')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value40 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value41')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value41 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value42')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value42 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value43')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value43 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value44')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value44 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value45')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value45 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value46')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value46 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value47')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value47 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value48')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value48 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value49')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value49 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value50')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value50 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value51')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value51 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value52')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value52 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value53')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value53 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value54')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value54 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValues]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValues]')
      AND [name] = N'Value55')
   ALTER TABLE [dbo].[ShadowValues] ALTER COLUMN Value55 VeryLongListType NULL

ALTER TABLE ShadowValues
ADD TempColumn OleObjectType null
EXEC sp_tableoption N'ShadowValues', 'text in row', '0'
ALTER TABLE ShadowValues
DROP COLUMN TempColumn


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value1')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value1 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value2')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value2 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value3')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value3 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value4')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value4 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value5')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value5 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value6')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value6 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value7')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value7 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value8')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value8 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value9')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value9 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value10')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value10 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value11')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value11 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value12')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value12 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value13')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value13 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value14')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value14 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value15')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value15 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value16')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value16 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value17')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value17 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value18')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value18 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value19')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value19 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value20')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value20 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value21')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value21 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value22')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value22 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value23')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value23 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value24')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value24 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value25')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value25 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value26')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value26 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value27')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value27 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value28')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value28 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value29')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value29 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value30')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value30 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value31')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value31 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value32')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value32 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value33')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value33 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value34')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value34 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value35')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value35 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value36')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value36 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value37')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value37 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value38')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value38 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value39')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value39 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value40')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value40 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value41')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value41 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value42')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value42 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value43')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value43 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value44')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value44 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value45')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value45 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value46')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value46 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value47')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value47 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value48')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value48 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value49')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value49 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value50')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value50 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value51')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value51 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value52')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value52 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value53')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value53 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value54')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value54 VeryLongListType NULL



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ShadowValuesErrors_mst]')
      AND [name] = N'Value55')
   ALTER TABLE [dbo].[ShadowValuesErrors_mst] ALTER COLUMN Value55 VeryLongListType NULL

GO
/* Miscellaneous Setup */ 

DECLARE @TableName 	TableNameType
DECLARE @Infobar 	InfobarType
DECLARE @ModuleName	SYSNAME
DECLARE @SiteColumn 	SYSNAME

SET @TableName = N'ReplicatedRows3_mst'
SET @ModuleName = N'Core'
SET @SiteColumn = N'SiteRef'
SET @Infobar = NULL

EXECUTE [dbo].[SchemaAdditionalTasksSp] @TableName, @TableName, @Infobar, @ModuleName, @SiteColumn

SET @TableName = N'rep_object_category'
SET @Infobar = NULL
SET @SiteColumn = NULL

EXECUTE [dbo].[SchemaAdditionalTasksSp] @TableName, @TableName, @Infobar, @ModuleName, @SiteColumn

SET @TableName = N'intranet'
SET @Infobar = NULL
SET @SiteColumn = NULL

EXECUTE [dbo].[SchemaAdditionalTasksSp] @TableName, @TableName, @Infobar, @ModuleName, @SiteColumn

SET @TableName = N'ShadowValues'
SET @Infobar = NULL
SET @SiteColumn = NULL

EXECUTE [dbo].[SchemaAdditionalTasksSp] @TableName, @TableName, @Infobar, @ModuleName, @SiteColumn

SET @TableName = N'ShadowValuesErrors_mst'
SET @Infobar = NULL
SET @SiteColumn = NULL

EXECUTE [dbo].[SchemaAdditionalTasksSp] @TableName, @TableName, @Infobar, @ModuleName, @SiteColumn

GO


IF OBJECT_ID(N'[dbo].[IONMessagingErrors_mst]', N'U') IS NULL
CREATE TABLE [dbo].[IONMessagingErrors_mst](
   [OperationNumber] [OperationCounterType]  IDENTITY(1,1)  NOT NULL,
   [SiteRef] [SiteType] NOT NULL 
        CONSTRAINT DF_IONMessagingErrors_SiteRef DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))),
   [ToSite] [SiteType] NOT NULL,
   [ObjectName] [ObjectNameType] NOT NULL,
   [OperationType] [ReplicationOperationType] NOT NULL
      CONSTRAINT [CK_IONMessagingErrors_OperationType] CHECK ([OperationType] IN (1,2,3,4)),
   [MessageBody] [VeryLongListType] NOT NULL,
   [MessageError] [VeryLongListType] NOT NULL,
   [RefRowPointer] [RowPointerType] 
        CONSTRAINT [DF_IONMessagingErrors_RefRowPointer] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
   [ReplTransferType] [ReplTransferTypeType] NOT NULL
      CONSTRAINT [CK_IONMessagingErrors_ReplTransferType] CHECK ([ReplTransferType] IN (1,2,3)),
   [ResubmitToQueue] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_ResubmitToQueue] DEFAULT ((0))
      CONSTRAINT [CK_IONMessagingErrors_ResubmitToQueue] CHECK ([ResubmitToQueue] IN (0,1)),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_IONMessagingErrors_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IONMessagingErrors_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_IONMessagingErrors_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_IONMessagingErrors] PRIMARY KEY CLUSTERED 
      ([OperationNumber], [SiteRef]),
   CONSTRAINT [IX_IONMessagingErrors_RowPointer] UNIQUE NONCLUSTERED 
      ([RowPointer], [SiteRef])
)
GO

EXEC dbo.SchemaAdditionalTasksSp
  @PStartingTable = N'IONMessagingErrors_mst'
, @PEndingTable = N'IONMessagingErrors_mst'
, @Infobar = ''
, @pModuleName = 'Core'
, @PRememberIdentity = 1

GO
