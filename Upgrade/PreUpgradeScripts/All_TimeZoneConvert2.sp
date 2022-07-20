SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.TimeZoneConvert2') IS NOT NULL
   DROP FUNCTION dbo.TimeZoneConvert2
GO
--  Given an input datetime, a from time zone, and a to time zone, the
-- conversion is done.  Daylight savings time is the majority of the pain
-- in the algorithmn.

/* $Header: ApplicationDB\PreTableObjects\TimeZoneConvert2.sp 10.8.0.0 10/29/2018 13:51:49 */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/


/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/TimeZoneConvert2.sp $
 *
 * CoreDev 2 RS7568 Djohnson Wed Oct 28 11:48:48 2015
 * RS7568 - blow up if time zones do not exist.
 *
 * CoreDev 1 185911 Djohnson Fri Oct 03 16:28:22 2014
 * TimeZone sqlclr - can it be gotten rid of?
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.TimeZoneConvert2 (
  @inDate datetime
, @fromTZ TimeZoneType
, @toTZ TimeZoneType)
RETURNS datetime
AS
BEGIN
DECLARE 
  @StartDate1 datetime
, @StartDate2 datetime
, @EndDate1 datetime
, @EndDate2 datetime
, @Offset1 int
, @Offset2 int
, @DstOffset1 int
, @DstOffset2 int
, @StartMonth1 int
, @StartMonth2 int
, @StartDay1 int
, @StartDay2 int
, @StartDayOfWeek1 int
, @StartDayOfWeek2 int
, @EndMonth1 int
, @EndMonth2 int
, @EndDay1 int
, @EndDay2 int
, @EndDayOfWeek1 int
, @EndDayOfWeek2 int

--  Add 1 to the day of week because system time has Sunday at 0, SQL has it
-- at 1.
SELECT
  @StartMonth1 = t1.DstStartMonth
, @StartDay1 = t1.DstStartWeek
, @StartDayOfWeek1 = t1.DstStartDayOfWeek + 1
, @EndMonth1 = t1.DstEndMonth
, @EndDay1 = t1.DstEndWeek
, @EndDayOfWeek1 = t1.DstEndDayOfWeek + 1
, @Offset1 = t1.OffsetMinutes
, @DstOffset1 = t1.DstOffsetMinutes
, @StartMonth2 = t2.DstStartMonth
, @StartDay2 = t2.DstStartWeek
, @StartDayOfWeek2 = t2.DstStartDayOfWeek + 1
, @EndMonth2 = t2.DstEndMonth
, @EndDay2 = t2.DstEndWeek
, @EndDayOfWeek2 = t2.DstEndDayOfWeek + 1
, @Offset2 = t2.OffsetMinutes
, @DstOffset2 = t2.DstOffsetMinutes
FROM TimeZoneData t1
INNER JOIN TimeZoneData t2 ON t2.TimeZone = @toTZ
WHERE t1.TimeZone = @fromTZ
IF @@rowcount = 0
BEGIN
   DECLARE @msg NVARCHAR(MAX)
   SET @msg = 'Failed during time zone convert, no from time zone ' + @fromTZ + ' to time zone ' + @toTZ + ' record found in TimeZoneData.'
   SET @StartMonth1 = cast(@msg as int)
END

--  If the Daylight Savings time info is the same for the two time zones, don't bother doing those checks and adjustments.
IF NOT (@StartDay2 = @StartDay1 AND @StartDayOfWeek2 = @StartDayOfWeek1
  AND @StartMonth2 = @StartMonth1
  AND @DstOffset2 = @DstOffset1)
