IF NOT EXISTS (SELECT 1
  FROM EventTrigger
  WHERE RowPointer = 'BE21ABA2-AC91-45CE-B3C2-4DFA85E644B9')
INSERT INTO EventTrigger (EventName, AccessAs, RequestedBy, ConfigurationName, Active, Condition, FailureRetestInterval, SuccessRetestInterval, Transactional, RowPointer)
VALUES (N'TaskListCheck', N'Core', N'sa', NULL, 1, 'CONDITION(TRUE)', 60, 60, 1, 'BE21ABA2-AC91-45CE-B3C2-4DFA85E644B9')
ELSE
UPDATE EventTrigger
SET ConfigurationName = NULL
WHERE RowPointer = 'BE21ABA2-AC91-45CE-B3C2-4DFA85E644B9'
GO
