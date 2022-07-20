SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjectSentEmail_mst]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ObjectSentEmail_mst]')
      AND [name] = N'EmailFrom')
   ALTER TABLE [dbo].[ObjectSentEmail_mst] ALTER COLUMN
      [EmailFrom] [dbo].[EmailType] NULL
   -- NOTE: Column purpose is and always was "ReplyTo", but renaming is forbidden!
GO
