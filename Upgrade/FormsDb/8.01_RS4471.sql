-- =============================================================
--  RS #:   4471
--  Notes:  Toolset 6.02 Forms DB Upgrade Script
--          Adjusting "ActiveXComponentProperties.Properties"
--          column data type, changing to nvarchar(MAX).
-- =============================================================
DECLARE
  @ColType      INT
, @ColLen       INT

SELECT
  @ColType = ISNULL( [xtype],  0 )
, @ColLen  = ISNULL( [length], 0 )
FROM [dbo].[syscolumns]
WHERE [name] = N'Properties' AND
      [id]   = OBJECT_ID( N'[dbo].[ActiveXComponentProperties]' )

IF ( ( @ColType != 231 ) OR ( @ColLen != -1 ) )
BEGIN
   DELETE FROM [dbo].[ActiveXComponentProperties]

   IF EXISTS ( SELECT 1 FROM [sys].[stats] WHERE [name] = N'Properties' AND object_id = OBJECT_ID( N'[dbo].[ActiveXComponentProperties]' ) )
      DROP STATISTICS [dbo].[ActiveXComponentProperties].[Properties]

   IF EXISTS ( SELECT 1 FROM [dbo].[syscolumns] WHERE [name] = N'Properties' AND [id] = OBJECT_ID( N'[dbo].[ActiveXComponentProperties]' ) )
      ALTER TABLE [dbo].[ActiveXComponentProperties] DROP COLUMN [Properties]

   IF NOT EXISTS ( SELECT 1 FROM [dbo].[syscolumns] WHERE [name] = N'Properties' AND [id] = OBJECT_ID( N'[dbo].[ActiveXComponentProperties]' ) )
      ALTER TABLE [dbo].[ActiveXComponentProperties] ADD Properties nvarchar(MAX) NULL
END
GO