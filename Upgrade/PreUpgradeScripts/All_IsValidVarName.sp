SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[IsValidVarName]') AND xtype IN (N'FN', N'IF', N'TF'))
DROP FUNCTION [dbo].[IsValidVarName]
GO
-- =================================================================================
-- Function: IsValidVarName
-- This function validates that a string is a valid variable name such as
-- @InputValue
-- =================================================================================

/* $Header: ApplicationDB\PreTableObjects\IsValidVarName.sp 10.8.0.0 10/29/2018 13:51:49 */

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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/IsValidVarName.sp $
 *
 * CoreDev 1 218600 Djohnson Fri Nov 18 15:18:41 2016
 * Redesign form to maintain current function without risk of SQL injection.
 * Issue #218600
 * $NoKeywords: $
 */
CREATE FUNCTION [dbo].[IsValidVarName](
  @InputString VeryLongListType
)
RETURNS int
AS
BEGIN
DECLARE
  @One  SYSNAME
, @Rest SYSNAME
   IF @InputString IS NULL
      RETURN 0

   SET @One = SUBSTRING(@InputString, 1, 1)
   SET @Rest = SUBSTRING(@InputString, 2, LEN(@InputString) )

   IF @One <> N'@'
      RETURN 0


  RETURN dbo.IsValidIdentifier(@Rest)
END
GO
