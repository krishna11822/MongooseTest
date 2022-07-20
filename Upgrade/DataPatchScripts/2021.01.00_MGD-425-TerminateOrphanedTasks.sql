update ActiveBGTasks
set LastActiveDate = dbo.GetSiteDate(getdate())
where TaskStatusCode = 'RUNNING'
and	LastActiveDate  is null 