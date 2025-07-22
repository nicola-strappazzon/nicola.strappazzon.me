+++
draft = true
title = 'AVR Dx'
+++

Cualquiera que se haya iniciado con los microcontroladores habrá escuchado hablar del mitico ATmega328 creado por Atmel para la familia megaAVR, en el año 2016 Atmel fue adquirida por Microchip Technology. Este era 

Hagamos un repaso historico

8-bit

ATmega328P y ATmega328PB

La P es de Power, y PB es de picoPower®

atmega168 y atmega88


ATmega32
ATmega32u4
ATmega328
ATmega328P
ATmega328PB

La arquitectura AVR® es RISC. RISC - reduced instruction set computing



El AVR es una arquitectura muy versátil y fácil de entender. Existen numerosos libros, tanto online como offline, sobre los conceptos del AVR. Si ya has leído el 8051, aprenderlo te resultará mucho más fácil. El AVR es, en resumen, una versión mejorada del 8051 con funciones adicionales. Incluye todas las características necesarias, como RAM, memoria flash, registros de propósito general, EEPROM, temporizador de vigilancia, bits fusibles para configurar el chip, diferentes modos de programación de la memoria flash, diferentes protocolos de comunicación como SPI, I₂C, UART, pines PWM, etc.


🧪 Origen académico (1995)
Los microcontroladores AVR fueron diseñados por Alf-Egil Bogen y Vegard Wollan, dos estudiantes de electrónica de la Universidad Noruega de Ciencia y Tecnología (NTNU).
El nombre "AVR" proviene de sus nombres: Alf-Vegard RISC (aunque Atmel nunca lo confirmó oficialmente).
Fue uno de los primeros microcontroladores comerciales con memoria Flash programable en circuito (ISP), lo que era una gran ventaja frente a EEPROM o ROM fija.
🏭 Atmel los adopta
Atmel contrató a Bogen y Wollan, y comenzó la producción de los primeros AVR en 1996.
El primer AVR comercial fue el AT90S1200, lanzado en 1997.

🧬 Evolución de la familia AVR

Año	Modelo	Notas clave
1997	AT90S1200	Primer AVR comercial (8 bits, sin SRAM, sin ADC)
1998–2000	AT90S2313, AT90S4433	Primeros modelos con más funcionalidades
2002	ATmega8	Inicio de la familia "ATmega", más flash y periféricos
2005	ATmega88, ATmega168	Mejora en densidad de memoria y periféricos
2008	ATmega328	Popularizado por Arduino
2010+	ATtiny series, XMega	Más pequeños o más potentes según la gama
2006–2012	AVR32 (UC3)	AVR de 32 bits, discontinuado luego por Microchip
2016+	Microchip compra Atmel	Microchip hereda y sigue fabricando AVR y ARM (SAM)
💡 Contribución al hobbyismo y educación

Arduino (2005): una de las razones por las que AVR se volvió tan conocido. Usaba el ATmega8 y luego el ATmega168/328, acercando la programación de microcontroladores al público general.
AVR-GCC: herramienta libre para compilar código C para AVR. Hizo muy fácil el acceso para programadores.

🔧 ¿Por qué tuvo tanto éxito?

Arquitectura RISC simple y eficiente (ejecución de instrucciones en un solo ciclo de reloj).
Memoria Flash programable en sistema.
Buen soporte de herramientas libres (AVR-GCC, avrdude).
Documentación clara.
Bajo costo y buena relación precio/rendimiento.
Excelente para aplicaciones embebidas pequeñas.

https://www.eetimes.com/from-avr-to-arm-with-alf-egil-bogen-and-energy-micro/
https://no.wikipedia.org/wiki/Alf-Egil_Bogen
https://no.wikipedia.org/wiki/Vegard_Wollan
https://electronicmaffia.weebly.com/avr-microcontroller.html
https://community.element14.com/products/arduino/arduino-tutorials/w/documents/3504/tracing-the-origins-of-arduino-part-1-the-avr-microcontroller
