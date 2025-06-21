+++
draft = false
title = 'Resistencias'
katex = true
+++

El componente en sí no tiene una fecha exacta de creación, ni un personaje asociado, se puede decir que fue inventado a lo largo del siglo XIX (1800 hasta 1900) por diversos científicos interesados por la electricidad, donde la resistencia va evolucionando desde experimentos rudimentarios hasta ser un componente estandarizado según las necesidades de cada época.

Por lo tanto, el telégrafo puede considerarse como la primera aplicación práctica y formal de la resistencia en su forma primitiva, ya que los materiales resistivos eran una parte crucial para el funcionamiento de estos sistemas tempranos de telecomunicación.

Georg Simon Ohm, 

La intensidad y el voltaje son dos aspectos importantes de los circuitos. El tercero es la resistencia, la resistencia es la forma en que cada sustancia se opone al flujo de electrones reduciendo la fuerza de la corriente. Esta es una forma de controlar la corriente de un circuito.

Imagina a alguien pisando una manguera por la que pasa agua. La presión del agua tiene una fuerza, y una parte del agua consigue salir al otro extremo, por lo que el flujo de agua sufre una resistencia y baja la presión. Con la corriente eléctrica pasa lo mismo.

{{< svg name="resistor01" >}}

Todos los componentes ofrecen cierto grado de resistencia a la corriente eléctrica, pero existen unos componentes denominados resistencias, cuya función es reducir la corriente. Se usan para controlar la intensidad y el voltaje de otro componente o para prevenir que un componente delicado sufra por recibir demasiada corriente. Muchas resistencias contienen carbón, que es un producto que no conduce bien la electricidad.

Existen resistores cuyo valor puede ser ajustado manualmente llamados potenciómetros o simplemente resistencias variables. También se producen dispositivos cuya resistencia varía en función de parámetros externos, como los termistores, que son resistores que varían con la temperatura; los varistores, que dependen de la tensión a la que son sometidos, o las fotorresistencias que actúan de acuerdo a la luz recibida. Todas estas las trataremos en otra sección, pero la base de la teórica resistencia es la misma.

Los resistores se utilizan en los circuitos para limitar el valor de la corriente o para fijar el valor de la tensión, según la Ley de Ohm. A diferencia de otros componentes electrónicos, los resistores no tienen polaridad definida.

Se le denomina resistencia a la oposición al flujo de corriente eléctrica a través de un conductor. La unidad de resistencia en el Sistema Internacional es el ohmio, que se representa con la letra griega Ω, en honor al físico alemán Georg Simon Ohm, quien descubrió el principio que ahora lleva su nombre.

{{< svg name="resistor02" >}}

Existen muchos tipos de encapsulados para resistencias y con diferentes materiales de construcción. Para este libro solo trataremos los encapsulados de tipo axial como se observa en la figura \ref{fig:resistor-axial} que es ideal para el uso didáctico y de prototipado.

> Existen resistencias cuyo valor es de 0Ω y son utilizadas para configurar un circuito, actuando como un puente. Es un excelente ejemplo de un componente cuya función parece innecesaria al principio, y quizás incluso inútil. Sin embargo, es bastante útil para los diseñadores que la conocen y entienden cómo puede ayudar a resolver problemas de circuitos y diseños a un muy bajo coste con complicaciones mínimas o nulas.

Entre las resistencias de tipo axial, tenemos dos grandes grupos; las de carbono y las de película metálica. La primera son de propósito general, más económicas, más comunes, de muchos valores, suelen ser de un color beige con 4 bandas de colores. La segunda opción es para circuitos donde se requiere mayor precisión y durabilidad, son de color azul con 4 y 5 bandas de colores.

## Código de colores

Para identificar una resistencia hacen falta entender el código de colores que nos permite identificar el valor de la resistencia eléctrica y su tolerancia.

En los casos más comunes, las de cuatro franjas de colores, se lee de la siguiente forma: de izquierda a derecha, la primera y segunda indican el valor de la resistencia, la tercera el multiplicador, y la cuarta la tolerancia.

{{< svg name="resistor03" >}}

El valor de la resistencia se obtiene leyendo las dos primeras cifras, luego se multiplica y se obtiene el resultado en ohmios Ω, veamos un ejemplo usando la figura anterior y la siguiente tabla:

| Color | Banda | Valor |
|-------|-------|-------|
|Marron | 1     | 1     |
|Negro  | 2     | 0     |
|Rojo   | 3     | 100   |
|Oro    | 4     | ±5%   |

Las primeras dos bandas representa una cifra, si unimos la primera banda de color marrón que vale 1 y la segunda banda de color negro que vale 0 tenemos el número 10, ahora lo multiplicamos por el valor de la tercera banda de color rojo que vale 100 quedando 1000Ω y así quedaría la ecuación: `10 x 100 = 1000Ω`. La cuarta banda de color oro que vale 5% indica la tolerancia.

|          | Color                      | Banda 1 | Banda 2 | Multiplicador | Toleranci |
|----------|----------------------------|---------|---------|---------------|-----------|
| Negro    | {{< colorband "black" >}}  | 0       | 0       |             1 |           |
| Marron   | {{< colorband "brown" >}}  | 1       | 1       |            10 |        ±1 |
| Rojo     | {{< colorband "red" >}}    | 2       | 2       |           100 |        ±2 |
| Naranja  | {{< colorband "orange" >}} | 3       | 3       |         1.000 |        ±3 |
| Amarillo | {{< colorband "yellow" >}} | 4       | 4       |        10.000 |        ±4 |
| Verde    | {{< colorband "green" >}}  | 5       | 5       |       100.000 |      ±0.5 |
| Azul     | {{< colorband "blue" >}}   | 6       | 6       |     1.000.000 |     ±0.25 |
| Violeta  | {{< colorband "violet" >}} | 7       | 7       |    10.000.000 |      ±0.1 |
| Gris     | {{< colorband "gray" >}}   | 8       | 8       |   100.000.000 |           |
| Blanco   | {{< colorband "white" >}}  | 9       | 9       | 1.000.000.000 |           |
| Dorado   | {{< colorband "gold" >}}   |         |         |           0,1 |        ±5 |
| Plateado | {{< colorband "silver" >}} |         |         |          0,01 |       ±10 |

