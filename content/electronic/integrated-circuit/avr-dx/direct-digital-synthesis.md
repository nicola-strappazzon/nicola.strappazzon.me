+++
draft = true
title = 'Direct Digital Synthesis (DDS)'
+++

Tipos de ondas

1. Sine wave (seno), puede usar la funcion sin() o usar una tabla wavetable.
2. Sawtooth (diente de sierra)
3. Triangle wave (triángulo)
4. Pulse wave (pulso / cuadrada con duty cycle)
5. Exponential wave, hace uso de una tabla exponencial.
6. Noise wave, usa LFSR (Linear Feedback Shift Register).
7. Hilltop wave, hace uso de una tabla.

salen todas por un solo pin, acompañado de un circuito de filtro paso bajo.
se puede usar un buzzer pasivo o speaker, poner una nota para saber como saber si un buzzer es pasivo.

https://hackaday.com/2016/02/12/embed-with-elliot-audio-playback-with-direct-digital-synthesis/
https://www.weigu.lu/microcontroller/dds/index.html
https://github.com/BareMetal6502/BuzzKill

cada pieza vosc  (voice/osc) tiene un conjunto de parametros que define como suena

- Tipo = qué onda suena; (sine wave, Sawtooth, Triangle wave)
- Freq = la nota deseada.
- Step = cuánto avanza la fase por tick (derivado de freq).
- Mid = el centro de la onda (bias).
- Rev = invertir la dirección de la fase.
- Inv = invertir la polaridad de la onda.
