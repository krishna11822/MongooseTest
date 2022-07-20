IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WebUserControlElements]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'PK_WebUserControlElements'
   AND [type] = 'PK' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[WebUserControlElements]'))
alter table WebUserControlElements
drop constraint PK_WebUserControlElements
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WebUserControlElements'
            AND COLUMN_NAME = N'ElementName')
alter table WebUserControlElements
alter column ElementName nvarchar(360) not null
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WebUserControlElements]'), N'IsUserTable') = 1
alter table WebUserControlElements
add CONSTRAINT [PK_WebUserControlElements] PRIMARY KEY CLUSTERED 
(
       [ElementName] ASC,
       [ContentType] ASC,
       [ScopeType] ASC,
       [ScopeName] ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
