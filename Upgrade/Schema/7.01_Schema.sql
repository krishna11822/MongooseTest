
-- =======================
-- Issue118032.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplDocElement]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[ReplDocElement]')
      AND [name] = N'ExclusionPropertyName')
   ALTER TABLE [dbo].[ReplDocElement] ADD
      [ExclusionPropertyName] [dbo].[CollectionPropertyPathType] NULL
GO



-- =======================
-- Issue118439.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_COR_OUTBOX_ENTRY_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[COR_OUTBOX_ENTRY]'))
   ALTER TABLE [dbo].[COR_OUTBOX_ENTRY] ADD
   CONSTRAINT [IX_COR_OUTBOX_ENTRY_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_COR_OUTBOX_HEADERS_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[COR_OUTBOX_HEADERS]'))
   ALTER TABLE [dbo].[COR_OUTBOX_HEADERS] ADD
   CONSTRAINT [IX_COR_OUTBOX_HEADERS_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_COR_PROPERTY_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[COR_PROPERTY]'))
   ALTER TABLE [dbo].[COR_PROPERTY] ADD
   CONSTRAINT [IX_COR_PROPERTY_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_COR_INBOX_ENTRY_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[COR_INBOX_ENTRY]'))
   ALTER TABLE [dbo].[COR_INBOX_ENTRY] ADD
   CONSTRAINT [IX_COR_INBOX_ENTRY_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'IX_COR_INBOX_HEADERS_RowPointer'
   AND [xtype] = 'UQ' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[COR_INBOX_HEADERS]'))
   ALTER TABLE [dbo].[COR_INBOX_HEADERS] ADD
   CONSTRAINT [IX_COR_INBOX_HEADERS_RowPointer] UNIQUE
   (
      [RowPointer]
   )  WITH  FILLFACTOR = 90 ON [PRIMARY] 
GO



-- =======================
-- Issue121673.sql
-- =======================
IF OBJECT_ID(N'[dbo].[AppView]', N'U') IS NULL
   CREATE TABLE [dbo].[AppView] (
      [ViewName]  sysname NOT NULL 
    , [ViewCode]  [dbo].[VeryLongListType] NOT NULL 
    , [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
         CONSTRAINT [DF_AppView_NoteExistsFlag] DEFAULT ((0))
         CONSTRAINT [CK_AppView_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1))
    , [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_AppView_RecordDate] DEFAULT (getdate())
    , [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_AppView_RowPointer] DEFAULT (newid())
    , [CreatedBy]  [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_AppView_CreatedBy] DEFAULT (suser_sname())
    , [UpdatedBy]  [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_AppView_UpdatedBy] DEFAULT (suser_sname())
    , [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_AppView_CreateDate] DEFAULT (getdate())
    , [InWorkflow] [dbo].[FlagNyType] NOT NULL
         CONSTRAINT [DF_AppView_InWorkflow] DEFAULT ((0))
         CONSTRAINT [CK_AppView_InWorkflow] CHECK ([InWorkflow] IN (0,1))
    , CONSTRAINT [PK_AppView] PRIMARY KEY CLUSTERED (ViewName)
    , CONSTRAINT [IX_AppView_RowPointer] UNIQUE NONCLUSTERED (RowPointer)
   ) ON [PRIMARY]
GO

-- =======================
-- Issue121827.sql
-- =======================
IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'FullObjectPathType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[FullObjectPathType] FROM [nvarchar](max) NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplDocOutbound]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'KeyListSource' 
   AND OBJECT_NAME(id) = N'ReplDocOutbound')
   ALTER TABLE [dbo].[ReplDocOutbound]
      ALTER COLUMN [KeyListSource] [dbo].[FullObjectPathType] NULL
GO


-- =======================
-- Issue121960.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplDocOutbound]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[ReplDocOutbound]')
      AND [name] = N'LastManualPublishDate')
   ALTER TABLE [dbo].[ReplDocOutbound] ADD 
      [LastManualPublishDate] [dbo].[DateTimeType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplDocOutbound]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[ReplDocOutbound]')
      AND [name] = N'EligibleForBackgroundManualRequest')
   ALTER TABLE [dbo].[ReplDocOutbound] ADD 
      [EligibleForBackgroundManualRequest] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_ReplDocOutbound_EligibleForBackgroundManualRequest] DEFAULT ((0))
         CONSTRAINT [CK_ReplDocOutbound_EligibleForBackgroundManualRequest] CHECK ([EligibleForBackgroundManualRequest] IN (0,1))
GO



-- =======================
-- Issue123010.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'SMTPEnableSSL')
   ALTER TABLE [dbo].[intranet] ADD
      [SMTPEnableSSL] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_intranet_SMTPEnableSSL] DEFAULT ((0))
         CONSTRAINT [CK_intranet_SMTPEnableSSL] CHECK ([SMTPEnableSSL]=(1) OR [SMTPEnableSSL]=(0))
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
    WHERE st.name = N'SMTPDeliveryMethodType' AND ss.name = N'dbo')
    CREATE TYPE [dbo].[SMTPDeliveryMethodType] FROM [nchar](1) NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'SMTPDeliveryMethod')
   ALTER TABLE [dbo].[intranet] ADD
      [SMTPDeliveryMethod] [dbo].[SMTPDeliveryMethodType] NOT NULL
         CONSTRAINT [DF_intranet_SMTPDeliveryMethod] DEFAULT (('I'))
         -- IIS (Default) Pickup Directory, Network, or Specified Pickup Directory
         CONSTRAINT [CK_intranet_SMTPDeliveryMethod] CHECK ([SMTPDeliveryMethod]=('I') OR [SMTPDeliveryMethod]=('N') OR [SMTPDeliveryMethod]=('S'))
GO

-- Note: SMTPEnableSSL can be true only if [SMTPDeliveryMethod] = 'N'

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'SMTPPickupDirectory')
   ALTER TABLE [dbo].[intranet] ADD
      [SMTPPickupDirectory] [dbo].[OSLocationType] NULL
GO

-- Note: SMTPPickupDirectory is relevant only if [SMTPDeliveryMethod] = 'S'

-- =======================
-- Issue124103.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventOutputParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventOutputParameter')
ALTER TABLE [dbo].[EventOutputParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTriggerParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventTriggerParameter')
ALTER TABLE [dbo].[EventTriggerParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventGlobalConstant]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventGlobalConstant')
ALTER TABLE [dbo].[EventGlobalConstant]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessageVariable]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventMessageVariable')
ALTER TABLE [dbo].[EventMessageVariable]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventVariable]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventVariable')
ALTER TABLE [dbo].[EventVariable]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventParameter')
ALTER TABLE [dbo].[EventParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventInitialVariable]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventInitialVariable')
ALTER TABLE [dbo].[EventInitialVariable]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventInputParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventInputParameter')
ALTER TABLE [dbo].[EventInputParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

-- =======================
-- Issue124651.sql
-- =======================
IF OBJECT_ID(N'[dbo].[UserTask]', N'U') IS NULL
CREATE TABLE [dbo].[UserTask] (
   [UserId] [dbo].[TokenType] NOT NULL,
   [TaskName] [dbo].[MessageSubjectType] NOT NULL, 
   [RemindDateTime] [dbo].[DateTimeType] NULL,
   [TaskDescription] [dbo].[NoteType] NULL,
   [DeleteAfterReminder] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_UserTask_DeleteAfterReminder] DEFAULT (0)
      CONSTRAINT [CK_UserTask_DeleteAfterReminder] CHECK ([DeleteAfterReminder]=(1) OR [DeleteAfterReminder]=(0)),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_UserTask_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_UserTask_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_UserTask_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_UserTask_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_UserTask_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_UserTask_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_UserTask_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_UserTask_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_UserTask_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0)),
   CONSTRAINT [PK_UserTask] PRIMARY KEY  CLUSTERED 
   (
      [UserId]
   ,  [TaskName]
   ), 
   CONSTRAINT [IX_UserTask_RowPointer] UNIQUE  NONCLUSTERED 
   (
      [RowPointer]
   ),
)
GO

-- =======================
-- Issue124879.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTrigger]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'ConfigurationName' 
   AND OBJECT_NAME(id) = N'EventTrigger')
   ALTER TABLE [dbo].[EventTrigger] 
      ALTER COLUMN [ConfigurationName] [dbo].[ConfigurationNameType] NULL
GO
UPDATE [dbo].[EventTrigger]
SET ConfigurationName = NULL
WHERE ConfigurationName = N'CURRENT_CONFIG'
GO


-- =======================
-- Issue124918.sql
-- =======================
-- User Defined Data Types
IF NOT EXISTS (SELECT 1 FROM systypes WHERE name = 'BusinessRoleType')
   CREATE TYPE [BusinessRoleType] FROM nvarchar(40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM systypes WHERE name = 'ProcessFlowType')
   CREATE TYPE [ProcessFlowType] FROM nvarchar(40) NULL
GO

IF NOT EXISTS (SELECT 1 FROM systypes WHERE name = 'XMLStringType')
   CREATE TYPE [XMLStringType] FROM nvarchar(max) NULL
GO

-- New Table for Business Process Flows
IF OBJECT_ID(N'[dbo].[BusinessProcessFlow]', N'U') IS NULL
CREATE TABLE [dbo].[BusinessProcessFlow](
   [BusinessRole] [dbo].[BusinessRoleType] NOT NULL,
   [ProcessFlow] [dbo].[ProcessFlowType] NOT NULL,
   [FlowDiagram] [dbo].[XMLStringType] NULL,
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_BusinessProcessFlow_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_BusinessProcessFlow_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_BusinessProcessFlow_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL  
      CONSTRAINT [DF_BusinessProcessFlow_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_BusinessProcessFlow_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_BusinessProcessFlow_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_BusinessProcessFlow_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_BusinessProcessFlow_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_BusinessProcessFlow_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_BusinessProcessFlow] PRIMARY KEY CLUSTERED
   (
      [BusinessRole]
    , [ProcessFlow]
   ) ON [PRIMARY],
   CONSTRAINT [IX_BusinessProcessFlow_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) ON [PRIMARY],
) ON [PRIMARY]
GO

-- =======================
-- Issue124987.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'SendEmailPrompts')
   ALTER TABLE [dbo].[UserNames] ADD
      [SendEmailPrompts] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_UserNames_SendEmailPrompts] DEFAULT ((0))
         CONSTRAINT [CK_UserNames_SendEmailPrompts] CHECK ([SendEmailPrompts] IN (0,1))
GO


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'LanguageCode')
   ALTER TABLE [dbo].[UserNames] ADD
      [LanguageCode] [dbo].[LangCodeType] NULL
GO

-- =======================
-- Issue124987b.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventHandlerState]')
      AND [name] = N'RestartCurrentAction')
   ALTER TABLE [dbo].[EventHandlerState] ADD
      [RestartCurrentAction] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_EventHandlerState_RestartCurrentAction] DEFAULT ((0))
         CONSTRAINT [CK_EventHandlerState_RestartCurrentAction] CHECK ([RestartCurrentAction] IN (0,1))
GO


-- =======================
-- Issue128492.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[sysobjects]
WHERE [name]= N'CK_EventActionState_PayloadOneNonDefault'
AND [xtype] = 'C' 
AND [parent_obj] = OBJECT_ID(N'[dbo].[EventActionState]'))
ALTER TABLE [dbo].[EventActionState]
   DROP CONSTRAINT [CK_EventActionState_PayloadOneNonDefault]
GO



IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
AND NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
WHERE [name]= N'CK_EventActionState_PayloadOneNonDefault'
AND [xtype] = 'C' 
AND [parent_obj] = OBJECT_ID(N'[dbo].[EventActionState]'))
ALTER TABLE [dbo].[EventActionState]
   ADD CONSTRAINT [CK_EventActionState_PayloadOneNonDefault] CHECK (
(ISNULL([PayloadAccess], N'D') = N'D') OR
(ISNULL([PayloadAccess], N'D') <> N'D' 
  AND ISNULL ([UnmodifiedPayloadAccess], N'D') = N'D' AND ISNULL ([ModifiedPayloadAccess], N'D') = N'D') )
GO



-- =======================
-- Issue128961.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBMessageId2Type' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBMessageId2Type] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBLogicalIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBLogicalIdType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBNounNameType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBNounNameType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBAccountingEntityIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBAccountingEntityIdType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBLocationIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBLocationIdType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBVariationIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBVariationIdType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBRevisionIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBRevisionIdType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBNounIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBNounIdType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBSystemIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBSystemIdType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBDrillbackLidType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBDrillbackLidType] FROM [NVARCHAR](250) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ESBAgencyRoleType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ESBAgencyRoleType] FROM [NVARCHAR](250) NULL
GO

