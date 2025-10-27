+++
title = 'Reclamar espacio'
tags = ["bash", "docker"]
+++

Es muy habitual si trabajamos con Docker quedarnos sin espacio de disco, estos comandos te permiten reclamar espacio, seguramente deberás ejecutarlos todos.

Elimina todo lo que no se ha usado; contenedores, network, imagenes, volumenes:

```bash
docker system prune -f
```

Elimina todos los contenedores y sus volumenes:

```bash
docker rm -vf $(docker ps -aq)
```

Elimina todas las imagenes:

```bash
docker rmi -f $(docker images -aq)
```
