+++
draft  = false
title  = 'Resistencia equivalente'
weight = 7
+++

La resistencia equivalente es aquella resistencia que puede sustituir todas las resistencias de un circuito eléctrico. Por lo tanto, es aquella que absorbe la misma intensidad de corriente que todas las resistencias del circuito juntas.

{{< svg name="draw01" >}}

Una resistencia equivalente (R\textsubscript{eq}) reemplaza todas las resistencias y las intensidades por una sola. En la práctica, es común encontrarse con una red compleja de resistencias que se deben analizar. Para simplificar el análisis, es posible calcular una resistencia equivalente que represente toda la red. Aquí describiremos cómo calcular esta resistencia en diferentes configuraciones.

## Resistencias en Paralelo

Cuando las resistencias están conectadas en paralelo, la corriente se divide entre ellas, y la resistencia equivalente se calcula mediante la fórmula:

<!-- \[\frac{1}{R\textsubscript{eq}}=\frac{1}{R\textsubscript{1} + 1} + \frac{1}{R\textsubscript{2} + 1} + \frac{1}{R\textsubscript{3} + 1} + \frac{1}{R\textsubscript{n} + 1}\] -->

## Resistencias en Serie

Las resistencias en serie es cuando están dispuestas una detrás de la otra, de manera que la corriente fluye a través de cada una de ellas sucesivamente. El valor de R\textsubscript{eq} es simplemente la suma de cada una de las resistencias individuales:

<!-- \[R\textsubscript{eq}=R\textsubscript{1} + R\textsubscript{2} + R\textsubscript{3} + R\textsubscript{n}\] -->

### Resistencias combinadas en Serie y Paralelo

En muchos circuitos, las resistencias están dispuestas en una combinación de configuraciones en serie y en paralelo. En este caso, se deben analizar por separado las partes en serie y en paralelo, y luego combinarlas para obtener la resistencia equivalente total.

Este proceso puede ser iterativo, simplificando gradualmente el circuito en partes más pequeñas hasta obtener una única resistencia equivalente que represente todo el circuito.

Para calcular una red compleja de resistencias, se sigue un proceso iterativo, simplificando el circuito paso a paso:

- Identificar y aislar las resistencias en serie y en paralelo en el circuito.
- Calcular las resistencias equivalentes de las secciones en serie y en paralelo utilizando las fórmulas mencionadas anteriormente.
- Sustituir las resistencias calculadas en el circuito original, reduciendo su complejidad.
- Repetir los pasos del 1 al 3 hasta obtener una única resistencia equivalente.

Calcular la resistencia equivalente es una herramienta esencial en la ingeniería eléctrica y la electrónica. Permite diseñar y analizar circuitos complejos, facilitando la comprensión de cómo fluye la corriente en ellos.

<!-- hablar de los diversos componentes que actuan como resistencia -->
<!-- potenciometro -->
<!-- hablar de como puedes hacer una resistencia casera -->
<!-- dispositivos especiales: aqui se puede hablar de los diferentes componentes que tienen una resistencia como una ldr, termistores NTC, las de las calefacciones, Efecto piezorresistivo (Galga extensiométrica). -->
