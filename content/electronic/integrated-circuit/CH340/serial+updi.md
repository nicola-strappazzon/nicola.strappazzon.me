+++
title = 'Serial + UPDI'
+++

Esta idea la obtuve de [MCS Electronics](https://avrhelp.mcselec.com/index.html?updi_programmer.htm), ellos no usan `avrdude` y en el ejemplo usan un CI 4053. Al entender cómo funciona su solución hice los cambios más lógicos a mi parecer usando un 4052 y un pulsador.

Es posible usar el mismo CI para tener las dos funciones, pero se necesita un CI adicional que haga de switch (4052) para ir alternando a UART o UPDI y que será controlado por un pulsador, al ser presionado se activa el modo "programmer" como lo llamo yo, cuando no está presionado esta en el modo "data" o serial para que nos podamos entender. En el ejemplo de [MCS Electronics](https://avrhelp.mcselec.com/index.html?updi_programmer.htm) usan el pin DTR (Data Terminal Ready) para controlar estos modos del 4052, a pesar de que conceptualmente funciona, pero en la práctica no del todo debido a que los clientes cómo [CoolTerm](https://freeware.the-meiers.org/), [picocom](https://github.com/npat-efault/picocom) entre otros usan el DTR y termina no funcionando bien.

![](funcional-diagram-pinout.png)

## Componentes

- Un IC CH340.
- Un IC CD4052B.
- Un pulsador.
- Condensador de 10nF.
- Condensador de 100nF / 0.1uF, Código: 104, Cantidad: 2.
- Resistencia de 4.7k.
- Resistencia de 10k.
- Diodo schottky 1N5817 (puede ser otro; BAT43).

## Esquema

El CI 4052 permitirá usar un pin de control A y B en paralelo para redirigir la entrada TX y RX del CH340, al circuito de UPDI o a los pines del UART del MCU. El pulsador que hace de programador está configurado en modo PullUp.

![](schematic3.png)
