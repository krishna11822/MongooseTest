SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- RS5817 upgrade script
-- =================================================================================
/* $Header: /Tools/SQLScripts/FormsDB/SchemaChanges/ReadyToApply/RS5817.sql 1     3/07/13 3:53p Johndou $ */
/*
Copyright © 2012 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

----------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Themes]') AND type IN (N'U'))
CREATE TABLE Themes (
  [ID]            uniqueidentifier  not null default newid()
, [ThemeName]     nvarchar(50)   not null
, [ScopeType]     smallint       not null default (0)
, [ScopeName]     nvarchar(50)   not null default (N'[NULL]')
, [LockedBy]      nvarchar(50)   null

-- constraints
, CONSTRAINT [PK_Themes] PRIMARY KEY (ThemeName, ScopeType, ScopeName)
)

----------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Styles]') AND type IN (N'U'))
CREATE TABLE Styles (
  [ID]            uniqueidentifier  not null default newid()
, [ThemeID]       uniqueidentifier  null        -- NULL=component/property class ext
, [ElementType]   nvarchar(30)      not null    -- UIElement, AppFrame, Menu, MenuItem, Toolbar, etc...
, [Class]         nvarchar(30)      null        -- Unique: ThemeID+Class

-- constraints
, CONSTRAINT [PK_Styles] PRIMARY KEY (ID)
)

GO

----------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThemeAttributes]') AND type IN (N'U'))
CREATE TABLE ThemeAttributes (
  [ID]      uniqueidentifier not null  -- theme or style ID
, [Name]    nvarchar(80) not null
, [Value]   nvarchar(max) null
-- constraints
, CONSTRAINT [PK_ThemeAttrs] PRIMARY KEY (ID,Name)
)

GO