IF OBJECT_ID(N'[dbo].[ESB_INBOUND_DUPLICATE]') IS NULL
CREATE TABLE [dbo].[ESB_INBOUND_DUPLICATE] (
   [C_ID] [dbo].[ESBMessageIdType] NOT NULL IDENTITY(1,1),
   [C_MESSAGE_ID] [dbo].[ESBMessageId2Type] NOT NULL,
   [C_CREATED_DATE_TIME] [dbo].[CurrentDateType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ESB_INBOUND_DUPLICATE_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ESB_INBOUND_DUPLICATE_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ESB_INBOUND_DUPLICATE_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ESB_INBOUND_DUPLICATE_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ESB_INBOUND_DUPLICATE_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ESB_INBOUND_DUPLICATE_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_ESB_INBOUND_DUPLICATE_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ESB_INBOUND_DUPLICATE_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ESB_INBOUND_DUPLICATE_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ESB_INBOUND_DUPLICATE] PRIMARY KEY CLUSTERED
   (
      [C_ID]
   ) ON [PRIMARY],
   CONSTRAINT [IX_ESB_INBOUND_DUPLICATE_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_INBOUND_DUPLICATE]')
   AND   [name] = N'IX_ESB_INBOUND_DUPLICATE_TIMESTAMP'
   )
   DROP INDEX [dbo].[ESB_INBOUND_DUPLICATE].[IX_ESB_INBOUND_DUPLICATE_TIMESTAMP]
GO
CREATE INDEX [IX_ESB_INBOUND_DUPLICATE_TIMESTAMP] ON [dbo].[ESB_INBOUND_DUPLICATE] (C_CREATED_DATE_TIME)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_INBOUND_DUPLICATE]')
   AND   [name] = N'IX_ESB_INBOUND_DUPLICATE_C_MESSAGE_ID'
   )
   DROP INDEX [dbo].[ESB_INBOUND_DUPLICATE].[IX_ESB_INBOUND_DUPLICATE_C_MESSAGE_ID]
GO
CREATE INDEX [IX_ESB_INBOUND_DUPLICATE_C_MESSAGE_ID] ON [dbo].[ESB_INBOUND_DUPLICATE] (C_MESSAGE_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]') IS NULL
CREATE TABLE [dbo].[ESB_VARIATION_ID_MEDIATION] (
   [C_ID] [dbo].[ESBMessageIdType] NOT NULL IDENTITY(1,1),
   [C_LOGICAL_ID] [dbo].[ESBLogicalIdType] NOT NULL,
   [C_NOUN_NAME] [dbo].[ESBNounNameType] NOT NULL,
   [C_TENANT_ID] [dbo].[ESBTenantIdType] NOT NULL,
   [C_ACCOUNTING_ENTITY_ID] [dbo].[ESBAccountingEntityIdType] NULL,
   [C_LOCATION_ID] [dbo].[ESBLocationIdType] NULL,
   [C_VARIATION_ID] [dbo].[ESBVariationIdType] NULL,
   [C_REVISION_ID] [dbo].[ESBRevisionIdType] NULL,
   [C_NOUN_ID] [dbo].[ESBNounIdType] NOT NULL,
   [C_SYSTEM_ID] [dbo].[ESBSystemIdType] NULL,
   [C_DRILLBACK_LID] [dbo].[ESBDrillbackLidType] NULL,
   [C_AGENCY_ROLE] [dbo].[ESBAgencyRoleType] NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ESB_VARIATION_ID_MEDIATION_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ESB_VARIATION_ID_MEDIATION_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ESB_VARIATION_ID_MEDIATION_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ESB_VARIATION_ID_MEDIATION_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ESB_VARIATION_ID_MEDIATION_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ESB_VARIATION_ID_MEDIATION_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_ESB_VARIATION_ID_MEDIATION_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ESB_VARIATION_ID_MEDIATION_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ESB_VARIATION_ID_MEDIATION_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ESB_VARIATION_ID_MEDIATION] PRIMARY KEY CLUSTERED
   (
      [C_ID]
   ) ON [PRIMARY],
   CONSTRAINT [IX_ESB_VARIATION_ID_MEDIATION_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) ON [PRIMARY]         
) ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_LOGICAL_ID'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_LOGICAL_ID]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_LOGICAL_ID] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_LOGICAL_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_NOUN_ID'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_NOUN_ID]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_NOUN_ID] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_NOUN_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_TENANT_ID'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_TENANT_ID]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_TENANT_ID] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_TENANT_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_SYSTEM_ID'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_SYSTEM_ID]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_SYSTEM_ID] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_SYSTEM_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_NOUN_NAME'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_NOUN_NAME]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_NOUN_NAME] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_NOUN_NAME)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_LOCATION_ID'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_LOCATION_ID]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_LOCATION_ID] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_LOCATION_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_REVISION_ID'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_REVISION_ID]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_REVISION_ID] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_REVISION_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_ACCOUNTING_ENTITY_ID'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_ACCOUNTING_ENTITY_ID]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_ACCOUNTING_ENTITY_ID] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_ACCOUNTING_ENTITY_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_VARIATION_ID_MEDIATION]')
   AND   [name] = N'IX_ESB_VARIATION_ID_MEDIATION_C_AGENCY_ROLE'
   )
   DROP INDEX [dbo].[ESB_VARIATION_ID_MEDIATION].[IX_ESB_VARIATION_ID_MEDIATION_C_AGENCY_ROLE]
GO
CREATE INDEX [IX_ESB_VARIATION_ID_MEDIATION_C_AGENCY_ROLE] ON [dbo].[ESB_VARIATION_ID_MEDIATION](C_AGENCY_ROLE)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]') IS NULL
CREATE TABLE [dbo].[ESB_PREVIOUS_VERSION_MEDIATION] (
   [C_ID] [dbo].[ESBMessageIdType] NOT NULL IDENTITY(1,1),
   [C_LOGICAL_ID] [dbo].[ESBLogicalIdType] NOT NULL,
   [C_NOUN_NAME] [dbo].[ESBNounNameType] NOT NULL,
   [C_TENANT_ID] [dbo].[ESBTenantIdType] NOT NULL,
   [C_ACCOUNTING_ENTITY_ID] [dbo].[ESBAccountingEntityIdType] NULL,
   [C_LOCATION_ID] [dbo].[ESBLocationIdType] NULL,
   [C_VARIATION_ID] [dbo].[ESBVariationIdType] NULL,
   [C_REVISION_ID] [dbo].[ESBRevisionIdType] NULL,
   [C_NOUN_ID] [dbo].[ESBNounIdType] NOT NULL,
   [C_XML] [dbo].[ESBMessageXMLType] NULL,
   [C_AGENCY_ROLE] [dbo].[ESBAgencyRoleType] NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ESB_PREVIOUS_VERSION_MEDIATION_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ESB_PREVIOUS_VERSION_MEDIATION_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ESB_PREVIOUS_VERSION_MEDIATION_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_ESB_PREVIOUS_VERSION_MEDIATION_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ESB_PREVIOUS_VERSION_MEDIATION_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_ESB_PREVIOUS_VERSION_MEDIATION_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_ESB_PREVIOUS_VERSION_MEDIATION_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_ESB_PREVIOUS_VERSION_MEDIATION_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ESB_PREVIOUS_VERSION_MEDIATION_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ESB_PREVIOUS_VERSION_MEDIATION] PRIMARY KEY CLUSTERED
   (
      [C_ID]
   ) ON [PRIMARY],
   CONSTRAINT [IX_ESB_PREVIOUS_VERSION_MEDIATION_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) ON [PRIMARY]         
) ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_LOGICAL_ID'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_LOGICAL_ID]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_LOGICAL_ID] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_LOGICAL_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_NOUN_ID'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_NOUN_ID]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_NOUN_ID] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_NOUN_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_TENANT_ID'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_TENANT_ID]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_TENANT_ID] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_TENANT_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_NOUN_NAME'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_NOUN_NAME]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_NOUN_NAME] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_NOUN_NAME)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_LOCATION_ID'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_LOCATION_ID]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_LOCATION_ID] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_LOCATION_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_REVISION_ID'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_REVISION_ID]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_REVISION_ID] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_REVISION_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_ACCOUNTING_ENTITY_ID'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_ACCOUNTING_ENTITY_ID]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_ACCOUNTING_ENTITY_ID] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_ACCOUNTING_ENTITY_ID)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ESB_PREVIOUS_VERSION_MEDIATION]')
   AND   [name] = N'IX_ESB_PREVIOUS_VERSION_MEDIATION_C_AGENCY_ROLE'
   )
   DROP INDEX [dbo].[ESB_PREVIOUS_VERSION_MEDIATION].[IX_ESB_PREVIOUS_VERSION_MEDIATION_C_AGENCY_ROLE]
GO
CREATE INDEX [IX_ESB_PREVIOUS_VERSION_MEDIATION_C_AGENCY_ROLE] ON [dbo].[ESB_PREVIOUS_VERSION_MEDIATION](C_AGENCY_ROLE)
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

-- =======================
-- Issue131549_RS4504.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplDocOutbound]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[ReplDocOutbound]')
      AND [name] = N'intranet_name')
   ALTER TABLE [dbo].ReplDocOutbound ADD
      [intranet_name] [dbo].[IntranetNameType] NULL
GO
IF EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name] = N'IX_ReplDocOutbound_AppliesToIDOName'
   AND [xtype] = 'UQ'
   AND [parent_obj] = OBJECT_ID(N'[dbo].[ReplDocOutbound]'))
   ALTER TABLE [dbo].[ReplDocOutbound] DROP CONSTRAINT [IX_ReplDocOutbound_AppliesToIDOName]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ReplDocOutbound]'), N'IsUserTable') = 1
   ALTER TABLE [dbo].[ReplDocOutbound] ADD CONSTRAINT [IX_ReplDocOutbound_AppliesToIDOName] UNIQUE CLUSTERED
   (
      AppliesToIDOName
    , AppliesToIDOMethodName
    , AppliesToIDOAction
    , intranet_name
   ) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO


-- =======================
-- Issue132368_RS4773.sql
-- =======================
-- =======================
-- RS4773.sql
-- =======================

IF OBJECT_ID(N'[dbo].[BusinessProcessFlow]') IS NOT NULL 
   AND OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BusinessProcessFlow]'), N'IsUserTable') = 1
   DROP TABLE [dbo].[BusinessProcessFlow]
GO


-- =======================
-- Issue136602.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventOutputParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventOutputParameter')
ALTER TABLE [dbo].[EventOutputParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTriggerParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventTriggerParameter')
ALTER TABLE [dbo].[EventTriggerParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventGlobalConstant]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventGlobalConstant')
ALTER TABLE [dbo].[EventGlobalConstant]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessageVariable]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventMessageVariable')
ALTER TABLE [dbo].[EventMessageVariable]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventVariable]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventVariable')
ALTER TABLE [dbo].[EventVariable]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventParameter')
ALTER TABLE [dbo].[EventParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventInitialVariable]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventInitialVariable')
ALTER TABLE [dbo].[EventInitialVariable]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventInputParameter]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'Value' 
   AND OBJECT_NAME(id) = N'EventInputParameter')
ALTER TABLE [dbo].[EventInputParameter]
  ALTER COLUMN [Value] [dbo].[EventVariableValueType] NULL
GO

-- =======================
-- Issue137991.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[PublicationSubscriber]')
   AND   [name] = N'IX_PublicationSubscriber_PublicationName')
   DROP INDEX [dbo].[PublicationSubscriber].[IX_PublicationSubscriber_PublicationName]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   CREATE CLUSTERED INDEX [IX_PublicationSubscriber_PublicationName] ON [dbo].[PublicationSubscriber]
   (
      PublicationName
     ,	[Username]
   ) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO


-- =======================
-- Issue142889_RS5310.sql
-- =======================
-- Modify Table: EventMessage
-- Add Column: EventStateId
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessage]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventMessage]')
      AND [name] = N'EventStateId')
ALTER TABLE [dbo].[EventMessage] ADD
   [EventStateId] [dbo].[RowPointerType] NULL
GO

-- Modify Table: EventDocumentObject
-- Add Column: EventStateId
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventDocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventDocumentObject]')
      AND [name] = N'EventStateId')
BEGIN
   -- Add the new key column, as Nullable because we don't have a Default value:
   ALTER TABLE [dbo].[EventDocumentObject] ADD
      [EventStateId] [dbo].[RowPointerType] NULL

   -- Populate the new key column:
   EXEC sp_executesql N'
   UPDATE edoc
   SET EventStateId = es.RowPointer
   FROM EventState es
   INNER JOIN DocumentObjectReference edocref
      ON edocref.TableName = N''EventState''
      AND edocref.TableRowPointer = es.RowPointer
   INNER JOIN EventDocumentObject edoc
      ON edoc.RowPointer = edocref.DocumentObjectRowPointer
   '
   
   -- Allow wiping out any existing rows that we didn't hit (see EventDocumentObjectDel):
   EXEC sp_executesql N'
   DELETE edocref
   FROM DocumentObjectReference edocref
   WHERE edocref.DocumentObjectRowPointer IN (SELECT RowPointer FROM EventDocumentObject
      WHERE EventStateId IS NULL)
   '

   -- Wipe out any existing rows that we didn't hit (maybe the EventState row went away?):
   EXEC sp_executesql N'
   DELETE
   FROM EventDocumentObject
   WHERE EventStateId IS NULL
   '

   -- Set the new key column as non-Nullable:   
   ALTER TABLE [dbo].[EventDocumentObject] ALTER COLUMN
      [EventStateId] [dbo].[RowPointerType] NOT NULL

   -- Drop the old Primary Key:
   ALTER TABLE [dbo].[EventDocumentObject] DROP
      CONSTRAINT [PK_EventDocumentObject]
   
   -- Add the new Primary Key, leading with the new key column:
   ALTER TABLE [dbo].[EventDocumentObject] ADD
   CONSTRAINT [PK_EventDocumentObject] PRIMARY KEY CLUSTERED
   (
      [EventStateId] ASC,
      [DocumentName] ASC,
      [Sequence] ASC
   )

   -- Create a new index to simulate the old PK, for DocumentObjectAndRefViewPreInsert:
   CREATE NONCLUSTERED INDEX [IX_EventDocumentObject_Document] ON [dbo].[EventDocumentObject] 
   (
      [DocumentName] ASC,
      [Sequence] ASC
   )
