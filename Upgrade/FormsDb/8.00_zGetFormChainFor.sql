-- =====================================================
--  UDF: GetFormChainFor
--       (RS 5906)
-- =====================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.GetFormChainFor') IS NOT NULL
   DROP FUNCTION dbo.GetFormChainFor
GO

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

CREATE FUNCTION dbo.GetFormChainFor
(
  @formId          int = -1
)
RETURNS
@FormChainResult TABLE
(
   [RowIndex]      int PRIMARY KEY NOT NULL IDENTITY(0, 1)
 , [FormId]        int
 , [FormName]      nvarchar(50)
 , [BaseFormName]  nvarchar(50)
 , [ScopeType]     smallint
 , [ScopeName]     nvarchar(50)
 , [Level]         int
 )
AS
BEGIN
   DECLARE
     @defaultFormId     int
   , @scopeVendor       smallint
   , @scopeSiteDefault  smallint
   , @scopeGroup        smallint
   , @scopeUser         smallint;

   DECLARE
     @originFormId      int
   , @originFormName    nvarchar(50)
   , @originBaseForm    nvarchar(50)
   , @originScopeType   smallint
   , @originScopeName   nvarchar(50)
   , @originLevel       int;
   
   DECLARE @FormChainUp TABLE
   (
      [FormId]        int
    , [FormName]      nvarchar(50)
    , [BaseFormName]  nvarchar(50)
    , [ScopeType]     smallint
    , [ScopeName]     nvarchar(50)
    , [Level]         int
   );
   
   DECLARE @FormChainDown TABLE
   (
      [FormId]        int
    , [FormName]      nvarchar(50)
    , [BaseFormName]  nvarchar(50)
    , [ScopeType]     smallint
    , [ScopeName]     nvarchar(50)
    , [Level]         int
   );

   -- =====================================================
   -- Scope:
   -- =====================================================
   SELECT
     @defaultFormId     = -1
   , @scopeVendor       = 0
   , @scopeSiteDefault  = 1
   , @scopeGroup        = 2
   , @scopeUser         = 3;
      
   -- =====================================================
   -- Origin:
   -- =====================================================
   SELECT
     @originFormId      = ISNULL( f.[ID], @defaultFormId )
   , @originFormName    = f.[Name]
   , @originBaseForm    = f.[BaseFormName]
   , @originScopeType   = f.[ScopeType]
   , @originScopeName   = f.[ScopeName]
   , @originLevel       = 0
   FROM [dbo].[Forms] f
   WHERE f.[ID] = @formId;
   
   IF ( @originFormId = @defaultFormId )
      RETURN;
   
   -- =====================================================
   -- Form extension chain (UP - ancestor(s)):
   -- =====================================================
   IF ( ( @originScopeType = @scopeUser ) OR
        ( @originScopeType = @scopeGroup ) )
   BEGIN
      WITH FormChainUpCTE as
      (
         SELECT f.[ID], f.[Name], f.[BaseFormName], f.[ScopeType], f.[ScopeName], 0 AS [Level]
         FROM [Forms] AS f
         WHERE ( ( f.[ID] = @formId ) AND
                 ( f.[Name] != f.[BaseFormName] ) )
         
         UNION ALL
      
         SELECT p.[ID], p.[Name], p.[BaseFormName], p.[ScopeType], p.[ScopeName], [Level] - 1
         FROM [FormChainUpCTE] AS c
         INNER JOIN [Forms] AS p ON p.[Name] = c.[BaseFormName]
         WHERE ( ( p.[ScopeType] = @originScopeType AND p.[ScopeName] = @originScopeName ) OR
                 ( p.[ScopeType] < @scopeGroup ) )
      )
      INSERT INTO @FormChainUp
      SELECT [ID], [Name], [BaseFormName], [ScopeType], [ScopeName], [Level]
      FROM [FormChainUpCTE]
      WHERE [Level] < 0
      ORDER BY [Level] DESC, [ScopeType] DESC, [ScopeName];
   END
   ELSE IF ( @originScopeType = @scopeSiteDefault )
   BEGIN
      WITH FormChainUpCTE as
      (
         SELECT f.[ID], f.[Name], f.[BaseFormName], f.[ScopeType], f.[ScopeName], 0 AS [Level]
         FROM [Forms] AS f
         WHERE ( ( f.[ID] = @formId ) AND
                 ( f.[Name] != f.[BaseFormName] ) )
         
         UNION ALL
      
         SELECT p.[ID], p.[Name], p.[BaseFormName], p.[ScopeType], p.[ScopeName], [Level] - 1
         FROM [FormChainUpCTE] AS c
         INNER JOIN [Forms] AS p ON p.[Name] = c.[BaseFormName]
         WHERE ( p.[ScopeType] < @scopeGroup )
      )
      INSERT INTO @FormChainUp
      SELECT [ID], [Name], [BaseFormName], [ScopeType], [ScopeName], [Level]
      FROM [FormChainUpCTE]
      WHERE [Level] < 0
      ORDER BY [Level] DESC, [ScopeType] DESC, [ScopeName];
   END
   ELSE
   BEGIN
      WITH FormChainUpCTE as
      (
         SELECT f.[ID], f.[Name], f.[BaseFormName], f.[ScopeType], f.[ScopeName], 0 AS [Level]
         FROM [Forms] AS f
         WHERE ( ( f.[ID] = @formId ) AND
                 ( f.[Name] != f.[BaseFormName] ) )
         
         UNION ALL
      
         SELECT p.[ID], p.[Name], p.[BaseFormName], p.[ScopeType], p.[ScopeName], [Level] - 1
         FROM [FormChainUpCTE] AS c
         INNER JOIN [Forms] AS p ON p.[Name] = c.[BaseFormName]
         WHERE ( p.[ScopeType] = @scopeVendor )
      )
      INSERT INTO @FormChainUp
      SELECT [ID], [Name], [BaseFormName], [ScopeType], [ScopeName], [Level]
      FROM [FormChainUpCTE]
      WHERE [Level] < 0
      ORDER BY [Level] DESC, [ScopeType] DESC, [ScopeName];
   END
   
   -- =====================================================
   -- Form extension chain (DOWN - descendant(s)):
   -- =====================================================
   IF ( ( @originScopeType = @scopeUser ) OR
        ( @originScopeType = @scopeGroup ) )
   BEGIN
      WITH FormChainDownCTE as
      (
         SELECT f.[ID], f.[Name], f.[BaseFormName], f.[ScopeType], f.[ScopeName], 0 AS [Level]
         FROM [Forms] AS f
         WHERE ( f.[ID] = @formId )
         
         UNION ALL
      
         SELECT c.[ID], c.[Name], c.[BaseFormName], c.[ScopeType], c.[ScopeName], [Level] + 1
         FROM [FormChainDownCTE] AS p
         INNER JOIN [Forms] AS c ON c.[BaseFormName] = p.[Name]
         WHERE ( c.[ScopeType] = @originScopeType AND c.[ScopeName] = @originScopeName )
      )
      INSERT INTO @FormChainDown
      SELECT [ID], [Name], [BaseFormName], [ScopeType], [ScopeName], [Level]
      FROM [FormChainDownCTE]
      WHERE [Level] > 0
      ORDER BY [Level] DESC, [ScopeType] DESC, [ScopeName];
   END
   ELSE IF ( @originScopeType = @scopeSiteDefault )
   BEGIN
      WITH FormChainDownCTE as
      (
         SELECT f.[ID], f.[Name], f.[BaseFormName], f.[ScopeType], f.[ScopeName], 0 AS [Level]
         FROM [Forms] AS f
         WHERE ( f.[ID] = @formId )
         
         UNION ALL
      
         SELECT c.[ID], c.[Name], c.[BaseFormName], c.[ScopeType], c.[ScopeName], [Level] + 1
         FROM [FormChainDownCTE] AS p
         INNER JOIN [Forms] AS c ON c.[BaseFormName] = p.[Name]
         WHERE ( c.[ScopeType] > @scopeVendor )
      )
      INSERT INTO @FormChainDown
      SELECT [ID], [Name], [BaseFormName], [ScopeType], [ScopeName], [Level]
      FROM [FormChainDownCTE]
      WHERE [Level] > 0
      ORDER BY [Level] DESC, [ScopeType] DESC, [ScopeName];
   END
   ELSE
   BEGIN
      WITH FormChainDownCTE as
      (
         SELECT f.[ID], f.[Name], f.[BaseFormName], f.[ScopeType], f.[ScopeName], 0 AS [Level]
         FROM [Forms] AS f
         WHERE ( f.[ID] = @formId )
         
         UNION ALL
      
         SELECT c.[ID], c.[Name], c.[BaseFormName], c.[ScopeType], c.[ScopeName], [Level] + 1
         FROM [FormChainDownCTE] AS p
         INNER JOIN [Forms] AS c ON c.[BaseFormName] = p.[Name]
      )
      INSERT INTO @FormChainDown
      SELECT [ID], [Name], [BaseFormName], [ScopeType], [ScopeName], [Level]
      FROM [FormChainDownCTE]
      WHERE [Level] > 0
      ORDER BY [Level] DESC, [ScopeType] DESC, [ScopeName];
   END
   
   -- =====================================================
   -- Form extension chain:
   --   - Down-chain (descendant(s))
   --   - Requested form
   --   - Up-chain (ancestor(s))
   -- =====================================================
   INSERT INTO @FormChainResult
   SELECT fcd.[FormId], fcd.[FormName], fcd.[BaseFormName], fcd.[ScopeType], fcd.[ScopeName], fcd.[Level]
   FROM @FormChainDown fcd
   WHERE fcd.[Level] > 0;

   INSERT INTO @FormChainResult( [FormId], [FormName], [BaseFormName], [ScopeType], [ScopeName], [Level] )
   VALUES( @originFormId, @originFormName, @originBaseForm, @originScopeType, @originScopeName, @originLevel );

   INSERT INTO @FormChainResult
   SELECT fcu.[FormId], fcu.[FormName], fcu.[BaseFormName], fcu.[ScopeType], fcu.[ScopeName], fcu.[Level]
   FROM @FormChainUp fcu
   WHERE fcu.[Level] < 0;

   RETURN;
END
GO