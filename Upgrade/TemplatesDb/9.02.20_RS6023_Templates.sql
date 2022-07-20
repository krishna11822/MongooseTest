SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[dbo].[FrtFormManActivityLog]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[FrtFormManActivityLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [int] NOT NULL,
	[MessageText] [nvarchar](255) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[RecordDate] [datetime] NOT NULL
  CONSTRAINT [DF_FrtFormManAct_RecordDate]  DEFAULT (getdate()),
	[MessageText2] [nvarchar](255) NULL,
 CONSTRAINT PK_FrtFormManActivityLog PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90),
 CONSTRAINT UQ_FrtFormManActivityLog UNIQUE CLUSTERED 
(
	[Timestamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90)
)
END
GO
IF OBJECT_ID(N'[dbo].[FormManActivityLog]', N'U') IS NOT NULL
BEGIN
SET IDENTITY_INSERT FrtFormManActivityLog ON
INSERT INTO FrtFormManActivityLog(ID, MessageType, MessageText, RecordDate,
	MessageText2)
SELECT ID, MessageType, MessageText, RecordDate, MessageText2
FROM FormManActivityLog f1
WHERE NOT EXISTS (SELECT 1
	FROM FrtFormManActivityLog f2
	WHERE f1.ID = f2.ID)
SET IDENTITY_INSERT FrtFormManActivityLog OFF
END
GO
IF OBJECT_ID(N'[dbo].[FormManActivityLog]', N'U') IS NOT NULL
DROP TABLE FormManActivityLog
GO

IF OBJECT_ID(N'[dbo].[FrtFormManAuthorizedUsers]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[FrtFormManAuthorizedUsers](
	[UserName] [nvarchar](50) NOT NULL,
	[AdminUserFlag] [tinyint] NOT NULL
  CONSTRAINT [DF_FrtFormManAut_AdminUser]  DEFAULT (0),
 CONSTRAINT [PK_FrtFormManAuthorizedUsers] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90)
)
END
IF OBJECT_ID(N'[dbo].[FormManAuthorizedUsers]', N'U') IS NOT NULL
BEGIN
INSERT INTO FrtFormManAuthorizedUsers(UserName, AdminUserFlag)
SELECT UserName, AdminUserFlag
FROM FormManAuthorizedUsers f1
WHERE NOT EXISTS (SELECT 1
	FROM FrtFormManAuthorizedUsers f2
	WHERE f1.UserName = f2.UserName)
END
GO
IF OBJECT_ID(N'[dbo].[FormManAuthorizedUsers]', N'U') IS NOT NULL
BEGIN
   DROP TABLE FormManAuthorizedUsers
END
GO

IF OBJECT_ID(N'[dbo].[FrtFormManTranLog]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[FrtFormManTranLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[ObjectType] [int] NOT NULL,
	[ObjectName] [nvarchar](255) NOT NULL,
	[DevDatabase] [nvarchar](20) NULL,
	[Action] [int] NOT NULL,
	[SkipFlag] [tinyint] NOT NULL
  CONSTRAINT [DF_FrtFormManTra_SkipFlag]  DEFAULT (0),
	[RecordDate] [datetime] NOT NULL
  CONSTRAINT [DF_FrtFormManTra_RecordDate]  DEFAULT (getdate()),
	[Timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_FrtFormManTranLog] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90),
 CONSTRAINT [UQ_FrtFormManTranLog] UNIQUE CLUSTERED 
(
	[Timestamp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90)
)
END
IF OBJECT_ID(N'[dbo].[FormManTranLog]', N'U') IS NOT NULL
BEGIN
SET IDENTITY_INSERT FrtFormManTranLog ON
INSERT INTO FrtFormManTranLog(ID, UserName, ObjectType, ObjectName,
	DevDatabase, Action, SkipFlag, RecordDate)
SELECT ID, UserName, ObjectType, ObjectName, DevDatabase, Action, SkipFlag,
RecordDate
FROM FormManTranLog f1
WHERE NOT EXISTS (SELECT 1
	FROM FrtFormManTranLog f2
	WHERE f1.ID = f2.ID)
SET IDENTITY_INSERT FrtFormManTranLog OFF
END
GO
IF OBJECT_ID(N'[dbo].[FormManTranLog]', N'U') IS NOT NULL
BEGIN
   DROP TABLE FormManTranLog
END
GO
IF OBJECT_ID(N'[dbo].[FrtForms]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[FrtForms](
	[FormName] [nvarchar](50) NOT NULL,
	[FormType] [smallint] NULL,
	[PrimaryDataSource] [nvarchar](101) NULL,
	[Component] [nvarchar](50) NULL,
	[SubComponent] [nvarchar](50) NULL,
	[HelpFileName] [nvarchar](50) NULL,
	[HelpContextID] [int] NULL,
	[Comments] [nvarchar](251) NULL,
	[FilterFormSpec] [nvarchar](101) NULL,
	[MasterDeviceID] [int] NOT NULL
   CONSTRAINT [DF_FrtForms_MasterDeviceID]  DEFAULT (0)
 CONSTRAINT [FrtForms_PK] PRIMARY KEY NONCLUSTERED
(
	[FormName] ASC,
	[MasterDeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90)
)
IF NOT EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[FrtForms]') 
               AND name = N'FrtFormsHelpContextID')