END
GO

-- Modify Table: DocumentObjectReference
-- Add Index: (TableName, DocumentObjectRowPointer) for EventDiscardAttachmentsSp:
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObjectReference]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[DocumentObjectReference]')
   AND   [name] = N'IX_DocumentObjectReference_TableName_Document')
   DROP INDEX [dbo].[DocumentObjectReference].[IX_DocumentObjectReference_TableName_Document]
GO
CREATE NONCLUSTERED INDEX [IX_DocumentObjectReference_TableName_Document] ON [dbo].[DocumentObjectReference] 
(
      [TableName] ASC,
      [DocumentObjectRowPointer] ASC
)
GO

-- Modify Table: EventMessage
-- Add Index: (EventStateId) for EventMessageDel:
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessage]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[EventMessage]')
   AND   [name] = N'IX_EventMessage_EventStateId')
   DROP INDEX [dbo].[EventMessage].[IX_EventMessage_EventStateId]
GO
CREATE NONCLUSTERED INDEX [IX_EventMessage_EventStateId] ON [dbo].[EventMessage] 
(
      [EventStateId] ASC
)
GO


-- =======================
-- RS4246.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'PasswordHistoryCountType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[PasswordHistoryCountType] FROM TINYINT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PasswordParameters]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[PasswordParameters]')
      AND [name] = N'PasswordHistoryCount')
   ALTER TABLE [dbo].[PasswordParameters] ADD
      [PasswordHistoryCount] [dbo].[PasswordHistoryCountType] NOT NULL
         CONSTRAINT [DF_PasswordParameters_PasswordHistoryCount] DEFAULT (0)
         CONSTRAINT [CK_PasswordParameters_PasswordHistoryCount] CHECK ([PasswordHistoryCount] >= 0 AND [PasswordHistoryCount] <= 30)
GO

IF NOT EXISTS (SELECT 1 from sys.tables WHERE name = N'UserPasswordHistory')
CREATE TABLE [UserPasswordHistory] (
   [Username] [UsernameType] NOT NULL,
   [PasswordAgeCount] [PasswordHistoryCountType] NOT NULL,
   [UserPassword] EncryptedClientPasswordType NOT NULL,
   [NoteExistsFlag] [FlagNyType] NOT NULL
      CONSTRAINT [DF_UserPasswordHistory_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_UserPasswordHistory_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
   [CreatedBy] [UsernameType] NOT NULL
      CONSTRAINT [DF_UserPasswordHistory_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [UsernameType] NOT NULL
      CONSTRAINT [DF_UserPasswordHistory_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [CurrentDateType] NOT NULL
      CONSTRAINT [DF_UserPasswordHistory_CreateDate] DEFAULT (getdate()),
   [RecordDate] [CurrentDateType] NOT NULL
      CONSTRAINT [DF_UserPasswordHistory_RecordDate] DEFAULT (getdate()),
   [RowPointer] [RowPointerType] NOT NULL
      CONSTRAINT [DF_UserPasswordHistory_RowPointer] DEFAULT (newid()),
   [InWorkflow] [FlagNyType] NOT NULL
      CONSTRAINT [DF_UserPasswordHistory_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_UserPasswordHistory_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0)),
   CONSTRAINT [PK_UserPasswordHistory] PRIMARY KEY  CLUSTERED
   (
      [Username],
      [PasswordAgeCount]
   )  ON [PRIMARY],
   CONSTRAINT [IX_UserPasswordHistory_RowPointer] UNIQUE  NONCLUSTERED
   (
      [RowPointer]
   )  ON [PRIMARY]
) ON [PRIMARY]
GO

-- =======================
-- RS4323.sql
-- =======================
-- Add column ActiveBGTasks.ReportType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveBGTasks]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[ActiveBGTasks]')
      AND [name] = N'ReportType')
   ALTER TABLE [dbo].[ActiveBGTasks] ADD
      [ReportType] [dbo].[BGTaskReportTypeType] NULL
GO

-- Add column BGTaskDefinitions.ReportType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskDefinitions]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[BGTaskDefinitions]')
      AND [name] = N'ReportType')
   ALTER TABLE [dbo].[BGTaskDefinitions] ADD
      [ReportType] [dbo].[BGTaskReportTypeType] NULL
GO

-- Add column BGTaskHistory.ReportType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[BGTaskHistory]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[BGTaskHistory]')
      AND [name] = N'ReportType')
   ALTER TABLE [dbo].[BGTaskHistory] ADD
      [ReportType] [dbo].[BGTaskReportTypeType] NULL
GO

-- Add column intranet.ReportServerURL
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'ReportServerURL')
   ALTER TABLE [dbo].[intranet] ADD
      [ReportServerURL] [dbo].[URLType] NULL
GO

-- Add column intranet.ReportFolder
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'ReportFolder')
   ALTER TABLE [dbo].[intranet] ADD
      [ReportFolder] [dbo].[OSLocationType] NULL
GO

-- Drop column intranet.DefaultBGReportType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'DefaultBGReportType')
   ALTER TABLE [dbo].[intranet] DROP COLUMN [DefaultBGReportType]
GO

-- Drop the IntranetReports table.
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IntranetReports]'), N'IsUserTable') = 1
   DROP TABLE [dbo].[IntranetReports]
GO

-- Drop the OutputFormats table.
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[OutputFormats]'), N'IsUserTable') = 1
   DROP TABLE [dbo].[OutputFormats]
GO

-- =======================
-- RS4323_ReportServerDeploymentMode.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'ReportServerDeploymentModeType'AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ReportServerDeploymentModeType] FROM [nchar](1) NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[intranet]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[intranet]')
      AND [name] = N'ReportServerDeploymentMode')
   ALTER TABLE [dbo].[intranet] ADD
      [ReportServerDeploymentMode] [dbo].[ReportServerDeploymentModeType] NOT NULL
      CONSTRAINT [DF_intranet_ReportServerDeploymentMode] DEFAULT ((N'N'))
      CONSTRAINT [CK_intranet_ReportServerDeploymentMode] CHECK ([ReportServerDeploymentMode] IN (N'N',N'S'))
      --'N': Native; 'S': SharePoint Integrated 
GO


-- =======================
-- RS4409.sql
-- =======================
IF OBJECT_ID(N'[dbo].[UserCalendar]', N'U') IS NULL
CREATE TABLE [dbo].[UserCalendar] (
   [UserId]                [dbo].[TokenType]          NOT NULL,
   [AppointmentName]       [dbo].[MessageSubjectType] NULL, 
   [AppointmentLocation]   [dbo].[MessageSubjectType] NULL,
   [AppointmentDescription][dbo].[NoteType] NULL,
   [StartTime]             [dbo].[DateTimeType]    NOT NULL
      CONSTRAINT [DF_UserCalendar_StartTime]           DEFAULT (getdate()),
   [EndTime]               [dbo].[DateTimeType]    NOT NULL
      CONSTRAINT [DF_UserCalendar_EndTime]             DEFAULT (getdate()),
   [RemindDateTime]        [dbo].[DateTimeType]    NULL
      CONSTRAINT [DF_UserCalendar_RemindDateTime]      DEFAULT (getdate()),
   [DeleteAfterReminder]   [dbo].[ListYesNoType]   NOT NULL
      CONSTRAINT [DF_UserCalendar_DeleteAfterReminder] DEFAULT (0)
      CONSTRAINT [CK_UserCalendar_DeleteAfterReminder] CHECK ([DeleteAfterReminder]=(1) OR [DeleteAfterReminder]=(0)),
   [NoteExistsFlag]        [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_UserCalendar_NoteExistsFlag]      DEFAULT ((0))
      CONSTRAINT [CK_UserCalendar_NoteExistsFlag]      CHECK   ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
   [CreatedBy]             [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_UserCalendar_CreatedBy]           DEFAULT (suser_sname()),
   [UpdatedBy]             [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_UserCalendar_UpdatedBy]           DEFAULT (suser_sname()),
   [CreateDate]            [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_UserCalendar_CreateDate]          DEFAULT (getdate()),
   [RecordDate]            [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_UserCalendar_RecordDate]          DEFAULT (getdate()),
   [RowPointer]            [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_UserCalendar_RowPointer]          DEFAULT (newid()),
   [InWorkflow]            [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_UserCalendar_InWorkflow]          DEFAULT ((0))
      CONSTRAINT [CK_UserCalendar_InWorkflow]          CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0)),
   CONSTRAINT [PK_UserCalendar] PRIMARY KEY  CLUSTERED 
   (
      [RowPointer]
   ), 
   CONSTRAINT [IX_UserCalendar] UNIQUE  NONCLUSTERED 
   (
      [UserId]
   ,  [AppointmentName]
   ,  [StartTime]
   ,  [EndTime]
   ),
   CONSTRAINT [CK_UserCalendar_RemindDateTime] CHECK ([RemindDateTime] <= [StartTime]),
   CONSTRAINT [CK_UserCalendar_EndTime] CHECK ([EndTime] >= [StartTime])
)
GO

-- =======================
-- RS4416.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventAction]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventAction]')
      AND [name] = N'Description')
   ALTER TABLE [dbo].[EventAction] ADD
      [Description] [dbo].[DescriptionType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventHandler]')
      AND [name] = N'Description')
   ALTER TABLE [dbo].[EventHandler] ADD
      [Description] [dbo].[DescriptionType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandlerRevision]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventHandlerRevision]')
      AND [name] = N'Description')
   ALTER TABLE [dbo].[EventHandlerRevision] ADD
      [Description] [dbo].[DescriptionType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TmpEventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[TmpEventHandler]')
      AND [name] = N'Description')
   ALTER TABLE [dbo].[TmpEventHandler] ADD
      [Description] [dbo].[DescriptionType] NULL
GO


-- =======================
-- RS4441.sql
-- =======================
-- Add a new skip_method column for req set 4441.
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[rep_object_category]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[rep_object_category]')
      AND [name] = N'skip_method')
   ALTER TABLE [dbo].[rep_object_category] ADD
      [skip_method] [dbo].[ListYesNoType] 
         CONSTRAINT [DF_rep_object_category_skip_method] DEFAULT 0
         CONSTRAINT [CK_rep_object_category_skip_method] CHECK (skip_method IN (0,1)) NOT NULL 
GO


-- =======================
-- RS4455.sql
-- =======================
/******  Create UDDT ******/
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
    WHERE st.name = N'MessageCategoryType' AND ss.name = N'dbo')
    CREATE TYPE [dbo].[MessageCategoryType] FROM nvarchar(30) NULL
GO

/******  Create Table ******/

IF OBJECT_ID(N'[dbo].[EventMessageCategory]', N'U') IS NULL
CREATE TABLE [dbo].[EventMessageCategory] (
   [Category] [dbo].[MessageCategoryType] NOT NULL ,
   [Description] [dbo].[DescriptionType] NULL ,
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_EventMessageCategory_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_EventMessageCategory_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_EventMessageCategory_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL  
      CONSTRAINT [DF_EventMessageCategory_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_EventMessageCategory_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_EventMessageCategory_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_EventMessageCategory_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_EventMessageCategory_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_EventMessageCategory_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_EventMessageCategory] PRIMARY KEY CLUSTERED
   (
      [Category]
   )  ON [PRIMARY],
   CONSTRAINT [IX_EventMessageCategory_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )  ON [PRIMARY],
) ON [PRIMARY]
GO

/******  Add Column ******/

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessage]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventMessage]')
      AND [name] = N'Category')
   ALTER TABLE [dbo].[EventMessage] ADD
   	[Category] [dbo].[MessageCategoryType] NULL
GO


-- =======================
-- RS4464.sql
-- =======================
IF NOT EXISTS(SELECT 1 FROM [dbo].[systypes] WHERE [name] = N'FormNameOrCaptionType')
   CREATE TYPE [dbo].[FormNameOrCaptionType] FROM [nvarchar](50) NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionVariableAccess]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventActionVariableAccess]')
      AND [name] = N'Caption')
   ALTER TABLE [dbo].[EventActionVariableAccess] ADD
      [Caption] [dbo].[FormNameOrCaptionType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventVariable]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventVariable]')
      AND [name] = N'Caption')
   ALTER TABLE [dbo].[EventVariable] ADD
      [Caption] [dbo].[FormNameOrCaptionType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessageVariable]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventMessageVariable]')
      AND [name] = N'Caption')
   ALTER TABLE [dbo].[EventMessageVariable] ADD
      [Caption] [dbo].[FormNameOrCaptionType] NULL
GO


