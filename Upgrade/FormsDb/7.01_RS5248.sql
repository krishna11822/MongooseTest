--
--
-- RS5248 Script to replace "SyteLine" with "Mongoose" in forms and global script name spaces.
--
--
DECLARE @Num Integer
begin tran
print '>>> Updating table ActiveXScriptLines (Replacing "SyteLine" with "Mongoose" in Form script namespace)'
select @Num = count(*) from ActiveXScriptLines where CodeLine like '%SyteLine.FormScripts%'
print 'Number of Form Scripts to be updated -> ' + CAST(@Num AS varchar(10))
update ActiveXScriptLines
set CodeLine = REPLACE(CodeLine, 'SyteLine.FormScripts', 'Mongoose.FormScripts')
where CodeLine LIKE '%Namespace SyteLine.FormScripts%' OR CodeLine LIKE '%namespace SyteLine.FormScripts%'
select @Num = count(*) from ActiveXScriptLines where CodeLine like '%SyteLine.FormScripts%'
print 'Number of Form Scripts remaining to be updated. -> ' + CAST(@Num AS varchar(10))
print ' '

print '>>> Updating table ScriptLines (Replacing "SyteLine" with "Mongoose" in Global script namespace)'
select @Num = count(*) from ScriptLines where CodeLine like '%SyteLine.GlobalScripts%'
print 'Number of Global Scripts to be updated -> ' + CAST(@Num AS varchar(10))
update ScriptLines
set CodeLine = REPLACE(CodeLine, 'SyteLine.GlobalScripts', 'Mongoose.GlobalScripts')
where CodeLine LIKE '%Namespace SyteLine.GlobalScripts%' OR CodeLine LIKE '%namespace SyteLine.GlobalScripts%'
select @Num = count(*) from ScriptLines where CodeLine like '%SyteLine.GlobalScripts%'
print 'Number of Global Scripts remaining to be updated. -> ' + CAST(@Num AS varchar(10))
print ' '

print '>>> Updating table FormEventHandlers (Replacing "SyteLine" with "Mongoose" in namespace for Event Handler Inline Scripts)'
select @Num = count(*) from FormEventHandlers where Response like '%SyteLine.GlobalScripts%' AND ResponseType = 33
print 'Number of Form Event Handlers to be updated -> ' + CAST(@Num AS varchar(10))
update FormEventHandlers
set Response = REPLACE(Response, 'SyteLine.GlobalScripts', 'Mongoose.GlobalScripts')
where ( Response LIKE '%Namespace SyteLine.GlobalScripts%' OR Response LIKE '%namespace SyteLine.GlobalScripts%' ) AND ResponseType = 33
select @Num = count(*) from FormEventHandlers where Response like '%SyteLine.GlobalScripts%' AND ResponseType = 33
print 'Number of Form Event Handlers remaining to be updated. -> ' + CAST(@Num AS varchar(10))
print ' '

print '>>> Updating table Validators (Replacing "SyteLine" with "Mongoose" in namespace for Validator Inline Scripts)'
select @Num = count(*) from Validators where Parms like '%SyteLine.GlobalScripts%' AND Type = 14
print 'Number of validators to be updated -> ' + CAST(@Num AS varchar(10))
update Validators
set Parms = REPLACE(Parms, 'SyteLine.GlobalScripts', 'Mongoose.GlobalScripts')
where ( Parms LIKE '%Namespace SyteLine.GlobalScripts%' OR Parms LIKE '%namespace SyteLine.GlobalScripts%' ) AND Type = 14
select @Num = count(*) from Validators where Parms like '%SyteLine.GlobalScripts%' AND Type = 14
print 'Number of Validators remaining to be updated. -> ' + CAST(@Num AS varchar(10))
commit tran

