+++
draft = true
title = 'Resistencias'
+++

El componente en sí no tiene una fecha exacta de creación, ni un personaje asociado, se puede decir que fue inventado a lo largo del siglo XIX (1800 hasta 1900) por diversos científicos interesados por la electricidad, donde la resistencia va evolucionando desde experimentos rudimentarios hasta ser un componente estandarizado según las necesidades de cada época.

Por lo tanto, el telégrafo puede considerarse como la primera aplicación práctica y formal de la resistencia en su forma primitiva, ya que los materiales resistivos eran una parte crucial para el funcionamiento de estos sistemas tempranos de telecomunicación.

Georg Simon Ohm,

La intensidad y el voltaje son dos aspectos importantes de los circuitos. El tercero es la resistencia, la resistencia es la forma en que cada sustancia se opone al flujo de electrones reduciendo la fuerza de la corriente. Esta es una forma de controlar la corriente de un circuito.

Imagina a alguien pisando una manguera por la que pasa agua. La presión del agua tiene una fuerza, y una parte del agua consigue salir al otro extremo, por lo que el flujo de agua sufre una resistencia y baja la presión. Con la corriente eléctrica pasa lo mismo.

---

Todos los componentes ofrecen cierto grado de resistencia a la corriente eléctrica, pero existen unos componentes denominados resistencias, cuya función es reducir la corriente. Se usan para controlar la intensidad y el voltaje de otro componente o para prevenir que un componente delicado sufra por recibir demasiada corriente. Muchas resistencias contienen carbón, que es un producto que no conduce bien la electricidad.

Existen resistores cuyo valor puede ser ajustado manualmente llamados potenciómetros o simplemente resistencias variables. También se producen dispositivos cuya resistencia varía en función de parámetros externos, como los termistores, que son resistores que varían con la temperatura; los varistores, que dependen de la tensión a la que son sometidos, o las fotorresistencias que actúan de acuerdo a la luz recibida. Todas estas las trataremos en otra sección, pero la base de la teórica resistencia es la misma.

Los resistores se utilizan en los circuitos para limitar el valor de la corriente o para fijar el valor de la tensión, según la Ley de Ohm. A diferencia de otros componentes electrónicos, los resistores no tienen polaridad definida.

