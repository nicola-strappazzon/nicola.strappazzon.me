+++
title = "Aventuras de un DBA, primera parte"
date = "2025-10-10"
draft = true
tags = ["mysql"]
+++

Frecuentemente preguntan que hace un DBA, y por mi cabesa pasan cientos de experiencias que de entrada cuesta asimilar, entonces respondo con frases más simples y compatibles con todos cómo "arreglamos los datos para ahorrar dinero y tiempo" que da la conclusión que es un trabajo aburrido, imaginate a una persona condenada a ver bits y poner tiritas a cada uno y decirle tu por aquí y tu por allá. La realidad es todo lo contrario, y por eso quiero contar anecdotas curiosas en esta aventura que puede estar escrita en varios posts.

Un día te buscan una empresa para que le mires su base de datos para evaluar cómo esta pueda escalar, y con gusto nos ponemos a revisar. Con los años descubres que hay una serie de verdades incomodas para todas y que debemos sobrevivir con ellas:

- comentar que el > 95% de los datos no se usan.
- comentar que el < 10% son escrituras y el otro 90> % son lecturas.
- queries super complejas que hacen de cuello de botella.
- no hay proyecciones y se calcula casi todo a demanda.
- y no puede faltar la falta de indices.
- claves primarias mal definidas.

Muchos creen que por algun mito es mejor NO usar un MySQL sino otro gestor de bases de datos, en la gran mayoria de los casos si organizas tus datos y procesos es más que suficiente. Y el nivel de metricas y logs que tiene MySQL para buscar y resolver problemas es tan grande, que no he visto otro gestor open source que haga lo mismo, se que siempre hay un iluminado que dira M#@$ o P!@$$$ es mejor, si estubiera en mi piel sabría lo que pienso, pero como no ha tenido las hagallas comprendo su ignorancia. Eso no quita que hay que usar un gestor de bases de datos para lo que fue hecho, un 4x4 no esta hecho para competir con un F1.

Del modelo de datos, mejor no comentemos en detalle, pero suele ser aceptable.

Cuando comentas esto suele haber resistencia al cambio, y al terminar de convencer con las pruebas en la mano, una parte del equipo de desarrollo estarán meses trabajando antes que tu puedas ver alguna mejora considerable, pero mientras lo unico que salva el cuello aquí para sobrevivir con males necesarios es implementar un ProxySQL y hacer los cambios minimos con mayor impacto para que todo el ecosistema pueda sobrevivir.

Sorpresas adicionales:

- usar uuid como clave primaria.
- comentar que cuando hacen kill crearon una tool para matar las conexiones.
- guardar todos los eventos de trafico real en el MySQL ocupando el 80% de los IOPS.
- queries recursivas.
- stored procedures.
- calculos batch.

Por lo general siempre crees que haz visto todo, pero siempre por más dificil que lo creas, hay algo inesperado, que tu imaginación no ha logrado visualizar, allí está esperando por ti.
