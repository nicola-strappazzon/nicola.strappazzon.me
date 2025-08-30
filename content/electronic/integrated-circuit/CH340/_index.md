+++
title = 'CH340'
+++

Este es un simple CI que permite la comunicación USB 2.0 a Serial & UPDI de muy bajo coste, diseñado y fabricado en china por [Jiangsu Heng Qin Ltd. (WCH)](http://www.wch-ic.com). Para usar el CI conectado a un ordenador/computadora, necesitas tener instalado el driver. De momento nos vamos a centrar en el CH340C/B que tiene unas prestaciones muy versátiles, entre ellas destacan las siguientes:

- Las versiones CH340C/N/K/E/X/B tiene reloj integrado, no requiere cristal externo. CH340B también integra una EEPROM utilizada para configurar el número de serie, etc.
- USB 2.0 a Serial, compatible con RS232, RS485, RS422.
- Usa el protocolo UART para comunicarse con el MCU.
- Soporta 5v y 3.3v.

{{% blockquote type="note" %}}
En este [repositorio](https://github.com/nicola-strappazzon/CH340) podrás tener acceso a un diseño de PCB que puedes construir tu mismo cómo cualquier material adicional que pueda ser de interés.
{{% /blockquote %}}


También podemos configurar el UART para Unified Program and Debug Interface (UPDI) que es habitual para programar los Microcontroladores (MCU) como el AVR Dx.

![](https://github.com/nicola-strappazzon/CH340/blob/main/img/minimal_protoboard.jpg?raw=true)

En la imagen mostramos el circuito básico y la conexión con un ATMega328P.

Puedes conseguir el CH340 en la tienda oficial del fabricante en [AliExpress](https://wchofficialstore.es.aliexpress.com/store/1100367542) o en un distribuidor autorizado en china [LCSC](https://www.lcsc.com).
