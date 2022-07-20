IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[MessageTypes]'), N'IsUserTable') = 1
   IF EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[MtpMessageCodeUpr]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[MessageTypes]'))
      ALTER TABLE MessageTypes DROP
         CONSTRAINT MtpMessageCodeUpr

GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjectTypes]'), N'IsUserTable') = 1
   IF EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[OtyObjectCodeUpr]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[ObjectTypes]'))
      ALTER TABLE ObjectTypes DROP
         CONSTRAINT OtyObjectCodeUpr

GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[SystemProcessDefaults]'), N'IsUserTable') = 1
   IF EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[SydDefaultValueUpr]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[SystemProcessDefaults]'))
      ALTER TABLE SystemProcessDefaults DROP
         CONSTRAINT SydDefaultValueUpr

GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TaskTypes]'), N'IsUserTable') = 1
   IF EXISTS(SELECT 1 FROM sys.check_constraints
      WHERE object_ID = OBJECT_ID(N'[dbo].[TteTaskCodeUpr]')
      AND parent_object_ID  = OBJECT_ID(N'[dbo].[TaskTypes]'))
      ALTER TABLE TaskTypes DROP
         CONSTRAINT TteTaskCodeUpr

GO

