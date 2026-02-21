+++
title = 'Serial'
+++

La comunicación Serial es la más elemental para comunicarnos con el MCU y el PC, en realidad estamos hablando un conversor de interfaz USB a [UART](https://www.analog.com/en/resources/analog-dialogue/articles/uart-a-hardware-communication-protocol.html).

## Componentes

Use los siguientes componentes para construir el circuito mínimo:

- Un IC CH340.
- Condensador de 10nF.
- Condensador de 100nF / 0.1uF, Código: 104, Cantidad: 2.

## Esquema

![](https://github.com/nicola-strappazzon/CH340/blob/main/img/minimal_schematic.png?raw=true)

## Ejemplos

Existen una innumerable cantidad de productos que lo usan y tienen publicado sus diagramas esquemáticos que son ideales para referencias funcionales, pongo algunos ejemplos:

- [SparkFun Serial Basic Breakout - CH340C and USB-C](15096.pdf)
- [SparkFun Serial Basic Breakout - CH340G](14050.pdf)
- [GitHub - SerialUPDI Programmer](https://github.com/wagiminator/AVR-Programmer/tree/master/SerialUPDI_Programmer)
