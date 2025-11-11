+++
title = 'Docker'
tags = ["bash", "docker"]
+++

Para iniciar **docker** en el equipo de forma oficial ya está generando ruido con preguntas, algunas restricciones, entre otras políticas corporativas, por eso nació `colima`, una forma de disfrutar `docker` sin el "extra".

Para instalalar `colima` y las demás tools de `docker`.

```bash
brew install colima
brew install docker docker-compose
```

Para iniciar el servicio de docker usando `colima` cómo alternativa:

```bash
colima start
```

Para listar los contenedores que se estan ejecutando:

```bash
docker ps
```

Lista las columnas más importantes:

```bash
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}"
```

Para ver el comando completo cuando se lanzo el contenedor:

```bash
docker ps -a --no-trunc
```

Para entrar dentro de un contenedor:

```bash
docker exec -it my-container sh
```

Para detener un contenedor:

```bash
docker stop my-container
```

Para eliminar un contenedor:

```bash
docker rm my-container
```
