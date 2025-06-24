+++
draft  = false
title  = 'Divisor de corriente'
weight = 6
+++

Un divisor de corriente o divisor de intensidad, es un circuito simple formado por dos o más resistencias en paralelo. Según la ley de Ohm, en un circuito paralelo, la corriente total se divide entre las diferentes resistencias en función de su resistencia relativa. Cuanto menor sea la resistencia, mayor será la corriente que fluya a través de ella.

{{< svg name="draw01" >}}

Para calcular la intensidad solo de dos resistencias en paralelo usaremos las siguientes fórmulas, una por cada resistencia:

{{< mathjax "I_{1}=I_{t} \frac{R_{2}}{(R_{1} + R_{2})}" >}}

{{< mathjax "I_{2}=I_{t} \frac{R_{1}}{(R_{1} + R_{2})}" >}}

Aunque los divisores de corriente son esenciales en teoría, en la práctica rara vez se utilizan. De lo contrario, la teoría se utiliza como una herramienta para analizar circuitos más complejos. Por ejemplo, si un circuito tiene varias resistencias en paralelo, se puede considerar cada conjunto de resistencias como un divisor de corriente por separado para simplificar el análisis del circuito.

Es importante recordar algunas limitaciones y consideraciones de esta teoría. Primero, la ley de Ohm y la fórmula del divisor de corriente sólo se aplican a circuitos de corriente continua (CC). En los circuitos de corriente alterna (CA), la corriente y la resistencia pueden variar con el tiempo. Segundo, en circuitos reales, la resistencia puede cambiar por la temperatura y el envejecimiento.

El siguiente ejemplo demuestra la aplicación de las fórmulas.

{{< svg name="draw02" >}}

Conociento la Intencidad total It que son 3A y los valores de ambas resistencia R{{< sub "1" >}}1Ω y R{{< sub "2" >}}2Ω podemos hacer uso de las formulas I{{< sub "1" >}} y I{{< sub "2" >}} para allar su respectiva Intencidad.

{{< mathjax "I_{1}=3A \frac{2\Omega}{(1\Omega + 2\Omega)}=3A \frac{2\Omega}{3\Omega}=3A * 0.66\Omega=2A" >}}

{{< mathjax "I_{2}=3A \frac{1\Omega}{(1\Omega + 2\Omega)}=3A \frac{1\Omega}{3\Omega}=3A * 0.33\Omega=1A" >}}

Para verificar que el resultado de I{{< sub "1" >}} y I{{< sub "2" >}} son correctos, debemos sumar ambas para obtener I{{< sub "t" >}}, si el valor es igual consideramos como correcto.

{{< mathjax "I_{t}=I_{1} + I_{2}=2A + 1A = 3A" >}}

Como estamos trabajando con Intensidad, se entiende que el sobrante energético se disipa en calor, por eso debemos calcular la potencia mínima que debe soportar cada resistencia:

{{< mathjax "P_{1}=V x I_{1}=5V x 2A = 10W" >}}
{{< mathjax "P_{2}=V x I_{2}=5V x 1A = 5W" >}}

Conseguir o usar una resistencia de alto valor en watt (W) puede ser costoso o complicado, entonces se considera ponerlas en paralelo de igual valor para dividir de forma igual la Intensidad y sumar en potencia.