La unidad de las resistencias Ω están sujetos al prefijo del sistema internacional, por lo que se anteponen al nombre de la unidad para indicar el múltiplo o submúltiplo decimal de la misma; del mismo modo, los símbolos de los prefijos se anteponen a los símbolos de las unidades.

| Nombre      | Símbolo | Conversión               | Valor    | Ejemplo              |
|-------------|---------|--------------------------|----------|----------------------|
| mili-ohmios | mΩ      | 1mΩ = 10{{< sup "-3">}}Ω | 0.010Ω   | R{{< sub "0">}}=10mΩ |
| ohmios      | Ω       | -                        | 10Ω      | R{{< sub "1">}}=10Ω  |
| kilo-ohmios | kΩ      | 1kΩ = 10{{< sup "3">}}Ω  | 1000Ω    | R{{< sub "2">}}=1kΩ  |
| mega-ohmios | MΩ      | 1MΩ = 10{{< sup "-3">}}Ω | 1000000Ω | R{{< sub "3">}}=1MΩ  |

## Lista de resistencias comerciales

Los fabricantes crean las resistencias de muchos valores, aquí listamos en una tabla las más comunes con su respectivo código SMD y de colores:

| Ohm   | SMD |                                                                                | Ohm  | SMD |                                                                                | Ohm | SMD |                                                                                | Ohm  | SMD |                                                                                | Ohm  | SMD |                                                                                | Ohm   | SMD |                                                                                | Ohm   | SMD |                                                                                | Ohm   | SMD |                                                                                |
|-------|-----|--------------------------------------------------------------------------------|------|-----|--------------------------------------------------------------------------------|-----|-----|--------------------------------------------------------------------------------|------|-----|--------------------------------------------------------------------------------|------|-----|--------------------------------------------------------------------------------|-------|-----|--------------------------------------------------------------------------------|-------|-----|--------------------------------------------------------------------------------|-------|-----|--------------------------------------------------------------------------------|
| 0.00Ω | 0R  | {{< colorband "black" >}}{{< colorband "black" >}}{{< colorband "black" >}}    | 1.0Ω | 1   | {{< colorband "black" >}}{{< colorband "brown" >}}{{< colorband "black" >}}    | 10Ω | 10  | {{< colorband "brown" >}}{{< colorband "black" >}}{{< colorband "black" >}}    | 100Ω | 101 | {{< colorband "brown" >}}{{< colorband "black" >}}{{< colorband "brown" >}}    |1KΩ   | 102 | {{< colorband "brown" >}}{{< colorband "black" >}}{{< colorband "red" >}}      | 10KΩ  | 103 | {{< colorband "brown" >}}{{< colorband "black" >}}{{< colorband "orange" >}}   | 100KΩ | 104 | {{< colorband "brown" >}}{{< colorband "black" >}}{{< colorband "yellow" >}}   | 1.0MΩ | 105 | {{< colorband "brown" >}}{{< colorband "black" >}}{{< colorband "green" >}}    |
| 0.22Ω |     | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "silver" >}}       | 1.1Ω |     | {{< colorband "brown" >}}{{< colorband "brown" >}}{{< colorband "gold" >}}     | 11Ω | 11  | {{< colorband "brown" >}}{{< colorband "brown" >}}{{< colorband "black" >}}    | 110Ω | 111 | {{< colorband "brown" >}}{{< colorband "brown" >}}{{< colorband "gold" >}}     |1.1KΩ | 112 | {{< colorband "brown" >}}{{< colorband "brown" >}}{{< colorband "red" >}}      | 11KΩ  | 113 | {{< colorband "brown" >}}{{< colorband "brown" >}}{{< colorband "orange" >}}   | 110KΩ | 114 | {{< colorband "brown" >}}{{< colorband "brown" >}}{{< colorband "yellow" >}}   | 1.1MΩ | 115 | {{< colorband "brown" >}}{{< colorband "brown" >}}{{< colorband "green" >}}    |
| 0.47Ω |     | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "silver" >}} | 1.2Ω |     | {{< colorband "brown" >}}{{< colorband "red" >}}{{< colorband "gold" >}}       | 12Ω | 12  | {{< colorband "brown" >}}{{< colorband "red" >}}{{< colorband "black" >}}      | 120Ω | 121 | {{< colorband "brown" >}}{{< colorband "red" >}}{{< colorband "brown" >}}      |1.2KΩ | 122 | {{< colorband "brown" >}}{{< colorband "red" >}}{{< colorband "red" >}}        | 12KΩ  | 123 | {{< colorband "brown" >}}{{< colorband "red" >}}{{< colorband "orange" >}}     | 120KΩ | 124 | {{< colorband "brown" >}}{{< colorband "red" >}}{{< colorband "yellow" >}}     | 1.2MΩ | 125 | {{< colorband "brown" >}}{{< colorband "red" >}}{{< colorband "green" >}}      |
| 0.56Ω |     | {{< colorband "green" >}}{{< colorband "blue" >}}{{< colorband "silver" >}}    | 1.3Ω |     | {{< colorband "brown" >}}{{< colorband "orange" >}}{{< colorband "gold" >}}    | 13Ω | 13  | {{< colorband "brown" >}}{{< colorband "orange" >}}{{< colorband "black" >}}   | 130Ω | 131 | {{< colorband "brown" >}}{{< colorband "orange" >}}{{< colorband "brown" >}}   |1.3KΩ | 132 | {{< colorband "brown" >}}{{< colorband "orange" >}}{{< colorband "red" >}}     | 13KΩ  | 133 | {{< colorband "brown" >}}{{< colorband "orange" >}}{{< colorband "orange" >}}  | 130KΩ | 134 | {{< colorband "brown" >}}{{< colorband "orange" >}}{{< colorband "yellow" >}}  | 1.3MΩ | 135 | {{< colorband "brown" >}}{{< colorband "orange" >}}{{< colorband "green" >}}   |
| 0.68Ω |     | {{< colorband "blue" >}}{{< colorband "gray" >}}{{< colorband "silver" >}}     | 1.4Ω |     | {{< colorband "brown" >}}{{< colorband "yellow" >}}{{< colorband "gold" >}}    | 14Ω | 14  | {{< colorband "brown" >}}{{< colorband "yellow" >}}{{< colorband "black" >}}   | 140Ω | 141 | {{< colorband "brown" >}}{{< colorband "yellow" >}}{{< colorband "brown" >}}   |1.4KΩ | 142 | {{< colorband "brown" >}}{{< colorband "yellow" >}}{{< colorband "red" >}}     | 14KΩ  | 143 | {{< colorband "brown" >}}{{< colorband "yellow" >}}{{< colorband "orange" >}}  | 140KΩ | 144 | {{< colorband "brown" >}}{{< colorband "yellow" >}}{{< colorband "yellow" >}}  | 1.4MΩ | 145 | {{< colorband "brown" >}}{{< colorband "yellow" >}}{{< colorband "green" >}}   |
| 0.82Ω |     | {{< colorband "gray" >}}{{< colorband "red" >}}{{< colorband "silver" >}}      | 1.5Ω |     | {{< colorband "brown" >}}{{< colorband "green" >}}{{< colorband "gold" >}}     | 15Ω | 15  | {{< colorband "brown" >}}{{< colorband "green" >}}{{< colorband "black" >}}    | 150Ω | 151 | {{< colorband "brown" >}}{{< colorband "green" >}}{{< colorband "brown" >}}    |1.5KΩ | 152 | {{< colorband "brown" >}}{{< colorband "green" >}}{{< colorband "red" >}}      | 15KΩ  | 153 | {{< colorband "brown" >}}{{< colorband "green" >}}{{< colorband "orange" >}}   | 150KΩ | 154 | {{< colorband "brown" >}}{{< colorband "green" >}}{{< colorband "yellow" >}}   | 1.5MΩ | 155 | {{< colorband "brown" >}}{{< colorband "green" >}}{{< colorband "green" >}}    |
|       |     |                                                                                | 1.6Ω |     | {{< colorband "brown" >}}{{< colorband "blue" >}}{{< colorband "gold" >}}      | 16Ω | 16  | {{< colorband "brown" >}}{{< colorband "blue" >}}{{< colorband "black" >}}     | 160Ω | 161 | {{< colorband "brown" >}}{{< colorband "blue" >}}{{< colorband "brown" >}}     |1.6KΩ | 162 | {{< colorband "brown" >}}{{< colorband "blue" >}}{{< colorband "red" >}}       | 16KΩ  | 163 | {{< colorband "brown" >}}{{< colorband "blue" >}}{{< colorband "orange" >}}    | 160KΩ | 164 | {{< colorband "brown" >}}{{< colorband "blue" >}}{{< colorband "yellow" >}}    | 1.6MΩ | 165 | {{< colorband "brown" >}}{{< colorband "blue" >}}{{< colorband "green" >}}     |
|       |     |                                                                                | 1.8Ω |     | {{< colorband "brown" >}}{{< colorband "gray" >}}{{< colorband "gold" >}}      | 18Ω | 18  | {{< colorband "brown" >}}{{< colorband "grey" >}}{{< colorband "black" >}}     | 180Ω | 181 | {{< colorband "brown" >}}{{< colorband "grey" >}}{{< colorband "brown" >}}     |1.8KΩ | 182 | {{< colorband "brown" >}}{{< colorband "grey" >}}{{< colorband "red" >}}       | 18KΩ  | 183 | {{< colorband "brown" >}}{{< colorband "grey" >}}{{< colorband "orange" >}}    | 180KΩ | 184 | {{< colorband "brown" >}}{{< colorband "grey" >}}{{< colorband "yellow" >}}    | 1.8MΩ | 185 | {{< colorband "brown" >}}{{< colorband "grey" >}}{{< colorband "green" >}}     |
|       |     |                                                                                | 2.0Ω | 2   | {{< colorband "black" >}}{{< colorband "red" >}}{{< colorband "black" >}}      | 20Ω | 20  | {{< colorband "red" >}}{{< colorband "black" >}}{{< colorband "black" >}}      | 200Ω | 201 | {{< colorband "red" >}}{{< colorband "black" >}}{{< colorband "brown" >}}      |2.0KΩ | 202 | {{< colorband "red" >}}{{< colorband "black" >}}{{< colorband "red" >}}        | 20KΩ  | 203 | {{< colorband "red" >}}{{< colorband "black" >}}{{< colorband "orange" >}}     | 200KΩ | 204 | {{< colorband "red" >}}{{< colorband "black" >}}{{< colorband "yellow" >}}     | 2.0MΩ | 205 | {{< colorband "red" >}}{{< colorband "black" >}}{{< colorband "green" >}}      |
|       |     |                                                                                | 2.2Ω | 2R2 | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "gold" >}}         | 22Ω | 22  | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "black" >}}        | 220Ω | 221 | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "brown" >}}        |2.2KΩ | 222 | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "red" >}}          | 22KΩ  | 223 | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "orange" >}}       | 220KΩ | 224 | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "yellow" >}}       | 2.2MΩ | 225 | {{< colorband "red" >}}{{< colorband "red" >}}{{< colorband "green" >}}        |
|       |     |                                                                                | 2.4Ω | 2R4 | {{< colorband "red" >}}{{< colorband "yellow" >}}{{< colorband "gold" >}}      | 24Ω | 24  | {{< colorband "red" >}}{{< colorband "yellow" >}}{{< colorband "black" >}}     | 240Ω | 241 | {{< colorband "red" >}}{{< colorband "yellow" >}}{{< colorband "brown" >}}     |2.4KΩ | 242 | {{< colorband "red" >}}{{< colorband "yellow" >}}{{< colorband "red" >}}       | 24KΩ  | 243 | {{< colorband "red" >}}{{< colorband "yellow" >}}{{< colorband "orange" >}}    | 240KΩ | 244 | {{< colorband "red" >}}{{< colorband "yellow" >}}{{< colorband "yellow" >}}    | 2.4MΩ | 245 | {{< colorband "red" >}}{{< colorband "yellow" >}}{{< colorband "green" >}}     |
|       |     |                                                                                | 2.7Ω | 2R7 | {{< colorband "red" >}}{{< colorband "violet" >}}{{< colorband "gold" >}}      | 27Ω | 27  | {{< colorband "red" >}}{{< colorband "violet" >}}{{< colorband "black" >}}     | 270Ω | 271 | {{< colorband "red" >}}{{< colorband "violet" >}}{{< colorband "brown" >}}     |2.7KΩ | 272 | {{< colorband "red" >}}{{< colorband "violet" >}}{{< colorband "red" >}}       | 27KΩ  | 273 | {{< colorband "red" >}}{{< colorband "violet" >}}{{< colorband "orange" >}}    | 270KΩ | 274 | {{< colorband "red" >}}{{< colorband "violet" >}}{{< colorband "yellow" >}}    | 2.7MΩ | 275 | {{< colorband "red" >}}{{< colorband "violet" >}}{{< colorband "green" >}}     |
|       |     |                                                                                | 3.0Ω | 3   | {{< colorband "black" >}}{{< colorband "orange" >}}{{< colorband "black" >}}   | 30Ω | 30  | {{< colorband "orange" >}}{{< colorband "black" >}}{{< colorband "black" >}}   | 300Ω | 301 | {{< colorband "orange" >}}{{< colorband "black" >}}{{< colorband "brown" >}}   |3.0KΩ | 302 | {{< colorband "orange" >}}{{< colorband "black" >}}{{< colorband "red" >}}     | 30KΩ  | 303 | {{< colorband "orange" >}}{{< colorband "black" >}}{{< colorband "orange" >}}  | 300KΩ | 304 | {{< colorband "orange" >}}{{< colorband "black" >}}{{< colorband "yellow" >}}  | 3.0MΩ | 305 | {{< colorband "orange" >}}{{< colorband "black" >}}{{< colorband "green" >}}   |
|       |     |                                                                                | 3.3Ω | 3R3 | {{< colorband "orange" >}}{{< colorband "orange" >}}{{< colorband "gold" >}}   | 33Ω | 33  | {{< colorband "orange" >}}{{< colorband "orange" >}}{{< colorband "black" >}}  | 330Ω | 331 | {{< colorband "orange" >}}{{< colorband "orange" >}}{{< colorband "brown" >}}  |3.3KΩ | 332 | {{< colorband "orange" >}}{{< colorband "orange" >}}{{< colorband "red" >}}    | 33KΩ  | 333 | {{< colorband "orange" >}}{{< colorband "orange" >}}{{< colorband "orange" >}} | 330KΩ | 334 | {{< colorband "orange" >}}{{< colorband "orange" >}}{{< colorband "yellow" >}} | 3.3MΩ | 335 | {{< colorband "orange" >}}{{< colorband "orange" >}}{{< colorband "green" >}}  |
|       |     |                                                                                | 3.6Ω | 3R6 | {{< colorband "orange" >}}{{< colorband "blue" >}}{{< colorband "gold" >}}     | 36Ω | 36  | {{< colorband "orange" >}}{{< colorband "blue" >}}{{< colorband "black" >}}    | 360Ω | 361 | {{< colorband "orange" >}}{{< colorband "blue" >}}{{< colorband "brown" >}}    |3.6KΩ | 362 | {{< colorband "orange" >}}{{< colorband "blue" >}}{{< colorband "red" >}}      | 36KΩ  | 363 | {{< colorband "orange" >}}{{< colorband "blue" >}}{{< colorband "orange" >}}   | 360KΩ | 364 | {{< colorband "orange" >}}{{< colorband "blue" >}}{{< colorband "yellow" >}}   | 3.6MΩ | 365 | {{< colorband "orange" >}}{{< colorband "blue" >}}{{< colorband "green" >}}    |
|       |     |                                                                                | 3.9Ω | 3R9 | {{< colorband "orange" >}}{{< colorband "white" >}}{{< colorband "gold" >}}    | 39Ω | 39  | {{< colorband "orange" >}}{{< colorband "white" >}}{{< colorband "black" >}}   | 390Ω | 391 | {{< colorband "orange" >}}{{< colorband "white" >}}{{< colorband "brown" >}}   |3.9KΩ | 392 | {{< colorband "orange" >}}{{< colorband "white" >}}{{< colorband "red" >}}     | 39KΩ  | 393 | {{< colorband "orange" >}}{{< colorband "white" >}}{{< colorband "orange" >}}  | 390KΩ | 394 | {{< colorband "orange" >}}{{< colorband "white" >}}{{< colorband "yellow" >}}  | 3.9MΩ | 395 | {{< colorband "orange" >}}{{< colorband "white" >}}{{< colorband "green" >}}   |
|       |     |                                                                                | 4.3Ω | 4R3 | {{< colorband "yellow" >}}{{< colorband "orange" >}}{{< colorband "gold" >}}   | 43Ω | 43  | {{< colorband "yellow" >}}{{< colorband "orange" >}}{{< colorband "black" >}}  | 430Ω | 431 | {{< colorband "yellow" >}}{{< colorband "orange" >}}{{< colorband "brown" >}}  |4.3KΩ | 432 | {{< colorband "yellow" >}}{{< colorband "orange" >}}{{< colorband "red" >}}    | 43KΩ  | 433 | {{< colorband "yellow" >}}{{< colorband "orange" >}}{{< colorband "orange" >}} | 430KΩ | 434 | {{< colorband "yellow" >}}{{< colorband "orange" >}}{{< colorband "yellow" >}} | 4.3MΩ | 435 | {{< colorband "yellow" >}}{{< colorband "orange" >}}{{< colorband "green" >}}  |
|       |     |                                                                                | 4.7Ω | 4R7 | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "gold" >}}   | 47Ω | 47  | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "black" >}}  | 470Ω | 471 | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "brown" >}}  |4.7KΩ | 472 | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "red" >}}    | 47KΩ  | 473 | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "orange" >}} | 470KΩ | 474 | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "yellow" >}} | 4.7MΩ | 475 | {{< colorband "yellow" >}}{{< colorband "violet" >}}{{< colorband "green" >}}  |
|       |     |                                                                                | 5.1Ω | 5R1 | {{< colorband "green" >}}{{< colorband "brown" >}}{{< colorband "gold" >}}     | 51Ω | 51  | {{< colorband "green" >}}{{< colorband "brown" >}}{{< colorband "black" >}}    | 510Ω | 511 | {{< colorband "green" >}}{{< colorband "brown" >}}{{< colorband "brown" >}}    |5.1KΩ | 512 | {{< colorband "green" >}}{{< colorband "brown" >}}{{< colorband "red" >}}      | 51KΩ  | 513 | {{< colorband "green" >}}{{< colorband "brown" >}}{{< colorband "orange" >}}   | 510KΩ | 514 | {{< colorband "green" >}}{{< colorband "brown" >}}{{< colorband "yellow" >}}   | 5.1MΩ | 515 | {{< colorband "green" >}}{{< colorband "brown" >}}{{< colorband "green" >}}    |
|       |     |                                                                                | 6.2Ω | 6R2 | {{< colorband "blue" >}}{{< colorband "orange" >}}{{< colorband "gold" >}}     | 62Ω | 62  | {{< colorband "blue" >}}{{< colorband "red" >}}{{< colorband "black" >}}       | 620Ω | 621 | {{< colorband "blue" >}}{{< colorband "red" >}}{{< colorband "brown" >}}       |6.2KΩ | 622 | {{< colorband "blue" >}}{{< colorband "red" >}}{{< colorband "red" >}}         | 62KΩ  | 623 | {{< colorband "blue" >}}{{< colorband "red" >}}{{< colorband "orange" >}}      | 620KΩ | 624 | {{< colorband "blue" >}}{{< colorband "red" >}}{{< colorband "yellow" >}}      | 6.2MΩ | 625 | {{< colorband "blue" >}}{{< colorband "red" >}}{{< colorband "green" >}}       |
|       |     |                                                                                | 6.8Ω | 6R8 | {{< colorband "yellow" >}}{{< colorband "grey" >}}{{< colorband "gold" >}}     | 68Ω | 68  | {{< colorband "red" >}}{{< colorband "grey" >}}{{< colorband "black" >}}       | 680Ω | 681 | {{< colorband "blue" >}}{{< colorband "grey" >}}{{< colorband "brown" >}}      |6.8KΩ | 682 | {{< colorband "blue" >}}{{< colorband "grey" >}}{{< colorband "red" >}}        | 68KΩ  | 683 | {{< colorband "blue" >}}{{< colorband "grey" >}}{{< colorband "orange" >}}     | 680KΩ | 684 | {{< colorband "blue" >}}{{< colorband "grey" >}}{{< colorband "yellow" >}}     | 6.8MΩ | 685 | {{< colorband "blue" >}}{{< colorband "grey" >}}{{< colorband "green" >}}      |
|       |     |                                                                                | 7.5Ω | 7R5 | {{< colorband "violet" >}}{{< colorband "green" >}}{{< colorband "gold" >}}    | 75Ω | 75  | {{< colorband "violet" >}}{{< colorband "green" >}}{{< colorband "black" >}}   | 750Ω | 751 | {{< colorband "violet" >}}{{< colorband "green" >}}{{< colorband "brown" >}}   |7.5KΩ | 752 | {{< colorband "violet" >}}{{< colorband "green" >}}{{< colorband "red" >}}     | 75KΩ  | 753 | {{< colorband "violet" >}}{{< colorband "green" >}}{{< colorband "orange" >}}  | 750KΩ | 754 | {{< colorband "violet" >}}{{< colorband "green" >}}{{< colorband "yellow" >}}  | 7.5MΩ | 755 | {{< colorband "violet" >}}{{< colorband "green" >}}{{< colorband "green" >}}   |
|       |     |                                                                                | 8.2Ω | 8R2 | {{< colorband "grey" >}}{{< colorband "red" >}}{{< colorband "gold" >}}        | 82Ω | 82  | {{< colorband "grey" >}}{{< colorband "red" >}}{{< colorband "black" >}}       | 820Ω | 821 | {{< colorband "grey" >}}{{< colorband "red" >}}{{< colorband "brown" >}}       |8.2KΩ | 822 | {{< colorband "grey" >}}{{< colorband "red" >}}{{< colorband "red" >}}         | 82KΩ  | 823 | {{< colorband "grey" >}}{{< colorband "red" >}}{{< colorband "orange" >}}      | 820KΩ | 824 | {{< colorband "grey" >}}{{< colorband "red" >}}{{< colorband "yellow" >}}      | 8.2MΩ | 825 | {{< colorband "grey" >}}{{< colorband "red" >}}{{< colorband "green" >}}       |
|       |     |                                                                                | 9.1Ω | 9R1 | {{< colorband "white" >}}{{< colorband "brown" >}}{{< colorband "gold" >}}     | 91Ω | 91  | {{< colorband "white" >}}{{< colorband "brown" >}}{{< colorband "black" >}}    | 910Ω | 911 | {{< colorband "white" >}}{{< colorband "brown" >}}{{< colorband "brown" >}}    |9.1KΩ | 912 | {{< colorband "white" >}}{{< colorband "brown" >}}{{< colorband "red" >}}      | 91KΩ  | 913 | {{< colorband "white" >}}{{< colorband "brown" >}}{{< colorband "orange" >}}   | 910KΩ | 914 | {{< colorband "white" >}}{{< colorband "brown" >}}{{< colorband "yellow" >}}   | 9.1MΩ | 915 | {{< colorband "white" >}}{{< colorband "brown" >}}{{< colorband "green" >}}    |


