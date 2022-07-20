SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MGVersion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MGVersion](
       [ToolsetVersion] [nvarchar](80) NOT NULL
)
END
