+++
title = 'AVR Dx'
+++

## Repaso histórico

Cualquiera que se haya iniciado con los microcontroladores de 8-bit habrá escuchado hablar del mítico ATmega328 creado por Atmel para la familia ATmega que empezó en el año 2002, poco a poco fue evolucionando y la aparición de Arduino termino de popularizarse. Tiene más de dos décadas entre nosotros, y aún se sigue apostando por esta tecnología por muchos motivos. En el 2016 Atmel fue adquirida por Microchip Technology.

El AVR es una arquitectura muy versátil y fácil de entender, creo que es la favorita para el hobby y la educación. Existe una gran comunidad en torno a ella, numerosos libros, ejemplos, proyectos, etc. Si ya has leído sobre el 8051, aprenderlo te resultará mucho más fácil. El AVR es, en resumen, una versión mejorada del 8051 con funciones adicionales. Incluye todas las características necesarias, como RAM, memoria flash, registros de propósito general, EEPROM, temporizador de vigilancia, fusibles para configurar el chip, diferentes modos de programación de la memoria flash, diferentes protocolos de comunicación como SPI, I₂C, UART, pines PWM, etc.

Los microcontroladores AVR fueron diseñados por [Alf-Egil Bogen](https://no.wikipedia.org/wiki/Alf-Egil_Bogen) y [Vegard Wollan](https://no.wikipedia.org/wiki/Vegard_Wollan), dos estudiantes de electrónica de la Universidad Noruega de Ciencia y Tecnología (NTNU). Se cree que el nombre `AVR` proviene de sus nombres: Alf-Vegard y RISC (aunque Atmel nunca lo confirmó oficialmente). Pero oficialmente `AVR` sifnifica Advanced Virtual RISC.

|Año |Modelo     |Descripción                                                                      |
|----|-----------|---------------------------------------------------------------------------------|
|1997|AT90S1200  |Primer AVR comercial; muy básico, sin SRAM ni ADC.                               |
|1998|AT90S2313  |Mejora respecto al 1200, con UART y más memoria.                                 |
|1998|AT90S4433  |Con ADC, más memoria, y más pines de E/S.                                        |
|2002|ATmega8    |Primer "ATmega" con más flash (8 KB) y periféricos avanzados.                    |
|2005|ATmega88   |Versión optimizada del ATmega8, más rápida y con mejoras de periféricos.         |
|2006|ATmega168  |Igual que el 88 pero con 16 KB de flash.                                         |
|2002|ATmega32   |MCU de gama media con 32 KB Flash, 1 KB SRAM, ADC, timers, SPI, UART, etc.       |
|2008|ATmega328  |Modelo popularizado por Arduino, con 32 KB de flash.                             |
|2010|ATtiny     |Familia de bajo consumo y tamaño reducido (flash desde 0.5 KB a 8 KB).           |
|2006|AVR32      |AVR de 32 bits (UC3); arquitectura distinta, ahora discontinuado.                |
|2010|ATmega328P |Variante del 328 con tecnología picoPower® para bajo consumo.                    |
|2015|ATmega328PB|Extensión del 328P con más periféricos (TWI/SPI/UART extras).                    |
|2010|ATmega32u2 |Sin ADC; soporte USB nativo, usado en interfaces USB básicas.                    |
|2010|ATmega32u4 |Con ADC, USB, y más periféricos; usado en Arduino Leonardo y similares.          |
|2020|AVR128DA48 |Nueva serie AVR DA, con 128 KB flash, 16 KB SRAM, 24 MHz, y periféricos modernos.|
|2020|AVR64DA32  |Versión con 64 KB flash, 32 pines, misma arquitectura moderna AVR Dx.            |
|2021|AVR128DB28 |Serie DB con más periféricos (op-amp, DAC, puente analog/digital integrado).     |
|2021|AVR32DB48  |Versión de 32 KB flash de la serie DB, 48 pines, rica en periféricos.            |

## La nueva generación

La última novedad fue en el 2020 con la nueva incorporación de la familia [AVR Dx](https://www.microchip.com/en-us/products/microcontrollers/8-bit-mcus/avr-mcus/avr-db), algunos lo llaman AVR modernos, existen un buen puñado de estos; DA/DB/DD/DU y otros más, por eso el nombre Dx. Me decanté por el AVR DA como una excelente evolución y reemplazo del mítico ATmega328P (sin soporte USB, para eso está el AVR DU). Para compilar podemos seguir usando él [avrdude](https://github.com/avrdudes/avrdude) sin problemas, pero debe ser la última version posible.

Los registros y algunas lógicas de configuración de la nueva familia AVR Dx son diferentes, y para eso [Microchip ha sacado una documentación](migration-from-megaAVR-to-AVR-Dx.pdf) que explica como migrar.

Librería que usa el avrdude que está en el repositorio [avr-libc](https://github.com/avrdudes/avr-libc) que es de la misma gente, ya tiene soporte para la familia AVR Dx, o también se puede utilizar sobre el microcontrolador un framework como Arduno llamado [DxCore](https://github.com/SpenceKonde/DxCore) sobre él [Arduino IDE 1.x](https://www.arduino.cc/en/software/OldSoftwareReleases/) que funciona bastante bien. Para programarlo existe una nueva forma y mucho más simple que el clásico ISP, esta es UPDI que significa [Unified Program and Debug Interface](https://nicola.strappazzon.me/electronic/integrated-circuit/ch340/serial+updi/), solo basta con un [CH340](https://nicola.strappazzon.me/electronic/integrated-circuit/ch340/) y un puñado de componentes.

![](pinout.png)

Llevo un tiempo usando el AVR128DA28 (Versión DIP) y el AVR128DA48 (Versión SMD), programarlo no es igual que el ATmega328P porque los registros son diferentes, consulte el [Datasheet del AVR-DA](AVRxxDAxx.pdf), es más avanzado, pero aún queda mucho para que la comunidad vaya publicando ejemplos prácticos de cómo por ejemplo usar un I2C / TWI para un IC en particular, de todos modos [Microchip esta poco a poco publicando códigos fuentes de ejemplo en GitHub](https://github.com/microchip-pic-avr-examples?q=avr128&type=all&language=&sort=), igual no hay que dejar de visitar el [Foro para los Freaks de AVR](https://www.avrfreaks.net).

## Ejemplos