## Medición

Con un multímetro podemos leer el valor real de una resistencia y comprobar si está en buen estado comparando el resultado obtenido con el código de colores y la tolerancia. También debe tener en cuenta que el componente se debe medir fuera del circuito, de lo contrario la medición está influenciada por otros componentes y el resultado será incorrecto. Recuerde que la polaridad no importa.

{{< svg name="resistor04" >}}

Para calcular el rango válido usamos la tolerancia ±5% de 1000 ohm, la cual es 50 ohm. Ahora calculamos el rango restando y sumando al valor obtenido por el código de colores y nos queda un rango entre 950 ohm y 1050 ohm. Si el valor real está fuera del rango o no hay valor, entonces deberá descartar el componente. En este caso el valor real es de 994 ohm y está dentro del rango, por lo que está bien la resistencia.

## Carga ficticia

Una carga ficticia (dummy load) o carga fantasma, es un dispositivo o una forma alternativa que se utiliza en lugar de una carga real para simular las condiciones de carga en un circuito. Se usa frecuentemente para probar fuentes de alimentación, amplificadores y otros equipos electrónicos sin necesidad de conectar la carga final prevista. También se utiliza para representar una carga en un circuito esquemático sin entrar en detalles. Sin este tipo de carga el circuito no realiza lo esperado.

