+++
draft = false
title = 'Container'
+++

Es un proyecto de [Apple](https://github.com/apple/container) que permite ejecutar contenedores con Linux de forma optimizada en los Apple silicon. Para instalarlo debes descargar el instalador pkg del siguiente [enlace](https://github.com/apple/container/releases/download/0.8.0/container-installer-signed.pkg), revisar la última version disponible en [releases](https://github.com/apple/container/releases).

Una vez instalado, deberás ejecutar el siguiente comando:

```bash
container system start
```

Para ir simplificando, vamos a definir un `alias d=container`.

## Listar

```bash
container ls
```
