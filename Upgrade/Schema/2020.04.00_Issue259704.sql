IF OBJECT_ID('DF_NotesSiteMap_CreateDate') IS NOT NULL
   ALTER TABLE dbo.NotesSiteMap DROP CONSTRAINT DF_NotesSiteMap_CreateDate
GO
ALTER TABLE dbo.NotesSiteMap ADD CONSTRAINT DF_NotesSiteMap_CreateDate DEFAULT GETDATE() FOR CreateDate
GO
IF OBJECT_ID('DF_NotesSiteMap_RecordDate') IS NOT NULL
   ALTER TABLE dbo.NotesSiteMap DROP CONSTRAINT DF_NotesSiteMap_RecordDate
GO
ALTER TABLE dbo.NotesSiteMap ADD CONSTRAINT DF_NotesSiteMap_RecordDate DEFAULT GETDATE() FOR RecordDate
GO
IF OBJECT_ID('DF_ReplicatedRows3_mst_CreateDate') IS NOT NULL
   ALTER TABLE dbo.ReplicatedRows3_mst DROP CONSTRAINT DF_ReplicatedRows3_mst_CreateDate
GO
ALTER TABLE dbo.ReplicatedRows3_mst ADD CONSTRAINT DF_ReplicatedRows3_mst_CreateDate DEFAULT GETDATE() FOR CreateDate
GO
IF OBJECT_ID('DF_ReusableNotesToSite_CreateDate') IS NOT NULL
   ALTER TABLE dbo.ReusableNotesToSite DROP CONSTRAINT DF_ReusableNotesToSite_CreateDate
GO
ALTER TABLE dbo.ReusableNotesToSite ADD CONSTRAINT DF_ReusableNotesToSite_CreateDate DEFAULT GETDATE() FOR CreateDate
GO
IF OBJECT_ID('DF_ReusableNotesToSite_RecordDate') IS NOT NULL
   ALTER TABLE dbo.ReusableNotesToSite DROP CONSTRAINT DF_ReusableNotesToSite_RecordDate
GO
ALTER TABLE dbo.ReusableNotesToSite ADD CONSTRAINT DF_ReusableNotesToSite_RecordDate DEFAULT GETDATE() FOR RecordDate
GO
