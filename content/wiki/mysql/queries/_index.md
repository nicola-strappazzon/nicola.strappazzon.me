+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'MySQL queries for DBA'
tags = ["mysql", "sql", "dba"]
+++

# MySQL queries for DBA

## Tables size

```SQL
SELECT table_schema as "Database",
       table_name AS "Table", 
       round(((data_length + index_length) / 1024 / 1024), 2) "Size in MB"
FROM information_schema.TABLES 
ORDER BY (data_length + index_length) DESC;
```

## Databases size

```SQL
SELECT table_schema "DB Name",
       ROUND(SUM(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB" 
FROM information_schema.tables 
GROUP BY table_schema;
```

## Safe update

You are using safe update mode and you tried to update a table without a WHERE clause that uses a KEY column.

```SQL
SET SQL_SAFE_UPDATES=0;
UPDATE table_name SET foo = 0 WHERE bar = 'oof';
SET SQL_SAFE_UPDATES=1;
```

## List all primary keys

```SQL
SELECT t.table_schema AS 'Schema',
       c.table_name AS 'Table',
       c.column_name AS 'Column',
       (c.extra LIKE '%AUTO_INCREMENT%') AS AI,
       c.is_nullable AS NN,
       c.data_type AS DT
FROM information_schema.tables t
JOIN information_schema.columns c
  ON c.table_schema = t.table_schema
 AND c.table_name = t.table_name
JOIN information_schema.statistics s
  ON s.table_schema = t.table_schema
 AND s.table_name = t.table_name
 AND s.column_name = c.column_name
WHERE t.table_schema NOT IN ('mysql', 'performance_schema')
  AND t.table_type = 'BASE TABLE'
  AND s.index_name = 'PRIMARY'
ORDER BY t.table_schema, c.table_name, c.column_name;
```

## List all foreign keys

```SQL
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_SCHEMA = '<database>'
  AND REFERENCED_TABLE_NAME = '<table>';
```

## List all foreign keys with rules

```SQL
SELECT kcu.TABLE_NAME, kcu.COLUMN_NAME, kcu.CONSTRAINT_NAME, kcu.REFERENCED_TABLE_NAME, kcu.REFERENCED_COLUMN_NAME, rc.UPDATE_RULE, rc.DELETE_RULE
FROM information_schema.KEY_COLUMN_USAGE kcu
JOIN information_schema.REFERENTIAL_CONSTRAINTS rc ON kcu.CONSTRAINT_NAME = rc.CONSTRAINT_NAME
ORDER BY kcu.TABLE_NAME, kcu.COLUMN_NAME;
```

## List all primary and foreign keys

```SQL
SELECT tab.table_schema AS database_schema,
    sta.index_name AS pk_name,
    sta.seq_in_index AS column_id,
    sta.column_name,
    tab.table_name
FROM information_schema.tables AS tab
LEFT OUTER JOIN information_schema.statistics AS sta
             ON sta.table_schema = tab.table_schema
            AND sta.table_name = tab.table_name
            AND sta.index_name = 'primary'
WHERE tab.table_schema = '<table>'
    AND tab.table_type = 'BASE TABLE'
ORDER BY tab.table_name, column_id;
```
## Add new column before x column

```SQL
ALTER TABLE demo ADD COLUMN foo TINYINT DEFAULT 0 NOT NULL AFTER bar;
```

## List partitions on table

```SQL
SELECT PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'demo';
```

## Empty partitioned table

```SQL
CREATE TABLE `demo_p201901` LIKE `demo`;
ALTER TABLE `demo_p201901` REMOVE PARTITIONING;
ALTER TABLE `demo`
EXCHANGE PARTITION p201901
WITH TABLE `demo_p201901`;
DROP TABLE `demo_p201901`;
```

## Encoding and collation on tables and columns

```SQL
SELECT t.table_schema, t.table_name, t.engine, t.table_collation, c.column_name, c.data_type, c.character_set_name, c.collation_name
FROM information_schema.columns c
JOIN information_schema.tables t
WHERE t.table_schema NOT IN ('information_schema', 'mysql', 'performance_schema', 'sys')
  AND t.table_name = c.table_name
  AND t.table_schema = c.table_schema
  AND (c.character_set_name != 'utf8mb4'
  	OR c.collation_name NOT LIKE 'utf8mb4%'
  	OR t.table_collation NOT LIKE 'utf8mb4%')
ORDER BY c.table_name, c.column_name;
```

## Performance Schema

### List all tables with DML operations

```SQL
SELECT object_schema,
       object_name,
       count_read,
       count_insert,
       count_update,
       count_delete
FROM performance_schema.table_io_waits_summary_by_table
WHERE object_schema NOT IN ('mysql',
                            'information_schema',
                            'performance_schema');
```
