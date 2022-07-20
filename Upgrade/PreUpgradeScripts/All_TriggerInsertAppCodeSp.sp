SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.TriggerInsertAppCodeSp') IS NOT NULL
   DROP PROCEDURE dbo.TriggerInsertAppCodeSp
GO

/* $Header: ApplicationDB\Stored Procedures\TriggerInsertAppCodeSp.sp 10.1.0.1 03/30/2018 14:27:37 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/TriggerInsertAppCodeSp.sp $
 *
 * CoreDev 6 248405 DJohnson Thu Oct 04
 * Add dbo. schema to path where missing.
 *
 * CoreDev 5 RS7915 Dlai Thu Mar 02 05:16:48 2017
 * RS7915 
 *
 * CoreDev 4 RS7915 Dlai Thu Mar 02 05:04:51 2017
 * RS7915 Use substring to avoid the search string lenght limit when using replace
 *
 * CoreDev 3 RS7915 Dlai Wed Mar 01 02:57:28 2017
 * RS7915 Use EXEC sp_executesql @FromContent insert of EXEC  @FromContent
 *
 * CoreDev 2 RS7915 Dlai Mon Feb 27 20:59:36 2017
 * RS7915 Remove the logic of external touch point for optional module since the table 'optional_module' dose not exist in core
 *
 * CoreDev 1 RS7915 Dlai Fri Feb 17 02:30:44 2017
 * RS7915 Add sp to modify core trigge and it will be called by sp TriggerIupCodeWrapperSp
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.TriggerInsertAppCodeSp (
  @Infobar         InfobarType OUTPUT
)
AS

-- Check for existence of Generic External Touch Point routine (this section was generated and inserted by CallALTETPs.exe):
IF OBJECT_ID(N'dbo.EXTGEN_TriggerInsertAppCodeSp') IS NOT NULL
BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_TriggerInsertAppCodeSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      DECLARE @EXTGEN_Severity int
      EXEC @EXTGEN_Severity = @EXTGEN_SpName
           @Infobar   OUTPUT

   
      -- ETP routine can RETURN 1 to signal that the remainder of this standard routine should now proceed:
      IF @EXTGEN_Severity <> 1
         RETURN @EXTGEN_Severity
END
-- End of Generic External Touch Point code.
-- End of CallALTETPs.exe generated code.

DECLARE @Severity                    INT
DECLARE @SpContainingAppSpecificCode ObjectNameType
DECLARE @TriggerName                 ObjectNameType
DECLARE @FromContent                 NVARCHAR(MAX)
DECLARE @ToContent                   NVARCHAR(MAX)
DECLARE @FromReplace                 NVARCHAR(MAX)
DECLARE @ToReplace                   NVARCHAR(MAX)
DECLARE @Header                      ObjectNameType
DECLARE @Footer                      ObjectNameType
DECLARE @AppHeader                   ObjectNameType
DECLARE @AppFooter                   ObjectNameType

DECLARE @Comment                     ObjectNameType
DECLARE @CreateTrigger               ObjectNameType
DECLARE @AlterTrigger                ObjectNameType

SET @Severity  = 0
SET @Header        = '--<APPLICATION_SPECIFIC_CODE_BEGIN>'
SET @Footer        = '--<APPLICATION_SPECIFIC_CODE_END>'
SET @Comment       = '--<DO NOT MANUALLY CHANGE APP SPECIFIC CODE>'
SET @AppHeader     = '/*APPLICATION_SPECIFIC_CODE_BEGIN'
SET @AppFooter     = 'APPLICATION_SPECIFIC_CODE_END */'

SET @CreateTrigger = 'CREATE TRIGGER' 
SET @AlterTrigger  = 'ALTER TRIGGER'

DECLARE apptrigger_cursor CURSOR GLOBAL STATIC FOR
SELECT TriggerName, SpContainingAppSpecificCode 
FROM apptrigger

OPEN apptrigger_cursor
WHILE 1=1
BEGIN
   FETCH apptrigger_cursor
   INTO 
     @TriggerName
   , @SpContainingAppSpecificCode

   IF @@FETCH_STATUS = -1 
      BREAK

   BEGIN TRY
      SET @FromContent = NULL
      SET @ToContent   = NULL
	  
      SELECT @FromContent = COALESCE(@FromContent , '') + ISNULL(dbo.sysComments.Text,'')
      FROM  dbo.SysObjects INNER JOIN 
            dbo.sysComments ON 
            dbo.SysObjects.ID = dbo.sysComments.ID
      WHERE dbo.SysObjects.Name = @TriggerName

      SELECT @ToContent = COALESCE(@ToContent , '') + ISNULL(dbo.sysComments.Text,'')
      FROM  dbo.SysObjects INNER JOIN 
            dbo.sysComments ON 
            dbo.SysObjects.ID = dbo.sysComments.ID
      WHERE dbo.SysObjects.Name = @SpContainingAppSpecificCode


      SET @FromContent =  SUBSTRING(@FromContent,0,CHARINDEX(@Header,@FromContent) + LEN(@Header)) 
	                     + char(10) + @Comment + char(10) 
						 + SUBSTRING(@FromContent, CHARINDEX(@Footer,@FromContent), LEN(@FromContent) -  CHARINDEX(@Footer,@FromContent) + LEN(@Footer))

      IF  ( CHARINDEX(@Header,@FromContent) > 0 AND CHARINDEX(@Footer,@FromContent)  >0 )
      AND ( CHARINDEX(@AppHeader,@ToContent) > 0 AND CHARINDEX(@AppFooter,@ToContent)  >0 )
      BEGIN

        SET @FromContent = REPLACE(@FromContent, @CreateTrigger , @AlterTrigger)
        SET @FromReplace = @Comment + char(10)
	
        SET @ToReplace = SUBSTRING(@ToContent,CHARINDEX(@AppHeader,@ToContent) + LEN(@AppHeader), CHARINDEX(@AppFooter,@ToContent) - CHARINDEX(@AppHeader,@ToContent) - LEN(@AppHeader))
			  
        SET @ToReplace = @Comment + char(10) + @ToReplace

        SET @FromContent = REPLACE(@FromContent,@FromReplace,@ToReplace)
        --Modify Trigger
        EXEC sys.sp_executesql @FromContent
      END
   END TRY
   BEGIN CATCH
      SET @Severity = 16
   END CATCH
END

CLOSE apptrigger_cursor
DEALLOCATE apptrigger_cursor

RETURN @Severity
GO

