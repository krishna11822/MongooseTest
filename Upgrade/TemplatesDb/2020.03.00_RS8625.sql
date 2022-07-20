-- ===============================================
--  RS8625 (Component Template):
-- ===============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FrtFormComponentGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FrtFormComponentGroups](
   [Name] [nvarchar](180) NOT NULL,
   [CreatedBy] [nvarchar] (128) NOT NULL,       -- UserNames.Username  (UserNameType)
   [Description] [nvarchar](250) NULL,
   [Template] [nvarchar](max) NULL,
CONSTRAINT [PK_FrtFormComponentGroups] PRIMARY KEY CLUSTERED
(
   [Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
)
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FrtFormComponentGroups_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FrtFormComponentGroups]
   ADD CONSTRAINT [DF_FrtFormComponentGroups_CreatedBy]
   DEFAULT ('[NULL]') FOR [CreatedBy]
END
GO