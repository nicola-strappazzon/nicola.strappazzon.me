+++
title = "Lección 3 - Condensador electrolítico"
+++

Con este simple circuito, se busca demostrar cómo funciona un condensador y en especial el de tipo electrolítico mediante la carga y descarga de una forma visible. Cómo sabemos, el condensador actúa cómo un tanque de agua en el circuito, en el caso de la electrónica no guarda agua, sino carga corriente. [Para saber más sobre los Condensadores, consulte aquí](https://nicola.strappazzon.me/electronic/components/capacitor/).

## Componentes

- Una placa de pruebas.
- Dos pilas de 1.5V para sumar 3V y con su base.
- Un pulsador.
- Una condensador electrolítico puede ser cualquiera de los siguientes valores: 100uF, 220uF, 470uF, 1000µF.
- Una resistencia de 1kΩ.
- Un LED del color deseado.
- Cables unifilar.



## Esquema

{{< svg name="schematic01" >}}

## Placa de pruebas

![](breadboard01.png)

## Análisis

Al presionar el pulsador se enciende el LED y se empieza a cargar el condensador, cuando dejas de presionar el pulsador se interrumpe la carga del condensador y este empieza a suministrar corriente al led hasta descargarse el condensador por completo. Durante el proceso de descarga se puede apreciar cómo el LED va bajando su luminosidad poco a poco hasta apagarse.
