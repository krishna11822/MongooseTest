SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.StringLines') IS NOT NULL
   DROP FUNCTION dbo.StringLines
GO
-- This function splits a string consisting of multiple lines into a set of rows,
-- one per line, after performing a number of replacements.

/* $Header: ApplicationDB\PreTableObjects\StringLines.sp 10.8.0.0 10/29/2018 13:51:49 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/StringLines.sp $
 *
 * Core90310 7 228987 Jmorris Tue May 23 08:39:10 2017
 * Temporary fix for build
 * 228987 - remove GO from comment
 *
 * Core90310 6 228856 Nthurn Fri May 19 15:11:10 2017
 * Function "StringLines" will cut content when it's length is greater than 4000
 *
 * CoreDev 5 rs4588 Dahn Mon Mar 08 08:06:33 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 4 rs3953 Dahn Tue Aug 26 16:50:12 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 3 rs3953 Vlitmano Mon Aug 18 15:57:32 2008
 * Changed a Copyright header information(RS3959)
 *
 * SL8.00 4 RS2968 prahaladarao.hs Thu Jul 13 01:24:23 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 3 RS2968 prahaladarao.hs Tue Jul 11 03:00:03 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * SL7.05 1 90206 thurnic Fri Nov 11 08:59:58 2005
 * Optimize Insert & Update Triggers
 * Split a string consisting of multiple lines into a set of rows, one per line, after performing a number of replacements.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.StringLines (
   @Lines nvarchar(MAX)
 , @IgnoreLeadingEmptyLine BIT = 1
 , @Indent nvarchar(MAX) = N''
 , @Replace1 nvarchar(MAX) = N''
 , @With1 nvarchar(MAX) = N''
 , @Replace2 nvarchar(MAX) = N''
 , @With2 nvarchar(MAX) = N''
 , @Replace3 nvarchar(MAX) = N''
 , @With3 nvarchar(MAX) = N''
)
RETURNS @Output TABLE (
   LineNumber int IDENTITY,
   Line nvarchar(MAX),
   PRIMARY KEY (LineNumber)
   )
AS
BEGIN
   SET @Indent = ISNULL(@Indent, N'')
   SET @Replace1 = ISNULL(@Replace1, N'')
   SET @With1 = ISNULL(@With1, N'')
   SET @Replace2 = ISNULL(@Replace2, N'')
   SET @With2 = ISNULL(@With2, N'')
   SET @Replace3 = ISNULL(@Replace3, N'')
   SET @With3 = ISNULL(@With3, N'')

   DECLARE @crlf nchar(2)
   SET @crlf = CHAR(13) + CHAR(10)

   -- Allow constant strings to be passed in like this:
   --    EXEC StringLines N'
   -- First Line of String
   -- Second Line of String
   -- '
   -- So the line indentation is unaffected by the syntax of the usage.
   IF @IgnoreLeadingEmptyLine = 1
   BEGIN
      IF SUBSTRING(@Lines, 1, LEN(@crlf)) = @crlf
         SET @Lines = SUBSTRING(@Lines, LEN(@crlf) + 1, LEN(@Lines))
      -- This was unnecessary:
      -- (The example above does not seem to end with @crlf?)
--       IF SUBSTRING(@Lines, LEN(@Lines) - LEN(@crlf) + 1, LEN(@crlf)) = @crlf
--          SET @Lines = SUBSTRING(@Lines, 1, LEN(@Lines) - LEN(@crlf))
   END

   WHILE @Lines <> N''
   BEGIN
      DECLARE @EOLpos int
      SET @EOLpos = CHARINDEX(@crlf, @Lines)
      IF @EOLpos > 0
      BEGIN
         INSERT INTO @Output (Line) VALUES (
            @Indent + REPLACE(REPLACE(REPLACE(SUBSTRING(@Lines, 1, @EOLpos - 1), @Replace1, @With1), @Replace2, @With2), @Replace3, @With3)
            )
         SET @Lines = SUBSTRING(@Lines, @EOLpos + LEN(@crlf), LEN(@Lines))
      END
      ELSE
      BEGIN
         INSERT INTO @Output (Line) VALUES (
            @Indent + REPLACE(REPLACE(REPLACE(@Lines, @Replace1, @With1), @Replace2, @With2), @Replace3, @With3)
            )
         SET @Lines = N''
      END
   END

   RETURN
END
GO

-- Testing:
/*
SELECT *
FROM dbo.StringLines(N'
*
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
*
 * 
 * CoreDev 5 rs4588 Dahn Mon Mar 08 08:06:33 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 4 rs3953 Dahn Tue Aug 26 16:50:12 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 3 rs3953 Vlitmano Mon Aug 18 15:57:32 2008
 * Changed a Copyright header information(RS3959)
 *
 * SL8.00 4 RS2968 prahaladarao.hs Thu Jul 13 01:24:23 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 3 RS2968 prahaladarao.hs Tue Jul 11 03:00:03 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * SL7.05 1 90206 thurnic Fri Nov 11 08:59:58 2005
 * Optimize Insert & Update Triggers
 * Split a string consisting of multiple lines into a set of rows, one per line, after performing a number of replacements.
 *
 *
CREATE FUNCTION dbo.StringLines (
   @Lines nvarchar(MAX)
 , @IgnoreLeadingEmptyLine BIT = 1
 , @Indent nvarchar(MAX) = N""
 , @Replace1 nvarchar(MAX) = N""
 , @With1 nvarchar(MAX) = N""
 , @Replace2 nvarchar(MAX) = N""
 , @With2 nvarchar(MAX) = N""
 , @Replace3 nvarchar(MAX) = N""
 , @With3 nvarchar(MAX) = N""
)
RETURNS @Output TABLE (
   LineNumber int IDENTITY,
   Line nvarchar(MAX),
   PRIMARY KEY (LineNumber)
   )
AS
BEGIN
   SET @Indent = ISNULL(@Indent, N"")
   SET @Replace1 = ISNULL(@Replace1, N"")
   SET @With1 = ISNULL(@With1, N"")
   SET @Replace2 = ISNULL(@Replace2, N"")
   SET @With2 = ISNULL(@With2, N"")
   SET @Replace3 = ISNULL(@Replace3, N"")
   SET @With3 = ISNULL(@With3, N"")

   DECLARE @crlf nchar(2)
   SET @crlf = CHAR(13) + CHAR(10)

   -- Allow constant strings to be passed in like this:
   --    EXEC StringLines N"
   -- First Line of String
   -- Second Line of String
   -- "
   -- So the line indentation is unaffected by the syntax of the usage.
   IF @IgnoreLeadingEmptyLine = 1
   BEGIN
      IF SUBSTRING(@Lines, 1, LEN(@crlf)) = @crlf
         SET @Lines = SUBSTRING(@Lines, LEN(@crlf) + 1, LEN(@Lines))
      -- This was unnecessary:
      -- (The example above does not seem to end with @crlf?)
--       IF SUBSTRING(@Lines, LEN(@Lines) - LEN(@crlf) + 1, LEN(@crlf)) = @crlf
--          SET @Lines = SUBSTRING(@Lines, 1, LEN(@Lines) - LEN(@crlf))
   END

   WHILE @Lines <> N""
   BEGIN
      DECLARE @EOLpos int
      SET @EOLpos = CHARINDEX(@crlf, @Lines)
      IF @EOLpos > 0
      BEGIN
         INSERT INTO @Output (Line) VALUES (
            @Indent + REPLACE(REPLACE(REPLACE(SUBSTRING(@Lines, 1, @EOLpos - 1), @Replace1, @With1), @Replace2, @With2), @Replace3, @With3)
            )
         SET @Lines = SUBSTRING(@Lines, @EOLpos + LEN(@crlf), LEN(@Lines))
      END
      ELSE
      BEGIN
         INSERT INTO @Output (Line) VALUES (
            @Indent + REPLACE(REPLACE(REPLACE(@Lines, @Replace1, @With1), @Replace2, @With2), @Replace3, @With3)
            )
         SET @Lines = N""
      END
   END

   RETURN
END

', 0, N'INDENT!  ',
'ELSE', 'Otherwise',
'nvarchar', 'String',
'SET ', 'Assign')
 */

