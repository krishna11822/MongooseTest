DECLARE @FormID INT
SELECT @FormID=ID FROM Forms WHERE Name = N'ReportViewer' AND ScopeType = 0
DELETE FROM Forms WHERE ID = @FormID AND ScopeType = 0
DELETE FROM FormComponents WHERE FormID = @FormID
DELETE FROM ActiveXComponentProperties WHERE FormID = @FormID
DELETE FROM FormEventHandlers WHERE FormID = @FormID
DELETE FROM Variables WHERE FormID = @FormID
DELETE FROM ActiveXScriptLines WHERE ScriptName = N'ReportViewer' AND ScopeType = 0 AND ScopeName = N'[NULL]'
DELETE FROM ActiveXScripts WHERE Name = N'ReportViewer' AND ScopeType = 0 AND ScopeName = N'[NULL]'
DELETE FROM FormComponentDragDropEvents WHERE FormID = @FormID
DELETE FROM DerivedFormOverrides WHERE FormID = @FormID
