-- Let OutriggerProfile.{Username,DataSourceName} be NULL so their values can come from the DSN entry:
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[OutriggerProfile]'), N'IsUserTable') = 1
   IF EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [name] = N'Username'
      AND [object_id] = OBJECT_ID(N'[dbo].[OutriggerProfile]'))
      ALTER TABLE [dbo].[OutriggerProfile]
         ALTER COLUMN [Username] [dbo].[UsernameType] NULL

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[OutriggerProfile]'), N'IsUserTable') = 1
   IF EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [name] = N'DataSourceName'
      AND [object_id] = OBJECT_ID(N'[dbo].[OutriggerProfile]'))
      ALTER TABLE [dbo].[OutriggerProfile]
         ALTER COLUMN [DataSourceName] [sysname] NULL

GO

