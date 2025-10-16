+++
draft = false
title = '555 Boost converter desde 3V hasta "12V"'
+++

{{% blockquote type="note" %}}
Sigo trabajando en mejorar y terminar el artículo. De momento esta incompleto.
{{% /blockquote %}}

Este es otro de esos ejemplos útiles con un 555 ideal para un laboratorio o ejercicio para entender cómo funciona un circuito que convertir desde los "3V" hasta los "12V". Este tipo de circuito se llaman `Boost` y se suelen encontrar mucho para alimentar un arreglo de LED's o pantallas OLED.

<!-- La idea la obtuve buscando en Internet hasta que me conseguí con varios post que tenían un diagrama esquemático aceptable y algunos explican cómo funciona. Al final probé este [5V to 12V Boost Converter Circuit](https://rgelectrics.com/5v-to-12v-boost-converter-circuit/), la explicación de cómo funciona me quedo con estos dos post [A Simple DC-DC Boost Converter using 555 Timer IC](https://circuitdigest.com/electronic-circuits/a-simple-boost-converter-circuit-using-555-timer-ic) y [Laptop Charger Circuit from 12V Battery](https://www.homemade-circuits.com/12v-car-laptop-charger-circuit-using/). -->

![](breadboard.png)

{{% blockquote type="tip" %}}
Existen muchos IC especializados para esta función, por lo que tienen mucha mejor eficiencia que un 555.
{{% /blockquote %}}

![](schematic.png)

Use una fuente de alimentación ajustable en la entrada y limite la corriente.

<!-- {{% blockquote type="warning" %}}
1. Sino usas el transistor correcto se sobrecalienta.
2. Sino usas un inductor de 1A por lo menos se sobrecalienta.
3. Puede llegar cerca de 90V si no pones un Diodo Zener.
4. Dependiendo del IC 555 puede operar desde los 2.xV.
5. Suele consumir bastante corriente, por eso no es eficiente.
{{% /blockquote %}} -->

Con las pruebas que hice conectando una fuente de alimentación ajustable, pude determinar que dependiendo del voltaje de entrada, podía generar los siguientes valores:

<!-- - Voltaje de entrada: 3.3V => Voltaje y corriente de salida: 47V / 120mA
- Voltaje de entrada: 5.0V => Voltaje y corriente de salida: 76V / 300mA

Ignore el diodo zener para saber cuál era el voltaje máximo de salida del transistor, es importante para saber el voltaje maximo del condensador. Con 5V de entrada el transistor empieza a calentarse pero no supera los 100C, su maximo es 150C. -->

## Componentes

- [NE555P](NE555P.pdf).
- [BD135](BD135.pdf).
- Dos resistencias de 1K 1/2W 5%.
- Una resistencias de 10K 1/2W 5%.
- Un condensador cerámico 560pF 5% (561).
- Un condensador cerámico 10nF 5% (103).
- Un condensador electrolítico 1uF 10% de 100V.
- Un inductor con nucleo de ferrita de 100uH 1A. Use el modelo [RLB0914-101KL](RLB.pdf).
- Un diodo schottky 1N5819.
- Un diodo zener de 12V 1W.

Puede cambiar el diodo zener por el valor deseado.

## ¿Cómo funciona?

Aún por desarrollar.

## Los cálculos

Esta parte es bastante compleja, la vamos a dividir en tres partes; frecuencia del 555, el valor del inductor y el valor del condensador para eliminar el rizado.

### Frecuencia

Lo primero que vamos a buscar es la frecuencia del 555 en su configuración de oscilador `astable`. Usa la calculadora de [Digikey](https://www.digikey.es/es/resources/conversion-calculators/conversion-calculator-555-timer) para validar tus cálculos.

Si observamos el esquema, identificamos que `R{{< sub "1">}}=1k`, `R{{< sub "2">}}=10k` y `C{{< sub "1">}}=560{{< sub "p">}}F`, la formula es la siguiente:


{{< mathjax "f=\frac{1,44}{(R_{1} + 2 \cdot R_{2}) \cdot C_{1}}=\frac{1,44}{(1k + 2 \cdot 10k) \cdot 560{p}F}=\frac{1,44}{(1.000\Omega + 2 \cdot 10.000\Omega) \cdot 0,000000056F}=122448,9796Hz=122,44kHz" >}}

### Inductor



### Condensador de salida

