
-- RS-8453
-- Add LocalTimeZone column to the UserNames table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserNames]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserNames]')
      AND [name] = N'LocalTimeZone')
BEGIN
   ALTER TABLE [dbo].[UserNames] ADD
      [LocalTimeZone] [dbo].[TimeZoneType] NULL
END
