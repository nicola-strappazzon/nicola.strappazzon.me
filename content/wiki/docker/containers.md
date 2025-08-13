+++
title = 'Containers'
tags = ["bash", "docker"]
+++

Esta es una lista para ejecutar diversos contenedores:

## ClickHouse

ClickHouse Server

```bash
docker run -d --network=host \
	--name clickhouse-server \
	-e CLICKHOUSE_SKIP_USER_SETUP=1 \
	--ulimit nofile=262144:262144 \
	-p 127.0.0.1:9000:9000 \
	clickhouse/clickhouse-server
```

## ClickHouse Cliente

```bash
docker run -it --rm \
	--name clickhouse-client \
	--link clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server
```

Si tienes el cliente de clickhouse instalado en el host, solo debes escribir `clickhouse client` en la terminal para poder entrar

## MySQL 5.7

```bash
docker run --name loc-mysql-5.7 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql:5.7
```

## MySQL 8

```bash
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql:8
```

## ProxySQL

```bash
docker run -p 6032:6032 -p 6033:6033 -p 6070:6070 -d proxysql/proxysql
```

## PostgreSQL

```bash
docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
```

## Redis

```bash
docker run -d --name redis -p 6379:6379 redis:latest
```

## InfluxDB

```bash
docker run \
      -d \
      -p 8086:8086 \
      -e DOCKER_INFLUXDB_INIT_USERNAME=myuser \
      -e DOCKER_INFLUXDB_INIT_PASSWORD=mysecretpassword \
      --name=influxdb \
      influxdb:2.7.10
```
