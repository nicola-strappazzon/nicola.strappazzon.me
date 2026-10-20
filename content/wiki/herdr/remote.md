---
title: "Remote"
date: 2026-10-18
draft: false
weight: 3
---

## Remoto

Puedes atachar una session remota usando SSH:

```bash
herdr --remote workbox
herdr --remote ssh://you@server.example.com:22
```

Si tienes configurado el acceso SSH con el nombre `workbox` tambien podrás usarlo.

```
Host workbox
  HostName server.example.com
  User you
  Port 22
```
