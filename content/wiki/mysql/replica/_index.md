+++
title = 'MySQL replication debug'
tags = ["mysql", "dba"]
weight = 3
+++

## Conocer el estado

```SQL
SHOW REPLICA STATUS\G
```

Aquí lo importante es ver las siguientes variables:

```
Replica_IO_Running: Yes
Replica_SQL_Running: No
Seconds_Behind_Source: 0
```

Si no hay errores, las dos primeras variables; `Replica_IO_Running` y `Replica_SQL_Running` deben tener el valor `Yes`. Luego se puede presentar un retardo en segundos en aplicar los cambios, ese valor lo indica la variable `Seconds_Behind_Source` la cual debe estar siempre en 0, si tiene un valor alto deberá revisar la causa y se puede deber a varios motivos:

- Lentitud en aplicar los cambios: hardware lento, gran número de cambios.
- Bloqueo de tablas en la replica: Queries lentas, falta de indices, ALTER en progreso.
- Configuración.

Si hay algún error que se haya producido en el proceso de replicación una de las variables `Replica_IO_Running` y `Replica_SQL_Running` podrá tener el valor `No`, y un detalle inicial del problema lo podrás ver facilmente en una de estas variables:

- Last_IO_Errno
- Last_IO_Error
- Last_Errno
- Last_Error
- Last_SQL_Errno
- Last_SQL_Error

## Estado de cada worker

```SQL
SELECT worker_id, thread_id, service_state, last_error_number, last_error_message, last_applied_transaction
FROM performance_schema.replication_applier_status_by_worker;
```

La cantidad de rows debe coincidir con el valor asignado en la variable `slave_parallel_workers`.

## Conocer el tiempo que tarda en aplicar los cambios

```SQL
SELECT
  worker_id,
  thread_id,
  service_state,
  last_error_number,
  last_error_message,
  last_applied_transaction,
  TIMESTAMPDIFF(SECOND,
    last_applied_transaction_start_apply_timestamp,
    last_applied_transaction_end_apply_timestamp
  ) + ((MICROSECOND(last_applied_transaction_end_apply_timestamp) - MICROSECOND(last_applied_transaction_start_apply_timestamp)) / 1000000
  ) AS last_applied_seconds
FROM performance_schema.replication_applier_status_by_worker;
```

## Variables relacionadas

Las siguientes variables suelen mejorar el rendimiento:

- `innodb_flush_log_at_trx_commit=2`
- `sync_binlog=0`
- `slave_parallel_workers=4` Si cambias este valor debes detener y reanudar la replicación. Aumentar no significa que vaya más rápido, puede ayudar.
- `binlog_transaction_dependency_tracking`
- `slave_preserve_commit_order`

## Ignorar objetos

Es posible ignorar los cambios de una o varias tablas ajustando la variable `replicate-ignore-table`. El nombre de la tabla debe estar acompañado del nombre de la base de datos `db.table`. Cada tabla separada por `,`.

## Troubleshooting

### Error number: 13146

Mensaje de error:

```
Worker 2 failed executing transaction '7daa9221-f81c-11ee-a5e5-066f1686b5af:4001763498' at source log mysql-bin-changelog.202710, end_log_pos 133307795; Column 15 of table '<database>.<table>' cannot be converted from type 'int' to type 'bigint unsigned'
```

Solución: `SLAVE_TYPE_CONVERSIONS=ALL_NON_LOSSY`.

Una vez aplicado el cambio verifique, detenga y reanude la replicación. Si el cambio no aparece reinicie el servidor si es necesario.
