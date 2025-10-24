+++
title = 'MySQL replication debug'
tags = ["mysql", "dba"]
weight = 3
+++

## Conocer el estado de la replicación:

```SQL
SHOW REPLICA STATUS\G
```

Aquí lo importante es ver las siguientes variables:

```
Replica_IO_Running: Yes
Replica_SQL_Running: No
Seconds_Behind_Source: 0
```

O esta con un valor alto tambien:

```
Seconds_Behind_Source: 0
```

Pero si vemos una de estas con el valor `No` hay que preocuparse.

```
Replica_IO_Running: Yes
Replica_SQL_Running: No
```

Si hay algún error que se haya producido en el proceso de replicación, lo podrás ver facilmente en una de estas variables:

- Last_IO_Errno
- Last_IO_Error
- Last_Errno
- Last_Error
- Last_SQL_Errno
- Last_SQL_Error

## Conocer el estado de cada worker

```SQL
SELECT worker_id, last_error_number, last_error_message
FROM performance_schema.replication_applier_status_by_worker;
```

## Conocer el tiempo que tarda en aplicar los cambios

```SQL

```

## Variables relacionadas

Las siguientes variables suelen mejorar el rendimiento:

- `innodb_flush_log_at_trx_commit=2`
- `sync_binlog=0`
- `slave_parallel_workers=4` Si cambias este valor debes detener y reanudar la replicación.
- `binlog_transaction_dependency_tracking`
- `slave_preserve_commit_order`

## Ignorar objetos

Es posible ignorar los cambios a una o varias tablas cambiando la variable `replicate-ignore-table`.

## Troubleshooting

### Error number: 13146

- Mensaje de error: `Worker 2 failed executing transaction '7daa9221-f81c-11ee-a5e5-066f1686b5af:4001763498' at source log mysql-bin-changelog.202710, end_log_pos 133307795; Column 15 of table '<database>.<table>' cannot be converted from type 'int' to type 'bigint unsigned'`
- Solución: `SLAVE_TYPE_CONVERSIONS=ALL_NON_LOSSY`.

Una vez aplicado el cambio verifique, detenga y reanude la replicación. Si el cambio no aparece reinicie el servidor si es necesario.
