-- =======================================
-- RS8317 (Responsive Layout):
-- =======================================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Forms]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'LayoutAttributes' 
   AND OBJECT_NAME(id) = N'Forms')
ALTER TABLE [dbo].[Forms]
  ADD [LayoutAttributes] nvarchar(max) NULL
GO
