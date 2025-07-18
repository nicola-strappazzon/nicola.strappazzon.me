+++
draft = false
title = "Lección 2 - Encender varios LED's"
+++

Esta lección la vamos a dividir en dos partes, porque hay dos formas de conectar los componentes; en serie y en paralelo. Ninguna es mejor que otra, cada una tiene sus ventajas y desventajas que iremos descubriendo paso a paso.

{{% blockquote type="note" %}}
- La configuración de conexión en serie y en paralelo es aplicable para muchos componentes; resistencias, diodos, condensadores, led, bombillas, pilas, entre otros.
- Existen situaciones donde un mismo circuito es una combinación de ambas configuraciones.
- Recuerde que un LED es un diodo.
{{% /blockquote %}}

## Serie

Un circuito en serie es una configuración de conexión en la que los terminales de los componentes se conectan sucesivamente uno detrás de otro, es decir, el terminal de salida de un componente se conecta a la terminal de entrada del componente siguiente.

### Esquema

{{< svg name="schematic01" >}}

### Placa de pruebas

![](breadboard01.png)

## Paralelo

Un circuito paralelo es una configuración de conexión de componentes en la que los bornes o terminales de entrada de todos los componentes conectados coinciden entre sí, al igual que sus terminales de salida.

### Esquema

{{< svg name="schematic02" >}}

### Placa de pruebas

![](breadboard02.png)

Al observar este último circuito se nos viene la idea de ¿Por qué no *ponemos una sola resistencia* para todos los LED's? y la respuesta corta es que **no se debe**, y te explico por qué:

- La razón principal es que no es posible conectar diodos en paralelo de forma segura.
- Si usamos una sola resistencia, tenemos un límite de corriente para todos los diodos. Ver la [ley de ohm](https://es.wikipedia.org/wiki/Ley_de_Ohm).
- El problema es que los diodos reales no tienen las mismas características y, por lo tanto, existe el riesgo de que un diodo comience a conducir mientras que otros no.
- Pueden surgir problemas de fuga térmica, cuando el diodo se calienta por la corriente que lo atraviesa, sus características cambian de tal manera que recibe más corriente, y en consecuencia se calienta aún más.
