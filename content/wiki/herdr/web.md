---
title: "Web UI"
date: 2026-10-18
draft: false
weight: 2
---

## Introducción

[Herdr Web UI](https://github.com/devswha/herdr-web-ui) permite acceder desde un navegador a las sesiones de [Herdr](https://github.com/herdrdev/herdr), incluyendo agentes como Claude Code y Codex.

En esta guía instalaremos Herdr Web UI en un servidor con **Omarchy Linux**, configurando:

- Acceso desde la red local.
- Acceso remoto mediante WireGuard.
- Autenticación mediante token.
- Reglas de firewall con UFW.
- Configuración persistente.

## Instalar

Ejecutamos el instalador oficial:

```bash
curl -fsSL https://herdrweb.dev/install.sh | sh
```

El instalador comprueba las dependencias necesarias e instala Herdr Web UI como plugin de Herdr.

Podemos comprobar que el plugin está disponible:

```bash
herdr plugin list
```

Una vez instalado, el servidor web utiliza por defecto:

```text
http://127.0.0.1:7317
```

Esto significa que inicialmente solo acepta conexiones desde el propio servidor.

## Configurar

Herdr Web UI permite modificar la dirección de escucha mediante la variable de entorno `HOST`.

Primero localizamos el directorio de configuración:

```bash
herdr plugin config-dir devswha.herdr-web-ui
```

En nuestro caso:

```text
/home/nicola/.config/herdr/plugins/config/devswha.herdr-web-ui
```

Editamos el archivo `env`, sin punto inicial:

```bash
hx ~/.config/herdr/plugins/config/devswha.herdr-web-ui/env
```

Añadimos:

```ini
HOST=0.0.0.0
PORT=7317
```

Con `HOST=0.0.0.0`, el servidor escuchará en todas las interfaces de red.

> **Seguridad:** no es recomendable habilitar el acceso desde la red sin configurar autenticación. Herdr Web UI permite interactuar con terminales y ejecutar comandos.

## Autenticación

Generamos un token aleatorio:

```bash
openssl rand -hex 32
```

Copiamos el resultado y editamos nuevamente el archivo:

```bash
hx ~/.config/herdr/plugins/config/devswha.herdr-web-ui/env
```

La configuración final será:

```ini
HOST=0.0.0.0
PORT=7317
HERDR_WEB_TOKEN=REEMPLAZAR_POR_TOKEN_GENERADO
```

Protegemos el archivo:

```bash
chmod 600 ~/.config/herdr/plugins/config/devswha.herdr-web-ui/env
```

El token permite autenticar los navegadores que accedan a Herdr Web UI.

Una vez iniciada la sesión, el navegador puede conservar la autenticación mediante una cookie.

**No debemos publicar el token ni incluirlo en repositorios Git.**

## Firewall

Nuestro objetivo es permitir conexiones únicamente desde la red local y desde WireGuard.

Permitimos el acceso desde la LAN:

```bash
sudo ufw allow from 192.168.1.0/24 to any port 7317 proto tcp
```

Permitimos el acceso desde WireGuard:

```bash
sudo ufw allow from 10.50.0.0/24 to any port 7317 proto tcp
```

Comprobamos las reglas:

```bash
sudo ufw status
```

Deberíamos encontrar:

```text
7317/tcp    ALLOW    192.168.1.0/24
7317/tcp    ALLOW    10.50.0.0/24
```

No necesitamos abrir el puerto `7317` en el router.

El acceso remoto se realizará mediante WireGuard.

## Reiniciar

Detenemos el plugin:

```bash
herdr plugin action invoke devswha.herdr-web-ui.stop
```

Lo iniciamos nuevamente:

```bash
herdr plugin action invoke devswha.herdr-web-ui.start
```

Esto reinicia Herdr Web UI sin necesidad de detener el servidor principal de Herdr.

> **Nota:** Herdr Web UI puede tardar unos segundos en estar disponible después del arranque.

## Verificar

Ejecutamos:

```bash
sudo ss -lntp | grep 7317
```

Antes de modificar la configuración, obteníamos:

```text
LISTEN 0 512 127.0.0.1:7317 0.0.0.0:*
```

Después del cambio, esperamos:

```text
LISTEN 0 512 0.0.0.0:7317 0.0.0.0:*
```

Esto confirma que el servicio acepta conexiones en las interfaces de red del servidor.

## 7. Verificar la autenticación

Podemos comprobar que la API requiere autenticación:

```bash
curl -i http://127.0.0.1:7317/api/session
```

La respuesta esperada es:

```http
HTTP/1.1 401 Unauthorized
Content-Type: application/json; charset=utf-8

{"error":{"code":"unauthorized","message":"token required"}}
```

El código `401` es correcto: significa que la aplicación está funcionando y exige un token.

También podemos probar la autenticación mediante una cabecera HTTP:

```bash
curl -i \
  -H "Authorization: Bearer ${HERDR_WEB_TOKEN}" \
  http://127.0.0.1:7317/api/session
```

Este ejemplo requiere que `HERDR_WEB_TOKEN` esté definida en la sesión actual de la terminal.

El archivo `env` del plugin no carga automáticamente esa variable en nuestro shell.

## 8. Acceder desde el navegador

### Desde la red local

Abrimos:

```text
http://192.168.1.100:7317
```

### Desde WireGuard

Con la VPN conectada:

```text
http://10.50.0.1:7317
```

Herdr Web UI solicitará el token de autenticación.

Una vez introducido, el navegador conservará la sesión.

> **Importante:** HTTP no cifra las credenciales ni el contenido de la sesión. WireGuard protege el tráfico dentro del túnel VPN, pero para acceder de forma segura desde otros dispositivos de la LAN es recomendable utilizar HTTPS.

## 9. Solución de problemas

### No puedo acceder desde otro equipo

Comprobamos la dirección de escucha:

```bash
sudo ss -lntp | grep 7317
```

Si aparece:

```text
127.0.0.1:7317
```

El servicio únicamente acepta conexiones locales.

Revisamos que el archivo `env` contenga:

```ini
HOST=0.0.0.0
```

Y reiniciamos el plugin.

### La página responde con 401 Unauthorized

Si ejecutamos:

```bash
curl -i http://127.0.0.1:7317/api/session
```

Y obtenemos:

```text
401 Unauthorized
```

El servidor está funcionando, pero requiere autenticación.

No es un error de conectividad.

### El navegador tarda en cargar

Después de reiniciar el plugin, esperamos unos segundos antes de volver a intentar acceder.

Podemos comprobar si el servidor está escuchando:

```bash
sudo ss -lntp | grep 7317
```

### Comprobar el estado del plugin

Ejecutamos:

```bash
herdr plugin action invoke devswha.herdr-web-ui.status
```

Este comando invoca la acción de estado del plugin. Su respuesta inicial puede limitarse a confirmar que la acción se está ejecutando.

## Conclusión

Con esta configuración tenemos Herdr Web UI funcionando en nuestro servidor Omarchy Linux.

Podemos acceder a nuestras sesiones de Claude Code y Codex desde cualquier equipo autorizado de la red local o mediante WireGuard.

La instalación utiliza la configuración nativa del proyecto, sin necesidad de añadir proxies ni servicios adicionales.

### Referencias

- [Herdr Web UI — GitHub](https://github.com/devswha/herdr-web-ui)
- [Herdr Web UI — Documentación](https://github.com/devswha/herdr-web-ui/blob/main/docs/guide.md)
- [Herdr Web UI — Instalación](https://github.com/devswha/herdr-web-ui/blob/main/INSTALL.md)
- [Herdr — GitHub](https://github.com/herdrdev/herdr)
