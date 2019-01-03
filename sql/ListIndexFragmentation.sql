
/*
-- Find the average fragmentation percentage of all indexes  
-- in the dbo.tablename   
SELECT a.index_id, name, avg_fragmentation_in_percent  
FROM sys.dm_db_index_physical_stats (DB_ID(N'DatabaseName'), 
      OBJECT_ID(N'dbo.PRINTED_LABEL_VARIABLES'), NULL, NULL, NULL) AS a  
    JOIN sys.indexes AS b 
      ON a.object_id = b.object_id AND a.index_id = b.index_id;   
GO  
*/
 
SELECT dbschemas.[name] as 'Schema',
dbtables.[name] as 'Table',
dbindexes.[name] as 'Index',
indexstats.avg_fragmentation_in_percent,
indexstats.fragment_count,
indexstats.page_count
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS indexstats
INNER JOIN sys.tables dbtables on dbtables.[object_id] = indexstats.[object_id]
INNER JOIN sys.schemas dbschemas on dbtables.[schema_id] = dbschemas.[schema_id]
INNER JOIN sys.indexes AS dbindexes ON dbindexes.[object_id] = indexstats.[object_id]
AND indexstats.index_id = dbindexes.index_id
WHERE indexstats.database_id = DB_ID()
ORDER BY fragment_count desc,indexstats.avg_fragmentation_in_percent desc
