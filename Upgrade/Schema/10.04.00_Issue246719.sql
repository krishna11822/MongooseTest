IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventQueue_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventQueue_mst]')
      AND [name] = N'InProcess')
   ALTER TABLE [dbo].[EventQueue_mst] ADD
      [InProcess] [dbo].[ListYesNoType] NOT NULL
       CONSTRAINT [DF_EventQueue_InProcess]  DEFAULT ((0)) 
       CONSTRAINT [CK_EventQueue_InProcess] CHECK ([InProcess] IN (0,1))
DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     N'EventQueue_mst'
   , N'EventQueue_mst'
   , @Infobar OUTPUT
   , N'Core'
   , N'SiteRef'
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTrigger_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventTrigger_mst]')
      AND [name] = N'InProcess')
   ALTER TABLE [dbo].[EventTrigger_mst] ADD
      [InProcess] [dbo].[ListYesNoType] NOT NULL
       CONSTRAINT [DF_EventTrigger_InProcess]  DEFAULT ((0)) 
       CONSTRAINT [CK_EventTrigger_InProcess] CHECK ([InProcess] IN (0,1))
DECLARE @Infobar InfobarType
EXEC [dbo].[SchemaAdditionalTasksSp]
     N'EventTrigger_mst'
   , N'EventTrigger_mst'
   , @Infobar OUTPUT
   , N'Core'
   , N'SiteRef'
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventHandlerState]')
      AND [name] = N'InProcess')
   ALTER TABLE [dbo].[EventHandlerState] ADD
      [InProcess] [dbo].[ListYesNoType] NOT NULL
       CONSTRAINT [DF_EventHandlerState_InProcess]  DEFAULT ((0)) 
       CONSTRAINT [CK_EventHandlerState_InProcess] CHECK ([InProcess] IN (0,1))
GO
 
