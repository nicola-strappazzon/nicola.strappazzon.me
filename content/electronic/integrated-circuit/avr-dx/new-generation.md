+++
title = 'La nueva generación'
+++

La última novedad fue en el 2020 con la nueva incorporación de la familia [AVR Dx](https://www.microchip.com/en-us/products/microcontrollers/8-bit-mcus/avr-mcus/avr-db), algunos lo llaman AVR modernos, existen un buen puñado de estos; DA/DB/DD/DU y otros más, por eso el nombre Dx. Me decanté por el AVR DA como una excelente evolución y reemplazo del mítico ATmega328P (sin soporte USB, para eso está el AVR DU). Para compilar podemos seguir usando él [avrdude](https://github.com/avrdudes/avrdude) sin problemas, pero debe ser la última version posible.

Los registros y algunas lógicas de configuración de la nueva familia AVR Dx son diferentes, y para eso [Microchip ha sacado una documentación](migration-from-megaAVR-to-AVR-Dx.pdf) que explica como migrar acompañado de bastantes ejemplos escritos en C.

Librería que usa el avrdude que está en el repositorio [avr-libc](https://github.com/avrdudes/avr-libc) que es de la misma gente, ya tiene soporte para la familia AVR Dx, o también se puede utilizar sobre el microcontrolador un framework como Arduno llamado [DxCore](https://github.com/SpenceKonde/DxCore) sobre él [Arduino IDE 1.x](https://www.arduino.cc/en/software/OldSoftwareReleases/) que funciona bastante bien. Para programarlo existe una nueva forma y mucho más simple que el clásico ISP, esta es UPDI que significa [Unified Program and Debug Interface](https://nicola.strappazzon.me/electronic/integrated-circuit/ch340/serial+updi/), solo basta con un [CH340](https://nicola.strappazzon.me/electronic/integrated-circuit/ch340/) y un puñado de componentes.

![](pinout.png)

Llevo un tiempo usando el AVR128DA28 (Versión DIP) y el AVR128DA48 (Versión SMD), programarlo no es igual que el ATmega328P porque los registros son diferentes, consulte el [Datasheet del AVR-DA](AVRxxDAxx.pdf), es más avanzado, pero aún queda mucho para que la comunidad vaya publicando ejemplos prácticos de cómo por ejemplo usar un I2C / TWI para un IC en particular, de todos modos [Microchip esta poco a poco publicando códigos fuentes de ejemplo en GitHub](https://github.com/microchip-pic-avr-examples?q=avr128&type=all&language=&sort=), igual no hay que dejar de visitar el [Foro para los Freaks de AVR](https://www.avrfreaks.net).