BEGIN
CREATE NONCLUSTERED INDEX [FrtFormsHelpContextID] ON [dbo].[FrtForms] 
(
	[HelpContextID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90)
END
END
GO
IF OBJECT_ID(N'[dbo].[Forms]', N'U') IS NOT NULL
BEGIN
INSERT INTO FrtForms(FormName, FormType, PrimaryDataSource, Component,
	SubComponent, HelpFileName, HelpContextID, Comments, FilterFormSpec,
	MasterDeviceID)
SELECT FormName, FormType, PrimaryDataSource, Component, SubComponent,
HelpFileName, HelpContextID, Comments, FilterFormSpec, MasterDeviceID
FROM Forms f1
WHERE NOT EXISTS (SELECT 1
	FROM FrtForms f2
	WHERE f1.FormName = f2.FormName
	AND f1.MasterDeviceID = f2.MasterDeviceID)
END
GO
IF OBJECT_ID(N'[dbo].[Forms]', N'U') IS NOT NULL
BEGIN
DROP TABLE Forms
END
GO

IF OBJECT_ID(N'[dbo].[FrtLinks]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[FrtLinks](
	[FormName] [nvarchar](50) NOT NULL,
	[ChildFormName] [nvarchar](50) NOT NULL,
	[ChildFormParms] [nvarchar](50) NULL,
	[ParentPropertyName] [nvarchar](50) NOT NULL,
	[ChildPropertyName] [nvarchar](50) NULL,
 CONSTRAINT [FrtLinks_PK] PRIMARY KEY NONCLUSTERED 
(
	[FormName] ASC,
	[ChildFormName] ASC,
	[ParentPropertyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90)
)
END
GO
IF OBJECT_ID(N'[dbo].[Links]', N'U') IS NOT NULL
BEGIN
INSERT INTO FrtLinks(FormName, ChildFormName, ChildFormParms, 
	ParentPropertyName, ChildPropertyName)
SELECT FormName, ChildFormName, ChildFormParms, ParentPropertyName,
ChildPropertyname
FROM Links l1
WHERE NOT EXISTS(SELECT 1
	FROM FrtLinks l2
	WHERE l1.FormName = l2.FormName
	AND l1.ChildFormName = l2.ChildFormName
	AND l1.ParentPropertyName = l2.ParentPropertyName)
END
GO
IF OBJECT_ID(N'[dbo].[Links]', N'U') IS NOT NULL
BEGIN
DROP TABLE Links
END
GO
IF OBJECT_ID(N'[dbo].[FrtLocalLog]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[FrtLocalLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [sysname] NOT NULL,
	[ObjectType] [int] NOT NULL,
	[ObjectName] [sysname] NOT NULL,
	[Action] [tinyint] NOT NULL,
	[SkipFlag] [tinyint] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[LockedBy] [sysname] NULL,
	[NotInProduction] [tinyint] NOT NULL
   CONSTRAINT DF_FrtLocalLogNIP DEFAULT ((0)),
	[stringTableName] [sysname] NULL
)
END
IF NOT EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[FrtLocalLog]') 
               AND name = N'FrtLocalLog_Ix1')
BEGIN
CREATE NONCLUSTERED INDEX [FrtLocalLog_Ix1] ON [dbo].[FrtLocalLog] 
(
	[ObjectType] ASC,
	[ObjectName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
END
IF OBJECT_ID(N'[dbo].[LocalLog]', N'U') IS NOT NULL
BEGIN
DROP TABLE LocalLog
END

IF OBJECT_ID(N'[dbo].[FrtProperties]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[FrtProperties](
	[FormName] [nvarchar](50) NULL,
	[PropertyName] [nvarchar](50) NULL,
	[SubCollectionName] [nvarchar](50) NULL,
	[Include] [bit] NOT NULL,
	[DefaultFrom] [nvarchar](101) NULL,
	[Class] [smallint] NULL,
	[Label] [nvarchar](50) NULL,
	[ContainerType] [smallint] NULL,
	[ContainerSequence] [smallint] NULL,
	[GroupBoxLabel] [nvarchar](50) NULL,
	[HelpString] [nvarchar](101) NULL,
	[ListSource] [nvarchar](201) NULL,
	[FindFromForm] [nvarchar](101) NULL,
	[FindFromProperty] [nvarchar](50) NULL,
	[MaintainFromSpec] [nvarchar](101) NULL,
	[Validators] [nvarchar](101) NULL,
	[Sequence] [smallint] NULL,
	[Format] [nvarchar](101) NULL,
	[DisplayWidth] [smallint] NULL,
	[Flags] [int] NULL,
	[ValidateImmediately] [bit] NOT NULL,
	[ValueIsListIndex] [bit] NOT NULL,
	[LinkBy] [nvarchar](250) NULL
)
IF NOT EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[FrtProperties]') 
               AND name = N'FrtProperties_Ix1')
BEGIN
CREATE NONCLUSTERED INDEX [FrtProperties_Ix1] ON [dbo].[FrtProperties] 
(
	[FormName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
END
INSERT INTO FrtProperties (FormName, PropertyName, SubCollectionName,
	Include, DefaultFrom, Class, Label, ContainerType, ContainerSequence,
	GroupBoxLabel, HelpString, ListSource, FindFromForm, FindFromProperty,
	MaintainFromSpec, Validators, Sequence, Format, DisplayWidth,
	Flags, ValidateImmediately, ValueIsListIndex, LinkBy)
SELECT FormName, PropertyName, SubCollectionName, Include, DefaultFrom, Class,
Label, ContainerType, ContainerSequence, GroupBoxLabel, HelpString, ListSource,
FindFromForm, FindFromProperty, MaintainFromSpec, Validators, Sequence,
Format, DisplayWidth, Flags, ValidateImmediately, ValueIsListIndex, LinkBy
FROM Properties p1
END
GO
IF OBJECT_ID(N'[dbo].[Properties]', N'U') IS NOT NULL
BEGIN
DROP TABLE Properties
END
GO

