IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Collections]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'OutriggerProfile' 
   AND OBJECT_NAME(id) = N'Collections')
ALTER TABLE [dbo].[Collections]
  ADD [OutriggerProfile] NVARCHAR(50) NULL
GO