La carga ficticia disipa la energía en forma de calor y permite verificar el comportamiento del circuito bajo condiciones controladas, el componente principal es una o varias resistencias, dependiento de la tolerancia exigida (watt) pueden ser de una forma tradicional o bobinadas de montaje sobre chasis, ya que son mas robustas y resistentes, utilizando una o varias con una combiacion ideal se puede obtener una cantidad de ohms y watios (watt) deseada, las resistecas se suelen fijar sobre disipadores de calor.

Para este simple ejemplo, vamos a usar una resistencia con un valor de potencia alta, como por ejemplo una resistencia de 10Ω que soporta una potencia por encima de 2.5W y con una precisión de ±5%, esta resistencia será conectada a una fuente de voltaje ajustable que proporcionara 5V y 0.5A. Deberá ajustar los valores de la fuente usando un multímetro.

{{< svg name="resistor05" >}}

Para calcular la corriente a través de la resistencia R{{< sub "L">}}:

{{< svg name="formula01" >}}

La disipación de potencia en la resistencia se calcula usando: 

<!-- \[P=V x I=5V x 0.5A = 2.5W\] -->

Por lo tanto, se debe utilizar una resistencia por encima de 2.5W para evitar daños, por ejemplo una de 3W.

Otro ejemplo de uso, es la de conectar una carga ficticia en la saliad de un amplificador de audio para realizar pruebas o mediciones sin necesidad de conectar un Altavoz evitando diversos problemas, como por ejemplo: ruidos molestos, daños, o molestias a los vecinos.

