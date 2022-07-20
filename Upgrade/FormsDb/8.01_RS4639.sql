IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductVersion]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'ProductVersion')
ALTER TABLE [dbo].[ProductVersion]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO
