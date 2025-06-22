+++
draft  = false
title  = 'Código de colores'
weight = 1
+++

Para identificar una resistencia hacen falta entender el código de colores que nos permite identificar el valor de la resistencia eléctrica y su tolerancia.

En los casos más comunes, las de cuatro franjas de colores, se lee de la siguiente forma: de izquierda a derecha, la primera y segunda indican el valor de la resistencia, la tercera el multiplicador, y la cuarta la tolerancia.

{{< svg name="draw01" >}}

El valor de la resistencia se obtiene leyendo las dos primeras cifras, luego se multiplica y se obtiene el resultado en ohmios Ω, veamos un ejemplo usando la figura anterior y la siguiente tabla:

| Color | Banda | Valor |
|-------|-------|-------|
|Marron | 1     | 1     |
|Negro  | 2     | 0     |
|Rojo   | 3     | 100   |
|Oro    | 4     | ±5%   |

Las primeras dos bandas representa una cifra, si unimos la primera banda de color marrón que vale `1` y la segunda banda de color negro que vale `0` tenemos el número `10`, ahora lo multiplicamos por el valor de la tercera banda de color rojo que vale `100` quedando `1000Ω` y así quedaría la ecuación: `10 x 100 = 1000Ω`. La cuarta banda de color oro que vale 5% indica la tolerancia.

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