<!-- \begin{figure}[h]
\centering
\begin{tikzpicture}
  %\draw[step=0.5,gray,very thin, dotted] (0,0) grid (12,2.5);
  %\draw[step=1.0,gray!50,very thin] (0,0) grid (12,2.5);
  
  \draw[line width=0.1mm] (1,0) rectangle (3,1) node[pos=.5] {\shortstack{\tiny Generador \\ \tiny de señales}};
  \draw[line width=0.1mm] (5,0) rectangle (7,1) node[pos=.5] {\shortstack{\tiny Amplificador \\ \tiny de audio}};
  \draw[line width=0.1mm] (7,2.5) rectangle (9,1.5) node[pos=.5] {\tiny Osciloscopio};
  \draw[line width=0.1mm] (9,0) rectangle (11,1) node[pos=.5] {\shortstack{\tiny Carga \\ \tiny ficticia}};

  \draw[red,   line width=0.1mm] (3.0,0.7) -- (5.0,0.7);
  \draw[black, line width=0.1mm] (3.0,0.3) -- (5.0,0.3);
  
  \draw[red,   line width=0.1mm] (7.0,0.7) -- (9.0,0.7);
  \draw[black, line width=0.1mm] (7.0,0.3) -- (9.0,0.3);
  
  \draw[red,   line width=0.1mm] (7.75,0.7) -- (7.75,1.5);
  \draw[black, line width=0.1mm] (8.25,0.3) -- (8.25,1.5);
  
  \node at (3.2,0.9) {\tiny +};
  \node at (3.2,0.1) {\tiny -};
  \node at (4.8,0.9) {\tiny In};
  \node at (7.3,0.9) {\tiny Out};
  \node at (8.8,0.9) {\tiny +};
  \node at (8.8,0.1) {\tiny -};
