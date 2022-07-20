DECLARE @SQL NVARCHAR(MAX)


--Nullable Fixes
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'can_drill_down'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET can_drill_down = 1 
               WHERE can_drill_down IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'can_run'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET can_run = 1 
               WHERE can_run IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'can_update_parms'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET can_update_parms = 1 
               WHERE can_update_parms IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'can_user'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET can_user = 1 
               WHERE can_user IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'recv_drill'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET recv_drill = 0 
               WHERE recv_drill IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'recv_email'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET recv_email = 1 
               WHERE recv_email IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cat_users]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_cat]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_cat]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_cat]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_cat]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_cat]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_cat]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_cat]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_drilldown]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_drilldown]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_drilldown]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_drilldown]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_drilldown]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_drilldown]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_drilldown]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_filter'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_filter]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_filter'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_filter]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_filter'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_filter]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_filter'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_filter]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'active'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET active = 1 
               WHERE active IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'alert_use'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET alert_use = 1 
               WHERE alert_use IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'goal_use'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET goal_use = 1 
               WHERE goal_use IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'show_cr_num'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET show_cr_num = 1 
               WHERE show_cr_num IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_num]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_parms]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_parms]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_parms]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_parms]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_parms]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_parms]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_cr_parms]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_cat]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_cat]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_cat]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_cat]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_cat]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_cat]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_cat]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_filter'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_filter]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_filter'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_filter]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_filter'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_filter]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_filter'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_filter]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_parms]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_parms]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_parms]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_parms]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_parms]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_parms]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drill_parms]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'alert_use'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET alert_use = 1 
               WHERE alert_use IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'goal_use'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET goal_use = 1 
               WHERE goal_use IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'std_display'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET std_display = 1 
               WHERE std_display IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown_column'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown_column]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown_column'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown_column]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown_column'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown_column]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown_column'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown_column]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown_column'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown_column]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown_column'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_drilldown_column]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'show_snap'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET show_snap = 0 
               WHERE show_snap IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_parms]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'can_drill_down'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET can_drill_down = 1 
               WHERE can_drill_down IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'can_run'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET can_run = 1 
               WHERE can_run IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'can_update_parms'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET can_update_parms = 1 
               WHERE can_update_parms IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'can_user'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET can_user = 1 
               WHERE can_user IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'recv_drill'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET recv_drill = 0 
               WHERE recv_drill IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'recv_email'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET recv_email = 1 
               WHERE recv_email IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_permits]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'alert_use'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET alert_use = 1 
               WHERE alert_use IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'goal_use'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET goal_use = 1 
               WHERE goal_use IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_snapshot]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_sub_drilldown]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_sub_drilldown]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_sub_drilldown]
               SET InWorkflow = 0 
               WHERE InWorkflow IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_sub_drilldown]
               SET NoteExistsFlag = 0 
               WHERE NoteExistsFlag IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_sub_drilldown]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_sub_drilldown]
               SET RowPointer = NEWID() 
               WHERE RowPointer IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_sub_drilldown]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_cr_nums'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_cr_nums]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_cr_nums'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_cr_nums]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_cr_nums'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_cr_nums]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_cr_nums'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_cr_nums]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_drill_results'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_drill_results]
               SET CreateDate = ISNULL(RECORDDATE,getdate()) 
               WHERE CreateDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_drill_results'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_drill_results]
               SET CreatedBy = ISNULL(UPDATEDBY,suser_sname()) 
               WHERE CreatedBy IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_drill_results'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_drill_results]
               SET RecordDate = ISNULL(CREATEDATE,getdate()) 
               WHERE RecordDate IS NULL'
   EXEC sp_executesql @SQL
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_drill_results'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
BEGIN
   SET @SQL = 'UPDATE [dbo].[wb_tmp_drill_results]
               SET UpdatedBy = ISNULL(CREATEDBY,suser_sname()) 
               WHERE UpdatedBy IS NULL'
   EXEC sp_executesql @SQL
END
