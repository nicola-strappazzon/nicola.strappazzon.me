+++
title = 'Condensadores'
+++

También llamado capacitores, este componente se comporta en la práctica como un elemento capaz de almacenar la energía eléctrica que recibe durante el período de carga, la misma energía que cede después durante el período de descarga. Además, es capaz de almacenar carga eléctrica luego de cargado y desconectado del circuito, por lo que es apropiado ser cuidadoso al manipular uno, ya que podría haber quedado cargado desde su uso anterior, lo adecuado es conectar siempre sus extremos mediante un elemento conductor por unos segundos antes de manipular un condensador.

Existen dos grandes grupos de condensadores, los polarizados y los que no. Cada tipo se representa con diferentes símbolos, muestro las formas más habituales de cada uno:

![](symbols.png)

<!-- Para que se suelen usar -->

Entre ambos grupos, existen muchos diferentes tipos que utilizan distintos tipos de dieléctrico. Al diseñar un circuito es útil saber qué tipos de capacitores pueden estar disponibles en el rango requerido. Sin embargo, vale la pena tener en cuenta algunos puntos:

1. **Capacitores electrolíticos:** Aunque tienen un valor más alto, su tolerancia es pobre. Son polarizados y no funcionan bien a altas frecuencias.
2. **Capacitores cerámicos:** Pueden usarse en muchas áreas. Usualmente son buenos a altas frecuencias (RF y microondas). Algunas cerámicas ofrecen alta estabilidad, otras un tamaño reducido, etc.
3. **Tántalo:** Son capacitores polarizados que ofrecen altos niveles de capacitancia, pero a menudo a bajos voltajes. Son muy intolerantes a voltajes inversos y no pueden manejar mucha corriente. Son caros.
4. **Película plástica:** No están disponibles en versiones de montaje superficial (SMD). Existen diferentes tipos que pueden proporcionar alta estabilidad y un buen nivel de desempeño en general, pero no son aptos para frecuencias RF o de microondas altas. Suelen usarse para audio.

Las distintas combinaciones de dieléctrico, construcción del capacitor y otros factores implican que diferentes tipos de capacitores tienden a cubrir diferentes rangos de valores en los que están disponibles.

## Tabla de equivalencias entre unidades

Los fabricantes crean los condensadores de muchos valores, aquí listamos los más comunes para un laboratorio.

<!-- Se puede indicar que rangos de valore cubre ceramico, electrolitico, tantalio, etc... -->

|picofarad (pF)|nanofarad (nF)|microfarad (uF)|Code|Code (nF)|
|--------------|--------------|---------------|----|---------|
|1,5           |0,0015        |0,0000015      |1R5 |         |	
|2,2           |0,0022        |0,0000022      |2R2 |         |	
|4,7           |0,0047        |0,0000047      |4R7 |         |	
|10            |0,01          |0,00001        |100 |         |	
|12            |0,012         |0,000012       |120 |         |	
|15            |0,015         |0,000015       |150 |         |	
|22            |0,022         |0,000022       |220 |         |	
|27            |0,027         |0,000027       |27J |         |	
|33            |0,033         |0,000033       |330 |         |	
|47            |0,047         |0,000047       |470 |         |	
|68            |0,068         |0,000068       |470 |         |	
|100           |0,1           |0,0001         |101 |         |
|120           |0,12          |0,00012        |121 |         |	
|130           |0,13          |0,00013        |131 |         |	
|150           |0,15          |0,00015        |151 |         |	
|180           |0,18          |0,00018        |181 |         |	
|220           |0,22          |0,00022        |221 |         |	
|330           |0,33          |0,00033        |331 |         |	
|470           |0,47          |0,00047        |471 |         |	
|560           |0,56          |0,00056        |561 |         |	
|680           |0,68          |0,00068        |681 |         |	
|750           |0,75          |0,00075        |571 |         |	
|820           |0,82          |0,00082        |821 |         |	
|1000          |1             |0,001          |102 |1n       |
|1500          |1,5           |0,0015         |152 |1n5      |
|2000          |2             |0,002          |202 |         |
|2200          |2,2           |0,0022         |222 |2n2      |
|3300          |3,3           |0,0033         |332 |3n3      |
|4700          |4,7           |0,0047         |472 |4n7      |
|5000          |5             |0,005          |502 |         |
|5600          |5,6           |0,0056         |562 |         |
|6800          |6,8           |0,0068         |682 |6n8      |
|10000         |10            |0,01           |103 |10n      |
|15000         |15            |0,015          |153 |15n      |
|22000         |22            |0,022          |223 |22n      |
|33000         |33            |0,033          |333 |33n      |
|47000         |47            |0,047          |473 |47n      |
|68000         |68            |0,068          |683 |68n      |
|100000        |100           |0,1            |104 |100n     |
|150000        |150           |0,15           |154 |150n     |
|200000        |200           |0,2            |204 |         |
|220000        |220           |0,22           |224 |220n     |
|330000        |330           |0,33           |334 |330n     |
|470000        |470           |0,47           |474 |470n     |
|680000        |680           |0,68           |684 |         |
|1000000       |1000          |1              |105 |         |
|1500000       |1500          |1,5            |155 |         |
|2000000       |2000          |2              |205 |         |
|2200000       |2200          |2,2            |225 |         |
|3300000       |3300          |3,3            |335 |         |
|4700000       |4700          |4,7            |475 |         |
|10000000      |10000         |10             |106 |         |
|20000000      |20000         |20             |226 |         |
