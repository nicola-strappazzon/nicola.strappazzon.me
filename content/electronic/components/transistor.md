+++
draft = false
title = 'Transistores'
+++

Para entender los transistores y hacerlos funcionar, debemos saber que significan sus valores, aquí una breve descripción de los más importantes:

- **Current Gain (β):** En cualquier circuito, la ganancia de corriente de un transistor es un parámetro importante, se suele denominar β o hfe. La corriente es la relación entre la corriente de base y la corriente de colector y una medida de la capacidad de amplificación del transistor. Si desea utilizar el transistor como amplificador, elija un transistor con mayor ganancia de corriente.
- **Collector-Emitter Voltage (V{{<sub CEO>}}):** El VCEO es el voltaje máximo que la unión colector-emisor de un transistor puede soportar. En la mayoría de los transistores, el V{{<sub CEO>}} suele ser de 30V o más, medido con la base en circuito abierto.
- **Emitter-Base Voltage (V{{<sub EBO>}}):** El voltaje V{{<sub EBO>}} es el voltaje máximo que se puede aplicar a través de la unión emisor-base. **Es el responsable para activar o desactivar el transistor** controlando el paso de la corriente del Emitter. El V{{<sub EBO>}} es relativamente menor que el V{{<sub CEO>}}. El V{{<sub EBO>}} máximo suele ser de 6V o más para la mayoría de los transistores y se mide con el colector abierto.
- **Collector-Base Voltage (V{{<sub CBO>}}):** El V{{<sub CBO>}} es el voltaje máximo que se puede aplicar a través de la unión colector-base y se mide con el circuito abierto del emisor. El V{{<sub CBO>}} suele ser de 50V o más. El V{{<sub CBO>}} es relativamente más alto que el V{{<sub CEO>}} porque el voltaje colector-base suele ser mayor que el voltaje colector-emisor.
- **Collector current (L{{<sub C>}}):** La corriente del colector es la corriente máxima que puede circular por el colector. Generalmente se define en miliamperios, pero para transistores de alta potencia, se define en amperios.

> Aplicar un voltaje o corriente superior al maximo definido puede dañar el transistor. Se puede usar una resistencia para limitar la corriente. Verifique siempre los datos en el datasheet.

Los fabricantes crean casi una infinidad de transistores, pero aquí listamos los más comunes para un laboratorio.

| Transistor                         | Tipo | β                 | V{{<sub CEO>}}| V{{<sub EBO>}} | V{{<sub CBO>}} | L{{<sub C>}} |
|------------------------------------|------|-------------------|---------------|----------------|----------------|--------------|
|{{< download BC547 "BC547.pdf">}}   | NPN  | 800 h{{<sub FE>}} | 45V           | 6V             | 50V            | 100mA        |
|{{< download BC548 "BC548.pdf">}}   | NPN  | 800 h{{<sub FE>}} | 30V           | 5V             | 30V            | 100mA        |
|{{< download BC549 "BC549.pdf">}}   | NPN  | 800 h{{<sub FE>}} | 30V           | 5V             | 30V            | 100mA        |
|{{< download BC557 "BC557.pdf">}}   | PNP  | 800 h{{<sub FE>}} | 45V           | 5V             | 50V            | 100mA        |
|{{< download BC558 "BC558.pdf">}}   | PNP  | 800 h{{<sub FE>}} | 30V           | 5V             | 30V            | 100mA        |
|{{< download BC559 "BC559.pdf">}}   | PNP  | 800 h{{<sub FE>}} | 30V           | 5V             | 30V            | 100mA        |
|{{< download 2N3904 "2N3904.pdf">}} | NPN  | 200 h{{<sub FE>}} | 40V           | 6V             | 60V            | 200mA        |
|{{< download 2N3906 "2N3906.pdf">}} | PNP  | 200 h{{<sub FE>}} | 40V           | 5V             | 40V            | 200mA        |
|{{< download 2N4401 "2N4401.pdf">}} | NPN  | 200 h{{<sub FE>}} | 40V           | 6V             | 60V            | 600mA        |
|{{< download 2N4403 "2N4403.pdf">}} | PNP  | 300 h{{<sub FE>}} | 40V           | 5V             | 40V            | 600mA        |

## Pinout

Todos los transistores que están definidos en la tabla tienen el mismo pinout estándar:

![](pinout.png)