-- =======================
-- RS4505.sql
-- =======================
-- Add column UserNames.SourceControlUsername
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'SourceControlUsername')
   ALTER TABLE [dbo].[UserNames] ADD
      [SourceControlUsername] [dbo].[UsernameType] NULL
GO

-- Add column UserNames.SourceControlPassword
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'SourceControlPassword')
   ALTER TABLE [dbo].[UserNames] ADD
      [SourceControlPassword] [dbo].[EncryptedClientPasswordType] NULL
GO


-- =======================
-- RS4507_Issue132970.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'CollectionFilterType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[CollectionFilterType] FROM [nvarchar](max) NULL
GO

IF OBJECT_ID(N'[dbo].[IDOFilter]', N'U') IS NULL
CREATE TABLE [dbo].[IDOFilter](
   [CollectionName]   [CollectionNameType]   NOT NULL
 , [UserName]         [UsernameType]         NULL
 , [GroupName]        [GroupnameType]        NULL
 , [Filter]           [CollectionFilterType] NULL
 , [Active]           [ListYesNoType]        NOT NULL
      CONSTRAINT [DF_IDOFilter_Active] DEFAULT (1)
      CONSTRAINT [CK_IDOFilter_Active] CHECK ([Active] IN (0,1))
 , [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_IDOFilter_RowPointer] DEFAULT (newid())
 , [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_IDOFilter_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_IDOFilter_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1))
 , [CreatedBy] [dbo].[UsernameType] NOT NULL  
      CONSTRAINT [DF_IDOFilter_CreatedBy] DEFAULT (suser_sname())
 , [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_IDOFilter_UpdatedBy] DEFAULT (suser_sname())
 , [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_IDOFilter_CreateDate] DEFAULT (getdate())
 , [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_IDOFilter_RecordDate] DEFAULT (getdate())
 , [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_IDOFilter_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_IDOFilter_InWorkflow] CHECK ([InWorkflow] IN (0,1))
 , CONSTRAINT [PK_IDOFilter] PRIMARY KEY NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IDOFilter]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[IDOFilter]')
   AND   [name] = N'IX_IDOFilter_Collection_User_Group_Active')
   DROP INDEX [dbo].[IDOFilter].[IX_IDOFilter_Collection_User_Group_Active]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[IDOFilter]'), N'IsUserTable') = 1
   CREATE CLUSTERED INDEX [IX_IDOFilter_Collection_User_Group_Active] ON [dbo].[IDOFilter]
   (
      [CollectionName]
    , [UserName] 
    , [GroupName]
    , [Active]
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO


-- =======================
-- RS4521.sql
-- =======================
IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'DocumentNameType' AND ss.name = N'dbo')
CREATE TYPE dbo.DocumentNameType FROM NVARCHAR(120) NULL
GO

IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'DocumentExtensionType' AND ss.name = N'dbo')
CREATE TYPE dbo.DocumentExtensionType FROM NVARCHAR(30) NULL
GO

IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'DocumentObjectType' AND ss.name = N'dbo')
CREATE TYPE dbo.DocumentObjectType FROM VARBINARY(MAX) NULL
GO

IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'DocumentTypeType' AND ss.name = N'dbo')
CREATE TYPE dbo.DocumentTypeType FROM NVARCHAR(50) NULL
GO

IF OBJECT_ID(N'[dbo].[DocumentType]', N'U') IS NULL
CREATE TABLE [dbo].[DocumentType](
   [DocumentType] [dbo].[DocumentTypeType] NOT NULL,
   [Description] [dbo].[DescriptionType] NULL,
   [DocumentExtension] [dbo].[DocumentExtensionType] NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocumentType_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_DocumentType_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocumentType_CreatedBy]  DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocumentType_UpdatedBy]  DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocumentType_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocumentType_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_DocumentType_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocumentType_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_DocumentType_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
   (
      [DocumentType] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_DocumentType_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECT_ID(N'[dbo].[DocumentObject]', N'U') IS NULL
CREATE TABLE [dbo].[DocumentObject](
   [DocumentName] [dbo].[DocumentNameType] NOT NULL,
   [Sequence] [dbo].[SequenceType] NOT NULL,
   [Description] [dbo].[LongDescType] NULL,
   [DocumentType] [dbo].[DocumentTypeType] NOT NULL,
   [DocumentExtension] [dbo].[DocumentExtensionType] NOT NULL,
   [IndexExtension] AS N'.' + DocumentExtension,
   [Internal] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_DocumentObject_Internal] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObject_Internal] CHECK ([Internal] IN (0,1)),
   [DocumentObject] [dbo].[DocumentObjectType] NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocumentObject_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObject_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocumentObject_CreatedBy]  DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocumentObject_UpdatedBy]  DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocumentObject_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocumentObject_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_DocumentObject_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocumentObject_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObject_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_DocumentObject] PRIMARY KEY CLUSTERED
   (
      [DocumentName] ASC,
      [Sequence] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_DocumentObject_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects] 
   WHERE [object_id] = OBJECT_ID(N'FK_DocumentObject_DocumentType'))
   ALTER TABLE [dbo].[DocumentObject] WITH NOCHECK 
   ADD CONSTRAINT [FK_DocumentObject_DocumentType]
   FOREIGN KEY (
      [DocumentType]
   ) REFERENCES [dbo].[DocumentType](
      [DocumentType]
   ) NOT FOR REPLICATION
GO

IF FULLTEXTSERVICEPROPERTY('IsFullTextInstalled') = 1
   IF NOT EXISTS (SELECT 1 FROM sys.fulltext_catalogs WHERE name = 'DocumentsCatalog')
   CREATE FULLTEXT CATALOG DocumentsCatalog
GO

IF EXISTS (SELECT 1 FROM sys.fulltext_catalogs WHERE name = 'DocumentsCatalog')
AND NOT EXISTS (SELECT 1 FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[DocumentObject]'))
CREATE FULLTEXT INDEX ON DocumentObject
(DocumentObject TYPE COLUMN IndexExtension )
KEY INDEX IX_DocumentObject_RowPointer
ON DocumentsCatalog
GO

IF OBJECT_ID(N'[dbo].[DocumentObjectReference]', N'U') IS NULL
CREATE TABLE [dbo].[DocumentObjectReference](
   [TableName] [dbo].[TableNameType] NOT NULL,
   [TableRowPointer] [dbo].[RowPointerType] NOT NULL,
   [RefSequence] [dbo].[SequenceType] NOT NULL,
   [DocumentObjectRowPointer] [dbo].[RowPointerType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObjectReference_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_CreatedBy]  DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_UpdatedBy]  DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObjectReference_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_DocumentObjectReference] PRIMARY KEY CLUSTERED 
   (
      [TableName] ASC,
      [TableRowPointer] ASC,
      [DocumentObjectRowPointer] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_DocumentObjectReference_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_DocumentObjectReference_TableName_RowPointer_RefSequence] UNIQUE NONCLUSTERED 
   (
      [TableName] ASC,
      [TableRowPointer] ASC,
      [RefSequence] ASC
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObjectReference]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects] 
   WHERE [object_id] = OBJECT_ID(N'FK_DocumentObjectReference_DocumentObjectRowPointer'))
   ALTER TABLE [dbo].[DocumentObjectReference] WITH NOCHECK 
   ADD CONSTRAINT [FK_DocumentObjectReference_DocumentObjectRowPointer]
   FOREIGN KEY (
      [DocumentObjectRowPointer]
   ) REFERENCES [dbo].[DocumentObject](
      [RowPointer]
   ) NOT FOR REPLICATION
GO



-- =======================
-- RS4551_Issue132289_Core.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'EmailType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[EmailType] FROM [nvarchar](60) NULL
GO

IF EXISTS (
   SELECT 1 FROM [dbo].[systypes]
   WHERE [name] = N'EmailType')
   IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
      AND EXISTS (
      SELECT 1 FROM [dbo].[syscolumns] 
      WHERE [name] = N'EmailAddress' 
      AND OBJECT_NAME(id) = N'UserNames')
      ALTER TABLE [dbo].[UserNames] 
         ALTER COLUMN [EmailAddress] [dbo].[EmailType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'MobileDefaultForm')
   ALTER TABLE [dbo].[UserNames] ADD
      [MobileDefaultForm] [dbo].[FormNameType] NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'PublicationCategoryType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[PublicationCategoryType] FROM [nvarchar](30) NULL
GO

IF OBJECT_ID(N'[dbo].[PublicationCategory]', N'U') IS NULL
CREATE TABLE [dbo].[PublicationCategory](
   [PublicationCategory] [dbo].[PublicationCategoryType] NOT NULL,
   [Description] [dbo].[DescriptionType] NULL,
   [RowPointer]      [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_PublicationCategory_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag]  [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_PublicationCategory_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_PublicationCategory_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy]       [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_PublicationCategory_CreatedBy]  DEFAULT (suser_sname()),
   [UpdatedBy]       [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_PublicationCategory_UpdatedBy]  DEFAULT (suser_sname()),
   [CreateDate]      [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_PublicationCategory_CreateDate] DEFAULT (getdate()),
   [RecordDate]      [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_PublicationCategory_RecordDate] DEFAULT (getdate()),
   [InWorkflow]      [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_PublicationCategory_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_PublicationCategory_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_PublicationCategory] PRIMARY KEY CLUSTERED
   (
      [PublicationCategory]
   ) ON [PRIMARY],
   CONSTRAINT [IX_PublicationCategory_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECT_ID(N'[dbo].[Publication]', N'U') IS NULL
CREATE TABLE [dbo].[Publication](
   [PublicationName] [dbo].[NameType] NOT NULL,
   [Description] [dbo].[DescriptionType] NULL,
   [RowPointer]      [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_Publication_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag]  [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_Publication_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_Publication_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy]       [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_Publication_CreatedBy]  DEFAULT (suser_sname()),
   [UpdatedBy]       [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_Publication_UpdatedBy]  DEFAULT (suser_sname()),
   [CreateDate]      [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_Publication_CreateDate] DEFAULT (getdate()),
   [RecordDate]      [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_Publication_RecordDate] DEFAULT (getdate()),
   [InWorkflow]      [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_Publication_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_Publication_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED
   (
      [PublicationName]
   ) ON [PRIMARY],
   CONSTRAINT [IX_Publication_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECT_ID(N'[dbo].[PublicationCategoryPublication]', N'U') IS NULL
CREATE TABLE [dbo].[PublicationCategoryPublication](
   [PublicationCategory] [dbo].[PublicationCategoryType] NOT NULL,
   [PublicationName] [dbo].[NameType] NOT NULL,
   [IsSystemRecord] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_IsSystemRecord] DEFAULT ((0))
      CONSTRAINT [CK_PublicationCategoryPublication_IsSystemRecord] CHECK ([IsSystemRecord]IN (0,1)),
   [RowPointer]      [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag]  [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_PublicationCategoryPublication_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy]       [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_CreatedBy]  DEFAULT (suser_sname()),
   [UpdatedBy]       [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_UpdatedBy]  DEFAULT (suser_sname()),
   [CreateDate]      [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_CreateDate] DEFAULT (getdate()),
   [RecordDate]      [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_RecordDate] DEFAULT (getdate()),
   [InWorkflow]      [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_PublicationCategoryPublication_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_PublicationCategoryPublication_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_PublicationCategoryPublication] PRIMARY KEY CLUSTERED
   (
      [PublicationCategory]
      ,[PublicationName]
   ) ON [PRIMARY],
   CONSTRAINT [IX_PublicationCategoryPublication_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationCategoryPublication]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[PublicationCategoryPublication]')
   AND   [name] = N'IX_PublicationCategoryPublication_PublicationName')
   DROP INDEX [dbo].[PublicationCategoryPublication].[IX_PublicationCategoryPublication_PublicationName]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationCategoryPublication]'), N'IsUserTable') = 1
   CREATE INDEX [IX_PublicationCategoryPublication_PublicationName] ON [dbo].[PublicationCategoryPublication]
   (
      [PublicationName]
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationCategoryPublication]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects] 
   WHERE [id] = OBJECT_ID(N'PublicationCategoryPublicationFK1'))
   ALTER TABLE [dbo].[PublicationCategoryPublication] WITH NOCHECK 
   ADD CONSTRAINT [PublicationCategoryPublicationFK1]
   FOREIGN KEY (
      [PublicationCategory]
   ) REFERENCES [dbo].[PublicationCategory](
      [PublicationCategory]
   ) NOT FOR REPLICATION
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationCategoryPublication]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects] 
   WHERE [id] = OBJECT_ID(N'PublicationCategoryPublicationFK2'))
   ALTER TABLE [dbo].[PublicationCategoryPublication] WITH NOCHECK 
   ADD CONSTRAINT [PublicationCategoryPublicationFK2]
   FOREIGN KEY (
      [PublicationName]
   ) REFERENCES [dbo].[Publication](
      [PublicationName]
   ) NOT FOR REPLICATION
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'KeyValueType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[KeyValueType] FROM [nvarchar](30) NULL
GO

