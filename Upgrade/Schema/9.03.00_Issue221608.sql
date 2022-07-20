IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskHistory_mst]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'TaskErrorMsg' 
   AND OBJECT_NAME(id) = N'BGTaskHistory_mst')
   ALTER TABLE [dbo].[BGTaskHistory_mst]
      ALTER COLUMN [TaskErrorMsg] [dbo].[VeryLongListType] NULL
GO
exec [dbo].[SchemaAdditionalTasksSp]
     'BGTaskHistory_mst' -- @PStartingTable TableNameType
   , 'BGTaskHistory_mst' -- @PEndingTable TableNameType
   , ''
   , 'Core'
GO
