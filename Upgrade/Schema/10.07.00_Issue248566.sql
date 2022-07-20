--Drop & add back WBSnapshot indexes if this is a partitioned db and they are not partitioned

IF EXISTS (select * from sys.partition_functions where name = 'SitePFunction')
BEGIN
	IF NOT EXISTS (select distinct object_name(t.object_id) as 'table', t.name
	from sys.partitions p
	inner join sys.indexes t
	on p.object_id = t.object_id
	where p.partition_number <> 1 and object_name(t.object_id) = 'WBSnapshot_mst')
	BEGIN
		IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WBSnapshot_mst]') AND name = N'[IX_WBSnapshot_mst_Category]')
		BEGIN
			DROP INDEX [IX_WBSnapshot_mst_Category] ON [dbo].[WBSnapshot_mst]
			CREATE NONCLUSTERED INDEX [IX_WBSnapshot_mst_Category] ON [dbo].[WBSnapshot_mst]
			(
				[Category] ASC,
				[SiteRef] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
		END
		IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WBSnapshot_mst]') AND name = N'[IX_WBSnapshot_mst_Description]')
		BEGIN
			DROP INDEX [IX_WBSnapshot_mst_Description] ON [dbo].[WBSnapshot_mst]
			CREATE NONCLUSTERED INDEX [IX_WBSnapshot_mst_Description] ON [dbo].[WBSnapshot_mst]
			(
				[Description] ASC,
				[SiteRef] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
		END
		IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WBSnapshot_mst]') AND name = N'[IX_WBSnapshot_mst_KPINum]')
		BEGIN
			DROP INDEX [IX_WBSnapshot_mst_KPINum] ON [dbo].[WBSnapshot_mst]
			CREATE NONCLUSTERED INDEX [IX_WBSnapshot_mst_KPINum] ON [dbo].[WBSnapshot_mst]
			(
				[KPINum] ASC,
				[Seq] ASC,
				[SiteRef] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
		END
		IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WBSnapshot_mst]') AND name = N'[IX_WBSnapshot_mst_ShortDescription]')
		BEGIN
			DROP INDEX [IX_WBSnapshot_mst_ShortDescription] ON [dbo].[WBSnapshot_mst]
			CREATE NONCLUSTERED INDEX [IX_WBSnapshot_mst_ShortDescription] ON [dbo].[WBSnapshot_mst]
			(
				[ShortDescription] ASC,
				[SiteRef] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
		END
		IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WBSnapshot_mst_RowPointer]') AND type = 'D')
		BEGIN
			ALTER TABLE [dbo].[WBSnapshot_mst] DROP CONSTRAINT [IX_WBSnapshot_mst_RowPointer]
			ALTER TABLE [dbo].[WBSnapshot_mst] ADD  CONSTRAINT [IX_WBSnapshot_mst_RowPointer] UNIQUE NONCLUSTERED 
			(
				[RowPointer] ASC,
				[SiteRef] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
		END
	END
END


