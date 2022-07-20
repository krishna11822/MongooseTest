--Create UDDT
IF NOT EXISTS (SELECT * FROM [sys].[types] st JOIN [sys].[schemas] ss ON st.schema_id = ss.schema_id 
WHERE st.name = N'EventActionParmList2Type' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[EventActionParmList2Type] FROM [nvarchar](MAX) NULL
GO

-- Alter Column: Parameters
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventAction]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventAction]')
      AND [name] = N'Parameters')
   ALTER TABLE [dbo].[EventAction] ALTER COLUMN
      [Parameters] [dbo].[EventActionParmList2Type] NULL

GO