IF OBJECT_ID(N'[dbo].[PublicationSubscriber]', N'U') IS NULL
CREATE TABLE [dbo].[PublicationSubscriber] (
   [PublicationName] [dbo].[NameType] NOT NULL,
   [Username] [dbo].[UserNameType] NOT NULL,
   [Email] [dbo].[EmailType] NULL,
   [KeyValue] [dbo].[KeyValueType] NULL,
   [NoteExistsFlag] [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_PublicationSubscriber_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_PublicationSubscriber_NoteExistsFlag] CHECK ([NoteExistsFlag]IN (0,1)),
   [CreatedBy]      [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_PublicationSubscriber_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy]      [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_PublicationSubscriber_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate]     [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_PublicationSubscriber_CreateDate] DEFAULT (getdate()),
   [RecordDate]     [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_PublicationSubscriber_RecordDate] DEFAULT (getdate()),
   [RowPointer]     [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_PublicationSubscriber_RowPointer] DEFAULT (newid()),
   [InWorkflow]     [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_PublicationSubscriber_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_PublicationSubscriber_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_PublicationSubscriber] PRIMARY KEY NONCLUSTERED
   (
      [RowPointer]
   )  ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects] 
   WHERE [id] = OBJECT_ID(N'PublicationSubscriberFK1'))
   ALTER TABLE [dbo].[PublicationSubscriber] WITH NOCHECK 
   ADD CONSTRAINT [PublicationSubscriberFK1]
   FOREIGN KEY (
      [PublicationName]
   ) REFERENCES [dbo].[Publication](
      [PublicationName]
   ) NOT FOR REPLICATION
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[PublicationSubscriber]')
   AND   [name] = N'IX_PublicationSubscriber_PublicationName')
   DROP INDEX [dbo].[PublicationSubscriber].[IX_PublicationSubscriber_PublicationName]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   CREATE CLUSTERED INDEX [IX_PublicationSubscriber_PublicationName] ON [dbo].[PublicationSubscriber]
   (
      [PublicationName],
      [Username],
      [KeyValue]
   )
   WITH  FILLFACTOR = 90 ON [PRIMARY]
GO


-- =======================
-- RS4552.sql
-- =======================
-- Create new table IntranetSharedUserTableDefaults to hold Shared User table default entries 
IF OBJECT_ID(N'[dbo].[IntranetSharedUserTableDefault]', N'U') IS NULL
CREATE TABLE [dbo].[IntranetSharedUserTableDefault] (
   [TableName] [dbo].[TableNameType] NOT NULL ,
   [UserIdColumnName] [dbo].[ColumnNameType] NULL,
   [GroupIdColumnName] [dbo].[ColumnNameType] NULL,
   [Shareable] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_Shareable] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTableDefault_Shareable] CHECK ([Shareable]=(0) OR [Shareable]=(1)),         	      
   [UpdateRefId] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_UpdateRefId] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTableDefault_UpdateRefId] CHECK ([UpdateRefId]=(0) OR [UpdateRefId]=(1)),                  	         
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_NoteExistsFlag] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTableDefault_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)), 
   [CreatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_InWorkflow] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTableDefault_InWorkflow] CHECK ([InWorkflow] = 1 or [InWorkflow] = 0),         	      
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTableDefault_RowPointer] DEFAULT (newid()),
   CONSTRAINT [PK_IntranetSharedUserTableDefault] PRIMARY KEY  CLUSTERED 
   (
      [TableName]
   )  ON [PRIMARY] ,
   CONSTRAINT [IX_IntranetSharedUserTableDefault_RowPointer] UNIQUE  NONCLUSTERED 
   (
      [RowPointer]
   )  ON [PRIMARY] ,
) ON [PRIMARY]
GO

-- Create new table IntranetSharedUserTable to hold Shared User table entries and their processed state
IF OBJECT_ID(N'[dbo].[IntranetSharedUserTable]', N'U') IS NULL
CREATE TABLE [dbo].[IntranetSharedUserTable] (
   [IntranetName] [dbo].[IntranetNameType] NOT NULL ,
   [TableName] [dbo].[TableNameType] NOT NULL ,
   [UserIdColumnName] [dbo].[ColumnNameType] NULL,
   [GroupIdColumnName] [dbo].[ColumnNameType] NULL,
   [Shared] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_Shared] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTable_Shared] CHECK ([Shared]=(0) OR [Shared]=(1)),         
   [Processed] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_Processed] DEFAULT ((1)) 
      CONSTRAINT [CK_IntranetSharedUserTable_Processed] CHECK ([Processed]=(0) OR [Processed]=(1)),         
   [Shareable] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_Shareable] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTable_Shareable] CHECK ([Shareable]=(0) OR [Shareable]=(1)),         
   [UpdateRefId] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_UpdateRefId] DEFAULT ((1)) 
      CONSTRAINT [CK_IntranetSharedUserTable_UpdateRefId] CHECK ([UpdateRefId]=(0) OR [UpdateRefId]=(1)),                  	
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_NoteExistsFlag] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTable_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),         
   [CreatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_InWorkflow] DEFAULT ((0)) 
      CONSTRAINT [CK_IntranetSharedUserTable_InWorkflow] CHECK ([InWorkflow] = 1 or [InWorkflow] = 0),         
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_IntranetSharedUserTable_RowPointer] DEFAULT (newid()),
   CONSTRAINT [PK_IntranetSharedUserTable] PRIMARY KEY  CLUSTERED 
   (
      [IntranetName],
      [TableName]
   )  ON [PRIMARY] ,
   CONSTRAINT [IX_IntranetSharedUserTable_RowPointer] UNIQUE  NONCLUSTERED 
   (
      [RowPointer]
   )  ON [PRIMARY] ,
) ON [PRIMARY]
GO

-- =======================
-- RS4557.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventState]')
      AND [name] = N'ContinueAfterHandlerRowPointer')
   ALTER TABLE [dbo].[EventState] ADD
   	  [ContinueAfterHandlerRowPointer] [dbo].[RowPointerType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventState]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[EventState]')
   AND   [name] = N'IX_EventState_ContinueAfterHandlerRowPointer')
   DROP INDEX [dbo].[EventState].[IX_EventState_ContinueAfterHandlerRowPointer]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventState]'), N'IsUserTable') = 1
   CREATE NONCLUSTERED INDEX [IX_EventState_ContinueAfterHandlerRowPointer] ON [dbo].[EventState] 
   (
   	  [ContinueAfterHandlerRowPointer] ASC
   ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO


-- =======================
-- RS4562.sql
-- =======================
IF NOT EXISTS(SELECT 1 FROM [dbo].[systypes] WHERE [name] = N'EventQuorumType')
   CREATE TYPE [dbo].[EventQuorumType] FROM [int] NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'Quorum')
   ALTER TABLE [dbo].[EventActionState] ADD
      [Quorum] [dbo].[EventQuorumType] NULL
GO

-- =======================
-- RS4563.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'PayloadAccess')
   ALTER TABLE [dbo].[EventActionState] ADD
      [PayloadAccess] [dbo].[EventVariableAccessType] NULL
         CONSTRAINT [CK_EventActionState_PayloadAccess] CHECK ([PayloadAccess] IN (N'D', N'H',N'R'))
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'ModifiedPayloadAccess')
   ALTER TABLE [dbo].[EventActionState] ADD
      [ModifiedPayloadAccess] [dbo].[EventVariableAccessType] NULL
         CONSTRAINT [CK_EventActionState_ModifiedPayloadAccess] CHECK ([ModifiedPayloadAccess] IN (N'D', N'H',N'R'))
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'UnmodifiedPayloadAccess')
   ALTER TABLE [dbo].[EventActionState] ADD
      [UnmodifiedPayloadAccess] [dbo].[EventVariableAccessType] NULL
         CONSTRAINT [CK_EventActionState_UnmodifiedPayloadAccess] CHECK ([UnmodifiedPayloadAccess] IN (N'D', N'H',N'R'))
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
AND NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
WHERE [name]= N'CK_EventActionState_PayloadOneNonDefault'
AND [xtype] = 'C' 
AND [parent_obj] = OBJECT_ID(N'[dbo].[EventActionState]'))
ALTER TABLE [dbo].[EventActionState]
   ADD CONSTRAINT [CK_EventActionState_PayloadOneNonDefault] CHECK (
      (CASE ISNULL([UnmodifiedPayloadAccess], 'D') WHEN N'D' THEN 0 ELSE 1 END +
       CASE ISNULL([ModifiedPayloadAccess], 'D') WHEN N'D' THEN 0 ELSE 1 END +
       CASE ISNULL([PayloadAccess], 'D') WHEN N'D' THEN 0 ELSE 1 END) <= 1)
GO


-- =======================
-- RS4919.sql
-- =======================
-- ====================
-- RS4919.sql
-- ====================

IF NOT EXISTS (SELECT 1 FROM [dbo].[systypes]
   WHERE [name] = N'CountryPackOptionType')
   CREATE TYPE [dbo].[CountryPackOptionType] FROM [nchar](1) NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CountryPack]'), N'IsUserTable') = 1
   TRUNCATE TABLE [dbo].[CountryPack]
GO

-- remove CountryPack primary key 
IF EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name] = N'PK_CountryPack'
   AND [xtype] = 'PK'
   AND [parent_obj] = OBJECT_ID(N'[dbo].[CountryPack]'))
   ALTER TABLE [dbo].[CountryPack] DROP CONSTRAINT [PK_CountryPack]
GO

-- drop CountryPack column
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CountryPack]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[CountryPack]') 
   AND [name] = N'CountryPack')
   ALTER TABLE [dbo].[CountryPack] 
      DROP COLUMN [CountryPack]
GO

-- add Name column
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CountryPack]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[CountryPack]')
      AND [name] = N'Name')
   ALTER TABLE [dbo].[CountryPack]
      ADD [Name] [dbo].[NameType] NOT NULL
GO

-- add Option column
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CountryPack]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[CountryPack]')
      AND [name] = N'Option')
   ALTER TABLE [dbo].[CountryPack]
      ADD [Option] [dbo].[CountryPackOptionType] NOT NULL
         CONSTRAINT [CK_CountryPack_Option] CHECK ([Option]=N'L' OR [Option]=N'T')
         -- L -> Localization, T -> Translation
GO

-- add Description column
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CountryPack]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[CountryPack]')
      AND [name] = N'Description')
   ALTER TABLE [dbo].[CountryPack] 
      ADD [Description] [dbo].[DescriptionType] NULL
GO

-- add Version column
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CountryPack]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[CountryPack]')
      AND [name] = N'Version')
   ALTER TABLE [dbo].[CountryPack] 
      ADD [Version] [dbo].[ProductVersionType] NULL
GO

-- add composite primary key
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CountryPack]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[sysobjects]
   WHERE [name]= N'PK_CountryPack'
   AND [xtype] = 'PK' 
   AND [parent_obj] = OBJECT_ID(N'[dbo].[CountryPack]'))
   ALTER TABLE [dbo].[CountryPack] 
      ADD CONSTRAINT [PK_CountryPack] PRIMARY KEY CLUSTERED ([Name], [Option])
   WITH FILLFACTOR = 90 ON [PRIMARY] 
GO

-- =======================
-- RS4947_Core.sql
-- =======================
--RS4947

-- Add column: KeyValue2 to PublicationSubscriber table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[PublicationSubscriber]')
      AND [name] = N'KeyValue2')
   ALTER TABLE [dbo].[PublicationSubscriber] ADD
      [KeyValue2] [dbo].[KeyValueType] NULL
GO

-- Changing UDDT on Publication table Description column to LongDescType
IF EXISTS (
   SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'LongDescType' AND ss.name = N'dbo')
   IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Publication]'), N'IsUserTable') = 1
      AND EXISTS (
      SELECT 1 FROM [sys].[columns]
      WHERE [name] = N'Description'
      AND [object_id] = OBJECT_ID(N'[dbo].[Publication]'))
      ALTER TABLE [dbo].[Publication]
         ALTER COLUMN [Description] [dbo].[LongDescType] NULL
GO


-- =======================
-- RS4950_Issue133191.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SessionTypeType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[SessionTypeType] FROM [smallint] NULL
GO

-- Modify ConnectionInformation table to add columns SessionType and SessionSpec
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ConnectionInformation]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ConnectionInformation]')
      AND [name] = N'SessionType')
BEGIN
   ALTER TABLE [dbo].[ConnectionInformation] ADD
      [SessionType] [dbo].[SessionTypeType] NOT NULL
         CONSTRAINT [DF_ConnectionInformation_SessionType] DEFAULT ((0))
   ALTER TABLE [dbo].[ConnectionInformation] ADD
      [SessionSpec] [dbo].[LicenseCheckSumType] NULL
END
GO

-- Modify SiteConnectionInformation table to add columns SessionType and SessionSpec
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[SiteConnectionInformation]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[SiteConnectionInformation]')
      AND [name] = N'SessionType')
BEGIN
   ALTER TABLE [dbo].[SiteConnectionInformation] ADD
      [SessionType] [dbo].[SessionTypeType] NOT NULL
         CONSTRAINT [DF_SiteConnectionInformation_SessionType] DEFAULT ((0))
   ALTER TABLE [dbo].[SiteConnectionInformation] ADD
      [SessionSpec] [dbo].[LicenseCheckSumType] NULL
END
GO

-- Modify ModuleMembers table to add columns SessionType and SessionSpec
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ModuleMembers]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ModuleMembers]')
      AND [name] = N'SessionType')
