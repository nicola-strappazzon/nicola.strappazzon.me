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
	--env CLICKHOUSE_SKIP_USER_SETUP=1 \
	--ulimit nofile=262144:262144 \
	--publish 127.0.0.1:9000:9000 \
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
docker run --name loc-mysql-5.7 --publish 3306:3306 --env MYSQL_ROOT_PASSWORD=mysecretpassword --detach mysql:5.7
```

## MySQL 8

```bash
docker run --name mysql --publish 3306:3306 --env MYSQL_ROOT_PASSWORD=mysecretpassword --detach mysql:8
```

## ProxySQL

```bash
docker run --publish 6032:6032 --publish 6033:6033 --publish 6070:6070 --detach proxysql/proxysql
```

## PostgreSQL

```bash
docker run --name some-postgres --env POSTGRES_PASSWORD=mysecretpassword --detach --publish 5432:5432 postgres
```

## Redis

```bash
docker run --detach --name redis --publish 6379:6379 redis:latest
```

## Redis CLI

```bash
docker run -it --rm redis redis-cli -h redis.example.com
```

## InfluxDB

```bash
docker run \
      --detach \
      --publish 8086:8086 \
      --env DOCKER_INFLUXDB_INIT_USERNAME=myuser \
      --env DOCKER_INFLUXDB_INIT_PASSWORD=mysecretpassword \
      --name=influxdb \
      influxdb:2.7.10
```

## Cloudflare Tunnel

```bash
docker run \
	--detach \
	--name cloudflare-x \
	--restart=always \
	cloudflare/cloudflared:latest tunnel --no-autoupdate run --token "${CLOUDFLARE_TOKEN}"
```
