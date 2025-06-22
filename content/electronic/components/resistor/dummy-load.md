+++
draft  = false
title  = 'Carga ficticia'
weight = 4
+++

Una carga ficticia (dummy load) o carga fantasma, es un dispositivo o una forma alternativa que se utiliza en lugar de una carga real para simular las condiciones de carga en un circuito. Se usa frecuentemente para probar fuentes de alimentación, amplificadores y otros equipos electrónicos sin necesidad de conectar la carga final prevista. También se utiliza para representar una carga en un circuito esquemático sin entrar en detalles. Sin este tipo de carga el circuito no realiza lo esperado.

La carga ficticia disipa la energía en forma de calor y permite verificar el comportamiento del circuito bajo condiciones controladas, el componente principal es una o varias resistencias, dependiento de la tolerancia exigida (watt) pueden ser de una forma tradicional o bobinadas de montaje sobre chasis, ya que son mas robustas y resistentes, utilizando una o varias con una combiacion ideal se puede obtener una cantidad de ohms y watios (watt) deseada, las resistecas se suelen fijar sobre disipadores de calor.

Para este simple ejemplo, vamos a usar una resistencia con un valor de potencia alta, como por ejemplo una resistencia de 10Ω que soporta una potencia por encima de 2.5W y con una precisión de ±5%, esta resistencia será conectada a una fuente de voltaje ajustable que proporcionara 5V y 0.5A. Deberá ajustar los valores de la fuente usando un multímetro.

{{< svg name="draw01" >}}

Para calcular la corriente a través de la resistencia R{{< sub "L">}}:

{{< mathjax "I=\frac{V}{R_{L}}=\frac{5V}{10\Omega}=0,5A" >}}

La disipación de potencia en la resistencia se calcula usando: 

{{< mathjax "P=V x I=5V x 0.5A = 2.5W" >}}

Por lo tanto, se debe utilizar una resistencia por encima de 2.5W para evitar daños, por ejemplo una de 3W.

Otro ejemplo de uso, es la de conectar una carga ficticia en la saliad de un amplificador de audio para realizar pruebas o mediciones sin necesidad de conectar un Altavoz evitando diversos problemas, como por ejemplo: ruidos molestos, daños, o molestias a los vecinos.

{{< svg name="draw02" >}}

En este caso tenemos un amplificador de audio con una salida de 8 ohms y 70 watt por canal. Entonces la carga ficticia debe ser de la mism imperacia (8 ohm) y un valor superior de 70 watt, esto ultimo para aumentar la resistencia del componente y reducir el calor disipado.

Para la construccion de este dispositivo depende de los componentes disponibles y presupuestos, ponemos varios ejemplos al que mas se ajuste a su necesidad:

Este es el caso en que un solo componente hace de carga ficticia.

{{< svg name="draw03" >}}

La siguiente combinación de resistencias en paralelo nos permite tener una carga ficticia de 8 ohms y 150 watt.

{{< svg name="draw04" >}}

Para esta combinación de resistencias en paralelo nos permite tener una carga ficticia de 7.86 ohms y 200 watt.

{{< svg name="draw05" >}}

<!-- Como calcular los watts o RMS del amplificador. -->