BEGIN
   ALTER TABLE [dbo].[ModuleMembers] ADD
      [SessionType] [dbo].[SessionTypeType] NOT NULL
         CONSTRAINT [DF_ModuleMembers_SessionType] DEFAULT ((0))
   ALTER TABLE [dbo].[ModuleMembers] ADD
      [SessionSpec] [dbo].[LicenseCheckSumType] NULL
END
GO


-- =======================
-- RS4971_Issue133002_ExternalDataStore.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ExtDataStoreLifetimeType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExtDataStoreLifetimeType] FROM [smallint] NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ExtDataStoreAccessKeyType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExtDataStoreAccessKeyType] FROM [nvarchar](440) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ExtDataStoreValueType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExtDataStoreValueType] FROM [nvarchar](max) NULL
GO

IF OBJECT_ID(N'[dbo].[ExternalDataStore]', N'U') IS NULL
CREATE TABLE [dbo].[ExternalDataStore](
   [AccessKey] [dbo].[ExtDataStoreAccessKeyType] NOT NULL,
   [SessionID] [dbo].[RowPointerType] NOT NULL,
   [Lifetime] [dbo].[ExtDataStoreLifetimeType] NOT NULL
      CONSTRAINT [DF_ExternalDataStore_Lifetime] DEFAULT ((0)),
   [Value] [dbo].[ExtDataStoreValueType] NULL,
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_ExternalDataStore_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ExternalDataStore_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ExternalDataStore_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL  
      CONSTRAINT [DF_ExternalDataStore_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_ExternalDataStore_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ExternalDataStore_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ExternalDataStore_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ExternalDataStore_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ExternalDataStore_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ExternalDataStore] PRIMARY KEY CLUSTERED
   (
      [AccessKey]
   ) ON [PRIMARY],
   CONSTRAINT [IX_ExternalDataStore_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) ON [PRIMARY],
) ON [PRIMARY]
GO


-- =======================
-- RS5007.sql
-- =======================
/*RS 5007*/

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'EmailTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[EmailTypeType] FROM [nvarchar](30) NULL
GO

/*Create table: EmailType*/
IF OBJECT_ID(N'[dbo].[EmailType]', N'U') IS NULL
CREATE TABLE [dbo].[EmailType](
   [EmailType]   [dbo].[EmailTypeType]   NOT NULL,
   [Description] [dbo].[DescriptionType] NOT NULL,
   [RowPointer]  [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_EmailType_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType]  NOT NULL
      CONSTRAINT [DF_EmailType_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_EmailType_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType]     NOT NULL
      CONSTRAINT [DF_EmailType_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType]     NOT NULL
      CONSTRAINT [DF_EmailType_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EmailType_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EmailType_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_EmailType_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_EmailType_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_EmailType] PRIMARY KEY CLUSTERED
   (
      [EmailType]
   ) ON [PRIMARY],
   CONSTRAINT [IX_EmailType_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   ) ON [PRIMARY],
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT 1 FROM EmailType WHERE EmailType = N'P')
INSERT INTO EmailType(EmailType,Description) VALUES(N'P', N'FORMAT(sPrimary)')

/*PublicationSubscriber -- Add EmailNotificationsEmailType*/
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PublicationSubscriber]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[PublicationSubscriber]')
      AND [name] = N'EmailNotificationsEmailType')
   ALTER TABLE [dbo].[PublicationSubscriber] ADD
      [EmailNotificationsEmailType] [dbo].[EmailTypeType] 
GO

/*Check to see if User tables are shared and if so, check if current site is master site*/
DECLARE
   @MasterSite     SiteType
  ,@DatabaseName  SYSNAME
  ,@Shared        INT

SELECT @Shared = Shared FROM IntranetSharedUserTable WHERE Tablename = 'UserNames'
SET @DatabaseName = DB_NAME()

SELECT TOP 1 @MasterSite = MasterSite
   FROM intranet JOIN site ON site = MasterSite
   WHERE app_db_name = @DatabaseName

IF NOT((@Shared = 0 OR @Shared IS NULL) OR (@Shared = 1 AND @MasterSite IS NOT NULL))
   RETURN

/*Only apply the following to Non-Shared and Master Sites*/
/*Create table: UserEmail*/
IF OBJECT_ID(N'[dbo].[UserEmail]', N'U') IS NULL
CREATE TABLE [dbo].[UserEmail] (
   [Username]       [dbo].[UserNameType]   NOT NULL,
   [EmailType]      [dbo].[EmailTypeType]  NOT NULL,
   [EmailAddress]   [dbo].[EmailType]      NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType]     NOT NULL
      CONSTRAINT [DF_UserEmail_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_UserEmail_NoteExistsFlag] CHECK ([NoteExistsFlag]IN (0,1)),
   [CreatedBy]      [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_UserEmail_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy]      [dbo].[UsernameType]    NOT NULL
      CONSTRAINT [DF_UserEmail_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate]     [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_UserEmail_CreateDate] DEFAULT (getdate()),
   [RecordDate]     [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_UserEmail_RecordDate] DEFAULT (getdate()),
   [RowPointer]     [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_UserEmail_RowPointer] DEFAULT (newid()),
   [InWorkflow]     [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_UserEmail_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_UserEmail_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_UserEmail] PRIMARY KEY  NONCLUSTERED 
   (
      [RowPointer]
   )   ON [PRIMARY],
   CONSTRAINT [IX_UserEmail_Username_Type] UNIQUE CLUSTERED 
   (
      [Username],
      [EmailType]
   )  ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
    AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'EmailAddress')
BEGIN
   EXEC sp_executesql N'   INSERT INTO UserEmail (Username, EmailType, EmailAddress)
      SELECT Username, ''P'', EmailAddress FROM UserNames
         WHERE EmailAddress IS NOT NULL
           AND NOT EXISTS (SELECT 1 FROM UserEmail WHERE UserEmail.Username = UserNames.Username
                                                     AND UserEmail.EmailType = N''P'')'

   /*UserNames -- DROP EmailAddress*/
   ALTER TABLE [dbo].[UserNames] DROP COLUMN [EmailAddress]
END
GO

/*UserNames -- Add SendEmailNotifications*/
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'SendEmailNotifications')
   ALTER TABLE [dbo].[UserNames] ADD
      [SendEmailNotifications] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_UserNames_SendEmailNotifications] DEFAULT ((0))
         CONSTRAINT [CK_UserNames_SendEmailNotifications] CHECK ([SendEmailNotifications] IN (0,1))
GO

/*UserNames -- Add EmailPromptsEmailType*/
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'EmailPromptsEmailType')
   ALTER TABLE [dbo].[UserNames] ADD
      [EmailPromptsEmailType] [dbo].[EmailTypeType] 
GO

/*UserNames -- Add EmailNotificationsEmailType*/
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[syscolumns]
      WHERE [id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'EmailNotificationsEmailType')
   ALTER TABLE [dbo].[UserNames] ADD
      [EmailNotificationsEmailType] [dbo].[EmailTypeType] 
GO

-- =======================
-- RS5007_Issue138052.sql
-- =======================
/*Issue138052 Usernames*/
/*UserNames -- Add PrimaryEmailType*/
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'PrimaryEmailType')
   ALTER TABLE [dbo].[UserNames] ADD
      [PrimaryEmailType] [dbo].[EmailTypeType] NULL
GO

-- =======================
-- RS5108.sql
-- =======================
--Schema change for RS5108

-- New parms.display_report_headers column
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[parms]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[parms]')
      AND [name] = N'display_report_headers')
   ALTER TABLE [dbo].[parms] ADD
      [display_report_headers] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_parms_display_report_headers] DEFAULT (1)
      CONSTRAINT [CK_parms_display_report_headers] CHECK ([display_report_headers] IN (0,1))
GO



-- =======================
-- RS5148.sql
-- =======================
-- RS5148 Application Search

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'SearchItemNameType' AND ss.name = N'dbo')
      CREATE TYPE [dbo].[SearchItemNameType] FROM [nvarchar](80) NULL
GO

IF OBJECT_ID(N'[dbo].[SearchItem]', N'U') IS NULL
CREATE TABLE [dbo].[SearchItem] 
(  [SearchItemName]         [dbo].[SearchItemNameType] NOT NULL,
   [Active]                 [dbo].[ListYesNoType]   NOT NULL 
      CONSTRAINT [DF_SearchItem_Active]             DEFAULT ((0))
      CONSTRAINT [CK_SearchItem_Active]             CHECK ([Active] IN (0,1)),                                         
   [TableName]              [dbo].[TableNameType]   NOT NULL,
   [ColumnName]             [dbo].[ColumnNameType]  NOT NULL,
   [TitleColumnName]        [dbo].[ColumnNameType]  NOT NULL,
   [DescriptionColumnName]  [dbo].[ColumnNameType]  NOT NULL,
   [FormName]               [dbo].[FormNameType]    NOT NULL,
   [IsSystemRecord]         [dbo].[ListYesNoType]   NOT NULL 
      CONSTRAINT [DF_SearchItem_IsSystemRecord]     DEFAULT ((0))
      CONSTRAINT [CK_SearchItem_IsSystemRecord]     CHECK ([IsSystemRecord] IN (0,1)),                                          
   [NoteExistsFlag]         [dbo].[FlagNyType]      NOT NULL 
      CONSTRAINT [DF_SearchItem_NoteExistsFlag]     DEFAULT ((0))
      CONSTRAINT [CK_SearchItem_NoteExistsFlag]     CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy]              [dbo].[UsernameType]    NOT NULL 
      CONSTRAINT [DF_SearchItem_CreatedBy]          DEFAULT (suser_sname()),
   [UpdatedBy]              [dbo].[UsernameType]    NOT NULL 
      CONSTRAINT [DF_SearchItem_UpdatedBy]          DEFAULT (suser_sname()),
   [CreateDate]             [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_SearchItem_CreateDate]         DEFAULT (getdate()),
   [RecordDate]             [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_SearchItem_RecordDate]         DEFAULT (getdate()),
   [RowPointer]             [dbo].[RowPointerType]  NOT NULL 
      CONSTRAINT [DF_SearchItem_RowPointer]         DEFAULT (newid()),
   [InWorkflow]             [dbo].[FlagNyType]      NOT NULL 
      CONSTRAINT [DF_SearchItem_InWorkflow]         DEFAULT ((0))
      CONSTRAINT [CK_SearchItem_InWorkflow]         CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_SearchItem] PRIMARY KEY  CLUSTERED 
   (
      [SearchItemName]
   )  ON [PRIMARY],
    CONSTRAINT [IX_SearchItem_Table_Column] UNIQUE NONCLUSTERED 
   (
      [TableName],
      [ColumnName]
   ) ON [PRIMARY],
     CONSTRAINT [IX_SearchItem_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )  ON [PRIMARY]
)  ON [PRIMARY]
GO

-- Create default Catalog
IF FULLTEXTSERVICEPROPERTY('IsFullTextInstalled') = 1
   IF NOT EXISTS (SELECT 1 FROM sys.fulltext_catalogs ft WHERE ft.name = N'SearchCatalog')
     CREATE FULLTEXT CATALOG SearchCatalog AS DEFAULT;
GO

-- =======================
-- RS5149.sql
-- =======================
-- RS5149 Outlook SmartLink

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'SearchGroupType' AND ss.name = N'dbo')
      CREATE TYPE [dbo].[SearchGroupType] FROM [nvarchar](80) NULL
GO

IF OBJECT_ID(N'[dbo].[SearchPreferenceList]', N'U') IS NULL
CREATE TABLE [dbo].[SearchPreferenceList] (
   [Username]       [dbo].[UsernameType] NOT NULL,
   [SearchGroup]    [dbo].[SearchGroupType] NOT NULL,
   [SearchItemName] [dbo].[SearchItemNameType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_SearchPreferenceList_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_SearchPreferenceList_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy]      [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_SearchPreferenceList_CreatedBy]    DEFAULT (suser_sname()),
   [UpdatedBy]      [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_SearchPreferenceList_UpdatedBy]    DEFAULT (suser_sname()),
   [CreateDate]     [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_SearchPreferenceList_CreateDate]   DEFAULT (getdate()),
   [RecordDate]     [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_SearchPreferenceList_RecordDate]   DEFAULT (getdate()),
   [RowPointer]     [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_SearchPreferenceList_RowPointer]   DEFAULT (newid()),
   [InWorkflow]     [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_SearchPreferenceList_InWorkflow]   DEFAULT ((0))
      CONSTRAINT [CK_SearchPreferenceList_InWorkflow]   CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_SearchPreferenceList] PRIMARY KEY  CLUSTERED 
   (  
      [Username],
      [SearchGroup],
      [SearchItemName]
   ), 
   CONSTRAINT [IX_SearchPreferenceList_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )  ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[SearchPreferenceList]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
   WHERE [id] = OBJECT_ID(N'FK_SearchPreferenceList_SearchItemName'))
   ALTER TABLE [dbo].[SearchPreferenceList] WITH NOCHECK
   ADD CONSTRAINT [FK_SearchPreferenceList_SearchItemName]
   FOREIGN KEY (
     [SearchItemName]
   ) REFERENCES [dbo].[SearchItem](
     [SearchItemName]
   ) NOT FOR REPLICATION
GO

