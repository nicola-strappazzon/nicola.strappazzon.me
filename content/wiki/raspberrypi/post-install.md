+++
title = 'Post Install'
weight = 1
+++

Es algo que hago luego de instalar el sistema operativo.

## Paquetes

Actualizamos el sistema operativo:

```bash
sudo apt update
sudo apt upgrade
```

Instalamos una serie de paquetes:

```bash
sudo apt install nmap tmux vim btop
```

## Configuración

Desactivamos el `rainbow` en el splash screen:

Debes añadir la siguiente línea `disable_splash=1` al final del fichero `/boot/firmware/config.txt` antiguamente en `/boot/config.txt`.

Si tienes el raspberry pi conectado a una red usando ethernet, y no usas el bluetooth, desactívalos por seguridad añadiendo al final del fichero donde está `[all]` las siguientes líneas:

```
dtoverlay=disable-wifi
dtoverlay=disable-bt
```

Removemos el logo de raspberry en la esquina superior de la pantalla:

Debes añadir la siguiente opción `logo.nologo` al final de la única línea que esta dentro del fichero `/boot/firmware/cmdline.txt` antiguamente en `/boot/cmdline.txt`.

## Servicios

Si usas el dispositivo cómo servidor sin entorno grafico, seguramente nada de estos servicios te hace falta:

- avahi: Permite descubrir tu dispositivo en la red usando un DNS `.local`.
- bluealsa: Gestiona el audio por Bluetooth.
- bluetooth: Controla el adaptador Bluetooth general del sistema.
- gldriver-test: Prueba el controlador gráfico OpenGL en el arranque.
- hciuart: Configura la interfaz UART para el chip Bluetooth interno del Raspberry Pi.
- lightdm: Es el gestor gráfico de inicio de sesión (interfaz visual de escritorio).
- polkit: Gestiona permisos de administración en entorno gráfico.
- systemd-logind: Maneja sesiones de usuario y dispositivos de entrada.
- udisks2: Gestiona discos y unidades extraíbles en entorno gráfico.
- wpa_supplicant: Gestiona conexiones Wi-Fi.

Hay que desactivar una serie de servicios que no hacen falta; así ahorramos algo de recursos, si ya están desactivados no pasa nada.

```bash
sudo systemctl disable avahi-daemon.service
sudo systemctl disable bluealsa.service
sudo systemctl disable bluetooth.service
sudo systemctl disable gldriver-test.service
sudo systemctl disable hciuart.service
sudo systemctl disable lightdm.service
sudo systemctl disable polkit.service
sudo systemctl disable systemd-logind.service
sudo systemctl disable udisks2.service
sudo systemctl disable wpa_supplicant.service
```
