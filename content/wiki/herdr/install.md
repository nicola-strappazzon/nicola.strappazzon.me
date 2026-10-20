---
title: "Instalar"
date: 2026-10-18
draft: false
weight: 1
---

## Instalar

Ejecutamos el instalador oficial y verificamos su versión:

```bash
curl -fsSL https://herdr.dev/install.sh | sh
herdr --version
```

## Iniciar

Para iniciar la aplicación:

```bash
herdr
```

Se abrirá la interfaz de terminal desde la que podremos administrar nuestros proyectos y sesiones.

Herdr utiliza una arquitectura cliente-servidor.

El servidor mantiene las sesiones activas, mientras que el cliente proporciona la interfaz para interactuar con ellas.

Esto permite cerrar el cliente sin finalizar los procesos que se están ejecutando.
