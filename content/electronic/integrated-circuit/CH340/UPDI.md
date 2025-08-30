+++
title = 'UPDI'
+++

UPDI significa Unified Program and Debug Interface, Está diseñada para facilitar enormemente la programación de chips AVR modernos, entre otros. Básicamente cualquier chip (FT232/CP2102N/CH340/etc) que permita comunicación USB a Serial es compatible usando una resistencia y un diodo schottky conectados en los puertos TX y RX cómo se aprecia en el siguiente diagrama. Lo cual es una opción muy versátil y económica.

## Componentes

- Un IC CH340.
- Condensador de 10nF.
- Condensador de 100nF / 0.1uF, Código: 104, Cantidad: 2.
- Resistencia de 470 ohm (Puede ser de 1k ó 4.7k).
- Diodo schottky 1N5817 (puede ser otro; BAT43).

## Esquema

![](https://github.com/nicola-strappazzon/CH340/blob/main/img/minimal_updi_schematic.png?raw=true)
