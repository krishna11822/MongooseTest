SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT 1 FROM dbo.sysindexes idx JOIN dbo.sysobjects obj ON (obj.Id = idx.Id) WHERE obj.Name = 'DocumentObjectReference' AND obj.xtype = 'U' AND idx.Name = 'IX_DocumentObjectReference_TableName_Document')
   DROP INDEX [dbo].[DocumentObjectReference].[IX_DocumentObjectReference_TableName_Document]
GO

CREATE NONCLUSTERED INDEX [IX_DocumentObjectReference_TableName_Document] ON [dbo].[DocumentObjectReference]
(
       [DocumentObjectRowPointer] ASC,
       [TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
