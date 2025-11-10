+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'MySQL queries'
tags = ["mysql", "sql", "dba"]
weight = 2
+++

## Tables size

```SQL
SELECT table_schema as "Database",
       table_name AS "Table",
       table_rows AS "Rows",
       ROUND(((data_length + index_length) / POWER(1024, 3)), 2) "SizeInGB"
FROM information_schema.tables
ORDER BY (data_length + index_length) DESC;
```

## Databases size

```SQL
SELECT table_schema "DB Name",
       ROUND(SUM(data_length + index_length) / POWER(1024, 3), 1) "SizeInGB"
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
SELECT table_name, column_name, constraint_name, referenced_table_name, referenced_column_name
FROM information_schema.key_column_usage
WHERE referenced_table_schema = '<database>'
  AND referenced_table_name = '<table>';
```

## List all foreign keys with rules

```SQL
SELECT kcu.table_name, kcu.column_name, kcu.constraint_name, kcu.referenced_table_name, kcu.referenced_column_name, rc.update_rule, rc.delete_rule
FROM information_schema.key_column_usage kcu
JOIN information_schema.referential_constraints rc ON kcu.constraint_name = rc.constraint_name
ORDER BY kcu.table_name, kcu.column_name;
```

## Drop all foreign keys

```SQL
SELECT DISTINCT CONCAT(
    "ALTER TABLE ",
    kcu.table_name,
    " DROP CONSTRAINT ",
    kcu.constraint_name,
    ";"
  ) AS statement
FROM information_schema.key_column_usage kcu
JOIN information_schema.tables AS t
  ON t.table_schema = kcu.table_schema
 AND t.table_name = kcu.table_name
 JOIN information_schema.columns AS c
  ON t.table_schema = c.table_schema
 AND t.table_name = c.table_name
WHERE kcu.table_schema = DATABASE()
  AND kcu.referenced_table_name IS NOT NULL;
```

## Create all foreign keys with rules

```SQL
SELECT CONCAT(
    "ALTER TABLE ",
    kcu.table_name,
    " ADD CONSTRAINT ",
    kcu.constraint_name,
    " FOREIGN KEY (",
    kcu.column_name,
    ") REFERENCES ",
    kcu.referenced_table_name,
    "(",
    kcu.referenced_column_name,
    ") ON DELETE ",
    rc.delete_rule,
    " ON UPDATE ",
    rc.update_rule,
    ";"
  ) AS statement
FROM information_schema.key_column_usage kcu
JOIN information_schema.tables AS t
  ON t.table_schema = kcu.table_schema
 AND t.table_name = kcu.table_name
JOIN information_schema.referential_constraints rc
  ON kcu.constraint_name = rc.constraint_name
WHERE kcu.table_schema = DATABASE()
  AND kcu.referenced_table_name IS NOT NULL
ORDER BY kcu.table_name, kcu.column_name;
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

## List all virtual columns

```SQL
SELECT table_schema,
       table_name,
       data_type,
       extra,
       generation_expression
FROM information_schema.columns
WHERE extra LIKE '%stored%'
   OR extra LIKE '%virtual%';
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

Activar el instrumento:

```SQL
UPDATE performance_schema.setup_instruments
  SET enabled='YES', timed='YES'
  WHERE name LIKE 'stage/%';
```

Activar los eventos, útil para obtener información de los ALTER's:

```SQL
UPDATE performance_schema.setup_consumers
  SET enabled='YES'
  WHERE name IN ('events_stages_current','events_stages_history','events_stages_history_long');
```

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

### Conocer el progreso de un ALTER

```SQL
SELECT
    t.processlist_info,
    c.work_completed,
    c.work_estimated,
    ROUND(c.work_completed / NULLIF(c.work_estimated,0) * 100, 2) AS pct_done,
    ROUND(c.timer_wait / 1000000000000, 2) AS seconds_elapsed,
    ROUND((c.timer_wait / 1000000000000) /
          (c.work_completed / NULLIF(c.work_estimated,1))
        * (1 - (c.work_completed / NULLIF(c.work_estimated,1))), 2) AS seconds_eta
FROM performance_schema.events_stages_current c
JOIN performance_schema.threads t ON t.thread_id = c.thread_id;
```
