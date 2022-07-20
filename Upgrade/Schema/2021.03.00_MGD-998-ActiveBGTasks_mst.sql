SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE [object_id] = OBJECT_ID(N'[dbo].[ActiveBGTasks_mst]')
      AND [name] = N'IX_ActiveBGTasks_mst_Stat_Sch')
CREATE NONCLUSTERED INDEX IX_ActiveBGTasks_mst_Stat_Sch ON [dbo].[ActiveBGTasks_mst]
(
	[TaskStatusCode] ASC,
	[SchedEnabled] ASC,
	[SiteRef] ASC
)
INCLUDE (
   [NextStartDate],
	[SchedFreqType],
	[SchedStartDate]
   )
   ON [PRIMARY]
GO


