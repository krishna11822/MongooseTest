SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ValidateNextKeyGeneratorSp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ValidateNextKeyGeneratorSp]
GO

/* $Header: /Tools/SQLScripts/Upgrade/PreUpgradeScripts/9.03.00_ValidateNextKeyGeneratorSp.sp 1     11/21/16 8:55a Djohnson $ */

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
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

/* $Archive: /Tools/SQLScripts/Upgrade/PreUpgradeScripts/9.03.00_ValidateNextKeyGeneratorSp.sp $
 *
 * CoreDev 1 218600 Djohnson Fri Nov 18 15:23:57 2016
 * Redesign form to maintain current function without risk of SQL injection.
 * Issue #218600
 *
 * $NoKeywords: $
 */
--  A next key generator can be one of the following valid types:
-- A single stored procedure name: Ex: NextBigIDSp
-- Comma separated list of 2 next key stored procedures. Ex: NextKeyOneSp,NextKeyTwoSp
-- SetNextKeySp, literal string. Ex: SetNextKeySp,N'DO'
-- AUTONUMBER
-- SP name followed by an @name=value parameter list.  Ex:
-- NextLotSp @Item = @Item, @UseParm = @UseParm, @Prefix = @Prefix, @Key = @lot OUTPUT, @Infobar = @Infobar OUTPUT
CREATE PROCEDURE dbo.ValidateNextKeyGeneratorSp (
  @NextKeyGenerator VeryLongListType
, @Infobar          InfobarType   OUTPUT
) AS

   -- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
   IF OBJECT_ID(N'dbo.EXTGEN_ValidateNextKeyGeneratorSp') IS NOT NULL
   BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_ValidateNextKeyGeneratorSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      DECLARE @EXTGEN_Severity int
      EXEC @EXTGEN_Severity = @EXTGEN_SpName
         @NextKeyGenerator
         , @Infobar OUTPUT

      -- ETP routine can RETURN 1 to signal that the remainder of this standard routine should now proceed:
      IF @EXTGEN_Severity <> 1
         RETURN @EXTGEN_Severity
   END
   -- End of Generic External Touch Point code.

DECLARE
  @Severity INT
, @Literal  VeryLongListType
, @Proc1    VeryLongListType
, @Proc2    VeryLongListType
, @ParmPair VeryLongListType
, @Value1   VeryLongListType
, @Value2   VeryLongListType

SET @Severity = 0

IF @NextKeyGenerator IS NULL
   RETURN 0

IF @NextKeyGenerator = N'AUTONUMBER'
   RETURN 0

IF @NextKeyGenerator LIKE 'SetNextKeySp%'
BEGIN
   SET @Literal = dbo.Entry(2, @NextKeyGenerator, ',')
   IF dbo.NumEntries(@NextKeyGenerator, ',') > 2 OR dbo.IsValidLiteral(@Literal) = 0
   BEGIN
      EXEC @Severity = MsgAppSp @Infobar OUTPUT
        , N'E=NextKeyValidator1'
        , @NextKeyGenerator
      RETURN @Severity
   END
   RETURN 0
END

-- First proc might be followed by a comma or by a blank.
SET @Proc1 = dbo.Entry(1, dbo.Entry(1, @NextKeyGenerator, N','), N' ')
SET @Proc2 = dbo.Entry(2, @NextKeyGenerator, N',')

IF NOT EXISTS (SELECT 1
  FROM sys.procedures
  WHERE name = @Proc1 )
BEGIN
   EXEC @Severity = MsgAppSp @Infobar OUTPUT
    , N'E=NoExist1'
    , N'@@sysobjects:P'
    , N'@AppColumn.NextkeyGenerator'
    , @Proc1

   RETURN @Severity
END

IF dbo.NumEntries(@NextKeyGenerator, N',') = 2 AND dbo.IsValidLiteral(@Proc2) = 1
RETURN 0

IF dbo.NumEntries(@NextKeyGenerator, N',') = 2 AND dbo.IsValidLiteral(@Proc2) = 0
BEGIN
   IF NOT EXISTS (SELECT 1
     FROM sys.procedures
     WHERE name = @Proc2 )
   BEGIN
      EXEC @Severity = MsgAppSp @Infobar OUTPUT
       , N'E=NoExist1'
       , N'@@sysobjects:P'
       , N'@AppColumn.NextkeyGenerator'
       , @Proc2
      RETURN @Severity
   END
   RETURN 0
END

SET @Literal = SUBSTRING(@NextKeyGenerator, LEN(@Proc1) + 1, LEN(@NextKeyGenerator))
EXEC @Severity = ValidateNextKeyPairsSp @Literal, @Infobar OUTPUT
IF @Severity <> 0
BEGIN
   EXEC @Severity = MsgAppSp
    @Infobar OUTPUT
   , N'E=NextKeyValidator2'
   , @NextKeyGenerator
END

RETURN @Severity

GO