IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_parms_mst_site]') AND parent_object_id = OBJECT_ID(N'[dbo].[parms_mst]'))
ALTER TABLE [dbo].[parms_mst]  WITH NOCHECK ADD  CONSTRAINT [FK_parms_mst_site] FOREIGN KEY([site])
REFERENCES [site] ([site])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[parms_mst] CHECK CONSTRAINT [FK_parms_mst_site]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportOptions_mst_PrinterName]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportOptions_mst]'))
ALTER TABLE [dbo].[ReportOptions_mst]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportOptions_mst_PrinterName] FOREIGN KEY([PrinterName])
REFERENCES [Printer] ([PrinterName])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ReportOptions_mst] CHECK CONSTRAINT [FK_ReportOptions_mst_PrinterName]
GO

