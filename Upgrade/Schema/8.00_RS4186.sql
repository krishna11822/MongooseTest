-- Table parms
-- Add new column default_ending_from_starting
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[parms]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[parms]')
      AND [name] = N'default_ending_from_starting')
   ALTER TABLE [dbo].[parms] ADD
      [default_ending_from_starting] [dbo].[ListYesNoType] NOT NULL
      CONSTRAINT [DF_parms_default_ending_from_starting] DEFAULT (0)
      CONSTRAINT [CK_parms_default_ending_from_starting] CHECK ([default_ending_from_starting] IN (0,1))
GO

-- Table parms_all
-- Add new column default_ending_from_starting
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[parms_all]'), N'IsUserTable') = 1
   TRUNCATE TABLE [dbo].[parms_all]
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[parms_all]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[parms_all]')
      AND [name] = N'default_ending_from_starting')
   ALTER TABLE [dbo].[parms_all] ADD
      [default_ending_from_starting] [dbo].[ListYesNoType] NOT NULL
GO