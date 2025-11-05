+++
draft = false
title = 'ProxySQL'
+++

## Estado de las conexiones

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

## Contador general

```sql
SELECT * FROM stats_mysql_commands_counters;
```

## Errores en el backend

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

## Ping time backend servers

```sql
SELECT hostname,
       port,
       avg(ping_success_time_us) AS time_us
FROM monitor.mysql_server_ping_log
GROUP BY hostname, port;
```