\end{tikzpicture}
\caption{Conexion entre un amplificador de audio y una carga ficticia a un solo canal de salida.}
\label{fig:resistor-dummy-load-audio}
\end{figure} -->

En este caso tenemos un amplificador de audio con una salida de 8 ohms y 70 watt por canal. Entonces la carga ficticia debe ser de la mism imperacia (8 ohm) y un valor superior de 70 watt, esto ultimo para aumentar la resistencia del componente y reducir el calor disipado.

Para la construccion de este dispositivo depende de los componentes disponibles y presupuestos, ponemos varios ejemplos al que mas se ajuste a su necesidad:

Este es el caso en que un solo componente hace de carga ficticia.

<!-- \begin{figure}[h!]
  \begin{center}
    \begin{circuitikz}[american]
	  \draw (0,0)
	  to[V,v=$V$] (0,2) % The voltage source
	  to[short] (2,2)
	  to[R, l=$8\,\Omega$] (2,0) % The resistor
	  to[short] (0,0);
	  \node[below] at (3,0.8) {$150\,watt$};
	\end{circuitikz}
	\captionof{figure}{xx}
  \end{center}
\end{figure} -->

<!-- caso 2

\begin{figure}[h!]
  \begin{center}
	\begin{circuitikz}[american]
	  \draw (0,0)
	  to[V,v=$V$] (0,2) % The voltage source
	  to[short] (2,2)
	  to[R, l={\shortstack[l]{24 ohm \\ 50 watt}}] (2,0) % The resistor #1
	  to[short] (0,0);
      \draw (2,2)
      to[short] (4,2)
      to[R, l={\shortstack[l]{24 ohm \\ 50 watt}}] (4,0) % The resistor #2
      to[short] (0,0);
      \draw (4,2)
      to[short] (6,2)
      to[R, l={\shortstack[l]{24 ohm \\ 50 watt}}] (6,0) % The resistor #3
      to[short] (0,0);
	\end{circuitikz}
    \captionof{figure}{xx}
  \end{center}
