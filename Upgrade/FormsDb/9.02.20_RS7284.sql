IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveXComponentProperties]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DeviceID' 
   AND OBJECT_NAME(id) = N'ActiveXComponentProperties')
ALTER TABLE [dbo].[ActiveXComponentProperties]
  ADD [DeviceID] [int] NOT NULL CONSTRAINT DF_ActiveXComponentProperties_DeviceType DEFAULT -1
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ActiveXComponentProperties]') AND name = N'PK_ActiveXComponentProperties')
ALTER TABLE [dbo].[ActiveXComponentProperties] DROP CONSTRAINT [PK_ActiveXComponentProperties]
GO

ALTER TABLE [dbo].[ActiveXComponentProperties] ADD  CONSTRAINT [PK_ActiveXComponentProperties] PRIMARY KEY NONCLUSTERED 
(
	[FormID] ASC,
	[ComponentName] ASC,
	[DeviceID] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO
