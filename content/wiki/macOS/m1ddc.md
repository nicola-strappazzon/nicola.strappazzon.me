+++
draft = false
title = 'm1ddc'
+++

Es una pequeña [tool](https://github.com/waydabber/m1ddc) para manejar un monitor externo usando el protocolo DDC en los Apple Silicon. Podrás ajustar el brillo, los colores y cambiar de entrada desde la línea de comandos.

```bash
brew install m1ddc
```

Es importante saber que no funciona con cualquier cable conectado al monitor, hay uno que es el principal llamado DisplayPort que tiene acceso al protocolo I²C y el resto serian los HDMI, sino recibirás el siguiente mensaje de error `DDC communication failure: (iokit/?) unknown subsystem error`.

Para listar los monitores escribe:

```bash
m1ddc display list
```
```text
[1] DELL U2724DE (6CDE86E3-4958-4C2B-817F-FFB5BFA74D11)
```

Para cambiar al DisplayPort

```bash
m1ddc display 1 set input 18
```

Para cambiar al HDMI

```bash
m1ddc display 1 set input 17
```
