IF EXISTS (SELECT 1
FROM TimeZoneData
WHERE TimeZone = 'India Standard Time'
AND OffsetMinutes < 0)
UPDATE TimeZoneData
SET OffsetMinutes = -1 * OffSetMinutes
, DstOffsetMinutes = -1 * DstOffsetMinutes
