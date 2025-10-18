+++
draft = true
title = '555 Boost converter desde 3V hasta "12V"'
+++

{{% blockquote type="note" %}}
Sigo trabajando en mejorar y terminar el artículo. De momento esta incompleto.
{{% /blockquote %}}

Hace un tiempo descubrí que es posible pasar de un voltaje menor a uno mayor en corriente continua utilizando ciertos componentes, algunos más eficientes que otros. Me puse a investigar cómo hacer uno con un *555*, pero leí que era **muy ineficiente**, y razón no les falta. Aun así, me dediqué a verificar los esquemas que encontraba, y al probarlos noté lo que comentaban: no son en absoluto ineficientes, ya que presentan una **bajada de tensión** considerable y una **pérdida de energía** en el transistor. A pesar de eso, seguí estudiando para entender cómo funciona y realicé varias pruebas hasta conseguir un circuito que no tiene ninguno de estos problemas, aunque su corriente es mínima. Considero que es aceptable.

![](breadboard.png)

Este es otro de esos ejemplos útiles que puedes realizar con un *555*, ideal para un laboratorio o una práctica que busque entender cómo funciona un circuito elevador de voltaje, capaz de convertir 5V en un valor mayor. Este tipo de circuitos se llaman Boost y suelen emplearse para alimentar arreglos de LED o pantallas OLED. La realidad es que existen componentes diseñados específicamente para esta función, por lo que son mucho más eficientes, como por ejemplo el; [MCP1661T](https://nicola.strappazzon.me/electronic/integrated-circuit/mcp1661/).

![](schematic.png)

Usé una fuente de alimentación ajustable en la entrada, lo que me permitió conocer el límite de corriente, y un voltímetro en la salida para medir el voltaje obtenido. Además, con el voltímetro también puedes conocer la frecuencia que genera el 555.

<!-- {{% blockquote type="warning" %}}
1. Sino usas el transistor correcto se sobrecalienta.
2. Sino usas un inductor de 1A por lo menos se sobrecalienta.
3. Puede llegar cerca de 90V si no pones un Diodo Zener.
4. Dependiendo del IC 555 puede operar desde los 2.xV.
5. Suele consumir bastante corriente, por eso no es eficiente.
{{% /blockquote %}} -->

<!-- Con las pruebas que hice conectando una fuente de alimentación ajustable, pude determinar que dependiendo del voltaje de entrada, podía generar los siguientes valores: -->

<!-- - Voltaje de entrada: 3.3V => Voltaje y corriente de salida: 47V / 120mA
- Voltaje de entrada: 5.0V => Voltaje y corriente de salida: 76V / 300mA

Ignore el diodo zener para saber cuál era el voltaje máximo de salida del transistor, es importante para saber el voltaje maximo del condensador. Con 5V de entrada el transistor empieza a calentarse pero no supera los 100C, su maximo es 150C. -->
<!-- 
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

 -->

<!--
### Links

https://electronics.stackexchange.com/questions/447517/why-cant-my-555-based-dc-dc-boost-converter-supply-even-3-milliamps-at-12v
https://www.homemade-circuits.com/how-to-make-simple-boost-converter-circuits/
https://rgelectrics.com/5v-to-12v-boost-converter-circuit/


https://theorycircuit.com/ic-555-ic-741/boost-converter-circuit-555/


https://www.nomad.ee/micros/vbooster/index.shtml
https://www.emcauliffe.ca/blog/2016-11-26-555-Boost-Converter
https://leap.tardate.com/electronics101/555timer/nixiepowersupply/
https://community.element14.com/technologies/experts/f/forum/50023/boost-converter

http://students.ceid.upatras.gr/~galanopu/555_circ.png
 -->

<!-- La idea la obtuve buscando en Internet hasta que me conseguí con varios post que tenían un diagrama esquemático aceptable y algunos explican cómo funciona. Al final probé este [5V to 12V Boost Converter Circuit](https://rgelectrics.com/5v-to-12v-boost-converter-circuit/), la explicación de cómo funciona me quedo con estos dos post [A Simple DC-DC Boost Converter using 555 Timer IC](https://circuitdigest.com/electronic-circuits/a-simple-boost-converter-circuit-using-555-timer-ic) y [Laptop Charger Circuit from 12V Battery](https://www.homemade-circuits.com/12v-car-laptop-charger-circuit-using/). -->
