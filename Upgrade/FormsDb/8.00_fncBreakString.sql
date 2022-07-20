SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.fncBreakString') IS NOT NULL
   DROP FUNCTION dbo.fncBreakString
GO
Create Function fncBreakString (@FindChar VarChar(5),@SourceString VarChar(1024))
Returns @TmpTable Table (Value VarChar(100)) 
As
Begin
	Declare @Pos int
	While (1=1)
	Begin
		Set @Pos=CharIndex(@FindChar,@SourceString)
		if (@Pos=0)
		begin
			Insert @TmpTable Values(SubString(@SourceString,1,len(LTrim(RTrim(@SourceString)))))
			break
		end
		Insert @TmpTable Values(SubString(@SourceString,1,@Pos-1))	
		Set @SourceString=LTrim(Stuff(@SourceString,1,@Pos,''))	
	End
Return
End

GO
