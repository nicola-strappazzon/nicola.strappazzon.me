+++
draft = false
title = 'Divisor de voltaje'
+++

Un divisor de voltaje es un circuito simple que convierte un voltaje grande en uno más pequeño usando únicamente dos resistencias en serie R{{< sub "1">}} y R{{< sub "2">}}, de esta forma puede crear un voltaje de salida V{{< sub "out">}} exacto que es una fracción del voltaje de entrada.

{{< svg name="draw01" >}}

Para calcular el divisor de voltaje de 5V a 3.3V:

{{< mathjax "{V}_{out}={V}_{In}\frac{{R}_{2}}{\left({R}_{1}+{R}_{2}\right)}=5V\frac{2000\Omega}{\left(1000\Omega+2000\Omega\right)}=3,33V" >}}

Recuerde que el resultado matemático será levemente diferente al valor real obtenido con un multímetro a consecuencia del porcentaje de tolerancia de la resistencia.

| V{{< sub "In">}} | R{{< sub "1">}} | R{{< sub "2">}} | V{{< sub "out">}} |
|------------------|-----------------|-----------------|-------------------|
| 12V              | 6.8kΩ           | 4.7kΩ           | 4.9V              |
| 12V              | 9.1kΩ           | 3.6kΩ           | 3.4V              |
| 9V               | 3.9kΩ           | 4.7kΩ           | 4.9V              |
| 9V               | 5.7kΩ           | 3.3kΩ           | 3.3V              |
| 5V               | 1kΩ             | 2kΩ             | 3.3V              |

> Un componente que hace de divisor de voltaje es un potenciómetro, el cual es una resistencia variable que se puede usar para crear un divisor de voltaje ajustable. Internamente hay una resistencia única y un bloque deslizante, que corta la resistencia en dos y se mueve para ajustar la relación entre ambas mitades.
