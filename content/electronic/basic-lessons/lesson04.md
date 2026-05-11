+++
title = "Lección 4 - Transistores"
+++

Para entrar en el mundo de los transistores, me parece interesante empezar por hacer un circuito biestable simple (latch SR), también lo llaman flip-flop RS, o biestable de dos transistores. En la vida real es como representar el balancín del parque de niños en un circuito.

{{% blockquote type="note" %}}
Las siglas SR significa; La `S` de `Set` y la `R` de `Reset`. Un latch SR es una memoria que mantiene el último estado. `Set` (S) pone la salida en 1 y `Reset` (R) pone la salida en 0.
{{% /blockquote %}}

## Componentes

- Una placa de pruebas.
- Dos pilas de 1.5V para sumar 3V y con su base.
- Dos pulsadores.
- Dos LED del color deseado.
- Dos transistores 
- Seis resistencia de 1kΩ.
- Cable unifilar.

## Esquema

{{< svg name="schematic01" >}}

## Placa de pruebas

![](breadboard01.png)

## Análisis

Funciona así:

- Cada botón activa un transistor.
- Cada transistor controla un LED.
- Los transistores están cruzados entre sí mediante resistencias.
- Cuando presionas un botón, ese lado se enciende y al mismo tiempo fuerza al otro transistor a apagarse.
- El estado queda "memorizado" después de soltar el botón, si está bien hecho el acoplamiento cruzado.

En comportamiento lógico:


| Acción            |	LED verde	| LED rojo |
|-------------------|-----------|----------|
| Presionas botón 1	| ON        | OFF      |
| Presionas botón 2	| OFF	      | ON       |

Es como un circuito que tiene la memoria de 1 bit:

- Verde encendido = estado 0 o 1
- Rojo encendido = estado contrario

La idea clave es la realimentación cruzada: cada transistor "bloquea" al otro.
