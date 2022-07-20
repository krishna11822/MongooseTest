DECLARE @TimeZone TimeZoneType
SET @TimeZone = (select top 1 server_time_zone 
from parms_mst 
where server_time_zone is not null 
group by server_time_zone
order by count(*) desc)

UPDATE [dbo].[parms_mst]
   SET 
      [server_time_zone] = @TimeZone
      
 WHERE server_time_zone is null
GO


