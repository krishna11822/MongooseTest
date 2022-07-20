IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'TimeZoneData')
CREATE TABLE [dbo].[TimeZoneData] (
  [TimeZone] TimeZoneType NOT NULL 
, [OffsetMinutes] SmallIntType NOT NULL 
, [DstOffsetMinutes] SmallIntType NOT NULL 
, [DstStartMonth] SmallIntType NOT NULL 
, [DstStartWeek] SmallIntType NOT NULL 
, [DstStartDayOfWeek] SmallIntType NOT NULL 
, [DstEndMonth] SmallIntType NOT NULL 
, [DstEndWeek] SmallIntType NOT NULL 
, [DstEndDayOfWeek] SmallIntType NOT NULL 
, [CreatedBy] UsernameType NOT NULL CONSTRAINT [DF_TimeZoneData_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy] UsernameType NOT NULL CONSTRAINT [DF_TimeZoneData_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate] CurrentDateType NOT NULL CONSTRAINT [DF_TimeZoneData_CreateDate] DEFAULT (getdate())
, [RecordDate] CurrentDateType NOT NULL CONSTRAINT [DF_TimeZoneData_RecordDate] DEFAULT (getdate())
, [RowPointer] RowPointerType NOT NULL CONSTRAINT [DF_TimeZoneData_RowPointer] DEFAULT (newid())
, [NoteExistsFlag] FlagNyType NOT NULL CONSTRAINT [DF_TimeZoneData_NoteExistsFlag] DEFAULT ((0))
, [InWorkflow] FlagNyType NOT NULL CONSTRAINT [DF_TimeZoneData_InWorkflow] DEFAULT ((0))
, CONSTRAINT [CK_TimeZoneData_InWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0))
, CONSTRAINT [CK_TimeZoneData_NoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))
, CONSTRAINT [PK_TimeZoneData] PRIMARY KEY CLUSTERED ([TimeZone])
, CONSTRAINT [IX_TimeZoneData_RowPointer] UNIQUE NONCLUSTERED ([RowPointer])
)
GO

