/*MGD-3231    Change Headings for User Record Caps in Prefs and Process Defaults Updates the WinStudio 
Max Record Cap Headings to User Preferences Max Record Cap*/

DECLARE @NewDefaultTypeDesc36 ShortDescType = N'User Preferences Max Record Cap' 
IF (SELECT DefaultTypeDesc FROM DefaultTypes WHERE DefaultType = 36) <> @NewDefaultTypeDesc36
BEGIN

UPDATE pd SET pd.[DefaultTypeDesc] = @NewDefaultTypeDesc36 FROM DefaultTypes pd WHERE pd.DefaultType = 36

END