BEGIN
-- This means use the last xDay of the month as opposed to first, second,
-- third, or fourth.  Add a month.  Subtract the day number from that month
-- to backup to the last day of the current month again.  Adjust to the proper
-- day of the week.
IF @StartDay1 > 4
BEGIN
   SET @StartDate1 = dateadd(month,@StartMonth1-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @StartDate1 = dateadd(month,1,@StartDate1) -- Next month
   SET @StartDate1 = @StartDate1 - DAY(@StartDate1)   -- Last day of this month
   SET @StartDate1 = dateadd(dd,@StartDayOfWeek1-datepart(weekday, @StartDate1), @StartDate1)
END
-- Get to the first day of the month of the inDate year.
-- Add the number of days from the first day to the day of the week desired.
ELSE IF @StartDay1 > 0
BEGIN
   SET @StartDate1 = dateadd(month,@StartMonth1-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @StartDate1 = (@StartDay1 - 1)*7 + -- add weeks to get second, third, etc.
      @startDate1 + (@StartDayOfWeek1 + 7 - DATEPART(dw,@StartDate1))%7 
END

IF @EndDay1 > 4
BEGIN
   SET @EndDate1 = dateadd(month,@EndMonth1-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @EndDate1 = dateadd(month,1,@EndDate1) -- Next month
   SET @EndDate1 = @EndDate1 - DAY(@EndDate1)  -- Last day of this month
   SET @EndDate1 = dateadd(dd,@EndDayOfWeek1-datepart(weekday, @EndDate1), @EndDate1) 
END
ELSE IF @EndDay1 > 0
BEGIN
   SET @EndDate1 = dateadd(month,@EndMonth1-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @EndDate1 = (@EndDay1 - 1)*7 + -- add weeks to get second, third, etc.
      @EndDate1 + (@EndDayOfWeek1 + 7 - DATEPART(dw,@EndDate1))%7 
END

IF @StartDay2 = @StartDay1 AND @StartDayOfWeek2 = @StartDayOfWeek1
  AND @StartMonth2 = @StartMonth1
   SET @StartDate2 = @StartDate1
ELSE IF @StartDay2 > 4
BEGIN
   SET @StartDate2 = dateadd(month,@StartMonth2-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @StartDate2 = dateadd(month,1,@StartDate2) -- Next month
   SET @StartDate2 = @StartDate2 - DAY(@StartDate2) -- Last day of this month
   SET @StartDate2 = dateadd(dd,@StartDayOfWeek2-datepart(weekday, @StartDate2), @StartDate2) + 0.0833333333 -- the last bit is for 2:00 AM
END
ELSE IF @StartDay2 > 0
BEGIN
   SET @StartDate2 = dateadd(month,@StartMonth2-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @StartDate2 = (@StartDay2 - 1)*7 + -- add weeks to get second, third, etc.
      @StartDate2 + (@StartDayOfWeek2 + 7 - DATEPART(dw,@StartDate2))%7 + 0.0833333333 -- the last bit is for 2:00 AM
END

IF @EndDay2 = @EndDay1 AND @EndDayOfWeek2 = @EndDayOfWeek1
  AND @EndMonth2 = @EndMonth1
   SET @EndDate2 = @EndDate1
ELSE IF @EndDay2 > 4
BEGIN
   SET @EndDate2 = dateadd(month,@EndMonth2-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @EndDate2 = dateadd(month,1,@EndDate2) -- Next month
   SET @EndDate2 = @EndDate2 - DAY(@EndDate2) -- Last day of this month
   SET @EndDate2 = dateadd(dd,@EndDayOfWeek2-datepart(weekday, @EndDate2), @EndDate2) + 0.0833333333 -- the last bit is for 2:00 AM
END
ELSE IF @EndDay2 > 0
BEGIN
   SET @EndDate2 = dateadd(month,@EndMonth2-1,dateadd(year, datepart(year,@inDate)-1900,0))
   SET @EndDate2 = (@EndDay2 - 1)*7 + -- add weeks to get second, third, etc.
      @EndDate2 + (@EndDayOfWeek2 + 7 - DATEPART(dw,@EndDate2))%7 + 0.0833333333 -- the last bit is for 2:00 AM
END

-- Northern hemisphere, Daylight Savings Time is between start and end.
-- Souther hemisphere, non-Daylight Savings Time is between start and end.
IF @StartMonth1 < @EndMonth1
BEGIN
   IF @inDate between @StartDate1 and @EndDate1
      SET @Offset1 = @Offset1 + @DstOffset1
END
ELSE
BEGIN
   IF @inDate > @StartDate1 OR @InDate < @EndDate1
      SET @Offset1 = @Offset1 + @DstOffset1
END
IF @StartMonth2 < @EndMonth2
BEGIN
   IF @inDate between @StartDate2 and @EndDate2
   BEGIN
      SET @Offset2 = @Offset2 + @DstOffset2
   END
END
ELSE
BEGIN
   IF @inDate > @StartDate2 OR @InDate < @EndDate2
   BEGIN
      SET @Offset2 = @Offset2 + @DstOffset2
   END
END
END

RETURN DATEADD(MI, @Offset1 - @Offset2, @inDate)
END
GO

