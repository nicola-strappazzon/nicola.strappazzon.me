+++
title = 'MySQL en Amazon RDS'
tags = ["aws", "rds", "mysql", "bash", "dba"]
+++

## Enlaces de interés

- [MySQL bugs fixed by Aurora MySQL database engine updates](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraMySQLReleaseNotes/AuroraMySQL.Updates.MySQLBugs.html)
- [Security vulnerabilities fixed in Aurora MySQL](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraMySQLReleaseNotes/AuroraMySQL.CVE_list.html)
- [Configuring, starting, and stopping binary log (binlog) replication](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/mysql-stored-proc-replicating.html)

Esta es una pequeña selección de stored procedures propios de los RDS de Amazon Web Services.

## Replicación

Para detener la replicación:

```sql
CALL mysql.rds_stop_replication;
```

Configurar una nueva replicación:

```sql
CALL mysql.rds_set_external_master (
    '10.51.10.225'
  , 3306
  , 'repl'
  , 't3mpp@ssRepl'
  , 'mysql-bin-changelog.129202'
  , 511
  , 0
);
```

Iniciar el proceso de replicación:

```sql
CALL mysql.rds_start_replication;
```

Para borrar la configuración de la replicación:

```sql
CALL mysql.rds_reset_external_master;
```

Saltarse el error de replicación:

```sql
CALL mysql.rds_skip_repl_error;
```

## Config

Para mostrar las opciones de configuración relacionadas con replicación:

```sql
CALL mysql.rds_show_configuration();
```

Para definir un nuevo valor de configuración, en este caso definimos un periodo de retención de los binlogs hasta 48 horas.

```sql
CALL mysql.rds_set_configuration('binlog retention hours', 48);
```

Para saber el valor actual de configuración:

```sql
CALL mysql.rds_get_configuration('binlog retention hours');
```

## Process

Mata un proceso, por lo que cierra la conexión:

```sql
CALL mysql.rds_kill(1234);
```

Mata la query, pero no cierra la conexión:

```sql
CALL mysql.rds_kill_query(1234);
```
