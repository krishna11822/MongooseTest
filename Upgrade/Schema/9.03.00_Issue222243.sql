IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_TYPE = 'BASE TABLE'
           AND   TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'WBSnapshot')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_TYPE = 'BASE TABLE'
                AND   TABLE_SCHEMA = 'dbo'
                AND   TABLE_NAME = 'WBSnapshot_mst')
BEGIN
   DECLARE @Site SiteType
   , @Infobar Infobar
   , @FullTextIndexString NVARCHAR(MAX)
   , @AppDbName ObjectNameType

   SET @AppDbName = DB_NAME()

   SELECT TOP 1 @Site = Site
   FROM parms_mst
   ORDER BY parm_key

   EXEC SetSiteSp @Site, NULL
   
   EXEC ConvertTableToMultiSiteTableSp 
       @AppDbName, N'dbo', N'WBSnapshot', @Site, N'SiteRef'
     , @FullTextIndexString OUTPUT, @Infobar OUTPUT, N'Core'

   --Duplicate data for other sites since origin site is unknown
   INSERT INTO WBSnapshot_mst (
      SiteRef, ActualValue, 
      AlertDescription, AlertOperator, AlertUse, AlertValue, Description, Category,
      GoalDescription,  GoalOperator,  GoalUse,  GoalValue,
      KPINum, Color, Symbol, ShortDescription, SnapshotDate)
   SELECT
      prm.site, snapmst.ActualValue,
      snapmst.AlertDescription, snapmst.AlertOperator, snapmst.AlertUse, snapmst.AlertValue, snapmst.Description, snapmst.Category,
      snapmst.GoalDescription, snapmst.GoalOperator, snapmst.GoalUse, snapmst.GoalValue, 
      snapmst.KPINum, snapmst.Color, snapmst.Symbol, snapmst.ShortDescription, snapmst.SnapshotDate
   FROM WBSnapshot_mst snapmst
   INNER JOIN parms_mst prm
   ON prm.site_ref != snapmst.SiteRef
   ORDER BY prm.site, snapmst.seq
END

   EXEC SetSiteSp NULL, NULL
GO
