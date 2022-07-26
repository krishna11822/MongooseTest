SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF object_id('dbo.FKOneSp') IS NOT NULL
   DROP PROCEDURE dbo.FKOneSp
GO
/* $Header: ApplicationDB\Stored Procedures\FKOneSp.sp 10.1.0.1 03/30/2018 14:27:36 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/FKOneSp.sp $
 *
 * CoreDev 3 225842 Djohnson Mon Apr 03 18:32:37 2017
 * Code returned by FKOneSp should bracket table, constraint, and column names.
 * Issue #225842 - quote everything but Shakespeare
 *
 * CoreDev 2 RS5905 Jray Fri Apr 26 13:13:28 2013
 * RS5905: Made changes to increase performance
 *
 * CoreDev 1 RS5905 Jray Wed Apr 24 15:34:44 2013
 * RS5905: Move FKOneSp from SL to Core to support use-case when going from unpartitioned db to partitioned db.
 *
 * SL8.04 10 RS4615 jray Mon Jan 28 16:34:24 2013
 * RS4615: Change NVARCHAR(4000) to NVARCHAR(max) in 4 places
 *
 * SL8.02 9 rs4588 Dahn Thu Mar 04 13:12:30 2010
 * RS4588 Copyright header changes.
 *
 * SL8.01 8 rs3953 Vlitmano Tue Aug 26 16:52:54 2008
 * RS3953 - Changed a Copyright header?
 *
 * SL8.01 7 rs3953 Vlitmano Mon Aug 18 15:15:19 2008
 * Changed a Copyright header information(RS3959)
 *
 * SL8.00 6 RS2968 nkaleel Fri Feb 23 02:41:55 2007
 * changing copyright information
 *
 * SL8.00 5 RS2968 prahaladarao.hs Thu Jul 13 03:00:14 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 4 RS2968 prahaladarao.hs Tue Jul 11 07:56:27 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * SL7.05 3 91818 NThurn Fri Jan 06 15:19:31 2006
 * Inserted standard External Touch Point call.  (RS3177)
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.FKOneSp (
  @Table SYSNAME
, @Drop INT = 1
, @Create INT = 1
, @FKDropCode  NVARCHAR(max) OUTPUT
, @FKAddCode   NVARCHAR(max) OUTPUT
, @IncludeNOCHECKForAdd ListYesNoType = 0
)
AS

   -- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
   IF OBJECT_ID(N'dbo.EXTGEN_FKOneSp') IS NOT NULL
   BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_FKOneSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      EXEC @EXTGEN_SpName
         @Table
         , @Drop
         , @Create
         , @FKDropCode OUTPUT
         , @FKAddCode OUTPUT
         , @IncludeNOCHECKForAdd
 
      -- ETP routine must take over all desired functionality of this standard routine:
      RETURN 0
   END
   -- End of Generic External Touch Point code.

DECLARE @TableID int = OBJECT_ID(@Table) 

DECLARE
  @DropCodeLines TABLE (
  CodeLine NVARCHAR(max)
, RowPointer INT IDENTITY)

DECLARE
  @AddCodeLines TABLE (
  CodeLine NVARCHAR(max)
, RowPointer INT IDENTITY)

IF @Drop = 1
BEGIN
INSERT INTO @DropCodeLines (CodeLine)
select 'ALTER TABLE ' + quotename(schema_name(so.uid)) + N'.' + quotename(object_name(fkeyid)) + ' DROP CONSTRAINT ' + quotename(object_name(constid))
from sysreferences sr
inner join sysobjects so on
  so.id = sr.fkeyid
where rkeyid = @TableID
END

IF @Create = 1
BEGIN
INSERT INTO @AddCodeLines (CodeLine)
select 'ALTER TABLE ' + quotename(schema_name(so.uid)) + N'.' + quotename(object_name(fkeyid)) + 
CASE WHEN @IncludeNOCHECKForAdd = 1 THEN N' WITH NOCHECK' ELSE '' END +
' ADD CONSTRAINT ' + quotename(object_name(constid)) + '
FOREIGN KEY (' + QUOTENAME(COL_NAME (fkeyid, fkey1)) +
CASE WHEN fkey2 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey2))
  ELSE ''
END +
CASE WHEN fkey3 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey3))
  ELSE ''
END +
CASE WHEN fkey4 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey4))
  ELSE ''
END +
CASE WHEN fkey5 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey5))
  ELSE ''
END +
CASE WHEN fkey6 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey6))
  ELSE ''
END +
CASE WHEN fkey7 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey7))
  ELSE ''
END +
CASE WHEN fkey8 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey8))
  ELSE ''
END +
CASE WHEN fkey9 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey9))
  ELSE ''
END +
CASE WHEN fkey9 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey9))
  ELSE ''
END +
CASE WHEN fkey10 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey10))
  ELSE ''
END +
CASE WHEN fkey11 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey11))
  ELSE ''
END +
CASE WHEN fkey12 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey12))
  ELSE ''
END +
CASE WHEN fkey13 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey13))
  ELSE ''
END +
CASE WHEN fkey14 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey14))
  ELSE ''
END +
CASE WHEN fkey15 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey15))
  ELSE ''
END +
CASE WHEN fkey16 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(fkeyid, fkey16))
  ELSE ''
END +
') REFERENCES ' + quotename(schema_name(so2.uid)) + N'.' + quotename(object_name(rkeyid)) + ' (
' +
QUOTENAME(COL_NAME (rkeyid, rkey1)) +
CASE WHEN rkey2 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey2))
  ELSE ''
END +
CASE WHEN rkey3 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey3))
  ELSE ''
END +
CASE WHEN rkey4 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey4))
  ELSE ''
END +
CASE WHEN rkey5 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey5))
  ELSE ''
END +
CASE WHEN rkey6 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey6))
  ELSE ''
END +
CASE WHEN rkey7 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey7))
  ELSE ''
END +
CASE WHEN rkey8 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey8))
  ELSE ''
END +
CASE WHEN rkey9 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey9))
  ELSE ''
END +
CASE WHEN rkey10 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey10))
  ELSE ''
END +
CASE WHEN rkey11 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey11))
  ELSE ''
END +
CASE WHEN rkey12 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey12))
  ELSE ''
END +
CASE WHEN rkey13 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey13))
  ELSE ''
END +
CASE WHEN rkey14 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey14))
  ELSE ''
END +
CASE WHEN rkey15 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey15))
  ELSE ''
END +
CASE WHEN rkey16 != 0 THEN
  ', ' + QUOTENAME(COL_NAME(rkeyid, rkey16))
  ELSE ''
END +

')' +
CASE WHEN rc.DELETE_RULE = 'CASCADE' THEN ' ON DELETE CASCADE '
ELSE ''
END + ''
from sysreferences sr
inner join sysobjects so on
  so.id = sr.fkeyid
inner join sysobjects so2 on
  so2.id = sr.rkeyid
INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS rc ON
  rc.CONSTRAINT_NAME = OBJECT_NAME(sr.constid)
where rkeyid = @TableID
END

SET @FKDropCode = ''
SELECT
  @FKDropCode = @FKDropCode + CodeLine + NCHAR(10)
FROM @DropCodeLines
ORDER BY RowPointer

SET @FKAddCode = ''
SELECT
  @FKAddCode = @FKAddCode + CodeLine + NCHAR(10)
FROM @AddCodeLines
ORDER BY RowPointer

RETURN 0
GO
