+++
draft = false
title = 'ProxySQL'
+++

## ClenUp

Borra los datos de las siguientes tablas:

```sql
SELECT * FROM stats_mysql_client_host_cache_reset;
SELECT * FROM stats_mysql_connection_pool_reset;
SELECT * FROM stats_mysql_errors_reset;
SELECT * FROM stats_mysql_query_digest_reset;
SELECT * FROM stats_proxysql_message_metrics_reset;
```

## Conexiones

Estado general de cada MySQL server.

```sql
SELECT hostgroup,
       SUBSTR(srv_host, 1, INSTR(srv_host, '.') - 1) AS instance,
       status,
       connused,
       connfree,
       connok,
       connerr,
       maxconnused,
       queries
FROM stats_mysql_connection_pool
ORDER BY srv_host;
```

## Contadores

Es un contador de cualquier tipo de sentencia, también incluye media de rango de tiempos.

```sql
SELECT * FROM stats_mysql_commands_counters;
```

## Errores

Registra cualquier query que genere algún error del lado de MySQL server.

```sql
SELECT hostgroup,
       SUBSTR(hostname, 1, INSTR(hostname, '.') - 1) AS instance,
       client_address,
       username,
       schemaname,
       errno,
       count_star,
       last_seen,
       last_error
FROM stats_mysql_errors;
```

## Ping

Constantemente está midiendo el tiempo de respuesta por cada uno de los MySQL server, lo hace para descartar aquellos que tardan mucho.

```sql
SELECT hostname,
       port,
       avg(ping_success_time_us) AS time_us
FROM monitor.mysql_server_ping_log
GROUP BY hostname, port;
```

## Slow queries

Lista las 25 consultas más lentas.

```sql
SELECT hostgroup,
       schemaname,
       username,
       digest,
       SUBSTR(digest_text,0,45),
       count_star,sum_time/count_star avg_time,
       min_time, max_time/1000000 AS "max time secs",
       from_unixtime(first_seen) AS "first seen",
       from_unixtime(last_seen) AS "last seen"
FROM stats_mysql_query_digest
WHERE digest_text LIKE 'SELECT%'
ORDER BY max_time DESC, digest
LIMIT 25;
```

## Más ejecutadas

Lista las 25 consultas más frecuentes.

```sql
SELECT digest, SUBSTR(digest_text,0,45),
       count_star,
       sum_time,
       from_unixtime(first_seen) "first seen",
       from_unixtime(last_seen) "last seen",
       username,
       hostgroup
FROM stats_mysql_query_digest
WHERE digest_text LIKE 'SELECT%'
ORDER BY count_star DESC
LIMIT 25;
```
