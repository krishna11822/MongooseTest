IF (OBJECT_ID('ObjectBuildMessagesFk2', 'F') IS NULL)
BEGIN
ALTER TABLE [dbo].[ObjectBuildMessages]  WITH NOCHECK ADD  CONSTRAINT [ObjectBuildMessagesFk2] FOREIGN KEY([ObjectName], [MessageType])
REFERENCES [dbo].[ObjectMainMessages] ([ObjectName], [MessageType])
NOT FOR REPLICATION 
ALTER TABLE [dbo].[ObjectBuildMessages] CHECK CONSTRAINT [ObjectBuildMessagesFk2]
END
GO