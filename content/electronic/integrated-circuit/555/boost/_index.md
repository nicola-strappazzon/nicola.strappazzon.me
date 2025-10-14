+++
draft = false
title = 'IC 555 Boost converter desde 5V hasta 12V'
+++

Este es otro de esos ejemplos útiles con un IC 555 ideal para un laboratorio o ejercicio para entender cómo funciona un circuito que convertir de 5V hasta 12V. Este tipo de circuito se llaman `Boost` y se suelen encontrar mucho para alimentar un arreglo de LED's o pantallas OLED.

{{% blockquote type="tip" %}}
Existen muchos IC especializados para esta función, por lo que tienen mucha mejor eficiencia que un IC 555.
{{% /blockquote %}}

![](schematic.png)

Use una fuente de alimentación ajustable en la entrada y limite la corriente.

{{% blockquote type="warning" %}}
1. Sino usas el transistor correcto se sobrecalienta.
2. Sino usas un inductor de 1A por lo menos se sobrecalienta.
3. Puede llegar cerca de 90V si no pones un Diodo Zener.
4. Dependiendo del IC 555 puede operar desde los 2.xV.
5. Suele consumir bastante corriente, por eso no es eficiente.
{{% /blockquote %}}


## Componentes

- IC 555.
- [BD135](BD135.pdf).
- Dos resistencias de 1K 1/2W 5%.
- Una resistencias de 10K 1/2W 5%.
- Un condensador cerámico 560pF (561).
- Un condensador cerámico 10nF (103).
- Un condensador electrolítico 1uF de 100V.
- Un inductor con nucleo de ferrita de 100uH 1A.
- Un diodo schottky 1N5819.
- Un diodo zener de 12V 1W.

Puede cambiar el diodo zener por el valor deseado.
