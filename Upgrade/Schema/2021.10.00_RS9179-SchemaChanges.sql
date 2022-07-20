
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'LogMonitorPolicies' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'LogMonitorPolicies'
                 AND   COLUMN_NAME = 'IncludeSource' )
   ALTER TABLE dbo.LogMonitorPolicies
   ADD IncludeSource ListYesNoType NOT NULL CONSTRAINT [DF_IncludeSource]  DEFAULT ((0))
GO
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'LogMonitorPolicies' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'LogMonitorPolicies'
                 AND   COLUMN_NAME = 'IncludeText' )
   ALTER TABLE dbo.LogMonitorPolicies
   ADD IncludeText ListYesNoType NOT NULL CONSTRAINT [DF_IncludeText]  DEFAULT ((0))
GO
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'LogMonitorPolicies' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'LogMonitorPolicies'
                 AND   COLUMN_NAME = 'Active' )
   ALTER TABLE dbo.LogMonitorPolicies
   ADD Active ListYesNoType NOT NULL CONSTRAINT [DF_Active]  DEFAULT ((0))
GO
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'LogMonitorPolicies' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'LogMonitorPolicies'
                 AND   COLUMN_NAME = 'SiteCoordinatorPolicy' )
   ALTER TABLE dbo.LogMonitorPolicies
   ADD SiteCoordinatorPolicy ListYesNoType NOT NULL CONSTRAINT [DF_SiteCoordinatorPolicy]  DEFAULT ((0))
GO
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'LogMonitorPolicies' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'LogMonitorPolicies'
                 AND   COLUMN_NAME = 'FilterSequence' )
   ALTER TABLE dbo.LogMonitorPolicies
   ADD FilterSequence SmallIntType NOT NULL CONSTRAINT [DF_FilterSequence]  DEFAULT ((-1))
GO
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'LogMonitorPolicies' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'LogMonitorPolicies'
                 AND   COLUMN_NAME = 'PolicyExpiredInMinutes' )
   ALTER TABLE dbo.LogMonitorPolicies
   ADD PolicyExpiredInMinutes SmallIntType NOT NULL CONSTRAINT [DF_PolicyExpiredInMinutes]  DEFAULT ((-1))
GO
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'dbo'
			AND   TABLE_NAME = 'LogMonitorPolicies' )
AND NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = 'dbo'
                 AND   TABLE_NAME = 'LogMonitorPolicies'
                 AND   COLUMN_NAME = 'IncludeType' )
   ALTER TABLE dbo.LogMonitorPolicies
   ADD IncludeType ListYesNoType NOT NULL CONSTRAINT [DF_IncludeType]  DEFAULT ((0))
GO
BEGIN
   EXEC dbo.SchemaAdditionalTasksSp
     @PStartingTable = N'LogMonitorPolicies'
   , @PEndingTable = N'LogMonitorPolicies'
   , @Infobar = ''
   , @pModuleName = 'Core'
END

GO