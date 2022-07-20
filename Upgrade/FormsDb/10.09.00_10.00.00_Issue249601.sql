-- 24960 - fix collection commit flag on report type forms
UPDATE Forms 
SET Flags |= 0x00000008
WHERE Type = 6
AND Flags & 0x0000008 = 0
