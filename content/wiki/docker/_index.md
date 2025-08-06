+++
title = 'Docker'
tags = ["bash", "docker"]
+++

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

Para detener un contenedor:

```bash
docker stop my-container
```

Para eliminar un contenedor:

```bash
docker rm my-container
```
