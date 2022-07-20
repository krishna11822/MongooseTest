IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'IX_PublicationSubscriber_Username_Email_KeyValues'
   AND [type] = 'UQ' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[PublicationSubscriber]'))
   ALTER TABLE [dbo].[PublicationSubscriber] ADD
      CONSTRAINT [IX_PublicationSubscriber_Username_Email_KeyValues] UNIQUE NONCLUSTERED
      (
         [PublicationName],
         [Username],
         [Email],
         [KeyValue],
         [KeyValue2]
      )  WITH  FILLFACTOR = 90
GO
