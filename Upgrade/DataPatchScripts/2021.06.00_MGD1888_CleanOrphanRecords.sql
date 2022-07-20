-- Clean up orphaned records
DELETE ep  
FROM ObjExtAPIEndpoints ep    
LEFT JOIN ObjExtAPIs api 
ON ep.CollectionName = api.CollectionName 
WHERE api.CollectionName IS NULL 
GO