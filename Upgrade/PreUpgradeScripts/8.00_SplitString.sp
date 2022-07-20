SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.SplitString') IS NOT NULL
   DROP FUNCTION dbo.SplitString
GO

/* $Header: /Tools/SQLScripts/Upgrade/PreUpgradeScripts/8.00_SplitString.sp 1     1/18/17 12:54p Jmorris $Archive: $
 *
 * CoreDev 1 RS5926 Mbair1 Fri Jun 07 12:24:10 2013
 * ReqSet 5926
 *
 * $NoKeywords: $
 */

/* $Archive: $
 *
 * CoreDev 2 RS6385 Mjbuenaventura Fri May 08 06:53:12 2015
 * RS6385 Changed the data type varchar to nvarchar to handle Unicode characters
 *
 * $NoKeywords: $
 */
CREATE FUNCTION [dbo].[SplitString] 
   (  @Delimiter nvarchar(5), 
      @List      nvarchar(MAX) 
   ) 
   RETURNS @ListValues table 
      (  RowID   smallint identity(1,1), 
         Element nvarchar(MAX) 
      ) 
AS 

BEGIN
declare @StringLength int 
 
WHILE LEN( @List ) > 0 
	BEGIN 
		SELECT @StringLength = 
			(
			CASE CHARINDEX( @Delimiter, @List ) 
				WHEN 0 THEN LEN( @List ) 
            ELSE ( CHARINDEX( @Delimiter, @List ) -1 )
         END
         ) 
                                
         INSERT INTO @ListValues 
				SELECT SUBSTRING( @List, 1, @StringLength)
                
            SELECT @List = 
               (
               CASE ( LEN( @List ) - @StringLength ) 
                   WHEN 0 THEN '' 
                   ELSE RIGHT( @List, LEN( @List ) - @StringLength - 1 ) 
               END
               ) 
         END
    RETURN 
  END
  
  
  
  