-- =======================
-- RS5310.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'EventStateIdType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[EventStateIdType] FROM [uniqueidentifier] NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'EventAttachmentNameType' AND ss.name = N'dbo')
   -- Must be large enough to hold a DocumentNameType plus a SequenceType plus a 1-char delimiter:
   CREATE TYPE [dbo].[EventAttachmentNameType] FROM NVARCHAR(132) NULL
GO

-- Create table: EventDocument
IF OBJECT_ID(N'[dbo].[EventDocument]', N'U') IS NULL
CREATE TABLE [dbo].[EventDocument](
   [EventStateId] [dbo].[EventStateIdType] NOT NULL,
   [RefSequence] [dbo].[SequenceType] NOT NULL,
   [AttachmentName] [dbo].[EventAttachmentNameType] NOT NULL,
   [Suspended] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_EventDocument_Suspended] DEFAULT ((0))
      CONSTRAINT [CK_EventDocument_Suspended] CHECK ([Suspended] IN (0,1)),
   [NoteExistsFlag] [dbo].[FlagNyType]  NOT NULL
      CONSTRAINT [DF_EventDocument_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_EventDocument_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EventDocument_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType]  NOT NULL
      CONSTRAINT [DF_EventDocument_RowPointer] DEFAULT (newid()),
   [CreatedBy] [dbo].[UsernameType]     NOT NULL
      CONSTRAINT [DF_EventDocument_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType]     NOT NULL
      CONSTRAINT [DF_EventDocument_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EventDocument_CreateDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType]      NOT NULL
      CONSTRAINT [DF_EventDocument_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_EventDocument_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_EventDocument] PRIMARY KEY CLUSTERED
   (
      [EventStateId] ASC,
      [RefSequence] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_EventDocument_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_EventDocument_EventStateId_AttachmentName] UNIQUE NONCLUSTERED
   (
      [EventStateId] ASC,
      [AttachmentName] ASC
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table: EventDocumentObject
IF OBJECT_ID(N'[dbo].[EventDocumentObject]', N'U') IS NULL
CREATE TABLE [dbo].[EventDocumentObject](
   [DocumentName] [dbo].[DocumentNameType] NOT NULL,
   [Sequence] [dbo].[SequenceType] NOT NULL,
   [Description] [dbo].[LongDescType] NULL,
   [DocumentType] [dbo].[DocumentTypeType] NOT NULL,
   [DocumentExtension] [dbo].[DocumentExtensionType] NOT NULL,
   [IndexExtension] AS N'.' + DocumentExtension,
   [Internal] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_Internal] DEFAULT ((0))
      CONSTRAINT [CK_EventDocumentObject_Internal] CHECK ([Internal] IN (0,1)),
   [DocumentObject] [dbo].[DocumentObjectType] NULL,
   [Modified] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_Modified] DEFAULT ((0))
      CONSTRAINT [CK_EventDocumentObject_Modified] CHECK ([Modified] IN (0,1)),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_EventDocumentObject_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_CreatedBy]  DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_UpdatedBy]  DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_EventDocumentObject_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_EventDocumentObject_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_EventDocumentObject] PRIMARY KEY CLUSTERED
   (
      [DocumentName] ASC,
      [Sequence] ASC
   ) ON [PRIMARY],
   CONSTRAINT [IX_EventDocumentObject_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer] ASC
   ) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventDocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects] 
   WHERE [object_id] = OBJECT_ID(N'FK_EventDocumentObject_DocumentType'))
   ALTER TABLE [dbo].[EventDocumentObject] WITH NOCHECK 
   ADD CONSTRAINT [FK_EventDocumentObject_DocumentType]
   FOREIGN KEY (
      [DocumentType]
   ) REFERENCES [dbo].[DocumentType](
      [DocumentType]
   ) NOT FOR REPLICATION
GO

IF EXISTS (SELECT 1 FROM sys.fulltext_catalogs WHERE name = 'DocumentsCatalog')
AND NOT EXISTS (SELECT 1 FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[EventDocumentObject]'))
CREATE FULLTEXT INDEX ON EventDocumentObject
(DocumentObject TYPE COLUMN IndexExtension )
KEY INDEX IX_EventDocumentObject_RowPointer
ON DocumentsCatalog
GO

-- Modify Table: DocumentObjectReference
-- Add Column: Suspend
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObjectReference]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObjectReference]')
      AND [name] = N'Suspend')
   ALTER TABLE [dbo].[DocumentObjectReference] ADD
      [Suspend] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_DocumentObjectReference_Suspend] DEFAULT ((0))
      CONSTRAINT [CK_DocumentObjectReference_Suspend] CHECK ([Suspend] IN (0,1))
GO


-- =======================
-- RS5310b.sql
-- =======================
IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'InternetMediaTypeType' AND ss.name = N'dbo')
CREATE TYPE dbo.InternetMediaTypeType FROM NVARCHAR(255) NULL
GO

-- Modify Table: DocumentType
-- Add Column: MediaType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'MediaType')
ALTER TABLE dbo.DocumentType ADD
   [MediaType] [InternetMediaTypeType] NULL
GO

-- Modify Table: DocumentObject
-- Add Column: MediaType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentObject]')
      AND [name] = N'MediaType')
ALTER TABLE dbo.DocumentObject ADD
   [MediaType] [InternetMediaTypeType] NULL
GO

-- Modify Table: EventDocumentObject
-- Add Column: MediaType
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventDocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventDocumentObject]')
      AND [name] = N'MediaType')
ALTER TABLE dbo.EventDocumentObject ADD
   [MediaType] [InternetMediaTypeType] NULL
GO

-- Modify Table: EventDocument
-- Add Column: EmbedInEmail
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventDocument]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventDocument]')
      AND [name] = N'EmbedInEmail')
ALTER TABLE EventDocument ADD
   [EmbedInEmail] [ListYesNoType]     NOT NULL
      CONSTRAINT [DF_EventDocument_EmbedInEmail] DEFAULT ((0))
      CONSTRAINT [CK_EventDocument_EmbedInEmail] CHECK ([EmbedInEmail] IN (0,1))
GO

IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'EventBigIntervalType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[EventBigIntervalType] FROM [bigint] NULL
GO

IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'EventBigQuorumType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[EventBigQuorumType] FROM [bigint] NULL
GO

ALTER TABLE [EventActionState] ALTER COLUMN [Quorum] [EventBigQuorumType] NULL
GO


-- =======================
-- RS5310c.sql
-- =======================
-- Undo part of RS4521.sql:
IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'FK_DocumentObjectReference_DocumentObjectRowPointer'
   AND [type] = 'F'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[DocumentObjectReference]'))
   ALTER TABLE [dbo].[DocumentObjectReference]
   DROP CONSTRAINT [FK_DocumentObjectReference_DocumentObjectRowPointer]
GO



-- =======================
-- RS5085.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'EventVotingChoiceStatusType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[EventVotingChoiceStatusType] FROM [nchar](1) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'EventVotingMarginType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[EventVotingMarginType] FROM [decimal](5, 2) NULL
GO


/* EventActionState -- Add Iteration */
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventActionState]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventActionState]')
      AND [name] = N'Iteration')
   ALTER TABLE [dbo].[EventActionState] ADD
      [Iteration] [dbo].[EventOccurrencesType] NOT NULL
         CONSTRAINT [DF_EventActionState_Iteration] DEFAULT ((0))
GO


/* EventMessage -- Add ActionIteration */
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessage]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [OBJECT_ID] = OBJECT_ID(N'[dbo].[EventMessage]')
      AND [name] = N'ActionIteration')
   ALTER TABLE [dbo].[EventMessage] ADD
      [ActionIteration] [dbo].[EventOccurrencesType] NOT NULL
         CONSTRAINT [DF_EventMessage_ActionIteration] DEFAULT ((0))
GO


-- =======================
-- RS5314.sql
-- =======================
-- Add User Defined Data Types
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'MessageNoType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[MessageNoType] FROM nvarchar(30) NULL
GO

IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'MessageNoPrefixType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[MessageNoPrefixType] FROM nvarchar(30) NULL
GO

-- Add column MessageNoPrefix to parms table.
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[parms]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[parms]')
      AND [name] = N'MessageNoPrefix')
   ALTER TABLE [dbo].[parms] ADD 
      [MessageNoPrefix] [dbo].[MessageNoPrefixType] NULL
GO

-- ApplicationMessages table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ApplicationMessages]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ApplicationMessages]')
      AND [name] = N'MessageNo')
BEGIN

   IF EXISTS (SELECT 1 FROM [sys].[indexes] 
      WHERE [name] = N'IX_ApplicationMessages_MessageNo')
      DROP INDEX [IX_ApplicationMessages_MessageNo] ON [dbo].[ApplicationMessages]  
      
   -- Drop constraint CK_ApplicationMessages_MessageNo. No need to recreate this one.
   IF EXISTS (SELECT 1 FROM [sys].[objects]
      WHERE [object_id] = OBJECT_ID(N'CK_ApplicationMessages_MessageNo'))
      ALTER TABLE [dbo].[ApplicationMessages] DROP CONSTRAINT [CK_ApplicationMessages_MessageNo]
      
   IF EXISTS (SELECT 1 FROM [sys].[objects]
      WHERE [object_id] = OBJECT_ID(N'PK_ApplicationMessages'))
      ALTER TABLE [dbo].[ApplicationMessages] DROP CONSTRAINT [PK_ApplicationMessages]

   ALTER TABLE [dbo].[ApplicationMessages] ALTER COLUMN [MessageNo]
      [dbo].[MessageNoType] NOT NULL

   ALTER TABLE [dbo].[ApplicationMessages] ADD CONSTRAINT [PK_ApplicationMessages] PRIMARY KEY CLUSTERED
   (
	   [MessageNo] ASC,
	   [MessageLanguage] ASC
   ) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

END
GO

-- ObjectMainMessages table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjectMainMessages]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ObjectMainMessages]')
      AND [name] = N'MessageNo')
BEGIN

   IF EXISTS (SELECT 1 FROM [sys].[indexes] 
      WHERE [name] = N'ObjectMainMessagesIx2')
      DROP INDEX [ObjectMainMessagesIx2] ON [dbo].[ObjectMainMessages]

   ALTER TABLE [dbo].[ObjectMainMessages] ALTER COLUMN [MessageNo]
      [dbo].[MessageNoType] NOT NULL

   CREATE NONCLUSTERED INDEX [ObjectMainMessagesIx2] ON [dbo].[ObjectMainMessages] 
   (
	   [MessageNo] ASC
   )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, 
   ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]

END
GO

-- ObjectBuildMessages table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjectBuildMessages]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ObjectBuildMessages]')
      AND [name] = N'MessageNo')
BEGIN

   IF EXISTS (SELECT 1 FROM [sys].[indexes] 
      WHERE [name] = N'ObjectBuildMessagesIx2')
      DROP INDEX [ObjectBuildMessagesIx2] ON [dbo].[ObjectBuildMessages]

   ALTER TABLE [dbo].[ObjectBuildMessages] ALTER COLUMN [MessageNo]
      [dbo].[MessageNoType] NOT NULL

   CREATE NONCLUSTERED INDEX [ObjectBuildMessagesIx2] ON [dbo].[ObjectBuildMessages] 
   (
	   [MessageNo] ASC
   )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, 
   ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]

END
GO


-- =======================
-- RS5337.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventHandler]')
      AND [name] = N'EditableByWizard')
   ALTER TABLE [dbo].[EventHandler] ADD
      [EditableByWizard] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_EventHandler_EditableByWizard] DEFAULT ((0))
      CONSTRAINT [CK_EventHandler_EditableByWizard] CHECK ([EditableByWizard] IN (0,1))
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTrigger]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventTrigger]')
      AND [name] = N'EditableByWizard')
   ALTER TABLE [dbo].[EventTrigger] ADD
      [EditableByWizard] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_EventTrigger_EditableByWizard] DEFAULT ((0))
      CONSTRAINT [CK_EventTrigger_EditableByWizard] CHECK ([EditableByWizard] IN (0,1))
GO

-- Promote CollectionPropertyNameType UDDT from SyteLine:
IF NOT EXISTS(SELECT 1 FROM [sys].[types] st JOIN [sys].[schemas] ss ON st.schema_id = ss.schema_id
                WHERE st.name = N'CollectionPropertyNameType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[CollectionPropertyNameType] FROM [nvarchar](80) NULL
GO

-- EventHandler columns for Purpose, Property, Method
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventHandler]')
      AND [name] = N'Purpose')
   ALTER TABLE [dbo].[EventHandler] ADD
      [Purpose] [dbo].[DescriptionType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventHandler]')
      AND [name] = N'TriggeringProperty')
   ALTER TABLE [dbo].[EventHandler] ADD
      [TriggeringProperty] [dbo].[CollectionPropertyNameType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventHandler]')
      AND [name] = N'MethodToCall')
   ALTER TABLE [dbo].[EventHandler] ADD
      [MethodToCall] [dbo].[MethodNameType] NULL
GO


-- =======================
-- RS5337_2.sql
-- =======================
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TmpEventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[TmpEventHandler]')
      AND [name] = N'EditableByWizard')
   ALTER TABLE [dbo].[TmpEventHandler] ADD
      [EditableByWizard] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_TmpEventHandler_EditableByWizard] DEFAULT ((0))
      CONSTRAINT [CK_TmpEventHandler_EditableByWizard] CHECK ([EditableByWizard] IN (0,1))
