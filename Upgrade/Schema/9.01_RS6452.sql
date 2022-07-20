-- RS6452: Progress & DB2 & Postgres Outrigger

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Allow new [IdoLinkedDatabase].[DatabaseType] of 2 to represent Progress OpenEdge, 3 to represent IBM DB2, and 4 to represent EnterpriseDB Postgres Plus Advanced Server
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'IdoLinkedDatabase')
AND EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_IdoLinkedDatabase_DbType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'))
      ALTER TABLE [dbo].[IdoLinkedDatabase] DROP
      CONSTRAINT [CK_IdoLinkedDatabase_DbType]

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'IdoLinkedDatabase')
AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_IdoLinkedDatabase_DbType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[IdoLinkedDatabase]'))
      ALTER TABLE [dbo].[IdoLinkedDatabase] ADD
      CONSTRAINT [CK_IdoLinkedDatabase_DbType] CHECK ([DatabaseType] = (4) Or [DatabaseType] = (3) Or [DatabaseType] = (2) Or [DatabaseType] = (1) Or [DatabaseType] = (0))

-- Allow new [OutriggerProfile].[DatabaseType] of 2 to represent Progress OpenEdge, 3 to represent IBM DB2, and 4 to represent EnterpriseDB Postgres Plus Advanced Server
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'OutriggerProfile')
AND EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_OutriggerProfile_DatabaseType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[OutriggerProfile]'))
      ALTER TABLE [dbo].[OutriggerProfile] DROP
      CONSTRAINT [CK_OutriggerProfile_DatabaseType]

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'OutriggerProfile')
AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_OutriggerProfile_DatabaseType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[OutriggerProfile]'))
      ALTER TABLE [dbo].[OutriggerProfile] ADD
      CONSTRAINT [CK_OutriggerProfile_DatabaseType] CHECK ([DatabaseType] = (4) Or [DatabaseType] = (3) Or [DatabaseType] = (2) Or [DatabaseType] = (1) Or [DatabaseType] = (0))

