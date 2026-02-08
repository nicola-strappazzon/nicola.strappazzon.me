+++
weight = 3
title = 'Fuse'
draft = true
+++

El pin PF6 se utiliza para reiniciar el MCU, si se desactiva la funcionalidad del RESET este se convierte en un PIN solo de lectura. Si consultas en la nota número 2 de la página número 3 del [datasheet](https://nicola.strappazzon.me/electronic/integrated-circuit/avr-dx/new-generation/AVRxxDAxx.pdf) te lo indica.

Con el siguiente comando puedes consultar el valor del `fuse5` y de los otros fuses, guarda el valor antes de modificarlo.

```bash
avrdude -c serialupdi -p avr128da28 -P /dev/cu.usbserial-310 -p avr128da28 -x rtsdtr=hight -U fuse5:r:-:h
```
```text
Reading fuse5/syscfg0 memory ...
Writing 1 byte to output file <stdout>
0xc0

Avrdude done.  Thank you.
```

Tambien puedes leerlos todos a la vez así:

```bash
avrdude -c serialupdi -p avr128da28 -P /dev/cu.usbserial-310 -p avr128da28 -x rtsdtr=hight \
  -U fuse0:r:-:h \
  -U fuse1:r:-:h \
  -U fuse2:r:-:h \
  -U fuse3:r:-:h \
  -U fuse4:r:-:h \
  -U fuse5:r:-:h
```

- `w:` write
- `:m` modo inmediato
- `fuse5` SYSCFG0
