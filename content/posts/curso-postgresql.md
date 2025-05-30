+++
date = '2025-05-30T12:05:04+02:00'
draft = false
title = 'Curso de SQL en PostgreSQL'
+++


1. Esta presentación presenta una lección sobre el uso de la sentencia SELECT en SQL. Explica cómo se puede usar SELECT para recuperar datos de una tabla, incluyendo todas las filas y columnas o solo columnas específicas. También cubre cómo agregar alias a las columnas, realizar cálculos aritméticos, concatenar cadenas y evitar filas duplicadas usando DISTINCT. El objetivo es enseñar los conceptos básicos detrás de la consulta de datos en una base de datos usando el lenguaje SQL.


2. Este documento resume cómo limitar y ordenar los datos devueltos por la consulta SELECT en PostgreSQL. Explica cómo usar las cláusulas WHERE, LIKE, BETWEEN, IN y ORDER BY para filtrar y ordenar registros según columnas específicas, incluyendo comparaciones de texto, números y fechas. También cubre operadores lógicos y reglas de precedencia. El objetivo es entender cómo restringir el número de registros devueltos y el orden en que aparecen en los resultados de una consulta.


3. Este documento describe diversas funciones SQL que pueden usarse para manipular datos en PostgreSQL. Explica funciones de caracteres, números, fechas y conversión de tipos, así como funciones jerárquicas como COALESCE y CASE. El objetivo es entender cómo usar funciones simples para modificar la salida de registros.


Este documento explica cómo usar funciones para manipular grupos de datos en SQL. Describe funciones de grupo como AVG, COUNT, MAX, MIN y SUM y cómo estas operan sobre conjuntos de registros. Explica el uso de las cláusulas GROUP BY para dividir registros en grupos y HAVING para filtrar grupos, ilustrando con ejemplos cómo escribir consultas que agrupan y resumen datos.


Este documento proporciona instrucciones sobre cómo unir datos de múltiples tablas en PostgreSQL. Explica cómo usar cláusulas como NATURAL JOIN, USING, ON, LEFT JOIN y RIGHT JOIN para combinar tablas relacionadas basadas en columnas comunes. También cubre el uso de alias de tabla y columna para evitar ambigüedades y especificar condiciones adicionales en la cláusula JOIN. El objetivo es mostrar cómo escribir consultas SQL para obtener datos de varias tablas de manera eficiente.


Este documento explica el uso de subconsultas en PostgreSQL. Define las subconsultas como consultas SELECT anidadas dentro de una consulta principal. Explica que las subconsultas se pueden usar para extraer datos específicos dependiendo de los resultados de la consulta principal, y cubre temas como subconsultas de un solo registro, múltiples registros, y errores comunes. El objetivo es ayudar al lector a entender cómo y cuándo usar subconsultas.


Este documento explica los operadores de conjunto en SQL, los cuales permiten combinar los resultados de múltiples consultas. Describe los operadores UNION, UNION ALL, INTERSECT, y EXCEPT y cómo cada uno une, intersecta o exceptúa los resultados de las consultas. También cubre cómo manejar columnas con diferentes nombres o tipos de datos entre las consultas y ordenar o limitar los resultados combinados.


Este documento describe los lenguajes de manipulación de datos (DML) en PostgreSQL y cómo usar las sentencias INSERT, UPDATE y DELETE para agregar, modificar y eliminar registros de una tabla de forma atómica mediante transacciones. También explica cómo usar subconsultas con las sentencias DML y los comandos BEGIN, COMMIT, ROLLBACK y SAVEPOINT para controlar transacciones.


Este documento proporciona una lección sobre tablas en PostgreSQL. Explica cómo crear tablas y definir sus columnas, tipos de datos, restricciones y relaciones. También cubre cómo usar índices para mejorar el rendimiento de las consultas al acceder a los datos de las tablas de forma más rápida. El objetivo es ayudar al lector a entender la estructura básica de las tablas, los tipos de datos compatibles y cómo mantener la integridad de los datos a través de restricciones y relaciones entre tablas

Este documento explica las vistas en PostgreSQL. Las vistas son estructuras lógicas que permiten visualizar datos de una o más tablas sin contener datos reales. Permiten consultar pero no modificar datos. El documento describe cómo crear, modificar y eliminar vistas, así como usarlas en consultas de la misma forma que las tablas.
