-- Table TmpStagingNewDataMaintenance
-- Add new column DefaultValue
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TmpStagingNewDataMaintenance]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[TmpStagingNewDataMaintenance]')
      AND [name] = N'DefaultValue')
   ALTER TABLE [dbo].[TmpStagingNewDataMaintenance] ADD
      [DefaultValue] [dbo].[DefaultValueType] NULL 