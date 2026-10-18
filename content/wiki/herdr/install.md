---
title: "Instalar"
date: 2026-10-18
draft: false
weight: 1
---

## 1. Instalar Herdr

La instalación en Linux es sencilla.

Ejecutamos el instalador oficial:

```bash
curl -fsSL https://herdr.dev/install.sh | sh
```

El instalador descarga el binario correspondiente a nuestra arquitectura y lo instala en una ubicación disponible desde el `PATH`.

Es compatible con distribuciones Linux como Arch Linux, Ubuntu y Debian.

En nuestro caso utilizamos **Omarchy Linux**, basado en Arch Linux.

### Comprobar la instalación

```bash
herdr --version
```

Si el comando no se encuentra, podemos cerrar y volver a abrir la terminal para actualizar el entorno.

## 2. Iniciar Herdr

Para iniciar la aplicación:

```bash
herdr
```

Se abrirá la interfaz de terminal desde la que podremos administrar nuestros proyectos y sesiones.

Herdr utiliza una arquitectura cliente-servidor.

El servidor mantiene las sesiones activas, mientras que el cliente proporciona la interfaz para interactuar con ellas.

Esto permite cerrar el cliente sin finalizar los procesos que se están ejecutando.

## 3. Crear nuestro primer workspace

Un workspace representa un espacio de trabajo, normalmente asociado a un proyecto.

Por ejemplo, podemos organizar nuestros proyectos de esta manera:

```text
Herdr
│
├── backend
│   ├── Claude Code
│   ├── Tests
│   └── Git
│
├── infrastructure
│   ├── Codex
│   └── Terminal
│
└── data-platform
    ├── Claude Code
    ├── ClickHouse
    └── Logs
```

Cada workspace puede contener varias pestañas y paneles independientes.

Podemos ejecutar diferentes herramientas en cada uno de ellos.

Por ejemplo:

```bash
claude
```

O:

```bash
codex
```

Herdr no sustituye a estos agentes: simplemente administra las terminales donde se ejecutan.

Los agentes deben estar instalados y configurados previamente.

## 4. Desconectarnos sin detener los procesos

Una de las funcionalidades más interesantes de Herdr es la persistencia de las sesiones.

Para desconectarnos del cliente utilizamos:

```text
Ctrl+b, q
```

Primero pulsamos `Ctrl+b` y después `q`.

Los procesos continúan ejecutándose en el servidor de Herdr.

Para recuperar nuestras sesiones:

```bash
herdr
```

Volveremos a encontrar nuestros workspaces y terminales.

> **Importante:** desconectarse del cliente no es lo mismo que reiniciar el ordenador. Después de reiniciar el sistema, Herdr puede restaurar la distribución de los paneles y reanudar sesiones compatibles de agentes, pero los procesos originales no sobreviven al reinicio.

## 5. Acceder mediante SSH

Herdr resulta especialmente interesante cuando lo instalamos en un servidor dedicado.

Por ejemplo, podemos conectarnos desde nuestro Mac a un servidor Linux:

```bash
ssh nicola@192.168.1.100
```

Una vez conectados:

```bash
herdr
```

De esta manera podemos acceder a los proyectos y agentes que se ejecutan en el servidor.

Si perdemos la conexión SSH, el servidor de Herdr mantiene los procesos activos.

Al volver a conectarnos, podemos recuperar las sesiones.

Esta arquitectura es especialmente útil para trabajar con agentes que realizan tareas largas.

## 6. Comandos útiles

### Iniciar o recuperar sesiones

```bash
herdr
```

### Consultar la versión

```bash
herdr --version
```

### Comprobar el estado del servidor

```bash
herdr status server
```

### Actualizar Herdr

Si utilizamos el instalador oficial:

```bash
herdr update
```

### Consultar los plugins instalados

```bash
herdr plugin list
```

### Consultar la ayuda

```bash
herdr --help
```

## 7. Actualizaciones

Herdr dispone de un sistema de actualizaciones integrado.

Para actualizar una instalación realizada mediante el script oficial:

```bash
herdr update
```

También podemos seleccionar el canal de actualizaciones.

Canal estable:

```bash
herdr channel set stable
```

Canal de versiones preliminares:

```bash
herdr channel set preview
```

Para un entorno de trabajo habitual, es recomendable utilizar el canal estable.

> Las instalaciones realizadas mediante Homebrew, mise o Nix deben actualizarse utilizando su correspondiente gestor de paquetes.

## 8. Ampliar Herdr con Herdr Web UI

Una característica interesante de Herdr es su sistema de plugins.

Uno de ellos es [Herdr Web UI](https://github.com/devswha/herdr-web-ui), que permite acceder a las sesiones desde un navegador.

Podemos instalarlo mediante:

```bash
curl -fsSL https://herdrweb.dev/install.sh | sh
```

También podemos instalar directamente el plugin:

```bash
herdr plugin install devswha/herdr-web-ui
```

Herdr Web UI permite:

- Acceder desde un navegador.
- Utilizar Claude Code y Codex desde el móvil.
- Consultar las sesiones existentes.
- Interactuar con las terminales.
- Gestionar agentes remotamente.

Con Herdr ejecutándose en nuestro servidor y WireGuard proporcionando acceso remoto, podemos trabajar desde distintos dispositivos sin exponer directamente las terminales a Internet.

Herdr Web UI requiere configurar correctamente el acceso y la autenticación antes de permitir conexiones desde otros equipos.

## Conclusión

Herdr es una herramienta especialmente útil para quienes trabajan con múltiples proyectos y agentes de programación.

En lugar de mantener numerosas ventanas de terminal abiertas, podemos organizar todo nuestro entorno de desarrollo en una única aplicación.

Su arquitectura cliente-servidor permite mantener los procesos ejecutándose en segundo plano y recuperar nuestras sesiones desde diferentes equipos.

Combinado con SSH, WireGuard y Herdr Web UI, resulta una solución muy interesante para montar un entorno de desarrollo remoto en nuestro propio homelab.

## Referencias

- [Herdr — Web oficial](https://herdr.dev/)
- [Herdr — GitHub](https://github.com/herdrdev/herdr)
- [Herdr — Instalación](https://herdr.dev/docs/install/)
- [Herdr — Documentación](https://herdr.dev/docs/)
- [Herdr Web UI — GitHub](https://github.com/devswha/herdr-web-ui)
