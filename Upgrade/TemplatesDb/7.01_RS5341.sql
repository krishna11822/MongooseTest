--upgrade script for the changes in mongoose release 7.02 to templatesdb

--rs5341

GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Forms]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'MasterDeviceID' 
   AND OBJECT_NAME(id) = N'Forms')
ALTER TABLE [dbo].Forms
  ADD [MasterDeviceID] [int] NOT NULL CONSTRAINT DF_Forms_MasterDeviceID DEFAULT 0
GO


IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forms]') AND name = N'aaaaaForms_PK')
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [aaaaaForms_PK]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forms]') AND name = N'Forms_PK')
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [Forms_PK]
GO

/****** Object:  Index [aaaaaForms_PK]    Script Date: 01/12/2012 15:52:11 ******/
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [Forms_PK] PRIMARY KEY NONCLUSTERED 
(
	[FormName] ASC,
	[MasterDeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

