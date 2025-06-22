+++
draft = false
title = 'Medición'
+++

Con un multímetro podemos leer el valor real de una resistencia y comprobar si está en buen estado comparando el resultado obtenido con el código de colores y la tolerancia. También debe tener en cuenta que el componente se debe medir fuera del circuito, de lo contrario la medición está influenciada por otros componentes y el resultado será incorrecto. Recuerde que la polaridad no importa.

{{< svg name="draw01" >}}

Para calcular el rango válido usamos la tolerancia ±5% de 1000 ohm, la cual es 50 ohm. Ahora calculamos el rango restando y sumando al valor obtenido por el código de colores y nos queda un rango entre 950 ohm y 1050 ohm. Si el valor real está fuera del rango o no hay valor, entonces deberá descartar el componente. En este caso el valor real es de 994 ohm y está dentro del rango, por lo que está bien la resistencia.
