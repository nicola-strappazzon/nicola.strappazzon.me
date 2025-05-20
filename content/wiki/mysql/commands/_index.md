+++
date = '2025-05-09T10:56:29+02:00'
draft = true
title = 'MySQL commands for DBA'
tags = ["mysql", "bash", "dba"]
+++

# MySQL commands for DBA

## Show progress of load script

```bash
pv -e -p -t updates.sql | mysql -h 127.0.0.1 -u $MYSQL_USER -p$MYSQL_PASSWORD --batch --silent
```

## Kill all MySQL process

The command `m` is a alias from `mysql -h 127.0.0.1 -u $MYSQL_USER -p$MYSQL_PASSWORD`.

```bash
m -se "SHOW PROCESSLIST" | awk '{print "KILL "$1";"}' | m
```

For RDS use the follow commands, and in this example kill the all sleep process:

```bash
m -se "SHOW PROCESSLIST" | grep Sleep | awk '{print "CALL mysql.rds_kill("$1");"}' | m -f
```

## Dump users and privileges

```bash
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -BNe "SELECT DISTINCT CONCAT('SHOW GRANTS FOR ''', user, '''@''', host, ''';') AS query FROM mysql.user" \
| \
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD \
| \
sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/--\1--/;//{x;p;x;}'
```

## Modify many tables in many databases

```bash
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -Bse "SELECT DISTINCT CONCAT(\"ALTER TABLE \", TABLE_SCHEMA,\".foo ADD created_at datetime NOT NULL;\") AS sql_text FROM information_schema.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA LIKE 'site\_%' AND TABLE_NAME = 'foo';"
\ |
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD
```
