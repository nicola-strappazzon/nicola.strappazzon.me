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

Listar los esquemas:

```sql
\dn
\dn+
```

Cambiar o seleccionar una base de datos:

```sq;
\c demo
\connect demo
```

Listar las tablas:

```sql
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

Listar los usuarios (roles):

```sql
\du
\du+
SELECT rolname, rolcanlogin, rolsuper, rolcreatedb, rolcreaterole
FROM pg_roles
ORDER BY rolname;
```

Ver el propietario de la base de datos

```sql
SELECT datname, pg_get_userbyid(datdba) AS owner, datcollate, datctype
FROM pg_database;
```

Conocer la configuración:

```sql
SELECT setting::int max_conn FROM pg_settings WHERE name=$$max_connections$$;
```

Usario para una aplicación:

```sql
CREATE ROLE app_owner
  LOGIN
  PASSWORD 'password_owner'
  NOSUPERUSER
  CREATEDB
  NOCREATEROLE;

CREATE DATABASE app_db
  OWNER app_owner
  ENCODING 'UTF8';

GRANT CONNECT ON DATABASE app_db TO app_user;

-- CREATE SCHEMA app_schema AUTHORIZATION app_owner;
GRANT USAGE, CREATE ON SCHEMA public TO app_user;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO app_user;
```

Usario solo lectura:

```sql
CREATE ROLE usr_ro_audit
  LOGIN
  PASSWORD 'password_owner';

GRANT CONNECT ON DATABASE app_db TO usr_ro_audit;
GRANT USAGE ON SCHEMA public TO usr_ro_audit;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_ro_audit;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO usr_ro_audit;
```

Eliminar un usuario:

```sql
REVOKE ALL PRIVILEGES ON SCHEMA public FROM usr_ro_audit;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM usr_ro_audit;
DROP ROLE usr_ro_audit;
```

Hacer un respaldo:

```bash
# Forma tradicional:
pg_dump -h 127.0.0.1 -p 5432 -d app_db -U app_user --no-owner --no-privileges > app.sql
# Tarda mucho, y comparado con gzip no es mucho:
pg_dump -h 127.0.0.1 -p 5432 -d app_db -U app_user -Fc -Z9 -f app.dump
# En paralelo, usando cuatro cores:
pg_dump -h 127.0.0.1 -p 5432 -d app_db -U app_user -Fd -j 4 -f app_dir
# Es la mejor opción usar gzip:
pg_dump -h 127.0.0.1 -p 5432 -d app_db -U app_user | gzip > app.sql.gz
```

Hacer un restore:

```bash
gunzip -c app.sql.gz | psql -h 127.0.0.1 -p 5432 -U app_user -d app_db
```

Hacer un respaldo de los roles:

```bash
pg_dumpall --roles-only > roles.sql
```
