SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetEventActionTypeCodeSp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetEventActionTypeCodeSp]
GO

CREATE PROCEDURE [dbo].[GetEventActionTypeCodeSp] (
    @input                  nvarchar(100),
    @EventActionTypeCode    tinyint output
)

AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    SET @EventActionTypeCode = dbo.EventActionTypeCode(@input)
 
END
GO