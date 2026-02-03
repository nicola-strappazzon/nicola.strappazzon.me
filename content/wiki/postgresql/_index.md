+++
title = 'PostgreSQL'
+++

Conocer la versión:

```sql
SHOW server_version;
```

Listar las bases de datos:

```sql
\l  -- List
\l+ -- List with extra (include size)
\list
SELECT datname FROM pg_database;
SELECT current_database();
```

Cambiar o seleccionar una base de datos:

```
\c demo
\connect demo
```

Listar las tablas:

```
\dt
\dt+
SELECT * FROM pg_catalog.pg_tables;
```

Conocer el tamaño de la base de datos o de una tabla:

```sql
-- Database Size:
SELECT pg_size_pretty(pg_database_size('db_demo'));

-- Table Size:
SELECT pg_size_pretty(pg_relation_size('table_demo'));
```

Listar las conexiones activas:

```sql
SELECT * FROM pg_stat_activity;
```

Listar las conexiones por base de datos:

```sql
SELECT datname, COUNT(datid) FROM pg_stat_activity GROUP BY datname;
```

Conocer la configuración:

```
SELECT setting::int max_conn FROM pg_settings WHERE name=$$max_connections$$;
```