GO

-- TmpEventHandler columns for Purpose, Property, Method
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TmpEventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[TmpEventHandler]')
      AND [name] = N'Purpose')
   ALTER TABLE [dbo].[TmpEventHandler] ADD
      [Purpose] [dbo].[DescriptionType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TmpEventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[TmpEventHandler]')
      AND [name] = N'TriggeringProperty')
   ALTER TABLE [dbo].[TmpEventHandler] ADD
      [TriggeringProperty] [dbo].[CollectionPropertyNameType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[TmpEventHandler]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[TmpEventHandler]')
      AND [name] = N'MethodToCall')
   ALTER TABLE [dbo].[TmpEventHandler] ADD
      [MethodToCall] [dbo].[MethodNameType] NULL
GO


-- =======================
-- RS5340.sql
-- =======================
/* UserNames -- Add UseEmailReplyTo */
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'UseEmailReplyTo')
   ALTER TABLE [dbo].[UserNames] ADD
      [UseEmailReplyTo] [dbo].[ListYesNoType] NOT NULL
         CONSTRAINT [DF_UserNames_UseEmailReplyTo] DEFAULT ((0))
         CONSTRAINT [CK_UserNames_UseEmailReplyTo] CHECK ([UseEmailReplyTo] IN (0,1))
GO


/* UserNames -- Add ReplyToEmailType */
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'ReplyToEmailType')
   ALTER TABLE [dbo].[UserNames] ADD
      [ReplyToEmailType] [dbo].[EmailTypeType] NULL
GO




-- =======================
-- RS5345.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'BODTemplateType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[BODTemplateType] FROM [nvarchar](max) NULL
GO

IF OBJECT_ID(N'[dbo].[BODTemplate]', N'U') IS NULL
CREATE TABLE [dbo].[BODTemplate](
   [TemplateName] [dbo].[NameType] NOT NULL,
   [Description] [dbo].[LongDescType] NULL,
   [Active] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_BODTemplate_Active] DEFAULT ((1))
      CONSTRAINT [CK_BODTemplate_Active] CHECK ([Active] IN (0,1)),
   [Template] [dbo].[BODTemplateType] NULL,
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_BODTemplate_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_BODTemplate_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_BODTemplate_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_BODTemplate_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_BODTemplate_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_BODTemplate_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_BODTemplate_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_BODTemplate_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_BODTemplate_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_BODTemplate] PRIMARY KEY CLUSTERED 
   (
      [TemplateName]
   ) ON [PRIMARY],
   CONSTRAINT [IX_BODTemplate_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) ON [PRIMARY]
) ON [PRIMARY]
GO


-- =======================
-- RS5354.sql
-- =======================
IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'LongRowPointerType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[LongRowPointerType] FROM NVARCHAR(450) NULL
GO

IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'LinkDatabaseType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[LinkDatabaseType] FROM NVARCHAR(50) NULL
GO

IF NOT EXISTS (
   SELECT 1 FROM sys.types st 
   JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'KeySequenceType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[KeySequenceType] FROM INTEGER NULL
GO

IF OBJECT_ID(N'[dbo].[IdoLinkedDatabase]', N'U') IS NULL
CREATE TABLE [dbo].[IdoLinkedDatabase] (
   [IdoLinkDatabase] [dbo].[LinkDatabaseType] NOT NULL,
   [DatabaseName] sysname NOT NULL,
   [OptimisticLockColumnName] sysname NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IdoLinkedDatabase_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_IdoLinkedDatabase_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_IdoLinkedDatabase_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_IdoLinkedDatabase_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IdoLinkedDatabase_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IdoLinkedDatabase_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_IdoLinkedDatabase_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IdoLinkedDatabase_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_IdoLinkedDatabase_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0)),
   CONSTRAINT [PK_IdoLinkedDatabase] PRIMARY KEY  CLUSTERED 
   (
      [IdoLinkDatabase]
   ), 
   CONSTRAINT [IX_IdoLinkedDatabase_RowPointer] UNIQUE  NONCLUSTERED 
   (
      [RowPointer]
   )
) ON [PRIMARY]
GO


IF OBJECT_ID(N'[dbo].[IdoLinkedTable]', N'U') IS NULL
CREATE TABLE [dbo].[IdoLinkedTable] (
   [IdoLinkDatabase] [dbo].[LinkDatabaseType] NOT NULL,
   [TableName] sysname NOT NULL, 
   [ViewName] sysname NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IdoLinkedTable_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_IdoLinkedTable_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_IdoLinkedTable_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_IdoLinkedTable_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IdoLinkedTable_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IdoLinkedTable_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_IdoLinkedTable_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IdoLinkedTable_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_IdoLinkedTable_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0)),
   CONSTRAINT [PK_IdoLinkedTable] PRIMARY KEY  CLUSTERED 
   (
      [IdoLinkDatabase]
    , [TableName]
   ), 
   CONSTRAINT [IX_IdoLinkedTable_View] UNIQUE
   (
      [ViewName]
   ), 
   CONSTRAINT [IX_IdoLinkedTable_RowPointer] UNIQUE  NONCLUSTERED 
   (
      [RowPointer]
   ),
   CONSTRAINT [FK_IdoLinkedTable_IdoLinkDatabase] FOREIGN KEY (IdoLinkDatabase) REFERENCES IdoLinkedDatabase (IdoLinkDatabase)
) ON [PRIMARY]
GO

IF OBJECT_ID(N'[dbo].[IdoLinkedColumn]', N'U') IS NULL
CREATE TABLE [dbo].[IdoLinkedColumn] (
   [IdoLinkDatabase] [dbo].[LinkDatabaseType] NOT NULL,
   [TableName] sysname NOT NULL, 
   [ColumnName] sysname NOT NULL,
   [ViewColumnName] sysname NOT NULL,
   [IsCharacter] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IdoLinkedColumn_IsCharacter] DEFAULT (0)
      CONSTRAINT [CK_IdoLinkedColumn_IsCharacter] CHECK ([IsCharacter]=(1) OR [IsCharacter]=(0)),
   [IsKey] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IdoLinkedColumn_IsKey] DEFAULT (0)
      CONSTRAINT [CK_IdoLinkedColumn_IsKey] CHECK ([IsKey]=(1) OR [IsKey]=(0)),
   [IsOptimisticLock] [dbo].[ListYesNoType] NOT NULL 
      CONSTRAINT [DF_IdoLinkedColumn_IsOptimisticLock] DEFAULT (0)
      CONSTRAINT [CK_IdoLinkedColumn_IsOptimisticLock] CHECK ([IsOptimisticLock]=(1) OR [IsOptimisticLock]=(0)),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IdoLinkedColumn_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_IdoLinkedColumn_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_IdoLinkedColumn_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_IdoLinkedColumn_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IdoLinkedColumn_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_IdoLinkedColumn_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_IdoLinkedColumn_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_IdoLinkedColumn_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_IdoLinkedColumn_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0)),
   CONSTRAINT [PK_IdoLinkedColumn] PRIMARY KEY  CLUSTERED 
   (
      [IdoLinkDatabase]
   ,  [TableName]
   ,  [ColumnName]
   ), 
   CONSTRAINT [IX_IdoLinkedColumn_RowPointer] UNIQUE  NONCLUSTERED 
   (
      [RowPointer]
   ),
   CONSTRAINT [IX_IdoLinkedColumn_ViewColumnName] UNIQUE  NONCLUSTERED 
   (
      [IdoLinkDatabase]
    , [TableName]
    , [ViewColumnName]
   ),
   CONSTRAINT [FK_IdoLinkedColumn_IdoLinkDatabase_TableName] FOREIGN KEY (IdoLinkDatabase, TableName) REFERENCES IdoLinkedTable(IdoLinkDatabase, TableName)
) ON [PRIMARY]
GO

IF OBJECT_ID(N'[dbo].[LongRowPointerMap]', N'U') IS NULL
CREATE TABLE [dbo].[LongRowPointerMap] (
   [ObjectName] sysname NOT NULL,
   [LongRowPointer] [dbo].[LongRowPointerType] NOT NULL,
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_LongRowPointerMap_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_LongRowPointerMap_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_LongRowPointerMap_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_LongRowPointerMap_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_LongRowPointerMap_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_LongRowPointerMap_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_LongRowPointerMap_RowPointer] DEFAULT (newid()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_LongRowPointerMap_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_LongRowPointerMap_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0)),
   CONSTRAINT [PK_LongRowPointerMap] PRIMARY KEY  CLUSTERED 
   (
      [LongRowPointer],
      [ObjectName]
   ), 
   CONSTRAINT [IX_LongRowPointerMap_RowPointer] UNIQUE  NONCLUSTERED 
   (
      [RowPointer]
   )
) ON [PRIMARY]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AppColumn]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
     WHERE [object_id] = OBJECT_ID(N'[dbo].[AppColumn]')
     AND [name] = N'KeySequence')
   ALTER TABLE [dbo].[AppColumn] ADD
     [KeySequence] [dbo].[KeySequenceType] NULL
        CONSTRAINT [CK_AppColumn_KeySequence] CHECK ([KeySequence] > 0)
GO


-- =======================
-- RS5668.sql
-- =======================
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'ColumnPrecisionType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ColumnPrecisionType] FROM [smallint] NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'ColumnScaleType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ColumnScaleType] FROM [tinyint] NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id
   WHERE st.name = N'PropertyClassType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[PropertyClassType] FROM NVARCHAR(80) NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'CollectionPropertyDataTypeType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[CollectionPropertyDataTypeType] FROM NVARCHAR(80) NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'CollectionPropertyNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[CollectionPropertyNameType] FROM NVARCHAR(80) NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'StringNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[StringNameType] FROM NVARCHAR(50) NULL
GO

IF OBJECT_ID('[dbo].[TmpStagingNewDataMaintenance]') IS NULL
CREATE TABLE [dbo].[TmpStagingNewDataMaintenance](
   [ProcessID] [dbo].[RowPointerType] NOT NULL,
   [TableIDOName] [dbo].[CollectionNameType] NOT NULL,
   [Name] [dbo].[CollectionPropertyNameType] NOT NULL,
   [ColumnDataType] [sysname] NOT NULL,
   [DataType] [dbo].[CollectionPropertyDataTypeType] NOT NULL,
   [PropertyLength] [dbo].[ColumnPrecisionType] NULL,
   [PropertyScale] [dbo].[ColumnScaleType] NULL,
   [LabelStringID] [dbo].[StringNameType] NULL,
   [PrimaryKey] [ListYesNoType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_PrimaryKey]  DEFAULT ((0))
      CONSTRAINT [CK_TmpStagingNewDataMaintenance_PrimaryKey] CHECK ([PrimaryKey] IN (0,1)),
   [PropertyClass] [dbo].[PropertyClassType] NULL,
   [Required] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_Required]  DEFAULT ((0)),
      CONSTRAINT [CK_TmpStagingNewDataMaintenance_Required] CHECK ([Required] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_CreatedBy] DEFAULT (suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_RecordDate] DEFAULT (getdate()),
   [RowPointer] [dbo].[RowPointerType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_TmpStagingNewDataMaintenance_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL
      CONSTRAINT [DF_TmpStagingNewDataMaintenance_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_TmpStagingNewDataMaintenance_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_TmpStagingNewDataMaintenance] PRIMARY KEY NONCLUSTERED 
   (
       [ProcessID]
     , [Name]
   ),
   CONSTRAINT [IX_TmpStagingNewDataMaintenance_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   ) ON [PRIMARY]
) ON [PRIMARY]
GO


-- =======================
-- RS5458_PortalAdministratorHome.sql
-- =======================
-- Add Index on EventMessage.Category
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessage]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[EventMessage]')
   AND   [name] = N'IX_EventMessage_Category')
   DROP INDEX [dbo].[EventMessage].[IX_EventMessage_Category]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessage]'), N'IsUserTable') = 1
   CREATE INDEX [IX_EventMessage_Category] ON [dbo].[EventMessage]
      (
         Category
      )
      WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

-- =======================
-- RS5314_2.sql
-- =======================
-- ApplicationMessages table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ApplicationMessages]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ApplicationMessages]')
      AND [name] = N'AccessAs')
BEGIN
   ALTER TABLE [dbo].[ApplicationMessages] ADD 
      [AccessAs] [dbo].[AccessAsType] NULL
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ApplicationMessages]')
   AND   [name] = N'IX_ApplicationMessages_AccessAs')
BEGIN
CREATE NONCLUSTERED INDEX [IX_ApplicationMessages_AccessAs] ON [dbo].[ApplicationMessages]
(
  [AccessAs] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
END

-- ObjectMainMessages table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjectMainMessages]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[ObjectMainMessages]')
      AND [name] = N'AccessAs')
BEGIN
   ALTER TABLE [dbo].[ObjectMainMessages] ADD 
      [AccessAs] [dbo].[AccessAsType] NULL
END
GO

IF NOT EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ObjectMainMessages]')
   AND   [name] = N'IX_ObjectMainMessages_AccessAs')
BEGIN
CREATE NONCLUSTERED INDEX [IX_ObjectMainMessages_AccessAs] ON [dbo].[ObjectMainMessages]
(
  [AccessAs] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
END


