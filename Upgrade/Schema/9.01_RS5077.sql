IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'EventSessionTally')
CREATE TABLE [dbo].[EventSessionTally] (
  [SessionID] RowPointerType NOT NULL 
, [EventStateRowPointer] RowPointerType NOT NULL 
, [EventHandlerStateRowPointer] RowPointerType NOT NULL 
, [ActionSequence] EventSequenceType NOT NULL 
, [Choices] MessageResponseChoicesType NOT NULL 
, [Result] MessageResponseChoiceType NULL
, [FormattedResult] MessageResponseChoiceType NULL
, [Choice] MessageResponseChoiceType NOT NULL
, [Votes] INT NOT NULL
, [FrontRunner] ListYesNoType NOT NULL
, [Tied] ListYesNoType NOT NULL
, [Margin] EventVotingMarginType NOT NULL
, [VotesToWin] INT NOT NULL
, [Status] EventVotingChoiceStatusType NULL
, [CreatedBy] UsernameType NOT NULL CONSTRAINT [DF_EventSessionTally_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy] UsernameType NOT NULL CONSTRAINT [DF_EventSessionTally_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate] CurrentDateType NOT NULL CONSTRAINT [DF_EventSessionTally_CreateDate] DEFAULT (getdate())
, [RecordDate] CurrentDateType NOT NULL CONSTRAINT [DF_EventSessionTally_RecordDate] DEFAULT (getdate())
, [RowPointer] RowPointerType NOT NULL CONSTRAINT [DF_EventSessionTally_RowPointer] DEFAULT (newid())
, [NoteExistsFlag] FlagNyType NOT NULL CONSTRAINT [DF_EventSessionTally_NoteExistsFlag] DEFAULT ((0))
, [InWorkflow] FlagNyType NOT NULL CONSTRAINT [DF_EventSessionTally_InWorkflow] DEFAULT ((0))
, CONSTRAINT [IX_EventSessionTally_RowPointer] UNIQUE NONCLUSTERED ([RowPointer])
, CONSTRAINT [PK_EventSessionTally] PRIMARY KEY CLUSTERED ([SessionID], [EventStateRowPointer], [EventHandlerStateRowPointer], [Choice])
)
