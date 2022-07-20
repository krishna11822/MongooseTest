IF NOT EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX_SubGroupMap_SubGroupId' AND object_id = OBJECT_ID('[dbo].[SubGroupMap]'))
BEGIN     
CREATE NONCLUSTERED INDEX [IX_SubGroupMap_SubGroupId] ON [dbo].[SubGroupMap] ( [SubGroupId] );
END