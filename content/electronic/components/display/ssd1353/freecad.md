+++
weight = 2
title = 'FreeCAD'
+++

Este es mi primer proyecto hecho en [FreeCAD](https://www.freecad.org) para diseñar un marco de pantalla (bezel) que fija el display a la [PCB](https://nicola.strappazzon.me/electronic/components/display/ssd1353/kicad/) con el resultado de obtener un módulo firme, lo mande a fabricar en [JLCCNC](https://jlccnc.com/sheet-metal-quote), este [video](https://www.youtube.com/watch?v=CNUlHoU6qvA) y [este otro video](https://www.youtube.com/watch?v=cHe1TFVufjg) me ayudaron mucho a entender como diseñar un `sheet metal`, la verdad que tarde varias semanas y muchos intentos hasta lograr algo aceptable, al final podía hacer el dibujo con las medidas a memoria.

![](head.png)

El diseño quedo bastante cercano a la pieza original que tome de referencia.

![](render.png)

Si exportas el diseño a un formato [STEP](bezel.step) lo podrás cargar en [JLCCNC](https://jlccnc.com/sheet-metal-quote) para mandarlo a fabricar. La pieza original tiene una lámina con el espesor de 0.30mm y [JLCCNC cómo otros fabricantes trabaja con un mínimo de 0.5mm](https://jlccnc.com/help/article/materials-supported-in-sheet-metal-fabrication).