Se le denomina resistencia a la oposición al flujo de corriente eléctrica a través de un conductor. La unidad de resistencia en el Sistema Internacional es el ohmio, que se representa con la letra griega (&#8486;), en honor al físico alemán Georg Simon Ohm, quien descubrió el principio que ahora lleva su nombre.

Existen muchos tipos de encapsulados para resistencias y con diferentes materiales de construcción. Para este libro solo trataremos los encapsulados de tipo axial como se observa en la figura \ref{fig:resistor-axial} que es ideal para el uso didáctico y de prototipado.

Existen resistencias cuyo valor es de 0(&#8486;) y son utilizadas para configurar un circuito, actuando como un puente. Es un excelente ejemplo de un componente cuya función parece innecesaria al principio, y quizás incluso inútil. Sin embargo, es bastante útil para los diseñadores que la conocen y entienden cómo puede ayudar a resolver problemas de circuitos y diseños a un muy bajo coste con complicaciones mínimas o nulas.

Entre las resistencias de tipo axial, tenemos dos grandes grupos; las de carbono y las de película metálica. La primera son de propósito general, más económicas, más comunes, de muchos valores, suelen ser de un color beige con 4 bandas de colores. La segunda opción es para circuitos donde se requiere mayor precisión y durabilidad, son de color azul con 4 y 5 bandas de colores.

## Código de colores

Para identificar una resistencia hacen falta entender el código de colores que nos permite identificar el valor de la resistencia eléctrica y su tolerancia.

En los casos más comunes, las de cuatro franjas de colores, se lee de la siguiente forma: de izquierda a derecha, la primera y segunda indican el valor de la resistencia, la tercera el multiplicador, y la cuarta la tolerancia.

El valor de la resistencia se obtiene leyendo las dos primeras cifras, luego se multiplica y se obtiene el resultado en ohmios (\si{\ohm}), veamos un ejemplo usando la figura anterior \ref{fig:resistor-axial} y la siguiente tabla \ref{tbl:resistor-color-code}:
 ---

Las primeras dos bandas representa una cifra, si unimos la primera banda de color marrón que vale 1 y la segunda banda de color negro que vale 0 tenemos el número 10, ahora lo multiplicamos por el valor de la tercera banda de color rojo que vale 100 quedando 1000\si{\ohm} y así quedaría la ecuación: \(10 x 100 = 1000\si{\ohm}\). La cuarta banda de color oro que vale 5\% indica la tolerancia.

---

La unidad de las resistencias \si{\ohm} están sujetos al prefijo del sistema internacional, por lo que se anteponen al nombre de la unidad para indicar el múltiplo o submúltiplo decimal de la misma; del mismo modo, los símbolos de los prefijos se anteponen a los símbolos de las unidades.

---

## Lista de resistencias comerciales

Los fabricantes crean las resistencias de muchos valores, aquí listamos los más comunes:

--

|            |            |           |            |             |            |             |             |
|------------|------------|-----------|------------|-------------|------------|-------------|-------------|
|0.00&#8486; | 1.0&#8486; | 10&#8486; | 100&#8486; | 1.0K&#8486; | 10K&#8486; | 100K&#8486; | 1.0M&#8486; |
|            | 1.1&#8486; | 11&#8486; | 110&#8486; | 1.1K&#8486; | 11K&#8486; | 110K&#8486; | 1.1M&#8486; |
|0.22&#8486; | 1.2&#8486; | 12&#8486; | 120&#8486; | 1.2K&#8486; | 12K&#8486; | 120K&#8486; | 1.2M&#8486; |
|            | 1.3&#8486; | 13&#8486; | 130&#8486; | 1.3K&#8486; | 13K&#8486; | 130K&#8486; | 1.3M&#8486; |
|0.47&#8486; | 1.4&#8486; | 14&#8486; | 140&#8486; | 1.4K&#8486; | 14K&#8486; | 140K&#8486; | 1.4M&#8486; |
|0.56&#8486; | 1.5&#8486; | 15&#8486; | 150&#8486; | 1.5K&#8486; | 15K&#8486; | 150K&#8486; | 1.5M&#8486; |
|0.68&#8486; | 1.6&#8486; | 16&#8486; | 160&#8486; | 1.6K&#8486; | 16K&#8486; | 160K&#8486; | 1.6M&#8486; |
|0.82&#8486; | 1.8&#8486; | 18&#8486; | 180&#8486; | 1.8K&#8486; | 18K&#8486; | 180K&#8486; | 1.8M&#8486; |
|            | 2.0&#8486; | 20&#8486; | 200&#8486; | 2.0K&#8486; | 20K&#8486; | 200K&#8486; | 2.0M&#8486; |
|            | 2.2&#8486; | 22&#8486; | 220&#8486; | 2.2K&#8486; | 22K&#8486; | 220K&#8486; | 2.2M&#8486; |
|            | 2.4&#8486; | 24&#8486; | 240&#8486; | 2.4K&#8486; | 24K&#8486; | 240K&#8486; | 2.4M&#8486; |
|            | 2.7&#8486; | 27&#8486; | 270&#8486; | 2.7K&#8486; | 27K&#8486; | 270K&#8486; | 2.7M&#8486; |
|            | 3.0&#8486; | 30&#8486; | 300&#8486; | 3.0K&#8486; | 30K&#8486; | 300K&#8486; | 3.0M&#8486; |
|            | 3.3&#8486; | 33&#8486; | 330&#8486; | 3.3K&#8486; | 33K&#8486; | 330K&#8486; | 3.3M&#8486; |
|            | 3.6&#8486; | 36&#8486; | 360&#8486; | 3.6K&#8486; | 36K&#8486; | 360K&#8486; | 3.6M&#8486; |
|            | 3.9&#8486; | 39&#8486; | 390&#8486; | 3.9K&#8486; | 39K&#8486; | 390K&#8486; | 3.9M&#8486; |
|            | 4.3&#8486; | 43&#8486; | 430&#8486; | 4.3K&#8486; | 43K&#8486; | 430K&#8486; | 4.3M&#8486; |
|            | 4.7&#8486; | 47&#8486; | 470&#8486; | 4.7K&#8486; | 47K&#8486; | 470K&#8486; | 4.7M&#8486; |
|            | 5.1&#8486; | 51&#8486; | 510&#8486; | 5.1K&#8486; | 51K&#8486; | 510K&#8486; | 5.1M&#8486; |
|            | 6.2&#8486; | 62&#8486; | 620&#8486; | 6.2K&#8486; | 62K&#8486; | 620K&#8486; | 6.2M&#8486; |
|            | 6.8&#8486; | 68&#8486; | 680&#8486; | 6.8K&#8486; | 68K&#8486; | 680K&#8486; | 6.8M&#8486; |
|            | 7.5&#8486; | 75&#8486; | 750&#8486; | 7.5K&#8486; | 75K&#8486; | 750K&#8486; | 7.5M&#8486; |
|            | 8.2&#8486; | 82&#8486; | 820&#8486; | 8.2K&#8486; | 82K&#8486; | 820K&#8486; | 8.2M&#8486; |
|            | 9.1&#8486; | 91&#8486; | 910&#8486; | 9.1K&#8486; | 91K&#8486; | 910K&#8486; | 9.1M&#8486; |

Con un multímetro podemos leer el valor real de una resistencia y comprobar si está en buen estado comparando el resultado obtenido con el código de colores y la tolerancia. También debe tener en cuenta que el componente se debe medir fuera del circuito, de lo contrario la medición está influenciada por otros componentes y el resultado será incorrecto. Recuerde que la polaridad no importa.