\end{figure} -->

<!-- caso 3... -->

<!-- \begin{figure}[h!]
  \begin{center}
	\begin{circuitikz}[american]
	  \draw (0,0)
	  to[V,v=$V$] (0,2) % The voltage source
	  to[short] (2,2)
	  to[R, l={\shortstack[l]{30 ohm \\ 50 watt}}] (2,0) % The resistor #1
	  to[short] (0,0);
      \draw (2,2)
      to[short] (4,2)
      to[R, l={\shortstack[l]{30 ohm \\ 50 watt}}] (4,0) % The resistor #2
      to[short] (0,0);
      \draw (4,2)
      to[short] (6,2)
      to[R, l={\shortstack[l]{33 ohm \\ 50 watt}}] (6,0) % The resistor #3
      to[short] (0,0);
      \draw (6,2)
      to[short] (8,2)
      to[R, l={\shortstack[l]{33 ohm \\ 50 watt}}] (8,0) % The resistor #3
      to[short] (0,0);
	\end{circuitikz}
    \captionof{figure}{xx}
  \end{center}
\end{figure} -->

> Como calcular los watts o RMS del amplificador.

## Divisor de voltaje

Un divisor de voltaje es un circuito simple que convierte un voltaje grande en uno más pequeño usando únicamente dos resistencias en serie R\textsubscript{1} y R\textsubscript{2}, de esta forma puede crear un voltaje de salida V\textsubscript{out} exacto que es una fracción del voltaje de entrada.

<!-- \begin{table}[h]
  \centering
  \begin{tabular}{cc}
    \begin{minipage}[b]{0.45\textwidth}
		\begin{circuitikz}[american]
	      \draw (0,0)
	      to[V,v=$V_{in}$,invert] (0,4) % The voltage source
	      to[short] (2,4)
	      to[R=$R_1$] (2,2) % The resistor R1
	      to[R=$R_2$] (2,0) % The resistor R2
	      to[short] (0,0);
	      \draw
	      (2,2) to[short, -o] (3,2)
	      node[right] {$V_{out}$};
	      \draw
	      (2,0) to[short, -o] (3,0);
	    \end{circuitikz}
	    \captionof{figure}{Circuito.}
	    \label{tbl:resistor-voltage-divider-schematic}
    \end{minipage} &
    \begin{minipage}[b]{0.45\textwidth}
		  \centering
		  \small
		  \begin{tblr}{
		  column{1-4} = {r},
		  row{1}      = {font=\boldmath\bfseries},
		  hline{1-2}  = {-}{black,0.4mm},
		  hline{7}    = {-}{black,0.1mm},
		  }
		  V\textsubscript{in} & R\textsubscript{1} & R\textsubscript{2} & V\textsubscript{out} \\
		  12V                 & 6.8k\si{\ohm}      & 4.7k\si{\ohm}      & 4.9V                 \\
		  12V                 & 9.1k\si{\ohm}      & 3.6k\si{\ohm}      & 3.4V                 \\
		  9V                  & 3.9k\si{\ohm}      & 4.7k\si{\ohm}      & 4.9V                 \\
		  9V                  & 5.7k\si{\ohm}      & 3.3k\si{\ohm}      & 3.3V                 \\
		  5V                  & 1k\si{\ohm}        & 2k\si{\ohm}        & 3.3V                 \\
		  \end{tblr}
		  \caption{Combinaciones}
		  \label{tbl:resistor-voltage-divider-example}
    \end{minipage} \\
  \end{tabular}
\end{table} -->

Para calcular el divisor de voltaje de 5V a 3.3V:

<!-- \[V\textsubscript{out}=V\textsubscript{in}\frac{R\textsubscript{2}}{(R\textsubscript{1} + R\textsubscript{2})}=5V\frac{2000\si{\ohm}}{(1000\si{\ohm} + 2000\si{\ohm})}=3.33V\] -->

Recuerde que el resultado matemático será levemente diferente al valor real obtenido con un multímetro a consecuencia del porcentaje de tolerancia de la resistencia.

<!-- \noindent\fbox{
  \parbox{\textwidth}{
		Un componente que hace de divisor de voltaje es un potenciómetro, el cual es una resistencia variable que se puede usar para crear un divisor de voltaje ajustable. Internamente hay una resistencia única y un bloque deslizante, que corta la resistencia en dos y se mueve para ajustar la relación entre ambas mitades.
  }
}
-->

## Divisor de corriente

Un divisor de corriente o divisor de intensidad, es un circuito simple formado por dos o más resistencias en paralelo. Según la ley de Ohm, en un circuito paralelo, la corriente total se divide entre las diferentes resistencias en función de su resistencia relativa. Cuanto menor sea la resistencia, mayor será la corriente que fluya a través de ella.

<!-- \begin{figure}[h!]
  \begin{center}
    \begin{circuitikz}[american]
      \draw (0,0)
      to[I,i=$I_t$] (0,2)
      to[short] (2,2)
      to[R=$R_1$,i=$I_1$] (2,0)
      to[short] (0,0);
      \draw (2,2)
      to[short] (4,2)
      to[R=$R_2$,i=$I_2$] (4,0)
      to[short] (0,0);
    \end{circuitikz}
    \captionof{figure}{Ejemplo con dos resistencias}
  \end{center}
\end{figure} -->

Para calcular la intensidad solo de dos resistencias en paralelo usaremos las siguientes fórmulas, una por cada resistencia:

