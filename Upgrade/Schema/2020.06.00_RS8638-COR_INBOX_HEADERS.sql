IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[COR_INBOX_HEADERS]') AND name = N'IX_COR_INBOX_HEADERS_C_HEADER_KEY')
CREATE NONCLUSTERED INDEX [IX_COR_INBOX_HEADERS_C_HEADER_KEY] ON [dbo].[COR_INBOX_HEADERS]
(
	[C_HEADER_KEY] ASC
)INCLUDE([C_INBOX_ID], [C_HEADER_VALUE])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO