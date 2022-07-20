IF NOT EXISTS (SELECT 1 from ExtendableStoredProcedure where ProcedureName = 'GetReplicateObjects2Sp')
insert into ExtendableStoredProcedure (ProcedureName) values ('GetReplicateObjects2Sp')
