+++
draft  = false
title  = 'Resistencia equivalente'
weight = 7
+++

La resistencia equivalente es aquella resistencia que puede sustituir todas las resistencias de un circuito eléctrico. Por lo tanto, es aquella que absorbe la misma intensidad de corriente que todas las resistencias del circuito juntas.

{{< svg name="draw01" >}}

Una resistencia equivalente (R{{< sub "eq" >}}) reemplaza todas las resistencias y las intensidades por una sola. En la práctica, es común encontrarse con una red compleja de resistencias que se deben analizar. Para simplificar el análisis, es posible calcular una resistencia equivalente que represente toda la red. Aquí describiremos cómo calcular esta resistencia en diferentes configuraciones.

## Resistencias en Paralelo

Cuando las resistencias están conectadas en paralelo, la corriente se divide entre ellas, y la resistencia equivalente se calcula mediante la fórmula:

{{< mathjax "\frac{1}{R_{eq}}=\frac{1}{R_{1} + 1} + \frac{1}{R_{2} + 1} + \frac{1}{R_{3} + 1} + \frac{1}{R_{n} + 1}" >}}

## Resistencias en Serie

Las resistencias en serie es cuando están dispuestas una detrás de la otra, de manera que la corriente fluye a través de cada una de ellas sucesivamente. El valor de R{{< sub "eq" >}} es simplemente la suma de cada una de las resistencias individuales:

{{< mathjax "R_{eq}=R_{1} + R_{2} + R_{3} + R_{n}" >}}
