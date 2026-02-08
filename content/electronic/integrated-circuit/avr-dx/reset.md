+++
weight = 3
title = 'External Reset'
draft = false
+++

El pin PF6 se utiliza para reiniciar el MCU, si se desactiva la funcionalidad del RESET este se convierte en un PIN solo de lectura. Si consultas en la nota número 2 de la página número 3 del [datasheet](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/new-generation/AVRxxDAxx.pdf) te lo indica.

Al final de la página 21 se indica el circuito del reset:

![](schematic01.png)

Para desactivar el modo RESET debemos ejecutar el siguiente comando que cambia el fuse `-U fuse5:w:0x08:m`:

```bash
avrdude -c serialupdi -p avr128da28 -P /dev/cu.usbserial-310 -p avr128da28 -x rtsdtr=hight -U fuse5:w:0xF2:m
```

Para volver activar el modo RESET debes usar el siguiente comando:

```bash
avrdude -c serialupdi -p avr128da28 -P /dev/cu.usbserial-310 -p avr128da28 -x rtsdtr=hight -U fuse5:w:0xFA:m
```

Se recomienda que el circuito siempre tenga el botón de RESET.
