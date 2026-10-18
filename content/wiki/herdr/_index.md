---
title: "Herdr"
date: 2026-10-18
draft: false
---

## ¿Qué es Herdr?

[Herdr](https://herdr.dev/) es un multiplexor de terminales diseñado especialmente para trabajar con agentes de programación como **Claude Code, Codex y OpenCode**.

Podemos considerarlo una alternativa moderna a tmux, pero orientada a gestionar múltiples proyectos y agentes de inteligencia artificial.

Su principal ventaja es que permite mantener las terminales ejecutándose en segundo plano, incluso cuando cerramos la aplicación o perdemos la conexión SSH.

## ¿Para qué sirve?

Herdr permite:

- **Gestionar múltiples proyectos:** organizar cada proyecto en su propio workspace.
- **Ejecutar varios agentes:** utilizar Claude Code y Codex simultáneamente.
- **Mantener sesiones persistentes:** desconectarnos sin detener los procesos.
- **Supervisar agentes:** identificar cuáles están trabajando, esperando instrucciones o inactivos.
- **Organizar terminales:** crear pestañas y dividir paneles.
- **Acceder remotamente:** recuperar las sesiones desde otra terminal mediante SSH.
- **Extender funcionalidades:** instalar plugins como Herdr Web UI.

Además, Herdr está desarrollado en Rust y funciona directamente en la terminal, sin necesitar Electron.
