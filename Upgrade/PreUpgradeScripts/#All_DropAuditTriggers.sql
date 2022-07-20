SET NOCOUNT ON
DECLARE @Severity INT = 0
DECLARE @ShowMessages BIT = 1
DECLARE @SQL NVARCHAR(MAX)
DECLARE @Trigger sysname
DECLARE @REMessage NVARCHAR(MAX)

--Drop Audit Triggers if present
--Upgrade\PostUpgradeScripts\All_RecreateAuditLogTriggers.sql will recreate them if AuditLogging Enabled
--IF EXISTS(SELECT 1 [dbo].[SystemProcessDefaults WHERE DefaultType = 35 AND DefaultValue = 1)

DECLARE AuditTriggerAuditLogTypeCrs CURSOR LOCAL STATIC READ_ONLY
FOR 
SELECT
 [name]
FROM sys.triggers
WHERE [name] LIKE '%InsAudit'
OR [name] LIKE '%UpdAudit'
OR [name] LIKE '%DelAudit'

OPEN AuditTriggerAuditLogTypeCrs

WHILE @Severity = 0
BEGIN --CURSOR LOOP

    FETCH AuditTriggerAuditLogTypeCrs INTO
	 @Trigger

    IF @@FETCH_STATUS = -1
        BREAK
	SET @SQL=N'DROP TRIGGER ' + @Trigger
	EXEC (@SQL)

    SET @REMessage=N'DISPLAY: ' + CONVERT(VARCHAR(10), GETDATE(), 101) + N' ' + LTRIM(RIGHT(CONVERT(CHAR(20), GETDATE(), 22), 11)) + N'   Drop Trigger ' +  QUOTENAME(@Trigger) IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT

END--CURSOR LOOP

CLOSE AuditTriggerAuditLogTypeCrs
DEALLOCATE AuditTriggerAuditLogTypeCrs
GO