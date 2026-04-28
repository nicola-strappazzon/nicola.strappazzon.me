+++
weight = 10
title = 'Tone'
draft = true
+++

Existe una gran cantidad de documentación sobre hacer tonos (sonidos) con el buzzer y un MCU, pero aquí quiero profundizar, dar ejemplos útiles y resolver todas las dudas.

Antes de empezar quisiera que usaras el ordenador para crear estos sonidos desde la terminal para entender mejor y luego programarlos en el MCU.

casi la gran mayoria de sonido son de ondas cuadradas

sine (senoidal)

sox -n sine.wav synth 0.05 sine 440

Para generar los otros tipos de ondas dejo los ejemplos:

square (cuadrada)

sox -n square.wav synth 0.05 square 440

triangle (triangular)

sox -n triangle.wav synth 0.05 triangle 440

sawtooth (diente de sierra)

sox -n saw.wav synth 0.5 sawtooth 440

noise (ruido blanco)

sox -n noise.wav synth 0.5 noise 440

Existen mas tipos de ruido; pluck, noise, pinknoise y brownnoise. Pero para sistemas de 8-bit clásicos se usa white noise digital generado por LFSR (ruido pseudoaleatorio uniforme).

Puedes abrir los ficheros .wav con [Audacity](https://www.audacityteam.org) para visualizar el tipo de onda y reproducirlo





|Evento          |Frecuencia  |Duración  |Patrón               |
|----------------|------------|----------|---------------------|
|Click UI        |2-4 kHz     |5-15 ms   |Pulso único          |
|Rebote pared    |2-4 kHz     |8-20 ms   |Pulso corto          |
|Rebote fuerte   |1-2 kHz     |30-60 ms  |Pulso medio          |
|Disparo         |3-8 kHz     |10-40 ms  |Pulso + posible caída|
|Impacto         |800 Hz-3 kHz|20-80 ms  |Descenso rápido      |
|Power-up        |500→2kHz    |60-150 ms |Sweep ascendente     |
|Nivel completado|800-2kHz    |200-500 ms|Arpegio mayor        |
|Boot            |600-1.5kHz  |40-120 ms |Arpegio corto        |
|Game Over       |200-400 Hz  |150-400 ms|Descenso lento       |
|Victoria        |800Hz-3kHz  |300-800 ms|Secuencia ascendente |

Buzzer pasivo (piezoeléctrico) y las ondas se generan usando PWM como onda cuadrada.

El Buzzer suele usar entre 3.3V hasta 5V y sino supera los 20mA lo puedes conectar directamente al PIN del MCU. Si consume más corriente de lo que soporta el PIN del MCU entonces debes usar un transistor NPN o MOSFET. Si tienes dudas usa un transistor y si quieres hacer un circuito robusto usa un transistor. Seguramente el datasheet te indica cual es la mejor forma de conectarlo.

Para saber si es pasivo debes conectarlo a la fuente de alimentación y si no suena es pasivo, y si suena es activo.
Internamente los pasivos no tienen un oscilador interno mientras las activos si tienen.

[PS1240P02BT](https://www.digikey.es/es/products/detail/tdk-corporation/PS1240P02BT/935924)