<!-- \begin{table}[h]
  \centering
  \begin{tabular}{cc}
  	\begin{minipage}[b]{0.45\textwidth}
  		\[I\textsubscript{1}=I\textsubscript{t} \frac{R\textsubscript{2}}{(R\textsubscript{1} + R\textsubscript{2})}\]
    \end{minipage} &
  	\begin{minipage}[b]{0.45\textwidth}
  		\[I\textsubscript{2}=I\textsubscript{t} \frac{R\textsubscript{1}}{(R\textsubscript{1} + R\textsubscript{2})}\]
    \end{minipage} \\
  \end{tabular}
\end{table} -->

Aunque los divisores de corriente son esenciales en teoría, en la práctica rara vez se utilizan. De lo contrario, la teoría se utiliza como una herramienta para analizar circuitos más complejos. Por ejemplo, si un circuito tiene varias resistencias en paralelo, se puede considerar cada conjunto de resistencias como un divisor de corriente por separado para simplificar el análisis del circuito.

Es importante recordar algunas limitaciones y consideraciones de esta teoría. Primero, la ley de Ohm y la fórmula del divisor de corriente sólo se aplican a circuitos de corriente continua (CC). En los circuitos de corriente alterna (CA), la corriente y la resistencia pueden variar con el tiempo. Segundo, en circuitos reales, la resistencia puede cambiar por la temperatura y el envejecimiento.

El siguiente ejemplo demuestra la aplicación de las fórmulas.

<!-- \begin{figure}[h!]
  \begin{center}
	\begin{circuitikz}[american]
	      \draw (0,0)
	      to[I,i=$3A$] (0,2)
	      to[short] (2,2)
	      to[R=$R_11\si{\ohm}$,i=$I_1$] (2,0)
	      to[short] (0,0);
	      \draw (2,2)
	      to[short] (4,2)
	      to[R=$R_22\si{\ohm}$,i=$I_2$] (4,0)
	      to[short] (0,0);
	\end{circuitikz}
  \end{center}
\end{figure}
 -->

Conociento la Intencidad total It que son 3A y los valores de ambas resistencia R\textsubscript{1}1\si{\ohm} y R\textsubscript{2}2\si{\ohm} podemos hacer uso de las formulas I\textsubscript{1} y I\textsubscript{2} para allar su respectiva Intencidad.

<!-- \[I\textsubscript{1}=3A \frac{2\si{\ohm}}{(1\si{\ohm} + 2\si{\ohm})}=3A \frac{2\si{\ohm}}{3\si{\ohm}}=3A * 0.66\si{\ohm}=2A\] -->
<!-- \[I\textsubscript{2}=3A \frac{1\si{\ohm}}{(1\si{\ohm} + 2\si{\ohm})}=3A \frac{1\si{\ohm}}{3\si{\ohm}}=3A * 0.33\si{\ohm}=1A\] -->

Para verificar que el resultado de I\textsubscript{1} y I\textsubscript{2} son correctos, debemos sumar ambas para obtener I\textsubscript{t}, si el valor es igual consideramos como correcto.

<!-- \[I\textsubscript{t}=I\textsubscript{1} + I\textsubscript{2}=2A + 1A = 3A\] -->

Como estamos trabajando con Intensidad, se entiende que el sobrante energético se disipa en calor, por eso debemos calcular la potencia mínima que debe soportar cada resistencia:

<!-- \[P\textsubscript{1}=V x I\textsubscript{1}=5V x 2A = 10W\] -->
<!-- \[P\textsubscript{2}=V x I\textsubscript{2}=5V x 1A = 5W\]  -->

Conseguir o usar una resistencia de alto valor en watt (W) puede ser costoso o complicado, entonces se considera ponerlas en paralelo de igual valor para dividir de forma igual la Intensidad y sumar en potencia.

## Resistencia Equivalente

La resistencia equivalente es aquella resistencia que puede sustituir todas las resistencias de un circuito eléctrico. Por lo tanto, es aquella que absorbe la misma intensidad de corriente que todas las resistencias del circuito juntas.

<!-- \begin{figure}[h!]
  \begin{center}
	\begin{circuitikz}[american]
	  \draw (0,-2)
	  to[short] (0,0)
	  to[R=$R_1$] (2,0)
	  to[R=$R_2$] (2,-2);
	  \draw (0,-4)
	  to[V,v=$V_{in}$,invert] (0,-2)
	  to[R=$R_3$] (2,-2)
	  to[R=$R_4$] (4,-2)
	  to[R=$R_5$] (4,-4)
	  to[short] (0,-4);
      \draw (2,-2)
      to[R=$R_6$] (2,-4);
      \node at (5.3,-3) {\textbf{\huge =}};
      \draw (7,-4)
      to[V,v=$V_{in}$,invert] (7,-2)
      to[short] (9,-2)
      to[R=$R_{eq}$] (9,-4)
      to[short] (7,-4);
    \end{circuitikz}
  \end{center}
\end{figure} -->

Una resistencia equivalente (R\textsubscript{eq}) reemplaza todas las resistencias y las intensidades por una sola. En la práctica, es común encontrarse con una red compleja de resistencias que se deben analizar. Para simplificar el análisis, es posible calcular una resistencia equivalente que represente toda la red. Aquí describiremos cómo calcular esta resistencia en diferentes configuraciones.

## Resistencias en Serie

Las resistencias en serie es cuando están dispuestas una detrás de la otra, de manera que la corriente fluye a través de cada una de ellas sucesivamente. El valor de R\textsubscript{eq} es simplemente la suma de cada una de las resistencias individuales:

<!-- \[R\textsubscript{eq}=R\textsubscript{1} + R\textsubscript{2} + R\textsubscript{3} + R\textsubscript{n}\] -->

## Resistencias en Paralelo

Cuando las resistencias están conectadas en paralelo, la corriente se divide entre ellas, y la resistencia equivalente se calcula mediante la fórmula:

<!-- \[\frac{1}{R\textsubscript{eq}}=\frac{1}{R\textsubscript{1} + 1} + \frac{1}{R\textsubscript{2} + 1} + \frac{1}{R\textsubscript{3} + 1} + \frac{1}{R\textsubscript{n} + 1}\] -->

## Resistencias combinadas en Serie y Paralelo

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
