SET NOCOUNT ON

--Recreate AuditLog triggers dropped by
--Upgrade\PreUpgradeScripts\#All_DropAuditTriggers.sql

DECLARE @Severity INT = 0
DECLARE @TableName SYSNAME
DECLARE @REMessage NVARCHAR(MAX)
DECLARE @ShowMessages BIT = 1

IF EXISTS(SELECT 1 FROM [dbo].[SystemProcessDefaults] WHERE [DefaultType] = 35 AND [DefaultValue] = 1)
 BEGIN
	DECLARE AuditLogTypeCrs CURSOR LOCAL STATIC READ_ONLY
	FOR 
	SELECT DISTINCT
	 [MessageDesc]
	FROM [AuditLogTypes]
	WHERE [Category]=N'D'

	OPEN AuditLogTypeCrs

	WHILE @Severity = 0
	BEGIN --CURSOR LOOP

		FETCH AuditLogTypeCrs INTO
		 @TableName

		IF @@FETCH_STATUS = -1
			BREAK
		EXECUTE [dbo].[AuditLoggingGenCodeWrapperSp] @TableName

		SET @REMessage=N'DISPLAY: ' + CONVERT(VARCHAR(10), GETDATE(), 101) + N' ' + LTRIM(RIGHT(CONVERT(CHAR(20), GETDATE(), 22), 11)) + N'   Create Audit Trigger(s) for: ' +  QUOTENAME(@TableName) IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT
	END--CURSOR LOOP

	CLOSE AuditLogTypeCrs
	DEALLOCATE AuditLogTypeCrs
 END 
GO