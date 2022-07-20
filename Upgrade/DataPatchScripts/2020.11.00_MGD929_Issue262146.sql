-- Issue 262146 "LogMonitor service not logging in GovCloud"
-- Set initial value for LogMonitorPolicies table starting from 2019.05 version

IF NOT EXISTS (SELECT 1 FROM LogMonitorPolicies)
INSERT INTO LogMonitorPolicies (PolicyId, LogTypeFilter, LogRetentionDays, LogUntilDateTime)
VALUES (1,'Audit|Error|General|Performance|Security|SQL|Trace|UserDefined0|UserDefined1|UserDefined2|UserDefined3', 30, DATEADD(MINUTE, 30, SYSDATETIME()))
GO