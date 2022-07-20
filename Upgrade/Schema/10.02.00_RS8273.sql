IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[GroupNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[GroupNames]')
      AND [name] = N'ParentGroupId')
   ALTER TABLE [dbo].[GroupNames] ADD
      [ParentGroupId] [dbo].[TokenType] NULL

GO