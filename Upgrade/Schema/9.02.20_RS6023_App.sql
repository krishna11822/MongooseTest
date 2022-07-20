SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ProductVersion]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ProductVersion]')
      AND [name] = N'DataRowversion')
   ALTER TABLE [dbo].[ProductVersion] ADD
      [DataRowversion] TIMESTAMP NULL
GO

